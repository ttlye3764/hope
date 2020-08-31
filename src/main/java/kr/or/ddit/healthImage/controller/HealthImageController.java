package kr.or.ddit.healthImage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.healthImage.service.IHealthImageService;
import kr.or.ddit.healthImageFile.service.IHealthImageFileService;
import kr.or.ddit.vo.HealthImageVO;
import kr.or.ddit.vo.KnowledgeVO;

@Controller
@RequestMapping("/admin/healthImage/")
public class HealthImageController {
	
	@Autowired
	private IHealthImageService healthImageService;
	@Autowired
	private IHealthImageFileService healthFileService;
	
	// 운동법 리스트
	@RequestMapping("healthImageList")
	public ModelAndView healthImageList(ModelAndView andView, Map<String, String> params) throws Exception {

		List<HealthImageVO> healthImageList = this.healthImageService.healthList(params);
		
		andView.addObject("healthImageList", healthImageList);
		andView.setViewName("admin/healthImage/healthImageList");

		return andView;
	}
	
	@RequestMapping("chooseList")
	public ModelAndView chooseList(ModelAndView andView, Map<String, String> params, @RequestParam(value = "choose") String choose) throws Exception{
		System.out.println(choose);
		
		params.put("healthImage_category", choose);
		
		List<HealthImageVO> healthImageList = this.healthImageService.healthList(params);
		
		andView.addObject("healthImageList", healthImageList);
		andView.setViewName("admin/healthImage/healthImageList");
		
		return andView;
	}
	
	// 운동법 폼
	@RequestMapping("healthImageForm")
	public void healthImageForm() {
		
	}
	
	// 운동법  등록
	@RequestMapping("inserthealthImageInfo")
	public String inserthealthImageInfo(HealthImageVO healthInfo, @RequestParam("files") MultipartFile[] items)
			throws Exception {
		this.healthImageService.insertHealth(healthInfo, items);

		return "redirect:/admin/healthImage/healthImageList.do";
	}
	
	// 운동법 삭제
		@RequestMapping("deleteHealthImageInfo")
		public String deleteHealthImageInfo(@RequestParam(value = "healthImage_no") String healthImage_no) throws Exception {

			this.healthImageService.deleteHealth(healthImage_no);

			return "redirect:/admin/healthImage/healthImageList.do";
		}

	
	// 운동법 상세
	@RequestMapping("healthImageView")
	public HealthImageVO healthImageView(@RequestParam(value = "healthImage_no") String healthImage_no, 
											Map<String, String> params, 
											Model model,
											HealthImageVO healthInfo) throws Exception {
		params.put("healthImage_no", healthImage_no);
		
		healthInfo = this.healthImageService.healthInfo(params);
		model.addAttribute("healthInfo", healthInfo);

		return healthInfo;
	}
	
	// 운동법 수정
		@RequestMapping("updateHealthImageInfo")
		public String updateKnowledge(HealthImageVO healthInfo, @RequestParam("files") MultipartFile[] items)
				throws Exception {
			this.healthImageService.updateHealth(healthInfo, items);

			return "redirect:/admin/healthImage/healthImageList.do";
		}
}
