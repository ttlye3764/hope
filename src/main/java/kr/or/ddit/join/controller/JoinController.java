package kr.or.ddit.join.controller;

import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContextUtils;

import kr.or.ddit.login.service.ILoginService;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.utiles.UserSha256;
import kr.or.ddit.vo.LoginVO;
import kr.or.ddit.vo.MemberVO;

@Controller
@RequestMapping("/user/join/")
public class JoinController {
	Map<String, Integer> count = new HashMap<String, Integer>();
	
	@Autowired
	private IMemberService service; // 멤버 관련된 처리를 하기 위한 서비스
	
	@Autowired
	private ILoginService lservice; // 로그인 로그를 남기기 위한 서비스
	
	@RequestMapping("joinChoiceForm")
	public void joinChoiceForm() {
	}
	
	@RequestMapping("joinForm")
	public void joinForm() {
	}
	
	@RequestMapping("loginForm")
	public void loginForm(HttpServletRequest request) {
		Map<String, ?> paramMap = RequestContextUtils.getInputFlashMap(request);
		if (paramMap != null) {
			String message = (String) paramMap.get("message");
			System.out.println("RedirectAttribute 전달된 취득값 :" + message);
		}
	}
	
	public void loginLog(MemberVO memberInfo, String mem_id, String status) throws Exception {
		InetAddress local = InetAddress.getLocalHost(); 
		String ip = local.getHostAddress(); 
		
		String computerName = InetAddress.getLocalHost().getHostName();
		
		LoginVO loginVO = new LoginVO();
		
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String nowtime = format1.format(time);
		
		int i = 1; // 로그인 접속 시도 횟수
		
		if(count.get(ip) == null) { // count map에 해당 ip가 로그인 시도를 하지 않은 경우
			count.put(ip, i); // 접속 시도한 ip와 시도한 횟수 저장
		}else { // 이미 시도를 한 경우
			int check = count.get(ip); // map에서 해당 ip가 이미 시도를 몇번했는지 불러옴
			count.put(ip, check+1); 
		}
		
		loginVO.setLg_ip(ip);
		loginVO.setMem_id(mem_id);
		loginVO.setLg_time(nowtime);
		loginVO.setLg_comname(computerName);
		loginVO.setLg_count(toString().valueOf(count.get(ip)));
		
		if(status == null) { // 로그아웃은  파라미터로 status를 null로 넘겨줌
			status = "LogOut";
			loginVO.setLg_count(" "); // 로그아웃은 카운트 횟수를 넣지 않음.
			count.remove(ip);
		}else {
			if(memberInfo == null) { // 로그인 실패
				status = "Failed";
			}else {
				status = "Success";
				count.remove(ip);
			}
		}		
		loginVO.setLg_status(status);
		
		lservice.insertLogin(loginVO); 
	}

	@RequestMapping(value = "loginCheck")
	public ModelAndView loginCheck(HttpServletRequest request,@RequestParam(value="mem_id") String mem_id,@RequestParam(value="mem_pass") String mem_pass, HttpSession session,
			HttpServletResponse response, Map<String, String> params, ModelAndView andView) throws Exception {

		params.put("mem_id", mem_id);
		params.put("mem_pass", UserSha256.encrypt(mem_pass));

		MemberVO memberInfo = this.service.memberInfo(params);
		
		loginLog(memberInfo, mem_id, "login"); // 로그인 성공여부 저장

		if (memberInfo == null) { // 로그인 실패
			String message = "아이디 혹은 비밀번호가 일치하지 않습니다.";
			andView.addObject("json", message);
			andView.setViewName("jsonConvertView");
			return andView;
		} else {
			session.setAttribute("LOGIN_MEMBERINFO", memberInfo);
			if(memberInfo.getMem_division().equals("1")) { // 관리자가 로그인 했을 경우
				andView.addObject("json", 0);
				andView.setViewName("jsonConvertView");
				return andView;
			}
			if (memberInfo.getMem_temporary_pass() == null) { // 임시 비밀번호가 비어있을 경우
				andView.addObject("json", 1);
				andView.setViewName("jsonConvertView");
				return andView;
			} else { // 임시 비밀번호를 발급받은 사용자 일 경우
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
	
	@RequestMapping("passChangeForm") // 임시비밀번호로 로그인시 패스워드 변경창
	public void passChangeForm() {
	}
	
	@RequestMapping("passChange") // 임시비밀번호로 로그인 후 패스워드 변경창에서 변경시
	public ModelAndView passChange(String mem_pass, Map<String,String>params, ModelAndView andView, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		
		String mem_id = memberInfo.getMem_id();
		
		params.put("mem_id", mem_id);
		params.put("mem_pass", UserSha256.encrypt(mem_pass));
		
		this.service.updatePass(params);
		
		andView.addObject("json", 1);
		andView.setViewName("jsonConvertView");
		
		return andView;
	}

	@RequestMapping("logout")
	public ModelAndView logout(ModelAndView andView, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		String mem_id = memberInfo.getMem_id();
		
		session.invalidate();
		andView.addObject("json", "로그아웃 되었습니다.");
		andView.setViewName("jsonConvertView");
		
		loginLog(null, mem_id, null); // 로그인 성공여부 저장
		
		return andView;
	}
}
