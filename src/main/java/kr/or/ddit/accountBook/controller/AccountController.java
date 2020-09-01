package kr.or.ddit.accountBook.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.accountBook.service.IDealService;
import kr.or.ddit.schedule.service.IScheduleService;
import kr.or.ddit.utiles.RolePaginationUtil_pill;
import kr.or.ddit.vo.DealVO;
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
	public ModelAndView setting() throws Exception {
		
		List<DealVO> list = service.dealList("2");

		ModelAndView andView = new ModelAndView();
		andView.addObject("dealList", list);
		andView.setViewName("user/accountBook/setting");
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

		andView.addObject("cnt", cnt);
		// <bean id="jsonConvertView" class="..MappingJackson2JsonView>
		andView.setViewName("/user/accountBook/setting");
		return andView;
	}
}
