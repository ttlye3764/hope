package kr.or.ddit.mail.controller;

import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/mail/")
public class MailController {
	Map<String,String> check = new HashMap<String, String>();

	@Autowired
	private JavaMailSender mailSender;

	// mailSending 코드
	@ResponseBody
	@RequestMapping(value = "mailSending")
	public String mailSending(HttpServletRequest request) {
		String setfrom = "jyabiseu@gmail.com";
		String tomail = request.getParameter("mem_email"); // 받는 사람 이메일
		String title = "[쟈비스] 회원가입 인증 메일 입니다."; // 제목
		String strrand = randomNum();
		String content = "회원님께서 요청하신 인증번호를 보내드립니다. \n인증번호는 [" + strrand + "] 입니다."; // 내용

		check.remove(tomail); // 혹시 있을 경우 삭제
		check.put(tomail, strrand); // 이메일에 부여된 인증번호 관리
		
		System.out.println(check.get(tomail));

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}	
		return "인증메일을 발송하였습니다.";
	}	
	
	// 인증번호 확인 메서드
	@ResponseBody
	@RequestMapping(value = "mailCheck")
	public String mailCheck(HttpServletRequest request) {	
		String mail = (String)request.getParameter("mem_mail");
		String num = (String)request.getParameter("mail_num");		
		
		String innum = check.get(mail);
		
		if(innum.equals(num)) {
			check.remove(mail);
			return "인증번호가 일치합니다.";
		}else {
			return "인증번호가 일치하지 않습니다.";
		}		
	}
	
	// 인증번호 발급
	public String randomNum() {
		int intrand = (int)(Math.random() * 899999) + 100000;
		String strrand = String.valueOf(intrand);
		
		return strrand;
	}	
}