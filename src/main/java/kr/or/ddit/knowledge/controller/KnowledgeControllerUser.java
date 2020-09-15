package kr.or.ddit.knowledge.controller;

import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.knowledge.service.IKnowledgeService;
import kr.or.ddit.utiles.CryptoGenerator;
import kr.or.ddit.vo.KnowledgeVO;

@Controller
@RequestMapping("/user/knowledge/")
public class KnowledgeControllerUser {
	@Autowired
	private CryptoGenerator cryptoGen;
	@Autowired
	private ObjectMapper mapper;
	@Autowired
	private IKnowledgeService knowledgeService;
	
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

	@RequestMapping("chart")
	public void chart() {
	}
}
