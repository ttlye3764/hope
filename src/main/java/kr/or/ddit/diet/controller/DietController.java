package kr.or.ddit.diet.controller;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.protobuf.ByteString;

import kr.or.ddit.diet.service.IDietService;
import kr.or.ddit.utiles.RolePaginationUtil_diet;
import kr.or.ddit.vo.DietBoardVO;
import kr.or.ddit.vo.DietVO;
import kr.or.ddit.vo.Diet_dayVO;
import kr.or.ddit.vo.Diet_day_infoVO;
import kr.or.ddit.vo.Diet_infoVO;
import kr.or.ddit.vo.Diet_memVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MenuVO;

@Controller
@RequestMapping("/user/diet/")
public class DietController {

	@Autowired
	private IDietService dietService;

	@RequestMapping("dietMain")
	public ModelAndView dietMain(ModelAndView andView) {

		andView.setViewName("user/diet/diet");
		return andView;
	}

	@RequestMapping("searchMenu")
	public void searchMenu() {

	}

	@RequestMapping("menuList")
	public ModelAndView menuList(ModelAndView andView, Map<String, String> params,
								@RequestParam(value="search_menu_name", required=false) String search_menu_name,
								@RequestParam(value="search_kcal_min", required=false) String search_kcal_min,
								@RequestParam(value="search_kcal_max", required=false) String search_kcal_max,
								@RequestParam(value="currentPage", required=false) String currentPage,
								RolePaginationUtil_diet pagination,
								HttpServletRequest request,
								String ajax) throws Exception {
		

		if(currentPage == null) {
			currentPage = "1";
		}
		
		// first Loading
		if(search_menu_name != null) {
			if(search_menu_name.length() < 1) {
				params.put("search_menu_name", null);
			}else {
				params.put("search_menu_name", search_menu_name);
			}
			
			if(search_kcal_min.length() < 1) {
				params.put("search_kcal_min", null);
			}else {
				params.put("search_kcal_min", search_kcal_min);
			}
			
			if(search_kcal_max.length() < 1) {
				params.put("search_kcal_max", null);
			}else {
				params.put("search_kcal_max", search_kcal_max);
			}
		}
		
		
		List<MenuVO> menuList = dietService.menuList(params);
		
		int totalCount = menuList.size();
		
		 
		pagination.RolePaginationUtil(request, Integer.parseInt(currentPage), totalCount);
		
	    String startCount = String.valueOf(pagination.getStartCount());
	    String endCount = String.valueOf(pagination.getEndCount());
	    
	    params.put("startCount", startCount);
	    params.put("endCount", endCount);
	    
	    menuList = dietService.menuList(params);
	    
	    
	    andView.addObject("menuList", menuList);
		andView.addObject("pagination",pagination.getPagingHtmls());
		if(ajax == null) {
			andView.setViewName("user/diet/menuList");
			
		}else {
			andView.setViewName("jsonConvertView");
		}
		
		return andView;
	}

	@RequestMapping("dietIntro")
	public ModelAndView dietIntro(ModelAndView andView, Map<String, String> params) throws Exception {

		params.put("rownum", "10");
		List<MenuVO> menuList = dietService.menuList(params);

		andView.addObject("menuList", menuList);
		andView.setViewName("user/diet/dietIntro");
		return andView;
	}

	@RequestMapping("dayKcal")
	public void dayKcal() {

	}

	@RequestMapping("diet_my")
	public ModelAndView diet_my(ModelAndView andView, Map<String, String> params, HttpServletRequest request,
			HttpSession session) throws Exception {
		
		session = request.getSession();
		
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		
		params.put("mem_no", memberInfo.getMem_no());

		List<Diet_memVO> dietMemList = dietService.dietMemList(params);
		
		Diet_memVO dietMemLast = new Diet_memVO();
		
		if(dietMemList.size() > 1) {
			dietMemLast = dietMemList.get(dietMemList.size() - 1);
		}

		andView.addObject("dietMemLast", dietMemLast);
		andView.addObject("dietMemList", dietMemList);
		andView.setViewName("user/diet/diet_my");
		return andView;
	}

