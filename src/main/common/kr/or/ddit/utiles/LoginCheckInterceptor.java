package kr.or.ddit.utiles;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.or.ddit.vo.MemberVO;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		System.out.println("loginInterceptor 호출");
			
		HttpSession session = request.getSession();
		
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		
		if(memberInfo == null) {
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");

			response.sendRedirect(request.getContextPath()+"/user/join/loginForm?message=login plz");
			return false; 
		}
		
		return super.preHandle(request, response, handler);
	}

	
}
