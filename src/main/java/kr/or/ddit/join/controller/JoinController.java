package kr.or.ddit.join.controller;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.mail.Session;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.aop.Loggable;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.utiles.UserSha256;
import kr.or.ddit.vo.MemberVO;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;

// /SpringToddler/user/join/loginForm.do
// /SpringToddler/user/join/loginCheck.do
// /SpringToddler/user/join/loginOut.do
@Controller
@RequestMapping("/user/join/")
public class JoinController {
	@Autowired
	private MessageSourceAccessor accessor;
	@Autowired
	private IMemberService service;
	
	@RequestMapping("joinChoiceForm")
	public void joinChoiceForm() {
	}

	@RequestMapping("loginForm")
	public void loginForm(HttpServletRequest request) {
		Map<String, ?> paramMap = RequestContextUtils.getInputFlashMap(request);
		if (paramMap != null) {
			String message = (String) paramMap.get("message");
			System.out.println("RedirectAttribute 전달된 취득값 :" + message);
		}
	}
	
	@RequestMapping("loginForm2")
	public String loginForm2(HttpSession session) {
		session.invalidate();
		return "redirect:/user/join/loginForm.do";
	}

	@RequestMapping(value = "loginCheck")
	public ModelAndView loginCheck(HttpServletRequest request, String mem_id, String mem_pass, HttpSession session,
			HttpServletResponse response, Map<String, String> params, ModelAndView andView) throws Exception {

//		Map<String, String> params = new HashMap<String, String>();
		params.put("mem_id", mem_id);
		
		String pass = UserSha256.encrypt(mem_pass);
		mem_pass = pass;
		params.put("mem_pass", mem_pass);

		MemberVO memberInfo = this.service.memberInfo(params);

		if (memberInfo == null) {
			// 리다이렉트(컨텍스트 루트 | 패스 생략)
//			String message = this.accessor.getMessage("가입되지 않은 회원이거나, 비밀번호를 확인해주세요.", Locale.KOREA);
			String message = "아이디 혹은 비밀번호가 일치하지 않습니다.";
//			message = URLEncoder.encode(message, "UTF-8");
			andView.addObject("json", message);
			andView.setViewName("jsonConvertView");
			return andView;
		} else {
			session.setAttribute("LOGIN_MEMBERINFO", memberInfo);
			if(memberInfo.getMem_division().equals("1")) {
				andView.addObject("json", 0);
				andView.setViewName("jsonConvertView");
				return andView;
			}
			if (memberInfo.getMem_temporary_pass() == null) {
				andView.addObject("json", 1);
				andView.setViewName("jsonConvertView");
				return andView;
			} else {
				// 포워드(컨텍스트 루트 | 패스 생략)
				if (memberInfo.getMem_pass().equals(mem_pass)) { // 만약 임시비밀번호칸이 채워져있는데 본인비밀번호로 로그인 했을 경우
					andView.addObject("json", 1);
				} else { // 임시비밀번호로 로그인했을 경우
					andView.addObject("json", 2);
				}
				this.service.deletePass(mem_id);
				andView.setViewName("jsonConvertView");
				return andView;
			}
		}
	}
	
	@RequestMapping("passChangeForm")
	public void passChangeForm() {
	}
	
	@RequestMapping("passChange")
	public ModelAndView passChange(String mem_pass, Map<String,String>params, ModelAndView andView, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		
		String mem_id = memberInfo.getMem_id();
		
		params.put("mem_id", mem_id);
		
		String pass = UserSha256.encrypt(mem_pass);
		mem_pass = pass;
		params.put("mem_pass", mem_pass);
		
		this.service.updatePass(params);
		
		andView.addObject("json", 1);
		andView.setViewName("jsonConvertView");
		
		return andView;
	}

	@RequestMapping("logout")
	public ModelAndView logout(HttpSession session, ModelAndView andView) throws Exception {
		session.invalidate();
		andView.addObject("json", "로그아웃 되었습니다.");
		andView.setViewName("jsonConvertView");
		
		return andView;
	}

	@RequestMapping(value = "freeboardloginCheck", method = RequestMethod.POST)
	public String freeboardloginCheck(String mem_id, String mem_pass, HttpServletRequest request, HttpSession session,
			HttpServletResponse response, Map<String, String> params) throws Exception {
		params.put("mem_id", mem_id);
		
		String pass = UserSha256.encrypt(mem_pass);
		mem_pass = pass;
		params.put("mem_pass", mem_pass);

		MemberVO memberInfo = this.service.memberInfo(params);

		if (memberInfo == null) {
			// 리다이렉트(컨텍스트 루트 | 패스 생략)
			String message = this.accessor.getMessage("fail.common.join", Locale.KOREA);
			message = URLEncoder.encode(message, "UTF-8");
			return "redirect:/user/join/loginForm.do?message=" + message;
		} else {
			session.setAttribute("LOGIN_MEMBERINFO", memberInfo);
			// 포워드(컨텍스트 루트 | 패스 생략)
			return "forward:/user/freeboard/freeboardList.do";
		}
	}

	@RequestMapping("freeboardlogout")
	public String freeboardlogout(HttpSession session) throws Exception {
		session.invalidate();
		String message = this.accessor.getMessage("success.common.logout", Locale.KOREA);
		message = URLEncoder.encode(message, "UTF-8");
		return "redirect:/user/join/loginForm.do?message=" + message;
	}
}
