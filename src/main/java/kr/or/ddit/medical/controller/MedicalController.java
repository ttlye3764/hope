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
	public ModelAndView insertMedicalInfo(ModelAndView andView, MypillVO mypillInfo)
			throws Exception {
		
		andView.setViewName("user/medical/medicalList");
		
		System.out.println("asdfasdf");
		
		System.out.println(mypillInfo.getPill_start());
		
		String start = mypillInfo.getPill_start().concat("T");
		start = start.concat(mypillInfo.getPill_alerttime());
		mypillInfo.setPill_start(start);
		
		String end = mypillInfo.getPill_end().concat("T");
		end = end.concat(mypillInfo.getPill_alerttime());
		mypillInfo.setPill_end(end);
		
		mypillInfo.setMem_no("1");
		  
		this.medicalService.insertMedicalInfo(mypillInfo, null);
		  
		 
		return andView;
	}
}
