package kr.or.ddit.accountBook.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.accountBook.service.IDealService;
import kr.or.ddit.schedule.service.IScheduleService;
import kr.or.ddit.utiles.RolePaginationUtil;
import kr.or.ddit.utiles.RolePaginationUtil_BYEOL;
import kr.or.ddit.utiles.RolePaginationUtil_account;
import kr.or.ddit.utiles.RolePaginationUtil_pill;
import kr.or.ddit.utiles.RolePaginationUtil_yun;
import kr.or.ddit.vo.CardVO;
import kr.or.ddit.vo.DealVO;
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

	
	
	@RequestMapping("setting")
	public ModelAndView setting(String mem_no, HttpServletRequest request,HttpSession session,
								Map<String, String> params,ModelAndView andView,String currentPage, RolePaginationUtil_BYEOL pagination) throws Exception {
		 
		if(currentPage == null){
	         currentPage = "1";
	      }
		
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		memberInfo.setMem_no("2");
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
			Map<String, String> params,ModelAndView andView,String currentPage, RolePaginationUtil_BYEOL pagination) throws Exception {
		
		if(currentPage == null){
			currentPage = "1";
		}
		
		//MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		
		
		//List<DealVO> list4Size = service.dealList(memberInfo.getMem_no());
		List<DealVO> list4Size = service.dealList("2");
		String totalCount = Integer.toString(list4Size.size());
		
		pagination.RolePaginationUtil(request, Integer.parseInt(currentPage), Integer.parseInt(totalCount));
		String startCount = String.valueOf(pagination.getStartCount());
		String endCount = String.valueOf(pagination.getEndCount());
		
		params.put("startCount", startCount);
		params.put("endCount", endCount);
		//params.put("mem_no", memberInfo.getMem_no());
		params.put("mem_no", "2");
		
		List<DealVO> list = service.dealListView(params);
		
		andView.addObject("dealList", list);
		andView.addObject("pagination",pagination.getPagingHtmls());
		andView.setViewName("user/accountBook/accountList");
		return andView;
	}
	
	
	
	@RequestMapping("registTrace")
	public ModelAndView registTrace(String deal_option, String deal_kind, String deal_date, String deal_name, String deal_price, String mem_no, String deal_division) throws Exception {
		DealVO dealInfo = new DealVO();
		dealInfo.setDeal_option(deal_option);
		dealInfo.setDeal_kind(deal_kind);
		dealInfo.setDeal_date(deal_date);
		dealInfo.setDeal_name(deal_name);
		dealInfo.setDeal_price(deal_price);
		dealInfo.setDeal_division(deal_division);
		dealInfo.setMem_no(mem_no);
		
		int cnt = this.service.insertDeal(dealInfo);
		ModelAndView andView = new ModelAndView();
		List<DealVO> list = service.dealList(mem_no);
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
	@RequestMapping("cardList")
	public ModelAndView cardList(String card_kind, String mem_no) throws Exception {
		ModelAndView andView = new ModelAndView();
		List<CardVO> cardlist = service.cardList(mem_no);
		andView.addObject("cardlist", cardlist);
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
		List<DealVO> list = service.dealList(mem_no);
		andView.addObject("list", list);
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
		System.out.println(deal_year);
		System.out.println(deal_year.length());
		System.out.println(deal_bungi);
		System.out.println(deal_month);
		if(deal_name.length()<1) {
			System.out.println("널임");
			deal_name = null;
		}
		if(startDate.length()<1) {
			System.out.println("널임");
			startDate = null;
		}
		if(endDate.length()<1) {
			System.out.println("널임");
			endDate = null;
		}
		if(deal_option.length()<1) {
			System.out.println("널임");
			deal_option = null;
		}
		if(deal_division.length()<1) {
			System.out.println("널임");
			deal_division = null;
		}
		if(deal_kind.length()<1) {
			System.out.println("널임");
			deal_kind = null;
		}
		if(deal_year.length()<1) {
			System.out.println("널임");
			deal_year = null;
		}
		if(deal_bungi.length()<1) {
			deal_bungi = null;
		}else if(deal_bungi.length()>0) {
			String[] str = deal_bungi.split("/");
			deal_bungi = str[0];
			System.out.println(deal_bungi);
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
			System.out.println("분기");
			System.out.println(bungiStart);
			params.put("bungiStart", bungiStart);
			params.put("bungiEnd", bungiEnd);
			params.put("deal_bungi", deal_bungi);
		}
		if(deal_month.length()<1) {
			System.out.println("널임");
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
		params.put("deal_kind", deal_kind);
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
		System.out.println("스타트카운트");
		System.out.println(startCount);
		System.out.println(endCount);
		
		
		List<DealVO> list =  service.searchList(params);
		
		
		System.out.println(pagination.getPagingHtmls());
		ModelAndView andView = new ModelAndView();
		andView.addObject("list", list);
		andView.addObject("pagination", pagination.getPagingHtmls());
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
