package kr.or.ddit.message.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/sms/")
public class MessageController {
	Map<String,String> inNum = new HashMap<String,String>();
	
	@ResponseBody
	@RequestMapping(value = "sendSms")
	public ModelAndView sendSms(HttpServletRequest request, ModelAndView andView) {
		String api_key = "NCSRBYEVK6QCHVLN"; // 위에서 받은 api key를 추가
		String api_secret = "5SHOVODKIOSQLS5QGH16JNRNNYULDKKA"; // 위에서 받은 api secret를 추가
		
		String result;

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

		JSONObject sendResult = coolsms.send(set); // 보내기&전송결과받기
		System.out.println(set);
		
		System.out.println(sendResult);
		
		if ((boolean)sendResult.get("status") == true) {
            // 메시지 보내기 성공 및 전송결과 출력
			result = "인증번호가 전송되었습니다.";
			andView.addObject("json", result);
			andView.setViewName("jsonConvertView");
            return andView;            
          } else {
            // 메시지 보내기 실패
            System.out.println("실패");
            System.out.println(sendResult.get("code")); // REST API 에러코드
            System.out.println(sendResult.get("message")); // 에러메시지
            result = "인증번호 전송에 실패하였습니다.";
            andView.addObject("json", result);		
			andView.setViewName("jsonConvertView");
            return andView;
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
	public ModelAndView checkNum(HttpServletRequest request, ModelAndView andView) throws Exception {
		String phone = (String) request.getParameter("mem_hp");
		String num = (String) request.getParameter("hp_num");
		
		
		if(inNum.get(phone)==null) {
			String result="인증번호가 일치하지 않습니다.";
			andView.addObject("json", result);		
			andView.setViewName("jsonConvertView");
			return andView;
		}
		
		if(inNum.get(phone).equals(num)) {
			inNum.remove(phone);
			String result = "인증이 완료되었습니다.";
			andView.addObject("json", result);		
			andView.setViewName("jsonConvertView");			
			return andView;
		}else {
			String result="인증번호가 일치하지 않습니다.";
			andView.addObject("json", result);		
			andView.setViewName("jsonConvertView");	
			return andView;
		}
	}
}