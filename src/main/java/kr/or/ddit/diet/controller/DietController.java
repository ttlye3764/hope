package kr.or.ddit.diet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/diet/")
public class DietController {
	
	@RequestMapping("dietMain")
	public ModelAndView dietMain(ModelAndView andView) {
		
		
		andView.setViewName("user/diet/dietMain");
		return andView;
	}
	
}