	@RequestMapping("dietMemListAjax")
	public ModelAndView dietMemListAjax(ModelAndView andView, Map<String, String> params, HttpServletRequest request,
			HttpSession session) throws Exception {
		session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		params.put("mem_no", memberInfo.getMem_no());

		List<Diet_memVO> dietMemList = dietService.dietMemList(params);

		Diet_memVO dietMemLast = dietMemList.get(dietMemList.size() - 1);

		andView.addObject("dietMemLast", dietMemLast);
		andView.addObject("dietMemList", dietMemList);

		andView.setViewName("jsonConvertView");
		return andView;
	}

	@RequestMapping("recommendDiet")
	public ModelAndView recommendDiet(ModelAndView andView,
									Map<String, String> params) throws Exception{
		
		List<DietVO> dietList = dietService.recommendDietList(params);
		
		andView.addObject("dietList", dietList);
		andView.setViewName("user/diet/recommendDiet");
		return andView;
	}
	@RequestMapping("recommendDietInfo")
	public ModelAndView recommendDietInfo(ModelAndView andView,
											Map<String, String> params,
											@RequestParam(value="diet_no", required = false) String diet_no) throws Exception{
		
		params.put("diet_no", diet_no);
		List<Diet_infoVO> dietInfoList = dietService.recommendDietInfo(params);
		List<Diet_infoVO> dietInfoList1 = new ArrayList<Diet_infoVO>();
		List<Diet_infoVO> dietInfoList2 = new ArrayList<Diet_infoVO>();
		List<Diet_infoVO> dietInfoList3 = new ArrayList<Diet_infoVO>();
		
		for(Diet_infoVO dietInfo : dietInfoList) {
			if(dietInfo.getDiet_info_division().equals("1")) {
				dietInfoList1.add(dietInfo);
			}
			if(dietInfo.getDiet_info_division().equals("2")) {
				dietInfoList2.add(dietInfo);
			}
			if(dietInfo.getDiet_info_division().equals("3")) {
				dietInfoList3.add(dietInfo);
			}
		}
		andView.addObject("dietInfoList1", dietInfoList1);
		andView.addObject("dietInfoList2", dietInfoList2);
		andView.addObject("dietInfoList3", dietInfoList3);
		andView.setViewName("jsonConvertView");
		return andView;
	}

	@RequestMapping("bmi")
	public void bmi() {
	}

	@RequestMapping("searchAjax")
	public String insertMenu(String a, String b, Map<String, String> params) throws Exception {
		StringBuilder urlBuilder = new StringBuilder(
				"http://openapi.foodsafetykorea.go.kr/api/2ea6cf2e26314645b965/I2790/json/1/500"); /* URL */
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		System.out.println(sb.toString());

		JSONParser jsonParser = new JSONParser();

		JSONObject jsonObject = (JSONObject) jsonParser.parse(sb.toString());

		// JSONObject xmlJSONObj = XML.toJSONObject(sb.toString());

		JSONObject I2790JSON = (JSONObject) jsonObject.get("I2790");

		JSONArray rowJSONArray = (JSONArray) I2790JSON.get("row");

		String menu_kcal = "";
		String menu_name = "";

		for (int i = 0; i < rowJSONArray.size(); i++) {

			System.out.println("=row_" + i + " ===========================================");

			// 배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
			JSONObject rowObject = (JSONObject) rowJSONArray.get(i);

			// JSON name으로 추출
			System.out.println("rowInfo: NUTR_CONT3==>" + rowObject.get("NUTR_CONT3"));
			System.out.println("rowInfo: NUTR_CONT2==>" + rowObject.get("NUTR_CONT2"));
			System.out.println("rowInfo: NUTR_CONT1==>" + rowObject.get("NUTR_CONT1"));
			System.out.println("rowInfo: SERVING_SIZE==>" + rowObject.get("SERVING_SIZE"));
			System.out.println("rowInfo: DESC_KOR==>" + rowObject.get("DESC_KOR"));

			menu_kcal = rowObject.get("NUTR_CONT1").toString();
			menu_name = rowObject.get("DESC_KOR").toString();

			if (rowObject.get("NUTR_CONT1").toString().equals("")) {
				menu_kcal = "0";
			}
			params.put("menu_kcal", menu_kcal);
			params.put("menu_name", menu_name);

			dietService.insertMenu(params);

		}
		// NUTR_CONT1 열량
		// DESC_KOR 식품이름

		// String xmlJSONObjString = xmlJSONObj.toString();
		System.out.println("아");

		return "success";
	}

