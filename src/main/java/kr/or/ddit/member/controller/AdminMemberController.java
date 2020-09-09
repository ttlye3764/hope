package kr.or.ddit.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.utiles.RolePaginationUtil_seung;
import kr.or.ddit.utiles.UserSha256;
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
	public ModelAndView memberList(String search_keycode
							,String search_keyword
							, ModelAndView andView
							,Map<String, String> params
							,String currentPage
							,RolePaginationUtil_seung pagination
							,HttpServletRequest request) throws Exception {
		
		if(currentPage == null || currentPage.equals("")){
	         currentPage = "1";
	    }

		params.put("search_keycode", search_keycode);
		params.put("search_keyword", search_keyword);
		String totalCount = this.service.totalCount(params);
		
		pagination.RolePaginationUtil(request, Integer.parseInt(currentPage), Integer.parseInt(totalCount), search_keycode, search_keyword);
	    String startCount = String.valueOf(pagination.getStartCount());
	    String endCount = String.valueOf(pagination.getEndCount());
	    params.put("startCount", startCount);
	    params.put("endCount", endCount);
		

		List<MemberVO> memberList = this.service.memberList(params);
		
		andView.addObject("param",search_keycode);
		andView.addObject("param",search_keyword);
		andView.addObject("currentPage",currentPage);
		andView.addObject("memberList", memberList);
		andView.setViewName("admin/member/memberList");
		andView.addObject("pagination", pagination.getPagingHtmls());

		return andView;
	}
	
	@RequestMapping("memberView")
	public ModelMap memberView(String mem_id, 
							Map<String, String> params, 
							ModelMap modelMap, 
							String search_keycode,
							String search_keyword,
							String currentPage) throws Exception {
		if(currentPage == null || currentPage.equals("")){
	         currentPage = "1";
	    }
		
		params.put("mem_id", mem_id);
		MemberVO memberInfo = this.service.memberInfo(params);

//	      ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("search_keycode",search_keycode);
		modelMap.addAttribute("search_keyword",search_keyword);
		modelMap.addAttribute("currentPage",currentPage);
		modelMap.addAttribute("memberInfo", memberInfo);

		return modelMap;
	}
	
	@RequestMapping("updateMemberInfo")
	public String updateMember(MemberVO memberInfo, HttpSession session, Map<String, String> params) throws Exception {
		params.put("mem_id", memberInfo.getMem_id());
		
		String pass = UserSha256.encrypt(memberInfo.getMem_pass());
		memberInfo.setMem_pass(pass);
		
		this.service.updateMemberInfo(memberInfo, null);
		
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
