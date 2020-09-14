package kr.or.ddit.car.controller;

import java.util.List;
import java.util.Map;

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
	public ModelAndView carMain(HttpSession session, ModelAndView andView) throws Exception {
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		String mem_no = memberInfo.getMem_no();
		
		List<MyCarVO> carInfo = service.selectMycar(mem_no);
		
		service.selectMycar(mem_no);
		
		andView.addObject("carInfo", carInfo);
		
		return andView;
	}
	
	@RequestMapping("carForm")
	public void carForm() throws Exception {}
	
	@RequestMapping("carView")
	public ModelAndView carForm(HttpSession session, ModelAndView andView, Map<String,String>params, String car_no) throws Exception {
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		String mem_no = memberInfo.getMem_no();
		
		params.put("mem_no", mem_no);
		params.put("car_no", car_no);
		
		MyCarVO carInfo = (MyCarVO) service.selectchoiceMycar(params);
		
		car_no = carInfo.getCar_no();
		String [] no = car_no.split(" ");
		
		if(no.length > 1) {
			car_no = no[0]+no[1];
			carInfo.setCar_no(car_no);
		}
		
		andView.addObject("carInfo", carInfo);
		
		return andView;
	}
	
	@RequestMapping("insertMycar")
	public String insertMycar(MyCarVO carInfo, HttpSession session) throws Exception{
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		String mem_no = memberInfo.getMem_no();
		
		carInfo.setMem_no(mem_no);
		
		service.insertMycar(carInfo);
		
		return "redirect:/user/car/carMain.do";
	}
	
	@RequestMapping("updateMycar")
	public String updateMycar(MyCarVO carInfo, HttpSession session) throws Exception{
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		String mem_no = memberInfo.getMem_no();
		
		carInfo.setMem_no(mem_no);
		
		service.updateMycar(carInfo);
		
		return "redirect:/user/car/carMain.do";
	}
}
