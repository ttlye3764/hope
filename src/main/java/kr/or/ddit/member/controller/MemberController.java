package kr.or.ddit.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.vo.MemberVO;

// /SpringToddler/user/member/memberList.do
// /SpringToddler/user/member/memberView.do
// /SpringToddler/user/member/memberForm.do
@Controller
@RequestMapping("/user/member/")
public class MemberController {
	@Autowired
	private MessageSourceAccessor accessor;
	@Autowired
	private ObjectMapper mapper;
	@Autowired
	private IMemberService service;


	@RequestMapping("memberView")
	public ModelMap memberView(String mem_id, Map<String, String> params, ModelMap modelMap) throws Exception {
		params.put("mem_id", mem_id);
		MemberVO memberInfo = this.service.memberInfo(params);

//	      ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("memberInfo", memberInfo);

		return modelMap;
	}
	
	@RequestMapping("myPage")
	public ModelMap memberView(Map<String, String> params, ModelMap modelMap, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		
		modelMap.addAttribute("memberInfo", memberInfo);

		return modelMap;
	}

	@RequestMapping("updateMemberInfo")
	public String updateMember(MemberVO memberInfo, HttpSession session, Map<String, String> params) throws Exception {
		this.service.updateMemberInfo(memberInfo);		
		
		params.put("mem_id", memberInfo.getMem_id());
		
		if(!(memberInfo.getMem_pass().length()>0)) {
			MemberVO memberInfo2 = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
			params.put("mem_pass", memberInfo2.getMem_pass());
		}else {
			params.put("mem_pass", memberInfo.getMem_pass());
		}
		
		memberInfo = this.service.memberInfo(params);
		session.setAttribute("LOGIN_MEMBERINFO", memberInfo);

		return "redirect:/user/main/mainForm.do";
	}
	
	@RequestMapping("deleteMemberForm")
	public void deleteMemberForm() {}

	@RequestMapping("deleteMember")
	public ModelAndView deleteMember(@RequestParam String mem_id, Map<String, String> params, ModelAndView andView) throws Exception {
		params.put("mem_id", mem_id);
		this.service.deleteMemberInfo(params);
		
		String result = "성공적으로 처리되었습니다.";
		
		andView.addObject("json", result);
		andView.setViewName("jsonConvertView");
		
		return andView;
	}

	@RequestMapping("memberForm")
	public void memberForm() {
	}

	@RequestMapping("insertMemberInfo")
	public String insertMember(MemberVO memberInfo, @RequestBody String totalparams,
			RedirectAttributes redirectAttributes) throws Exception {

		this.service.insertMember(memberInfo);
		
		redirectAttributes.addFlashAttribute("message", "회원가입이 완료되었습니다");
		return "redirect:/user/join/loginForm.do";
	}

	@RequestMapping("idCheck")
	public ModelAndView idCheck(@RequestParam String mem_id, Map<String, String> params) throws Exception {
		params.put("mem_id", mem_id);

		MemberVO memberInfo = this.service.memberInfo(params);

		// Model(view 대상 전송 데이타 저장) + String(view 경로와 이름)
		ModelAndView andView = new ModelAndView();
		andView.addObject("memberInfo", memberInfo);

		String result;
		if (memberInfo == null) {
			result = "사용가능한 아이디입니다.";
		} else {
			result = "이미 존재하는 아이디입니다.";
		}

		andView.addObject("json", result);
		andView.setViewName("jsonConvertView");

		return andView;
	}
	
	@RequestMapping("nickCheck")
	public ModelAndView nickCheck(@RequestParam String mem_nickname) throws Exception{
		String nick = this.service.selectNick(mem_nickname);
		
		ModelAndView andView = new ModelAndView();
		
		String result;
		if(nick == null) {
			result = "사용가능한 닉네임입니다.";
		}else {
			result = "이미 존재하는 닉네임입니다.";
		}
		
		andView.addObject("json", result);
		andView.setViewName("jsonConvertView");
		
		return andView;
	}
	
	@RequestMapping("passCheck")
	public ModelAndView passCheck(@RequestParam String mem_pass, Map<String, String> params, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		
		String session_mem_pass = memberInfo.getMem_pass();

		ModelAndView andView = new ModelAndView();
		andView.addObject("memberInfo", memberInfo);

		String result;
		if (session_mem_pass.equals(mem_pass)) {
			result = "1";
		} else {
			result = "0";
		}

		andView.addObject("json", result);
		andView.setViewName("jsonConvertView");

		return andView;
	}

	@RequestMapping("searchID")
	public ModelAndView searchID(@RequestParam String mem_name, @RequestParam String mem_birth,
			Map<String, String> params) throws Exception {
		params.put("mem_name", mem_name);
		params.put("mem_birth", mem_birth);

		String result = this.service.searchID(params);

		ModelAndView andView = new ModelAndView();

		andView.addObject("json", result);
		andView.setViewName("jsonConvertView");

		return andView;
	}

	@RequestMapping("searchPW")
	public ModelAndView searchPW(@RequestParam String mem_id, @RequestParam String mem_name,
			@RequestParam String mem_birth, @RequestParam String mem_hp, Map<String, String> params) throws Exception {
		params.put("mem_name", mem_name);
		params.put("mem_birth", mem_birth);
		params.put("mem_id", mem_id);
		params.put("mem_hp", mem_hp);

		String result = this.service.searchPW(params);
		String mem_temporary_pass = null;

		if (result == null) {
		} else {
			mem_temporary_pass = random();
			params.put("mem_temporary_pass", mem_temporary_pass);
			service.makePass(params);
		}

		ModelAndView andView = new ModelAndView();

		andView.addObject("json", mem_temporary_pass);
		andView.setViewName("jsonConvertView");

		return andView;
	}

	public String random() {
		String rand = "";

		for (int i = 0; i < 8; i++) {
			int a = (int) (Math.random() * 25) + 65;
			int b = (int) (Math.random() * 25) + 97;

			int cnt = (int) (Math.random() * 2) + 1;

			char a1 = (char) a;
			char b1 = (char) b;

			if (cnt == 1) {
				rand += b1;
			} else {
				rand += a1;
			}
		}

		return rand;
	}
}
