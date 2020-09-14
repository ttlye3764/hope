package kr.or.ddit.car.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.car.service.ICarService;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MyCarVO;

@Controller
@RequestMapping("/user/car/")
public class CarController {
	@Autowired
	private ICarService service;
	
	@RequestMapping("carMain")
	public void carMain() throws Exception {}
	
	@RequestMapping("carForm")
	public void carForm() throws Exception {}
	
	@RequestMapping("carView")
	public ModelAndView carForm(HttpSession session, ModelAndView andView) throws Exception {
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		String mem_no = memberInfo.getMem_no();
		
		MyCarVO carInfo = service.selectMycar(mem_no);
		
		andView.addObject("carInfo", carInfo);
		
		return andView;
	}
	
	@RequestMapping("insertMycar")
	public String insertMycar(MyCarVO carInfo, HttpSession session) throws Exception{
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		String mem_no = memberInfo.getMem_no();
		
		carInfo.setMem_no(mem_no);
		
		service.insertMycar(carInfo);
		
		return "redirect:/user/car/carForm.do";
	}
}
