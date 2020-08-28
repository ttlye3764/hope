package kr.or.ddit.medical.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.bis.Bis;
import kr.or.ddit.medical.service.IMedicalService;
import kr.or.ddit.medicalfile.service.IMedicalFileService;
import kr.or.ddit.pill.service.IPillService;
import kr.or.ddit.utiles.RolePaginationUtil;
import kr.or.ddit.utiles.RolePaginationUtil_pill;
import kr.or.ddit.vo.MypillFileVO;
import kr.or.ddit.vo.MypillVO;
import kr.or.ddit.vo.PillVO;

// 이용춘 - 깃 커밋 테스트

@Controller
@RequestMapping("/user/medical/")
public class MedicalController {
	@Autowired
	private IMedicalService medicalService;
	@Autowired
	private IMedicalFileService medicalFileService;
	@Autowired
	private IPillService pillService;

	@Autowired
	private MessageSourceAccessor accessor;

	@Autowired
	private ObjectMapper mapper;

	@RequestMapping("viewJson")
	public ModelAndView medicalList(String mem_no) throws Exception {

		List<MypillVO> medicalList = this.medicalService.medicalList(mem_no);
		ModelAndView andView = new ModelAndView();
		andView.addObject("json", medicalList);
		andView.setViewName("jsonConvertView");
		return andView;
	}

	@RequestMapping("viewJson2")
	public ModelAndView medicalInfo(String pill_no) throws Exception {

		MypillVO medicalInfo = this.medicalService.medicalInfo(pill_no);
		MypillFileVO medicalImg = this.medicalFileService.selectImg(pill_no);
		ModelAndView andView = new ModelAndView();
		andView.addObject("json", medicalInfo);
		andView.addObject("json2", medicalImg);
		andView.setViewName("jsonConvertView");
		return andView;
	}

	@RequestMapping("searchPillJson")
	public ModelAndView searchPillJson(@RequestParam(value = "shapes[]", required = false) List<String> shapes,
			@RequestParam(value = "colors[]", required = false) List<String> colors,
			@RequestParam(value = "lines[]", required = false) List<String> lines, String pname, String cname,
			HttpServletRequest request, String currentPage, RolePaginationUtil_pill pagination) throws Exception {

		System.out.println(shapes);
		System.out.println(colors);
		System.out.println(lines);
		System.out.println(pname);
		System.out.println(cname);

		HashMap map = new HashMap<>();
		if (pname != null) {
			map.put("pname", pname);
		}
		if (cname != null) {
			map.put("cname", cname);
		}
		if (shapes != null) {
			map.put("shapes", shapes);
		}
		if (colors != null) {
			map.put("colors", colors);
		}
		if (lines != null) {
			map.put("lines", lines);
		}

		// 페이징처리
		if (currentPage == null) {
			currentPage = "1";
		}

		String totalCount = pillService.totalCount(map);

		pagination.RolePaginationUtil(request, Integer.parseInt(currentPage), Integer.parseInt(totalCount));

		String startCount = String.valueOf(pagination.getStartCount());

		String endCount = String.valueOf(pagination.getEndCount());

		map.put("startCount", startCount);
		map.put("endCount", endCount);

		List<PillVO> list = pillService.pillList(map);

		ModelAndView andView = new ModelAndView();
		andView.addObject("pagination", pagination.getPagingHtmls());
		andView.addObject("list", list);
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
	public ModelAndView insertMedicalInfo(ModelAndView andView, MypillVO mypillInfo,
			@RequestParam("files") MultipartFile[] items) throws Exception {

		andView.setViewName("user/medical/medicalList");
		String start = mypillInfo.getPill_start().concat("T");
		start = start.concat(mypillInfo.getPill_alerttime());
		mypillInfo.setPill_start(start);

		String end = mypillInfo.getPill_end().concat("T");
		end = end.concat(mypillInfo.getPill_alerttime());
		mypillInfo.setPill_end(end);

		mypillInfo.setMem_no("1");

		this.medicalService.insertMedicalInfo(mypillInfo, items);
		return andView;
	}

	@RequestMapping("updateMedicalInfo")
	public ModelAndView updateMedicalInfo(ModelAndView andView, MypillVO mypillInfo,
			@RequestParam("files") MultipartFile[] items) throws Exception {

		andView.setViewName("user/medical/medicalList");
		String start = mypillInfo.getPill_start().concat("T");
		start = start.concat(mypillInfo.getPill_alerttime());
		mypillInfo.setPill_start(start);

		String end = mypillInfo.getPill_end().concat("T");
		end = end.concat(mypillInfo.getPill_alerttime());
		mypillInfo.setPill_end(end);

		mypillInfo.setMem_no("1");

		this.medicalService.updateMedicalInfo(mypillInfo, items);
		return andView;
	}

	@RequestMapping("deleteMedicalInfo")
	public ModelAndView deleteMedicalInfo(ModelAndView andView, String pill_no) throws Exception {
		andView.setViewName("user/medical/medicalList");
		medicalService.deleteMedicalInfo(pill_no);
		return andView;
	}

	@RequestMapping("medicalMap")
	public void medicalMap() {
	}

	@RequestMapping("searchPill")
	public ModelAndView searchPill(HttpServletRequest request, String currentPage, HashMap params,
			RolePaginationUtil_pill pagination) throws Exception {
		if (currentPage == null) {
			currentPage = "1";
		}

		String totalCount = pillService.totalCount(params);

		pagination.RolePaginationUtil(request, Integer.parseInt(currentPage), Integer.parseInt(totalCount));

		String startCount = String.valueOf(pagination.getStartCount());

		String endCount = String.valueOf(pagination.getEndCount());

		params.put("startCount", startCount);
		params.put("endCount", endCount);

		List<PillVO> list = pillService.pillList(params);

		ModelAndView andView = new ModelAndView();
		andView.addObject("pillList", list);
		andView.addObject("pagination", pagination.getPagingHtmls());
		andView.setViewName("user/medical/searchPill");
		return andView;
	}

	@RequestMapping("paginationPill")
	public ModelAndView paginationPill(HttpServletRequest request, String currentPage, HashMap params,
			RolePaginationUtil_pill pagination) throws Exception {
		if (currentPage == null) {
			currentPage = "1";
		}

		String totalCount = pillService.totalCount(params);

		pagination.RolePaginationUtil(request, Integer.parseInt(currentPage), Integer.parseInt(totalCount));

		String startCount = String.valueOf(pagination.getStartCount());

		String endCount = String.valueOf(pagination.getEndCount());

		params.put("startCount", startCount);
		params.put("endCount", endCount);

		List<PillVO> list = pillService.pillList(params);

		ModelAndView andView = new ModelAndView();
		andView.addObject("pillList", list);
		andView.addObject("pagination", pagination.getPagingHtmls());
		andView.setViewName("user/medical/searchPill");
		return andView;
	}

	
	@ResponseBody
	@RequestMapping(value="pillAPI",produces="text/plain;charset=UTF-8")
	public String pillAPI(String pi_no) throws Exception {
		
		PillVO vo = pillService.pillInfo(pi_no);
		String pname = vo.getPi_name();
		String cname = vo.getPi_b_name();
		
		String pillResult = pillInfo.pillAPI(pname, cname); //json으로 옴
		return pillResult;
	}
}