	@RequestMapping("insertDietMem")
	public ModelAndView insertDietMem(Diet_memVO diet_memInfo, ModelAndView andView, HttpServletRequest request,
			HttpSession session, MemberVO memberInfo, String activity) throws Exception {
		session = request.getSession();

		memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");

		// bm 계산
		int height = Integer.parseInt(diet_memInfo.getHeight());
		int current_weight = Integer.parseInt(diet_memInfo.getCurrent_weight());
		int purpose_weight = Integer.parseInt(diet_memInfo.getPurpose_weight());

		int int_bmi = (int) ((float) current_weight / (height * height) * 10000);
		String bmi = int_bmi + "";

		String day_kcal = null;

		// 일일 추천 열량 계산
		if (current_weight == purpose_weight) {
			// 현재 체중 유지
			int recommendKcal = (int) ((height - 100) / 0.9 * (float) (Integer.parseInt(activity)));
			day_kcal = recommendKcal + "";
		} else if (current_weight > purpose_weight) {
			// 다이어트
			int recommendKcal = (int) ((height - 100) / 0.9 * (float) (Integer.parseInt(activity))) - 300;
			day_kcal = recommendKcal + "";
		} else {
			// 살 찌우고 싶을 때
			int recommendKcal = (int) ((height - 100) / 0.9 * (float) (Integer.parseInt(activity))) + 300;
			day_kcal = recommendKcal + "";
		}

		diet_memInfo.setBmi(bmi);
		diet_memInfo.setMem_no(memberInfo.getMem_no());
		diet_memInfo.setDay_kcal(day_kcal);

		dietService.insertDietMem(diet_memInfo);

		andView.setViewName("jsonConvertView");
		return andView;
	}

	@RequestMapping("menuSearch")
	public ModelAndView menuSearch(ModelAndView andView, String menu_search, Map<String, String> params)
			throws Exception {

		params.put("menu_search", menu_search);
		List<MenuVO> menuSearchList = dietService.menuSearch(params);

		andView.addObject("menuSearchList", menuSearchList);
		andView.setViewName("jsonConvertView");
		return andView;
	}

	@RequestMapping("insertAllDietDay")
	public ModelAndView insertAllDietDay(ModelAndView andView, Diet_dayVO dietDay, Diet_day_infoVO dietDayInfo,
			HttpServletRequest request, HttpSession session, String dd_date, Map<String, String> params, int dd_no)
			throws Exception {

		dietDayInfo.setDd_no(dd_no + "");
		dietService.InsertDietDayInfo(dietDayInfo);

		params.put("dd_no", dd_no + "");
		dietService.updateDietDayKcal(params);

		andView.setViewName("jsonConvertView");
		return andView;
	}

