package kr.or.ddit.knowledge.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.fileitem.service.IFileItemService;
import kr.or.ddit.knowledge.service.IKnowledgeService;
import kr.or.ddit.utiles.CryptoGenerator;
import kr.or.ddit.utiles.RolePaginationUtil;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.KnowledgeVO;

import org.apache.ibatis.annotations.Param;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin/knowledge/")
public class KnowledgeController {
	@Autowired
	private CryptoGenerator cryptoGen;
	@Autowired
	private ObjectMapper mapper;
	@Autowired
	private IKnowledgeService knowledgeService;
	@Autowired
	private IFileItemService fileItemService;

	// 문제리스트
	@RequestMapping("knowledgeList")
	public ModelAndView knowledgeList(ModelAndView andView, Map<String, String> params) throws Exception {

		List<KnowledgeVO> knowledgeList = this.knowledgeService.knowledgeList(params);

		andView.addObject("knowledgeList", knowledgeList);
		andView.setViewName("admin/knowledge/knowledgeList");

		return andView;

	}

	// 문제 상세
	@RequestMapping("knowledgeView")
	public KnowledgeVO knowledgeView(@RequestParam(value = "k_no") String k_no, Map<String, String> params, Model model,
			KnowledgeVO knowledgeInfo) throws Exception {
		params.put("k_no", k_no);
		knowledgeInfo = this.knowledgeService.knowledgeInfo(params);
		model.addAttribute("knowledgeInfo", knowledgeInfo);

		return knowledgeInfo;
	}

	// 문제 폼
	@RequestMapping("knowledgeForm")
	public void knowledgeForm() {
	}

	// 문제 수정
	@RequestMapping("updateKnowledgeInfo")
	public String updateKnowledge(KnowledgeVO knowledgeInfo, @RequestParam("files") MultipartFile[] items)
			throws Exception {
		this.knowledgeService.updateKnowledge(knowledgeInfo, items);

		return "redirect:/admin/knowledge/knowledgeList.do";
	}

	// 문제 등록
	@RequestMapping("insertKnowledgeInfo")
	public String insertKnowledge(KnowledgeVO knowledgeInfo, @RequestParam("files") MultipartFile[] items)
			throws Exception {
		this.knowledgeService.insertKnowledge(knowledgeInfo, items);

		return "redirect:/admin/knowledge/knowledgeList.do";
	}

	// 문제 삭제
	@RequestMapping("deleteKnowledgeInfo")
	public String deleteKnowledge(@RequestParam(value = "k_no") String k_no) throws Exception {

		this.knowledgeService.deleteKnowledge(k_no);

		return "redirect:/admin/knowledge/knowledgeList.do";
	}

	// 파일 다운로드
	@RequestMapping("fileDownload")
	public ModelAndView fileDownload(String file_seq, Map<String, String> params, ModelAndView andView)
			throws Exception {
		params.put("file_seq", file_seq);

		FileItemVO fileitemInfo = this.fileItemService.fileitemInfo(params);

		andView.addObject("fileitemInfo", fileitemInfo);
		andView.setViewName("fileDownloadView");

		return andView;

	}

}
