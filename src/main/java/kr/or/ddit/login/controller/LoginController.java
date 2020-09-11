package kr.or.ddit.login.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.login.service.ILoginService;
import kr.or.ddit.vo.LoginVO;

@Controller
@RequestMapping("/admin/login/")
public class LoginController {
	@Autowired
	private ILoginService service;

	@RequestMapping("loginList")
	public ModelAndView memberList(String end_time, String start_time, ModelAndView andView, Map<String, String> params,
			HttpServletRequest request) throws Exception {
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		Calendar cal = Calendar.getInstance();
		Date d_end_time;
		Date day;

		if (end_time == null) {
			start_time = null;
		} else if(start_time == null){
			end_time = null;
		}
		else {
			if (end_time.equals("") || start_time.equals("")) {
				start_time = null;
				end_time = null;
			}
		}

		if (end_time == null) {
		} else {
			d_end_time = format1.parse(end_time);
			cal.setTime(d_end_time);

			cal.add(Calendar.DATE, +1);
			day = cal.getTime();
			end_time = format1.format(day);
		}
		params.put("start_time", start_time);
		params.put("end_time", end_time);

		List<LoginVO> loginList = this.service.loginList(params);

		if (end_time == null) {
		} else {
			cal.add(Calendar.DATE, -1);
			day = cal.getTime();
			end_time = format1.format(day);
		}

		andView.addObject("param", start_time);
		andView.addObject("param", end_time);
		andView.addObject("loginList", loginList);
		andView.setViewName("admin/login/loginList");

		return andView;
	}
}
