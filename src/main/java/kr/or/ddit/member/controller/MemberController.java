package kr.or.ddit.member.controller;

import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ExtendedModelMap;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
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
	public String updateMember(MemberVO memberInfo) throws Exception {
		this.service.updateMemberInfo(memberInfo);

		return "redirect:/user/member/memberList.do";
	}

	// /user/member/deleteMemberInfo.do?user_id=a001
	@RequestMapping("deleteMemberInfo/{user_id}")
//	  public String deleteMember(@RequestParam(required=false, defaultValue="널 대체값") String mem_id,
//			  					Map<String, String> params) throws Exception{
// 			/user/member/deleteMemberInfo/a001.do
	public String deleteMember(@PathVariable("user_id") String mem_id, Map<String, String> params) throws Exception {

		params.put("mem_id", mem_id);
		this.service.deleteMemberInfo(params);

		return "redirect:/user/member/memberList.do";
	}

	@RequestMapping("memberForm")
	public void memberForm() {
	}

	@RequestMapping("insertMemberInfo")
	public String insertMember(MemberVO memberInfo, @RequestBody String totalparams,
			RedirectAttributes redirectAttributes) throws Exception {

		System.out.println(memberInfo.getMem_id());
		System.out.println(memberInfo.getMem_pass());
		System.out.println(memberInfo.getMem_gender());
		System.out.println(memberInfo.getMem_name());
		System.out.println(memberInfo.getMem_nickname());
		System.out.println(memberInfo.getMem_birth());
		System.out.println(memberInfo.getMem_hp());
		System.out.println(memberInfo.getMem_email());
		System.out.println(memberInfo.getMem_addr1());
		System.out.println(memberInfo.getMem_addr2());
		System.out.println(memberInfo.getMem_zip1());
		System.out.println(memberInfo.getMem_zip2());
		System.out.println(memberInfo.getMem_division());
		this.service.insertMember(memberInfo);

		// String message =
		// this.accessor.getMessage("cop.regist.msg.confiem",Locale.KOREA);
		// message = URLEncoder.encode(message, "UTF-8");
		// return "redirect:/user/join/loginForm.do?message="+ message;
		redirectAttributes.addFlashAttribute("message", "회원가입이 완료되었습니다");
		return "redirect:/user/join/loginForm.do";
	}

//	  @RequestMapping("idCheck")
//	  @ResponseBody
//	  public String idCheck(@RequestParam String mem_id,
//			  				Map<String, String> params,
//			  				Map<String, String> jsonMap)throws Exception{
//		  params.put("mem_id", mem_id);
//		  
//		  MemberVO memberInfo = this.service.memberInfo(params);
//		  
//		  if(memberInfo == null){
//			  jsonMap.put("flag", "true");
//		  }else{
//			  jsonMap.put("flag", "false");
//		  }
//		  String jsonData = this.mapper.writeValueAsString(jsonMap);
//		  
//		  return jsonData;
//	  }
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