	@RequestMapping("calendarModal")
	public ModelAndView calendarModal(ModelAndView andView, String dd_date, HttpServletRequest request,
			HttpSession session, Map<String, String> params, Diet_dayVO dietDay, String dd_no) throws Exception {

		// 일별 식단 등록

		session = request.getSession();

		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");

		dietDay.setMem_no(memberInfo.getMem_no());

		params.put("dd_date", dd_date);
		params.put("mem_no", memberInfo.getMem_no());

		// 처음 선택시에는 잘 들어가는데 그다음 다른창을 선택하면 insert가 3번된다?
		if (dietService.selectDietDay(params) == null) {
			dd_no = dietService.insertDietDay(dietDay) + "";
			params.put("dd_no", dd_no);
			
		} else {
			dietDay = dietService.selectDietDay(params);
			params.put("dd_no", dietDay.getDd_no());
		}

		// 일별 식단 내용 가져오기

		// 일별 식단의 식단 번호 가져오기
		

		// 일별 식단 상세 가져오기
		// 1 -> 아침꺼
		params.put("dd_info_division", "1");
		List<Diet_day_infoVO> dietDayInfoList1 = dietService.dietDayInfoList(params);

		// 2 -> 점심꺼
		params.put("dd_info_division", "2");
		List<Diet_day_infoVO> dietDayInfoList2 = dietService.dietDayInfoList(params);

		// 3 -> 저녁
		params.put("dd_info_division", "3");
		List<Diet_day_infoVO> dietDayInfoList3 = dietService.dietDayInfoList(params);

		andView.addObject("dietDay", dietDay);
		andView.addObject("dietDayInfoList1", dietDayInfoList1);
		andView.addObject("dietDayInfoList2", dietDayInfoList2);
		andView.addObject("dietDayInfoList3", dietDayInfoList3);

		andView.setViewName("jsonConvertView");
		return andView;
	}

