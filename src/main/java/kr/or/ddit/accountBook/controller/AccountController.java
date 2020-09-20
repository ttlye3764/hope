package kr.or.ddit.accountBook.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.protobuf.ByteString;

import kr.or.ddit.accountBook.service.IDealService;
import kr.or.ddit.schedule.service.IScheduleService;
import kr.or.ddit.utiles.RolePaginationUtil;
import kr.or.ddit.utiles.RolePaginationUtil_BYEOL;
import kr.or.ddit.utiles.RolePaginationUtil_account;
import kr.or.ddit.utiles.RolePaginationUtil_pill;
import kr.or.ddit.utiles.RolePaginationUtil_su;
import kr.or.ddit.utiles.RolePaginationUtil_yun;
import kr.or.ddit.vo.CardVO;
import kr.or.ddit.vo.DealVO;
import kr.or.ddit.vo.HealthImageVO;
import kr.or.ddit.vo.InbodyVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MypillVO;
import kr.or.ddit.vo.PillVO;
import kr.or.ddit.vo.ScheduleVO;

@Controller
@RequestMapping("/user/accountBook/")

public class AccountController {
	@Autowired
	private MessageSourceAccessor accessor;

	@Autowired
	private ObjectMapper mapper;

	@Autowired
	private IDealService service;

	
	
	
	@RequestMapping("accountStatistics")
	public ModelAndView accountStatistics(ModelAndView andView, HttpSession session) throws Exception {
		
		MemberVO vo = (MemberVO)session.getAttribute("LOGIN_MEMBERINFO");
		String mem_no = vo.getMem_no();
		//이번달 기준
		//총 비용, 총 수익
		String total_plus =  service.totalPlus(mem_no);
		String total_minus = service.totalMinus(mem_no);
		System.out.println(total_plus);
		System.out.println(total_minus);
		
		
		//그룹(식비,교통비)-비용
		List<DealVO> dealMinusList = service.groupMinus(mem_no);
		System.out.println("그룹 비용");
		System.out.println(dealMinusList.get(0).getGroupPrice());		//6000
		System.out.println(total_minus);								//177000
		System.out.println((Integer.parseInt(dealMinusList.get(0).getGroupPrice())*100) / Integer.parseInt(total_minus));
		//그룹(월급,상여금)-수익
		List<DealVO> dealPlusList = service.groupPlus(mem_no);

		//그룹(고정비용, 고정수익)
		String fix_plus = service.fix_plus(mem_no);
		String fix_minus = service.fix_minus(mem_no);
		
		System.out.println(fix_plus);
		System.out.println(fix_minus);
		
		andView.addObject("dealMinusList",dealMinusList);
		andView.addObject("dealPlusList",dealPlusList);
		andView.addObject("total_plus",total_plus);
		andView.addObject("total_minus",total_minus);
		andView.addObject("fix_plus",fix_plus);
		andView.addObject("fix_minus",fix_minus);
		andView.setViewName("user/accountBook/accountStatistics");
		return andView;
	}
	
	
	@RequestMapping("setting")
	public ModelAndView setting(String mem_no, HttpServletRequest request,HttpSession session,
								Map<String, String> params,ModelAndView andView,String currentPage, RolePaginationUtil_BYEOL pagination) throws Exception {
		 
		if(currentPage == null){
	         currentPage = "1";
	      }
		
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		List<DealVO> list4Size = service.dealList(memberInfo.getMem_no());
		String totalCount = Integer.toString(list4Size.size());
	    
		pagination.RolePaginationUtil(request, Integer.parseInt(currentPage), Integer.parseInt(totalCount));
	    String startCount = String.valueOf(pagination.getStartCount());
	    String endCount = String.valueOf(pagination.getEndCount());
	    
	    params.put("startCount", startCount);
	    params.put("endCount", endCount);
	    params.put("mem_no", memberInfo.getMem_no());
	    
	    List<DealVO> list = service.dealListView(params);
	    
		andView.addObject("dealList", list);
		andView.addObject("pagination",pagination.getPagingHtmls());
		andView.setViewName("user/accountBook/setting");
		return andView;
	}
	
	
	
