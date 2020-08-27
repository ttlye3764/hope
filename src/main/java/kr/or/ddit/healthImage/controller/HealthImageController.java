package kr.or.ddit.healthImage.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.healthImage.service.IHealthImageService;
import kr.or.ddit.healthImageFile.service.IHealthImageFileService;
import kr.or.ddit.vo.HealthImageVO;

@Controller
@RequestMapping("/admin/healthImage/")
public class HealthImageController {
	
	@Autowired
	private IHealthImageService healthImageService;
	@Autowired
	private IHealthImageFileService healthFileService;
	
	@RequestMapping("healthImageList")
	
	public ModelAndView healthImageList(ModelAndView andView, Map<String, String> params) throws Exception {

		List<HealthImageVO> healthImageList = this.healthImageService.healthList(params);
		
		andView.addObject("healthImageList", healthImageList);
		andView.setViewName("admin/healthImage/healthImageList");

		return andView;

	}

}
