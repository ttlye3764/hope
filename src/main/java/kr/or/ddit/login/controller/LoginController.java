package kr.or.ddit.login.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.login.service.ILoginService;
import kr.or.ddit.vo.LoginVO;

@Controller
@RequestMapping("/admin/login/")
public class LoginController {
	@Autowired
	private ILoginService service;
	
	@RequestMapping("loginList")
	public ModelAndView memberList(String search_keycode
							,String search_keyword
							, ModelAndView andView
							,Map<String, String> params
							,HttpServletRequest request) throws Exception {

		params.put("search_keycode", search_keycode);
		params.put("search_keyword", search_keyword);
		
		List<LoginVO> loginList = this.service.loginList(params);
		
		andView.addObject("param",search_keycode);
		andView.addObject("param",search_keyword);
		andView.addObject("loginList", loginList);
		andView.setViewName("admin/login/loginList");

		return andView;
	}
}
