package kr.or.ddit.medical.controller;

import java.util.List;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.medical.service.IMedicalService;
import kr.or.ddit.vo.MypillVO;

// 이용춘 - 깃 커밋 테스트

@Controller
@RequestMapping("/user/medical/")
public class MedicalController {
	@Autowired
	private IMedicalService medicalService;
	
	@Autowired
	private MessageSourceAccessor accessor;
	
	@Autowired
	private ObjectMapper mapper;
	
	
	
	@RequestMapping("viewJson")
	public ModelAndView medicalList(String mem_no) throws Exception{	
		
		List<MypillVO> medicalList  = this.medicalService.medicalList(mem_no);
		ModelAndView andView = new ModelAndView();
		andView.addObject("json", medicalList);		
		andView.setViewName("jsonConvertView");
		return andView;
	}
	
	
	
	// http://localhost/SpringToddler/user/medical/medicalForm.do
	@RequestMapping("medicalForm")
	public void medicalForm() {
	}
	
	@RequestMapping("medicalList")
	public void medicalList() {
	}

	
	@RequestMapping("insertMedicalInfo")
	public ModelAndView insertMedicalInfo(MypillVO mypillInfo)
			throws Exception {
		ModelAndView andView = new ModelAndView();
		andView.setViewName("");
		System.out.println("Asdfasdfsdaf");
		/*
		 * System.out.println(mypillInfo.getPill_start());
		 * System.out.println(mypillInfo.getPill_alerttime());
		 * 
		 * 
		 * this.medicalService.insertMedicalInfo(mypillInfo, null);
		 * 
		 */
		return andView;
	}
	
	

}
