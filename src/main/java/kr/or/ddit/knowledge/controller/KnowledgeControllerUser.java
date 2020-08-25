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
@RequestMapping("/user/knowledge/")
public class KnowledgeControllerUser {
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
		andView.setViewName("user/knowledge/knowledgeList");

		return andView;

	}
	
	// 문제 정답 리스트
	@RequestMapping("knowledgeAnswerList")
	public ModelAndView knowledgeAnswerList(ModelAndView andView, Map<String, String> params) throws Exception {

		List<KnowledgeVO> knowledgeList = this.knowledgeService.knowledgeList(params);

		andView.addObject("knowledgeList", knowledgeList);
		andView.setViewName("user/knowledge/knowledgeAnswerList");

		return andView;
	
	
	
	}
	
}
