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
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.accountBook.service.IDealService;
import kr.or.ddit.schedule.service.IScheduleService;
import kr.or.ddit.utiles.RolePaginationUtil;
import kr.or.ddit.utiles.RolePaginationUtil_BYEOL;
import kr.or.ddit.utiles.RolePaginationUtil_pill;
import kr.or.ddit.utiles.RolePaginationUtil_yun;
import kr.or.ddit.vo.DealVO;
import kr.or.ddit.vo.MemberVO;
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
		andView.setViewName("user/accountBook/accountList");
		return andView;
	}
	
	
	
	@RequestMapping("registTrace")
	public ModelAndView registTrace(String deal_option, String deal_kind, String deal_date, String deal_name, String deal_price, String mem_no) throws Exception {
		DealVO dealInfo = new DealVO();
		dealInfo.setDeal_option(deal_option);
		dealInfo.setDeal_kind(deal_kind);
		dealInfo.setDeal_date(deal_date);
		dealInfo.setDeal_name(deal_name);
		dealInfo.setDeal_price(deal_price);
		dealInfo.setMem_no(mem_no);
		
		int cnt = this.service.insertDeal(dealInfo);
		ModelAndView andView = new ModelAndView();
		List<DealVO> list = service.dealList(mem_no);
		andView.addObject("list", list);
		// <bean id="jsonConvertView" class="..MappingJackson2JsonView>
		andView.setViewName("jsonConvertView");
		return andView;
	}
}
