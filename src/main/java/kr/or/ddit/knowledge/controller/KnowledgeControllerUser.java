package kr.or.ddit.knowledge.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.category.service.ICategoryService;
import kr.or.ddit.knowledge.service.IKnowledgeService;
import kr.or.ddit.utiles.CryptoGenerator;
import kr.or.ddit.vo.KnowledgeVO;
import kr.or.ddit.vo.MemberVO;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.api.client.http.HttpRequest;

import edu.emory.mathcs.backport.java.util.Arrays;

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
	private ICategoryService categoryService;

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
	
	@RequestMapping("news")
	public void news() {}

	@RequestMapping("chart")
	public void chart() {
	}
	
	@RequestMapping("saveCategory")
	public String category(String [] checkBoxArr, HttpServletRequest request, Map<String,String> params) throws Exception {
		String checkBox = "";
		
		for(int i = 0 ; i < checkBoxArr.length ; i++) {
			checkBox += checkBoxArr[i]+",";
		}
		
		checkBox = checkBox.substring(0,checkBox.length()-1);
		
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		
		if(memberInfo==null) {}
		else {
			String mem_no = memberInfo.getMem_no();
			
			params.put("mem_no", mem_no);
			params.put("ct_name", checkBox);
			
			String cate_no = categoryService.selectCategory(mem_no);
			if(cate_no == null) {
				categoryService.insertCategory(params) ;
			}else {
				categoryService.updateCategory(params);
			}
		}
		
		return "redirect:/user/knowledge/news.do";
	}
}
