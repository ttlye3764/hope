package kr.or.ddit.chat.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.member.dao.IMemberDAO;
import kr.or.ddit.vo.MemberVO;

@Controller
@RequestMapping("/user/chat")
public class ChatController {
	
	@Autowired
	IMemberDAO memberDao;
	
	@RequestMapping("chat")
	public ModelAndView chat(HttpServletRequest request,
							ModelAndView andView) throws Exception {
		
////		test code
//		HttpSession session = request.getSession();
//		
//		MemberVO memberInfo = new MemberVO();
//		
//		Map<String, String> params = new HashMap<String, String>();
//		
//		params.put("mem_no", "61");
//		
//		memberInfo = memberDao.memberInfo(params);
//		
//		session.setAttribute("LOGINMEMBER", memberInfo);
		andView.setViewName("user/chat/chat");
		return andView;
	};
	
	
}
