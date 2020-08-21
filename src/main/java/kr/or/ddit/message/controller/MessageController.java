package kr.or.ddit.message.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/sms/")
public class MessageController {
	Map<String,String> inNum = new HashMap<String,String>();
	
	@ResponseBody
	@RequestMapping(value = "sendSms")
	public String sendSms(HttpServletRequest request) {
		String api_key = "NCSRBYEVK6QCHVLN"; // 위에서 받은 api key를 추가
		String api_secret = "5SHOVODKIOSQLS5QGH16JNRNNYULDKKA"; // 위에서 받은 api secret를 추가

		Coolsms coolsms = new Coolsms(api_key, api_secret);
		// 이 부분은 홈페이지에서 받은 자바파일을 추가한다음 그 클래스를 import해야 쓸 수 있는 클래스이다.

		HashMap<String, String> set = new HashMap<String, String>();
		
		String to = (String) request.getParameter("mem_hp");	
		
		inNum.remove(to);

		String randnum = rand(to);
		String context = "[쟈비스] 인증번호는 [" + randnum + "] 입니다.";
		
		set.put("from", "010-8798-3115"); // 발신번호
		set.put("to", to); // 발신번호, jsp에서 전송한 수신번호를 받아 map에 저장한다.
		set.put("text", context); // 문자내용, jsp에서 전송한 문자내용을 받아 map에 저장한다.
		set.put("type", "sms"); // 문자 타입

		JSONObject result = coolsms.send(set); // 보내기&전송결과받기
		System.out.println(set);
		
		System.out.println(result);
		
		if ((boolean)result.get("status") == true) {
            // 메시지 보내기 성공 및 전송결과 출력
            System.out.println("성공");
            System.out.println(result.get("group_id")); // 그룹아이디
            System.out.println(result.get("result_code")); // 결과코드
            System.out.println(result.get("result_message")); // 결과 메시지
            System.out.println(result.get("success_count")); // 메시지아이디
            System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
            return "인증번호가 전송되었습니다.";
          } else {

            // 메시지 보내기 실패
            System.out.println("실패");
            System.out.println(result.get("code")); // REST API 에러코드
            System.out.println(result.get("message")); // 에러메시지
            return "인증번호 전송에 실패하였습니다.";
          }
	}
	
	public String rand(String phone) {
		int rand = (int)(Math.random()*899999)+100000;
		String random = String.valueOf(rand);
		
		inNum.remove(phone);
		inNum.put(phone, random);
		
		return random;
	}
	
	@ResponseBody
	@RequestMapping(value = "checkSms")
	public String checkNum(HttpServletRequest request) throws Exception {
		String phone = (String) request.getParameter("mem_hp");
		String num = (String) request.getParameter("hp_num");
		
		if(inNum.get(phone)==null) {
			return "인증번호가 일치하지 않습니다.";
		}
		
		if(inNum.get(phone).equals(num)) {
			inNum.remove(phone);
			return "인증이 완료되었습니다.";
		}else {
			return "인증번호가 일치하지 않습니다.";
		}
	}
}