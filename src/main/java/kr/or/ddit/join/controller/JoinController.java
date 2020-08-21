package kr.or.ddit.join.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.aop.Loggable;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.vo.MemberVO;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.support.RequestContextUtils;

// /SpringToddler/user/join/loginForm.do
// /SpringToddler/user/join/loginCheck.do
// /SpringToddler/user/join/loginOut.do
@Controller
@RequestMapping("/user/join/")
public class JoinController {
	/*@Loggable
	private Logger logger;*/
	
	@Autowired
	private MessageSourceAccessor accessor;
	@Autowired
	private IMemberService service;
	@RequestMapping("loginForm")
	public void loginForm(HttpServletRequest request){
		// 반환값 : join/loginForm
		// InternalResourceViewResolver 취득
		//   prefix(/WEB-INF/views/user/)
		//   suffix(.jsp)
		// /WEB-INF/view/user/join/loginFormjsp 포워딩 처리
		//return "user/join/loginForm";
		// /SpringToddler/user/join/loginCheck.do
		// POST 전송방식 : mem_id=a001&mem_pass=asdfasdf
		// RedirctAttribute를 활용해 전송되는 값 취득
		Map<String, ?> paramMap = RequestContextUtils.getInputFlashMap(request);
		if(paramMap != null){
			String message = (String) paramMap.get("message");
			System.out.println("RedirectAttribute 전달된 취득값 :" + message);
		}
	}
	@RequestMapping(value="loginCheck", method=RequestMethod.GET)
	public String loginCheck(String mem_id, 
						     String mem_pass,
						     HttpServletRequest request,
						     HttpSession session,
						     HttpServletResponse response,
						     Map<String, String> params)
							 throws Exception{
//		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		params.put("mem_pass", mem_pass);
		
		MemberVO memberInfo = this.service.memberInfo(params);
		
		if(memberInfo == null){
			// 리다이렉트(컨텍스트 루트 | 패스 생략)
			String message = this.accessor.getMessage("fail.common.join", Locale.KOREA);
			message = URLEncoder.encode(message, "UTF-8");
			return "redirect:/user/join/loginForm.do?message=" + message;
		}else{
			session.setAttribute("LOGIN_MEMBERINFO", memberInfo);
			// 포워드(컨텍스트 루트 | 패스 생략)
			return "forward:/user/member/memberList.do";
		}
	}
		@RequestMapping("memberView")
		public ModelMap memberView(String mem_id,
								   Map<String, String> params,
								   ModelMap modelMap)throws Exception{
			params.put("mem_id", mem_id);
			
			MemberVO memberInfo = this.service.memberInfo(params);
			
//			ModelMap modelMap = new ModelMap();
			modelMap.addAttribute("memberInfo", memberInfo);
			
			return modelMap;
		
	}
		@RequestMapping("logout")
		public String logout(HttpSession session) throws Exception{
			session.invalidate();
			String message = this.accessor.getMessage("success.common.logout", Locale.KOREA);
			message = URLEncoder.encode(message, "UTF-8");
			return "redirect:/user/join/loginForm.do?message=" + message;
		}
		
		@RequestMapping(value="freeboardloginCheck",method=RequestMethod.POST)
		public String freeboardloginCheck(String mem_id, 
							     String mem_pass,
							     HttpServletRequest request,
							     HttpSession session,
							     HttpServletResponse response,
							     Map<String, String> params)
								 throws Exception{
//			Map<String, String> params = new HashMap<String, String>();
			params.put("mem_id", mem_id);
			params.put("mem_pass", mem_pass);
			
			MemberVO memberInfo = this.service.memberInfo(params);
			
			if(memberInfo == null){
				// 리다이렉트(컨텍스트 루트 | 패스 생략)
				String message = this.accessor.getMessage("fail.common.join", Locale.KOREA);
				message = URLEncoder.encode(message, "UTF-8");
				return "redirect:/user/join/loginForm.do?message=" + message;
			}else{
				session.setAttribute("LOGIN_MEMBERINFO", memberInfo);
				// 포워드(컨텍스트 루트 | 패스 생략)
				return "forward:/user/freeboard/freeboardList.do";
			}
		}
		
		@RequestMapping("freeboardlogout")
		public String freeboardlogout(HttpSession session) throws Exception{
			session.invalidate();
			String message = this.accessor.getMessage("success.common.logout", Locale.KOREA);
			message = URLEncoder.encode(message, "UTF-8");
			return "redirect:/user/join/loginForm.do?message=" + message;
		}
	
	

}
