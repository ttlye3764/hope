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

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public ModelAndView knowledgeList(Map<String, String> params,
									  ModelAndView andView,
									  HttpSession session,
									  HttpServletRequest request, 
									  String currentPage, RolePaginationUtil pagination, 
									  @RequestHeader("User-Agent") String agent,
									  @RequestHeader("Accept-Language") String language,
									  @CookieValue("JSESSIONID") String sessionID)throws Exception{
		   if(currentPage == null){
		         currentPage = "1";
		      }

		Map<String, String> publicKeyMap = this.cryptoGen.generatePairKey(session);
		
	    String totalCount = this.knowledgeService.totalCount(params);
	      
	      pagination.RolePaginationUtil(request, Integer.parseInt(currentPage), Integer.parseInt(totalCount));
	      String startCount = String.valueOf(pagination.getStartCount());
	      String endCount = String.valueOf(pagination.getEndCount());
	      params.put("startCount", startCount);
	      params.put("endCount", endCount);

	    
		List<KnowledgeVO> knowledgeList = this.knowledgeService.knowledgeList(params);
		
		andView.addObject("knowledgeList", knowledgeList);
		andView.addObject("publicKeyMap", publicKeyMap);
		andView.setViewName("admin/knowledge/knowledgeList");
		andView.addObject("pagination",pagination.getPagingHtmls());
		
		return andView;
		
	}
	
	// 문제 상세
	@RequestMapping("knowledgeView")
	//@ModelAttribute("memberInfo")
		public KnowledgeVO knowledgeView(String k_no,
									   Map<String, String> params,
									   ModelMap modelMap,
									   KnowledgeVO knowledgeInfo)throws Exception{
		params.put("k_no", k_no);
		knowledgeInfo = this.knowledgeService.knowledgeInfo(params);
		
		modelMap.addAttribute("knowledgeInfo", knowledgeInfo);
		
		return knowledgeInfo;
	}
	
	// 문제 폼
	@RequestMapping("knowledgeForm")
	public void knowledgeForm(){}
	
	// 문제 수정
	@RequestMapping("updateKnowledgeInfo")
	public String updateKnowledge(KnowledgeVO knowledgeInfo)throws Exception{
		this.knowledgeService.updateKnowledge(knowledgeInfo);
		
		return "redirect:/admin/knowledge/knowledgeList.do";
	}
	
	// 문제 등록
	@RequestMapping("insertKnowledgeInfo")
	public String insertKnowledge(KnowledgeVO knowledgeInfo,  
									@RequestParam("files") MultipartFile[] items)throws Exception{
		this.knowledgeService.insertKnowledge(knowledgeInfo, items);
		
		return "redirect:/admin/knowledge/knowledgeList.do";
	}
	
	// 문제 삭제
	@RequestMapping("deleteKnowledgeInfo")
	public String deleteKnowledge(String k_no) throws Exception{
		
		System.out.println(k_no);
		this.knowledgeService.deleteKnowledge(k_no);
		
		return "redirect:/admin/knowledge/knowledgeList.do";
	}
	
	// 파일 다운로드
	@RequestMapping("fileDownload")
	public ModelAndView fileDownload(String file_seq,
									 Map<String, String> params,
									 ModelAndView andView) throws Exception{
		params.put("file_seq", file_seq);
		
		FileItemVO fileitemInfo = this.fileItemService.fileitemInfo(params);
		
		andView.addObject("fileitemInfo", fileitemInfo);
		andView.setViewName("fileDownloadView");
		
		return andView;
		
	}

}
