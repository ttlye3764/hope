package kr.or.ddit.freeboard.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.or.ddit.fileitem.service.IFileItemService;
import kr.or.ddit.freeboard.service.IFreeboardService;
import kr.or.ddit.utiles.CryptoGenerator;
import kr.or.ddit.utiles.RolePaginationUtil;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.FreeboardVO;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

// 이용춘 - 깃 커밋 테스트


@Controller
@RequestMapping("/user/freeboard/")
public class FreeboardController {
	@Autowired
	private CryptoGenerator cryptoGen;
	@Autowired
	private ObjectMapper mapper;
	@Autowired
	private IFreeboardService freeboardService;
	@Autowired
	private IFileItemService fileItemService;
	
	// http://localhost/SpringToddelr/user/freeboard/feeboardList.do
	@RequestMapping("freeboardList")
	public ModelAndView freeboardList(Map<String, String> params,
									  ModelAndView andView,
									  HttpSession session,
									  HttpServletRequest request, 
									  String currentPage, RolePaginationUtil pagination, 
									  String search_keyword, 
									  String search_keycode,
									  @RequestHeader("User-Agent") String agent,
									  @RequestHeader("Accept-Language") String language,
									  @CookieValue("JSESSIONID") String sessionID)throws Exception{
		   if(currentPage == null){
		         currentPage = "1";
		      }

		Map<String, String> publicKeyMap = this.cryptoGen.generatePairKey(session);
		
		params.put("search_keyword", search_keyword);
	    params.put("search_keycode", search_keycode);
		
	    String totalCount = this.freeboardService.totalCount(params);
	      
	      pagination.RolePaginationUtil(request, Integer.parseInt(currentPage), Integer.parseInt(totalCount));
	      String startCount = String.valueOf(pagination.getStartCount());
	      String endCount = String.valueOf(pagination.getEndCount());
	      params.put("startCount", startCount);
	      params.put("endCount", endCount);

	    
		List<FreeboardVO> freeboardList = this.freeboardService.freeboardList(params);
		
//		ModelAndView andView = new ModelAndView();
		andView.addObject("freeboardList", freeboardList);
		andView.addObject("publicKeyMap", publicKeyMap);
		andView.setViewName("user/freeboard/freeboardList");
		 andView.addObject("pagination",pagination.getPagingHtmls());
		
		return andView;
		
	}
	@RequestMapping("freeboardView")
	@ModelAttribute("memberInfo")
		public FreeboardVO freeboardView(String bo_no,
									   Map<String, String> params,
									   ModelMap modelMap,
									   FreeboardVO freeboardInfo)throws Exception{
		params.put("bo_no", bo_no);
		 freeboardInfo = this.freeboardService.freeboardInfo(params);
		
		modelMap.addAttribute("freeboardInfo", freeboardInfo);
		
		return freeboardInfo;
	}
	@RequestMapping("freeboardForm")
	public void freeboardForm(){}
	
	@RequestMapping("updateFreeboardInfo")
	public String updateFreeboard(FreeboardVO freeboardInfo)throws Exception{
		this.freeboardService.updateFreeboard(freeboardInfo);
		
		return "redirect:/user/freeboard/freeboardList.do";
	}
	
	@RequestMapping("insertFreeboardInfo")
	public String insertFreeboard(FreeboardVO freeboardInfo,
								  @RequestParam("files") MultipartFile[] items)throws Exception{
		this.freeboardService.insertFreeboard(freeboardInfo, items);
		return "redirect:/user/freeboard/freeboardList.do";
	}
	
	@RequestMapping("deleteFreeboardInfo/{bo_no}")
	public String deleteFreeboard(@PathVariable("bo_no") String bo_no,
								Map<String, String> params) throws Exception{
		
		params.put("bo_no", bo_no);
		this.freeboardService.deleteFreeboard(params);
		
		return "redirect:/user/freeboard/freeboardList.do";
	}
	
	@RequestMapping("insertFreeboardReplyInfo")
	public String insertFreeboardReply(FreeboardVO freeboardInfo,
			  						   @RequestBody String totalparams,
			  						   RedirectAttributes redirectAttributes)throws Exception{
		this.freeboardService.insertFreeboardReply(freeboardInfo);
		return "redirect:/user/freeboard/freeboardList.do";
	}
	
	@RequestMapping("freeboardReplyForm")
	public void freeboardReplyForm(){}
	
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