	@RequestMapping("deleteDietDayInfo")
	public ModelAndView deleteDietDayInfo(ModelAndView andView, Map<String, String> params, String ddi_no,
			String dd_info_division, int dd_no) throws Exception {
		params.put("ddi_no", ddi_no);
		params.put("dd_info_division", dd_info_division);

		dietService.deleteDietDayInfo(params);
		params.put("dd_no", dd_no + "");
		dietService.updateDietDayKcal(params);

		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("kcalCalculate")
	public ModelAndView kcalCalculate(ModelAndView andView,
									@RequestParam(value="kcal", required = false)String kcall,
									Map<String, String> kcal) throws Exception{
		
		int intKcal = Integer.parseInt(kcall);
		
		String ring = intKcal / 5+"";
		String tenis = intKcal / 6+ "";
		String hiking = intKcal /  3 +"";
		String takgu = intKcal /  4 +"";
		String waking = intKcal /  3 +"";
		String cycle = intKcal /  4 +"";
		String joging = intKcal /  7 +"";
		String ski =intKcal /  6 +"";
		String mealPreparation =intKcal /  2 +"";
		String blanket = intKcal /  3 +"";
		String dressing = intKcal /  3 +"";
		String talk = intKcal /  1 +"";
		String clean = intKcal /  3 +"";
		String bath = intKcal /  2 +"";
		String ironing = intKcal /  2 +"";
		String sleep = intKcal /  1 +"";
		String look = intKcal /  1 +"";
		String cleanShoes = intKcal /  2 +"";
		String tv = intKcal /  1 +"";
		String makeup =intKcal /  1 +"";
		String wash = intKcal /  3 +"";
		String staris = intKcal /  3 +"";
		String swimming = intKcal /  5 +"";
		
		
		kcal.put("ring",ring);
		kcal.put("tenis", tenis);
		kcal.put("hiking", hiking);
		kcal.put("takgu", takgu);
		kcal.put("waking", waking);
		kcal.put("cycle", cycle);
		kcal.put("joging", joging);
		kcal.put("ski", ski);
		kcal.put("mealPreparation", mealPreparation);
		kcal.put("blanket", blanket);
		kcal.put("dreesing", dressing);
		kcal.put("talk", talk);
		kcal.put("clean",clean);
		kcal.put("bath", bath);
		kcal.put("ironing", ironing);
		kcal.put("sleep", sleep);
		kcal.put("look", look);
		kcal.put("cleanShoes", cleanShoes);
		kcal.put("tv", tv);
		kcal.put("makeup", makeup);
		kcal.put("wash", wash);
		kcal.put("stairs",staris);
		kcal.put("swimming", swimming);
		
		
		andView.addObject("kcal", kcal);
		andView.setViewName("user/diet/dayKcal");
		return andView;
	}

	@RequestMapping("dietMemGraphList")
	public ModelAndView dietMemGraph(ModelAndView andView, Map<String, String> params, HttpServletRequest request,
			HttpSession session) throws Exception {

		session = request.getSession();

		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");

		params.put("mem_no", memberInfo.getMem_no());

		List<Diet_dayVO> dietDayMemList = dietService.dietMemGraphList(params);

		andView.addObject("dietDayMemList", dietDayMemList);

		andView.setViewName("jsonConvertView");
		return andView;
	}

	@RequestMapping("dietBoardList")
	public ModelAndView dietBoardList(ModelAndView andView, Map<String, String> params, HttpSession session,
			HttpServletRequest request) throws Exception {

		session = request.getSession();

		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		params.put("mem_no", memberInfo.getMem_no());

		List<DietBoardVO> dietBoardList = dietService.dietBoardList(params);

		andView.addObject("dietBoardList", dietBoardList);

		andView.setViewName("jsonConvertView");
		return andView;
	}

	@RequestMapping("updateDietBoard")
	public ModelAndView updateDietBoard(ModelAndView andView, Map<String, String> params,
			@RequestBody List<Map<String, String>> json) throws Exception {

		List<DietBoardVO> dietBoardList = new ArrayList<DietBoardVO>();
		for (int i = 0; i < json.size(); i++) {
			DietBoardVO dietBoardInfo = new DietBoardVO();
			dietBoardInfo.setDiet_board_title(json.get(i).get("diet_board_title"));
			dietBoardInfo.setDiet_board_content(json.get(i).get("diet_board_content"));
			dietBoardInfo.setDiet_board_no(json.get(i).get("diet_board_no"));

			dietBoardList.add(dietBoardInfo);
		}

		dietService.updateDietBoard(dietBoardList);

		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("insertDietBoard")
	public ModelAndView insertDietBoard(ModelAndView andView,
										Map<String, String> params,
										HttpServletRequest request,
										HttpSession session) throws Exception{
		
		session = request.getSession();
		
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		
		params.put("mem_no", memberInfo.getMem_no());
		
		dietService.insertDietBoard(params);
		
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("insertDietBoardFirst")
	public ModelAndView insertDietBoardFirst(ModelAndView andView, Map<String, String> params, HttpServletRequest request,
									HttpSession session) throws Exception {

		session = request.getSession();

		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");

		params.put("mem_no", memberInfo.getMem_no());

		dietService.insertDietBoardFirst(params);

		andView.setViewName("jsonConvertView");
		return andView;
	}
	

	@RequestMapping("ocr")
	public static void detectText(HttpServletRequest request) throws IOException {
		// TODO(developer): Replace these variables before running the sample.
		String filePath = request.getSession().getServletContext().getRealPath("/image/ocrTest.png");
		detectText(filePath);
	}

	// Detects text in the specified image.
	public static void detectText(String filePath) throws IOException {
		List<AnnotateImageRequest> requests = new ArrayList<>();

		ByteString imgBytes = ByteString.readFrom(new FileInputStream(filePath));

		Image img = Image.newBuilder().setContent(imgBytes).build();
		Feature feat = Feature.newBuilder().setType(Feature.Type.TEXT_DETECTION).build();
		AnnotateImageRequest request = AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
		requests.add(request);

		// Initialize client that will be used to send requests. This client only needs
		// to be created
		// once, and can be reused for multiple requests. After completing all of your
		// requests, call
		// the "close" method on the client to safely clean up any remaining background
		// resources.
		try (ImageAnnotatorClient client = ImageAnnotatorClient.create()) {
			BatchAnnotateImagesResponse response = client.batchAnnotateImages(requests);
			List<AnnotateImageResponse> responses = response.getResponsesList();

			for (AnnotateImageResponse res : responses) {
				if (res.hasError()) {
					System.out.format("Error: %s%n", res.getError().getMessage());
					return;
				}

				// For full list of available annotations, see http://g.co/cloud/vision/docs
				for (EntityAnnotation annotation : res.getTextAnnotationsList()) {
					System.out.format("Text: %s%n", annotation.getDescription());
					System.out.format("Position : %s%n", annotation.getBoundingPoly());
				}
			}
		}
	}

}