	@RequestMapping("accountList")
	public ModelAndView accountList(String mem_no, HttpServletRequest request,HttpSession session,
			Map<String, String> params,ModelAndView andView,String currentPage, RolePaginationUtil_account pagination) throws Exception {
		
		if(currentPage == null){
			currentPage = "1";
		}
		
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		
		
		List<DealVO> listSize = service.dealList(memberInfo.getMem_no());
		String totalCount = Integer.toString(listSize.size());
		
		pagination.RolePaginationUtil(request, Integer.parseInt(currentPage), Integer.parseInt(totalCount));
		String startCount = String.valueOf(pagination.getStartCount());
		String endCount = String.valueOf(pagination.getEndCount());
		
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		params.put("mem_no", memberInfo.getMem_no());
		
		List<DealVO> list = service.searchList(params);
		
		for(int i = 0; i<list.size(); i++) {
			System.out.println(list.get(i).getDeal_date());
		}
		andView.addObject("dealList", list);
		andView.addObject("pagination",pagination.getPagingHtmls());
		andView.setViewName("user/accountBook/accountList");
		return andView;
	}
	
	
	
	@RequestMapping("registTrace")
	public ModelAndView registTrace(String deal_option, String deal_kind, String deal_date, String deal_name, String deal_price, String mem_no, String deal_division, String deal_fix_revenue, String deal_fix_expenditure, String deal_card_name) throws Exception {
		DealVO dealInfo = new DealVO();
		dealInfo.setDeal_option(deal_option);
		dealInfo.setDeal_kind(deal_kind);
		dealInfo.setDeal_date(deal_date);
		dealInfo.setDeal_name(deal_name);
		dealInfo.setDeal_price(deal_price);
		dealInfo.setDeal_division(deal_division);
		dealInfo.setMem_no(mem_no);
		dealInfo.setDeal_fix_expenditure(deal_fix_expenditure);
		dealInfo.setDeal_fix_revenue(deal_fix_revenue);
		dealInfo.setDeal_card_name(deal_card_name);
		
		int cnt = this.service.insertDeal(dealInfo);
		ModelAndView andView = new ModelAndView();
		List<DealVO> list = service.dealList(mem_no);
		andView.addObject("list", list);
		// <bean id="jsonConvertView" class="..MappingJackson2JsonView>
		andView.setViewName("jsonConvertView");
		return andView;
	}
	@RequestMapping("receiptregistTrace")
	public ModelAndView receiptregistTrace(String deal_option, String deal_kind, String deal_date, String deal_name, String deal_price, String mem_no, String deal_division, String deal_fix_revenue, String deal_fix_expenditure, String deal_card_name) throws Exception {
		DealVO dealInfo = new DealVO();
		dealInfo.setDeal_option(deal_option);
		dealInfo.setDeal_kind(deal_kind);
		dealInfo.setDeal_date(deal_date);
		dealInfo.setDeal_name(deal_name);
		dealInfo.setDeal_price(deal_price);
		dealInfo.setDeal_division(deal_division);
		dealInfo.setMem_no(mem_no);
		dealInfo.setDeal_fix_expenditure(deal_fix_expenditure);
		dealInfo.setDeal_fix_revenue(deal_fix_revenue);
		dealInfo.setDeal_card_name(deal_card_name);
		
		int cnt = this.service.insertDeal(dealInfo);
		ModelAndView andView = new ModelAndView();
		List<DealVO> list = service.dealList(mem_no);
		andView.addObject("list", list);
		// <bean id="jsonConvertView" class="..MappingJackson2JsonView>
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("staticregistTrace")
	public ModelAndView staticregistTrace(String deal_option, String deal_kind, String deal_date, String deal_name, String deal_price, String mem_no, String deal_division, String deal_fix_revenue, String deal_fix_expenditure, String deal_card_name) throws Exception {
		DealVO dealInfo = new DealVO();
		dealInfo.setDeal_option(deal_option);
		dealInfo.setDeal_kind(deal_kind);
		dealInfo.setDeal_date(deal_date);
		dealInfo.setDeal_name(deal_name);
		dealInfo.setDeal_price(deal_price);
		dealInfo.setDeal_division(deal_division);
		dealInfo.setMem_no(mem_no);
		dealInfo.setDeal_fix_expenditure(deal_fix_expenditure);
		dealInfo.setDeal_fix_revenue(deal_fix_revenue);
		dealInfo.setDeal_card_name(deal_card_name);
		
		int cnt = this.service.insertDeal(dealInfo);
		ModelAndView andView = new ModelAndView();
		List<DealVO> list = service.staticList(mem_no);
		andView.addObject("list", list);
		// <bean id="jsonConvertView" class="..MappingJackson2JsonView>
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("registCard")
	public ModelAndView registCard(String card_kind, String mem_no) throws Exception {
		CardVO cardInfo = new CardVO();
		cardInfo.setCard_kind(card_kind);
		cardInfo.setMem_no(mem_no);
		this.service.registCard(cardInfo);
		ModelAndView andView = new ModelAndView();
		List<CardVO> cardlist = service.cardList(mem_no);
		andView.addObject("cardlist", cardlist);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("barChart")
	public ModelAndView barChart(String mem_no, String startDate, String endDate, String deal_year, String deal_bungi, String deal_month) throws Exception {
		
		System.out.println(mem_no);
		System.out.println(startDate);
		System.out.println(endDate);
		System.out.println(deal_year);
		System.out.println(deal_bungi);
		System.out.println(deal_month);
		
		Map<String, String> params = new HashMap<>();
		
		String bungiStart = null;
		String bungiEnd = null;
		int check = 0;
		
		
		if( endDate == null || endDate.length()<1 ) {
			startDate = null;
			params.put("startDate", startDate);
			System.out.println("startdate null");
			endDate = null;
			params.put("endDate", endDate);
			System.out.println("endDate null");
		}
		else if(startDate != null || endDate != null) {
			String[] a = startDate.split("-");
			startDate = a[1];
			a = endDate.split("-");
			endDate = a[1];
			params.put("startDate", startDate);
			params.put("endDate", endDate);
			System.out.println("선택날짜");
			System.out.println(startDate);  //04
			System.out.println(endDate);    //09
		}
		if(deal_year == null || deal_year.length()<1 ) {
			deal_year = null;
			params.put("deal_year", deal_year);
			System.out.println("deal_year null");
		}
		if( deal_bungi == null || deal_bungi.length()<1 ) {
			deal_bungi = null;
			params.put("deal_bungi", deal_bungi);
			System.out.println("deal_bungi null");
		}else if(deal_bungi.length()>0) {
			String[] str = deal_bungi.split("/");
			deal_bungi = str[0];
			if(deal_bungi.equals("1")) {
				bungiStart = "1";
				bungiEnd = "3";
			}
			else if(deal_bungi.equals("2")) {
				bungiStart = "4";
				bungiEnd = "6";
			}
			else if(deal_bungi.equals("3")) {
				bungiStart = "7";
				bungiEnd = "9";
			}
			else if(deal_bungi.equals("4")) {
				bungiStart = "10";
				bungiEnd = "12";
			}
			params.put("bungiStart", bungiStart);
			params.put("bungiEnd", bungiEnd);
			params.put("deal_bungi", deal_bungi);
		}
		
		if(deal_month == null || deal_month.length()<1   ) {
			deal_month = null;
			params.put("deal_month", deal_month);
			System.out.println("deal_month null");
		}else if(deal_month.length()>0) {
			String[] m = deal_month.split("월");
			deal_month = m[0];
			params.put("deal_month", deal_month);
			System.out.println("월별");
			System.out.println(deal_month);
		}
		List<DealVO> listPlus = new ArrayList<DealVO>();
		List<DealVO> listMinus = new ArrayList<DealVO>();
		List<DealVO> label = new ArrayList<DealVO>();
		
	
		params.put("deal_year", deal_year);		
		params.put("mem_no", mem_no);		
		
		if(deal_year != null || deal_bungi != null) {
			listPlus = service.accountList_Plus(params);
			listMinus = service.accountList_Minus(params);
			label = service.accountLabel(params);
			check = 1;
		}
		
		if(deal_month != null) {
			listPlus = service.accountList2_Plus(params);
			listMinus = service.accountList2_Minus(params);
			label = service.accountLabel2(params);
			check = 2;
		}
		
		
		if(startDate != null || endDate != null) {
			listPlus = service.accountList_Plus(params);
			listMinus = service.accountList_Minus(params);
			label = service.accountLabel(params);
			check = 1;
		}
		
		
		ModelAndView andView = new ModelAndView();
		andView.addObject("check",check);
		andView.addObject("label",label);
		andView.addObject("listMinus",listMinus);
		andView.addObject("listPlus",listPlus);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("accountInfo")
	public ModelAndView accountInfo(String deal_no) throws Exception {
		
		DealVO vo =service.dealInfo(deal_no);
		ModelAndView andView = new ModelAndView();
		andView.addObject("dealInfo",vo);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("cardList")
	public ModelAndView cardList(String card_kind, String mem_no) throws Exception {
		ModelAndView andView = new ModelAndView();
		List<CardVO> cardlist = service.cardList(mem_no);
		andView.addObject("cardlist", cardlist);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	
	@RequestMapping("staticList")
	public ModelAndView staticList(String mem_no) throws Exception {
		ModelAndView andView = new ModelAndView();
		List<DealVO> staticList = service.staticList(mem_no);
		andView.addObject("staticList", staticList);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	
	@RequestMapping("deleteCard")
	public ModelAndView deleteCard(String card_no, String mem_no) throws Exception {
		ModelAndView andView = new ModelAndView();
		service.deleteCard(card_no);
		List<CardVO> cardlist = service.cardList(mem_no);
		andView.addObject("cardlist", cardlist);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	@RequestMapping("deletedeal")
	public ModelAndView deletedeal(String deal_no, String mem_no) throws Exception {
		ModelAndView andView = new ModelAndView();
		service.deletedeal(deal_no);
		List<DealVO> staticList = service.staticList(mem_no);
		andView.addObject("staticList", staticList);
		// <bean id="jsonConvertView" class="..MappingJackson2JsonView>
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("searchAccountList")
	public ModelAndView searchAccountList(@RequestParam(value = "startDate", required = false) String startDate, @RequestParam(value = "endDate", required = false) String endDate, @RequestParam(value = "deal_option", required = false) String deal_option,
			@RequestParam(value = "deal_name", required = false) String deal_name, @RequestParam(value = "deal_division", required = false) String deal_division, @RequestParam(value = "deal_kind", required = false) String deal_kind,
			@RequestParam(value = "deal_year", required = false) String deal_year, @RequestParam(value = "deal_bungi", required = false) String deal_bungi,@RequestParam(value = "deal_month", required = false) String deal_month, String mem_no,
			HttpServletRequest request, String currentPage, RolePaginationUtil_account pagination) throws Exception {
		Map<String, String> params = new HashMap<>();
		String bungiStart = null;
		String bungiEnd = null;
		System.out.println("테스트");
		System.out.println(deal_kind);
		if(deal_name.length()<1) {
			deal_name = null;
		}
		if(startDate.length()<1) {
			startDate = null;
		}
		if(endDate.length()<1) {
			endDate = null;
		}
		if(deal_option.length()<1) {
			deal_option = null;
		}
		if(deal_division.length()<1) {
			deal_division = null;
		}
		if(deal_kind.length()<1) {
			deal_kind = null;
		}
		if(deal_year.length()<1) {
			deal_year = null;
		}
		if(deal_bungi.length()<1) {
			deal_bungi = null;
		}else if(deal_bungi.length()>0) {
			String[] str = deal_bungi.split("/");
			deal_bungi = str[0];
			if(deal_bungi.equals("1")) {
				bungiStart = "1";
				bungiEnd = "3";
			}
			else if(deal_bungi.equals("2")) {
				bungiStart = "4";
				bungiEnd = "6";
			}
			else if(deal_bungi.equals("3")) {
				bungiStart = "7";
				bungiEnd = "9";
			}
			else if(deal_bungi.equals("4")) {
				bungiStart = "10";
				bungiEnd = "12";
			}
			params.put("bungiStart", bungiStart);
			params.put("bungiEnd", bungiEnd);
			params.put("deal_bungi", deal_bungi);
		}
		if(deal_month.length()<1) {
			deal_month = null;
		}else if(deal_month.length()>0) {
			String[] m = deal_month.split("월");
			deal_month = m[0];
			params.put("deal_month", deal_month);
		}
		
		
		params.put("startDate", startDate);
		params.put("endDate", endDate);
		params.put("deal_option", deal_option);
		params.put("deal_name", deal_name);
		params.put("deal_division", deal_division);
		
		
		
		
		if(deal_kind == null) {
			params.put("deal_kind", null);
			params.put("deal_card_name", null);
		}
		else if(deal_kind.equals("현금")) {
			params.put("deal_kind", deal_kind);
		}
		else if(!(deal_kind.equals("현금")) && deal_kind != null) {
			params.put("deal_card_name", deal_kind);
		}
		params.put("deal_year", deal_year);
		params.put("mem_no", mem_no);
		
		
		
		
		if (currentPage == null) {
			currentPage = "1";
		}

		String totalCount = service.totalCount(params);

		pagination.RolePaginationUtil(request, Integer.parseInt(currentPage), Integer.parseInt(totalCount));

		String startCount = String.valueOf(pagination.getStartCount());

		String endCount = String.valueOf(pagination.getEndCount());

		params.put("startCount", startCount);
		params.put("endCount", endCount);
		
		System.out.println(params.get(deal_kind));
		
		List<DealVO> list =  service.searchList(params);
		
		System.out.println(pagination.getPagingHtmls());
		ModelAndView andView = new ModelAndView();
		andView.addObject("list", list);
		andView.addObject("pagination", pagination.getPagingHtmls());
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("deleteAccount")
	public ModelAndView deleteAccount(String deal_no) throws Exception {
		System.out.println(deal_no);
		service.deletedeal(deal_no);
		ModelAndView andView = new ModelAndView();
		andView.setViewName("jsonConvertView");
		return andView;
	}
	@RequestMapping("updateAccount")
	public ModelAndView updateAccount(String deal_no, String deal_date, String deal_name, String deal_price, String deal_division, String deal_option, String deal_kind, String deal_card_name) throws Exception {
		Map<String, String> params = new HashMap<String, String>();
		params.put("deal_no", deal_no);		
		params.put("deal_date", deal_date);		
		params.put("deal_name", deal_name);		
		params.put("deal_price", deal_price);		
		params.put("deal_division", deal_division);		
		params.put("deal_option", deal_option);		
		
		
		if(deal_kind.equals("현금")) {
			params.put("deal_kind", deal_kind);		
		}else if(deal_kind.equals("카드")) {
			params.put("deal_kind", deal_kind);
			params.put("deal_card_name", deal_card_name);
		}
        
		service.updateAccount(params);
		ModelAndView andView = new ModelAndView();
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	
	
	// ocr
		@RequestMapping("ocr")
		public ModelAndView ocr(Model model, DealVO dealInfo, @RequestParam("files") MultipartFile items,
				HttpServletRequest request, ModelAndView andView) throws Exception {

			HttpSession session = request.getSession();
			MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");

			String imageFilePath = "D:\\receipt\\" + saveFile(items);

			ByteString imgBytes = ByteString.readFrom(new FileInputStream(imageFilePath));

			List<AnnotateImageRequest> requests = new ArrayList<>();
			Image img = Image.newBuilder().setContent(imgBytes).build();
			Feature feat = Feature.newBuilder().setType(Type.TEXT_DETECTION).build();
			AnnotateImageRequest req = AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
			requests.add(req);

			// 만들어진 AnnotateImageRequest를 클라이언트 요청에 담아 보내서 Response 객체를 받아오는 부분
			try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
				BatchAnnotateImagesResponse resp = client.batchAnnotateImages(requests);
				List<AnnotateImageResponse> responses = resp.getResponsesList();

				// 1개의 이미지만 넣었기 때문에 response도 하나이고, 따라서 for문은 별 의미는 없다.
				for (AnnotateImageResponse res : responses) {
					if (res.hasError()) {
						System.out.println(res.getError().getMessage());
						break;
					}
					// Response 객체에 담겨져 온 분석 결과 (이미지 내의 텍스트) 가 여기서 출력된다.
					System.out.println("Text : ");
					System.out.println(res.getTextAnnotationsList().get(0).getDescription());

					System.out.println("============================================================");
					System.out.println("날짜 : " + res.getTextAnnotationsList().get(117).getDescription());
					System.out.println("물품 : " + res.getTextAnnotationsList().get(38).getDescription());
					System.out.println("금액 : " + res.getTextAnnotationsList().get(48).getDescription());
					System.out.println("============================================================");
					System.out.println();
					
					dealInfo.setDeal_date(res.getTextAnnotationsList().get(117).getDescription());
					dealInfo.setDeal_name(res.getTextAnnotationsList().get(38).getDescription());
					dealInfo.setDeal_price(res.getTextAnnotationsList().get(48).getDescription());
					
					/*
					 * inbodyInfo.setInbody_weight(res.getTextAnnotationsList().get(6).
					 * getDescription());
					 * inbodyInfo.setInbody_bone(res.getTextAnnotationsList().get(13).getDescription
					 * ());
					 * inbodyInfo.setInbody_fat(res.getTextAnnotationsList().get(21).getDescription(
					 * )); inbodyInfo.setInbody_muscle(res.getTextAnnotationsList().get(35).
					 * getDescription()); inbodyInfo.setMem_no(memberInfo.getMem_no());
					 */

				}
			} catch (Exception e) {
				e.printStackTrace();
			}

			/* this.service.insertDeal(dealInfo); */
			
			String result2 = "success";
			
		    andView.addObject("dealInfo", dealInfo); 
			andView.addObject("json", result2);
			andView.setViewName("jsonConvertView");
			
			return andView;
		}
		
	
		// 사진 저장될 경로
		private static final String UPLOAD_PATH = "D:\\receipt";

	
		private String saveFile(@RequestParam("files") MultipartFile items) {

			// 파일 저장
			String saveName = items.getOriginalFilename();

			// 저장할 File 객체를 생성(껍데기 파일)
			File saveFile = new File(UPLOAD_PATH, saveName); // 저장할 폴더 이름, 저장할 파일 이름

			try {
				items.transferTo(saveFile); // 업로드 파일에 saveFile넣기
			} catch (IOException e) {
				e.printStackTrace();
				return null;
			}
			return saveName;
		}
	@RequestMapping("accountMap")
	public void accountMap() {}
		
		
	@RequestMapping("excelDown")
	public void excelDown(HttpServletResponse response,
							HttpSession session
							,Map<String, String> params
							,RolePaginationUtil_BYEOL pagination
							,HttpServletRequest request
							,@RequestParam(value = "currentPage", required = false) String currentPage) throws Exception {
		
		if(currentPage == null){
	         currentPage = "1";
	      }
		
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		List<DealVO> list4Size = service.dealList(memberInfo.getMem_no());
		String totalCount = Integer.toString(list4Size.size());
	    
		pagination.RolePaginationUtil(request, Integer.parseInt(currentPage), Integer.parseInt(totalCount));
	    String startCount = String.valueOf(pagination.getStartCount());
	    String endCount = String.valueOf(pagination.getEndCount());
	    
	    params.put("startCount", startCount);
	    params.put("endCount", endCount);
	    params.put("mem_no", memberInfo.getMem_no());
	    
	    List<DealVO> list = service.dealList(memberInfo.getMem_no());
		
		// 워크북 생성
		Workbook wb = new HSSFWorkbook();
		Sheet sheet = wb.createSheet("거래 등록 내역");
		Row row = null;
		Cell cell = null;
		int rowNo = 0;

		// 헤더 생성
		row = sheet.createRow(rowNo++);
		cell = row.createCell(0);
		cell.setCellValue("거래 일자");
		
		cell = row.createCell(1);
		cell.setCellValue("구분");
		
		cell = row.createCell(2);
		cell.setCellValue("거래방법");
		
		cell = row.createCell(3);
		cell.setCellValue("거래 내역");
		
		cell = row.createCell(4);
		cell.setCellValue("입/출");
		
		cell = row.createCell(5);
		cell.setCellValue("금액");
		
		// 데이터 부분 생성
		for(DealVO vo : list) {
			row = sheet.createRow(rowNo++);
			cell = row.createCell(0);
			cell.setCellValue(vo.getDeal_date());
			
			cell = row.createCell(1);
			cell.setCellValue(vo.getDeal_division());
			
			cell = row.createCell(2);
			cell.setCellValue(vo.getDeal_kind());
			
			cell = row.createCell(3);
			cell.setCellValue(vo.getDeal_name());
			
			cell = row.createCell(4);
			cell.setCellValue(vo.getDeal_option());
			
			cell = row.createCell(5);
			cell.setCellValue(vo.getDeal_price());
		}
		
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		
		Calendar time = Calendar.getInstance();
		
		String format_time1 = format1.format(time.getTime());
		
		
		// 엑셀 출력
		response.setContentType("application/vnd.ms-excel");
		response.setHeader("Content-Disposition", "attachment;filename=trace_"+format_time1+".xls");
		
		
		wb.write(response.getOutputStream());

		FileOutputStream fileOut = new FileOutputStream("excel.xlsx");
		wb.write(fileOut);
		fileOut.close();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
