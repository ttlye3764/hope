package kr.or.ddit.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.vo.MemberVO;

@Controller
@RequestMapping("/admin/member/")
public class AdminMemberController {
	@Autowired
	private MessageSourceAccessor accessor;
	@Autowired
	private ObjectMapper mapper;
	@Autowired
	private IMemberService service;
	
	@RequestMapping("memberList")
	public Model memberList(String search_keycode, String search_keyword, Map<String, String> params) throws Exception {

//		Map<String, String> params = new HashMap<String, String>();
		params.put("search_keycode", search_keycode);
		params.put("search_keyword", search_keyword);

		List<MemberVO> memberList = this.service.memberList(params);

		// memberList => view resolver => memberList.jsp
		Model model = new ExtendedModelMap();
		model.addAttribute("memberList", memberList);
		return model;
	}
	
	@RequestMapping("memberView")
	public ModelMap memberView(String mem_id, Map<String, String> params, ModelMap modelMap) throws Exception {
		params.put("mem_id", mem_id);
		MemberVO memberInfo = this.service.memberInfo(params);

//	      ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("memberInfo", memberInfo);

		return modelMap;
	}
	
	@RequestMapping("updateMemberInfo")
	public String updateMember(MemberVO memberInfo, HttpSession session, Map<String, String> params) throws Exception {
		this.service.updateMemberInfo(memberInfo);		
		
		params.put("mem_id", memberInfo.getMem_id());
		
		memberInfo = this.service.memberInfo(params);

		return "redirect:/admin/member/memberList.do";
	}
	
	@RequestMapping("deleteMember")
	public String deleteMember(@RequestParam String mem_id, Map<String, String> params) throws Exception {
		params.put("mem_id", mem_id);
		this.service.deleteMemberInfo(params);
		
		return "redirect:/admin/member/memberList.do";
	}

}
