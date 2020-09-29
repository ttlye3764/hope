package kr.or.ddit.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.utiles.UserSha256;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.MemberVO;

@Controller
@RequestMapping("/user/member/")
public class MemberController {
	@Autowired
	private IMemberService service;
	@Autowired
	private IBoardService boardService;
	
	@RequestMapping("myBoard") // 내가 작성한 게시글 목록
	public ModelAndView myBoard(ModelAndView andView
								,Map<String,String>params
								,HttpServletRequest request) throws Exception{
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		if(memberInfo==null) {
		}else {
			String mem_no = memberInfo.getMem_no();
			
			params.put("bd_division","1"); // 자유게시판 게시판 번호
			params.put("mem_no",mem_no);
			List<BoardVO> fboardList = this.boardService.myboardList(params);
			
			params.replace("bd_division","3"); // 건의사항 게시판 번호
			List<BoardVO> boardList = this.boardService.myboardList(params);
			
			params.replace("bd_division","4"); // Qna 게시판 번호
			List<BoardVO> qboardList = this.boardService.myboardList(params);
			
			andView.addObject("fboardList", fboardList);
			andView.addObject("boardList", boardList);
			andView.addObject("qboardList", qboardList);
		}
		andView.setViewName("user/member/myBoard");	
		
		return andView;
	}
	
	@RequestMapping("myPage")
	public ModelMap myPage(Map<String, String> params, ModelMap modelMap, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		
		modelMap.addAttribute("memberInfo", memberInfo);

		return modelMap;
	}

	@RequestMapping("updateMemberInfo")
	public String updateMember(MemberVO memberInfo, HttpSession session, Map<String, String> params, @RequestParam("files") MultipartFile[] items) throws Exception {
		params.put("mem_id", memberInfo.getMem_id());
		
		if(!(memberInfo.getMem_pass().length()>0)) { // 새로운 비밀번호를 사용자가 입력하지 않았을 경우
			MemberVO memberInfo2 = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO"); // 세션에서 사용자 정보를 불러와서 비밀번호에 그대로 넣어줌
			params.put("mem_pass", memberInfo2.getMem_pass());
		}else {
			memberInfo.setMem_pass(UserSha256.encrypt(memberInfo.getMem_pass())); // 새로운 비밀번호 암호화
			params.put("mem_pass", memberInfo.getMem_pass());
		}
		this.service.updateMemberInfo(memberInfo, items);
		
		memberInfo = this.service.memberInfo(params);
		session.setAttribute("LOGIN_MEMBERINFO", memberInfo); // 세션에 새로운 정보 저장

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
	
	@RequestMapping("checkPassForm")
	public void checkPassForm() {
	}

	@RequestMapping("insertMemberInfo")
	public String insertMember(MemberVO memberInfo,
			RedirectAttributes redirectAttributes, @RequestParam("files") MultipartFile[] items) throws Exception {
		
		String pass = UserSha256.encrypt(memberInfo.getMem_pass());
		memberInfo.setMem_pass(pass);
		
		this.service.insertMember(memberInfo, items);
		
		return "redirect:/user/join/loginForm.do";
	}

	@RequestMapping("idCheck")
	public ModelAndView idCheck(@RequestParam String mem_id, Map<String, String> params) throws Exception {
		params.put("mem_id", mem_id);

		MemberVO memberInfo = this.service.memberInfo(params);

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
	
	@RequestMapping("passCheck") // 마이페이지 들어가기 전 비밀번호 확인 페이지
	public ModelAndView passCheck(@RequestParam String mem_pass, Map<String, String> params, HttpServletRequest request, ModelAndView andView) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		
		String session_mem_pass = memberInfo.getMem_pass(); // 세션이 가지고 있는 해당 유저의 비밀번호

		mem_pass = UserSha256.encrypt(mem_pass);

		String result;
		if (session_mem_pass.equals(mem_pass)) {
			result = "1"; // 성공
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

		String result = this.service.searchID(params); // 검색 결과 아이디

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
			mem_temporary_pass = random(); // 임시 비밀번호 생성
			params.put("mem_temporary_pass", UserSha256.encrypt(mem_temporary_pass));
			service.makePass(params); // 암호화 된 임시비밀번호 DB에 저장
		}

		ModelAndView andView = new ModelAndView();

		andView.addObject("json", mem_temporary_pass); // 사용자에게는 암호화되지 않은 임시비밀번호 출력
		andView.setViewName("jsonConvertView");

		return andView;
	}

	public String random() {
		String rand = "";

		for (int i = 0; i < 8; i++) {
			int a = (int) (Math.random() * 25) + 65;
			int b = (int) (Math.random() * 25) + 97;

			int cnt = (int) (Math.random() * 2) + 1; //대문자를 입력할 것인지 소문자를 입력할 것인지 선택

			char a1 = (char) a; // 아스키 코드 변환
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
