package kr.or.ddit.medical.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.freeboard.service.IFreeboardService;
import kr.or.ddit.medical.service.IMedicalService;
import kr.or.ddit.vo.FreeboardVO;
import kr.or.ddit.vo.MypillVO;

// 이용춘 - 깃 커밋 테스트

@Controller
@RequestMapping("/user/medical/")
public class MedicalController {
	@Autowired
	private IMedicalService medicalService;
	
	// http://localhost/SpringToddler/user/medical/medicalForm.do
	@RequestMapping("medicalForm")
	public void medicalForm() {
	}

	@RequestMapping("insertMedicalInfo")
	public String insertMedicalInfo(MypillVO mypillInfo, @RequestParam("pill_img") MultipartFile[] items)
			throws Exception {
		System.out.println(mypillInfo);
		this.medicalService.insertMedicalInfo(mypillInfo, items);
		return "redirect:/user/freeboard/freeboardList.do";
	}
	
	

}
