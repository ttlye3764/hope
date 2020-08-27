package kr.or.ddit.chat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpRequest;
import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.chat.dao.IChatDao;
import kr.or.ddit.member.dao.IMemberDAO;
import kr.or.ddit.vo.ChatingRoomVO;
import kr.or.ddit.vo.FriendVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.ParticipationVO;

@Controller
@RequestMapping("/user/chat/")
public class ChatController {
	
	@Autowired
	IMemberDAO memberDao;
	
	@Autowired
	IChatDao chatDao;
	
	@RequestMapping("chat")
	public ModelAndView chat(HttpServletRequest request,
							ModelAndView andView) throws Exception {
		
////		test code
		
		
		
		System.out.println("안녕하세");
		
		MemberVO memberInfo = new MemberVO();
		
		Map<String, String> params = new HashMap<String, String>();
		
		HttpSession session = request.getSession();
		
		memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		
		System.out.println(memberInfo.getMem_no());
		
		params.put("mem_no", memberInfo.getMem_no());
		
		List<FriendVO> friendList = memberDao.friendMemberList(params);
		
		System.out.println(friendList.size());
		
		List<ChatingRoomVO> chatingRoomList = chatDao.ChatingRoomList(params);
		
		andView.addObject(chatingRoomList);
		andView.addObject("friendList",friendList);
		andView.setViewName("user/chat/chat");
		return andView;
	};
	
	@RequestMapping("searchMember")
	public ModelAndView searchMember(ModelAndView andView,
									Map<String, String> params,
									@RequestParam String mem_name) throws Exception {

		params.put("mem_name", mem_name);
		
		MemberVO memberInfo = memberDao.memberInfo(params);
		
		  andView.addObject("memberInfo", memberInfo);
		  andView.setViewName("jsonConvertView");
				
		
		return andView;
	}
	
	@RequestMapping("addFriend")
	public ModelAndView addFriend(ModelAndView andView,
								 Map<String, String> params,
								 @RequestParam String mem_name,
								 MemberVO memberInfo,
								 FriendVO friendInfo,
								 HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		
		params.put("mem_name",mem_name);
		
		// 등록할 친구
		memberInfo = memberDao.memberInfo(params);
		
//		memberDao.addFriend(memberInfo);
		
		// 나
		MemberVO member = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		
		System.out.println(memberInfo.getMem_no());
		
		System.out.println(member.getMem_no());
		
		friendInfo.setFri_mem_no(memberInfo.getMem_no());
		friendInfo.setFri_mem_name(memberInfo.getMem_name());
		friendInfo.setMem_name(member.getMem_name());
		friendInfo.setMem_no(member.getMem_no());
		
		memberDao.addFriend(friendInfo);
		
		friendInfo.setFri_mem_no(member.getMem_no());
		friendInfo.setFri_mem_name(member.getMem_name());
		friendInfo.setMem_name(memberInfo.getMem_name());
		friendInfo.setMem_no(memberInfo.getMem_no());
		
		memberDao.addFriend(friendInfo);
		
		andView.setViewName("user/chat/chat");
		
		return andView;
	}
	
	@RequestMapping("createChatingRoom")
	public ModelAndView createChatingRoom(ModelAndView andView, ChatingRoomVO chatingRoomInfo) throws Exception{
		
		chatDao.createChatRoom(chatingRoomInfo);
		
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	@RequestMapping("insertParticipation")
	public ModelAndView insertParticipation(@RequestParam String mem_no, @RequestParam String target_mem_no,
											Map<String, String> params,
											ModelAndView andView) throws Exception {
		
		System.out.println(mem_no);
		
		System.out.println("타겟 : " + target_mem_no);
		
		ParticipationVO participationInfo = new ParticipationVO();
		
		participationInfo.setMem_no(mem_no);
		
		chatDao.insertParticipation(participationInfo);
		
		participationInfo.setMem_no(target_mem_no);
		
		chatDao.insertParticipation(participationInfo);
		
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
}
