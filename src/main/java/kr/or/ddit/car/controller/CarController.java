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
import kr.or.ddit.vo.MyCarDetailVO;
import kr.or.ddit.vo.MyCarVO;

@Controller
@RequestMapping("/user/car/")
public class CarController {
	@Autowired
	private ICarService service;
	
	@RequestMapping("parking")
	public void parking() {}
	
	@RequestMapping("oil")
	public void carCenter() {}
	
	@RequestMapping("carMain")
	public ModelAndView carMain(HttpSession session, ModelAndView andView) throws Exception {
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		String mem_no = memberInfo.getMem_no();
		
		List<MyCarVO> carList = service.selectMycar(mem_no);
		
		service.selectMycar(mem_no);
		
		andView.addObject("carList", carList);
		
		return andView;
	}
	
	@RequestMapping("carView")
	public ModelAndView carView(HttpSession session, ModelAndView andView, Map<String,String>params, String car_no, MyCarVO carInfo) throws Exception {
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		String mem_no = memberInfo.getMem_no();
		
		params.put("mem_no", mem_no);
		params.put("car_no", car_no); // db에 저장되어있는 차 번호
		
		String [] no = car_no.split(" ");
		
		if(no.length > 1) {
			car_no = no[0]+no[1];
			carInfo.setCar_no(car_no);
			
			params.put("car_no1", car_no); // 띄어쓰기를 없앤 차 번호
			service.updateCarno(params);
			
			params.remove("car_no");
			params.put("car_no", car_no);
		}
		
		carInfo = (MyCarVO) service.selectchoiceMycar(params);
		
		List<MyCarDetailVO> kmList = service.selectKm(params);
		List<MyCarDetailVO> engineList = service.selectEngine(params);
		List<MyCarDetailVO> breakList = service.selectBreak(params);
		
		String result = "success";
		
		andView.addObject("carInfo", carInfo);
		andView.addObject("kmList", kmList);
		andView.addObject("engineList", engineList);
		andView.addObject("breakList", breakList);
		andView.addObject("json",result);
		andView.setViewName("jsonConvertView");
		
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
	
	@RequestMapping("insertMycarkm")
	public String insertMycarkm(MyCarDetailVO carDetailInfo) throws Exception{
		
		service.insertKm(carDetailInfo);
		
		return "redirect:/user/car/carMain.do";
	}
	
	@RequestMapping("insertMycarEg")
	public String insertMycarEg(MyCarDetailVO carDetailInfo) throws Exception{
		
		service.insertEngine(carDetailInfo);
		
		return "redirect:/user/car/carMain.do";
	}
	
	@RequestMapping("insertMycarBk")
	public String insertMycarBk(MyCarDetailVO carDetailInfo) throws Exception{
		
		service.insertBreak(carDetailInfo);
		
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
	
	@RequestMapping("deleteMycar")
	public String deleteMycar(String car_no, HttpSession session, Map<String,String>params) throws Exception{
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		String mem_no = memberInfo.getMem_no();
		
		params.put("mem_no", mem_no);
		params.put("car_no", car_no);
		
		service.deleteMycar(params);
		
		return "redirect:/user/car/carMain.do";
	}
}
