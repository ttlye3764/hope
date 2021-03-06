package kr.or.ddit.naver.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;

import kr.or.ddit.join.controller.JoinController;
import kr.or.ddit.login.service.ILoginService;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.utiles.UserSha256;
import kr.or.ddit.vo.LoginVO;
import kr.or.ddit.vo.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class NaverLoginController {
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private IMemberService service;
	
	@Autowired
	private ILoginService lservice;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

//로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/user/join/loginForm", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(Model model, HttpSession session)throws Exception {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
		System.out.println("네이버:" + naverAuthUrl);
//네이버
		model.addAttribute("url", naverAuthUrl);
		return "user/join/loginForm";
	}
	
	public void login(MemberVO memberInfo, String mem_id) throws Exception {
		InetAddress local; 
		local = InetAddress.getLocalHost(); 
		String ip = local.getHostAddress(); 
		
		LoginVO loginVO = new LoginVO();
		
		String computerName = InetAddress.getLocalHost().getHostName();
		
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
		Date time = new Date();
		String nowtime = format1.format(time);
		
		loginVO.setLg_ip(ip);
		loginVO.setMem_id(mem_id);
		loginVO.setLg_time(nowtime);
		loginVO.setLg_status("Success");
		loginVO.setLg_comname(computerName);
		loginVO.setLg_count("1");
		
		if(memberInfo == null) {
			loginVO.setLg_status("Failed");
		}
		
		lservice.insertLogin(loginVO); 
	}

//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/user/main/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, Map<String, String> params)
			throws Exception {
		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); // String형식의 json데이터
		System.out.println(apiResult);
		/**
		 * apiResult json 구조 {"resultcode":"00", "message":"success",
		 * "response":{"id":"33666449","nickname":"shinn****","age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}
		 **/
//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
//3. 데이터 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		
		String nickname = (String) response_obj.get("nickname");
		String gender = (String) response_obj.get("gender");
		String name = (String) response_obj.get("name");
		String email = (String) response_obj.get("email");
		
		String [] id = email.split("@");
		params.put("mem_id", id[0]+"_naver");
		params.put("mem_join_addr", "n");
		MemberVO memberInfo1 = this.service.memberInfo(params);
		MemberVO memberInfo = new MemberVO();
		
		memberInfo.setMem_id(id[0]+"_naver");
		memberInfo.setMem_nickname(nickname);
		memberInfo.setMem_name(name);
		memberInfo.setMem_email(email);
		memberInfo.setMem_addr1("주소1");
		memberInfo.setMem_addr2("주소2");
		memberInfo.setMem_birth("2020-01-01");
		memberInfo.setMem_division("0");
		memberInfo.setMem_gender(gender);
		memberInfo.setMem_hp("010-0000-0000");
		memberInfo.setMem_join_addr("n");
		String pass = UserSha256.encrypt("a");
		memberInfo.setMem_pass(pass);
		memberInfo.setMem_zip1("123");
		memberInfo.setMem_zip2("123");
		
		if(memberInfo1 == null) {
			this.service.insertMember(memberInfo, null);
		}else {
			this.service.updateMemberInfo(memberInfo, null);
		}
		
		login(memberInfo, id[0]+"_naver");
		
		params.put("mem_id", memberInfo.getMem_id());
		params.put("mem_pass", memberInfo.getMem_pass());
		
		memberInfo = this.service.memberInfo(params);
		session.setAttribute("LOGIN_MEMBERINFO", memberInfo); // 세션 생성
		
		model.addAttribute("result", apiResult);
		return "redirect:mainForm";
	}
}

