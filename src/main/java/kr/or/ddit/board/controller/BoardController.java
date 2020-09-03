package kr.or.ddit.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.border.Border;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.domain.Criteria;
import kr.or.ddit.domain.PageDTO;
import kr.or.ddit.utiles.CryptoGenerator;
import kr.or.ddit.utiles.RolePaginationUtil_pill;
import kr.or.ddit.utiles.RolePaginationUtil_yun;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.ChatingRoomVO;

@Controller
@RequestMapping("/user/board/")
public class BoardController {
	@Autowired
	private IBoardService boardService;
	@Autowired
	private IBoardService boardfileService;

	@Autowired
	private ObjectMapper mapper;
	@Autowired
	private CryptoGenerator cryptoGen;
	
	//컨트롤러에서의 리턴타입
	
	// 1. void
	
	// 2. String
	
	// 3. model
	
	// 4. modelAndView
	
	
	// 조회
	@RequestMapping("boardList")
	public ModelAndView boardList(String bd_division,
			                      Map<String, String> params,
			                      ModelAndView andView,
								  HttpSession session,
								  HttpServletRequest request, 
								  String currentPage, 
								  RolePaginationUtil_yun pagination, 
								  String search_keyword, 
								  String search_keycode) throws Exception{		
		
	
		if(currentPage == null){
	         currentPage = "1";
	      }
		
		System.out.println(bd_division);
		
		String board_division_name = "";

		switch(bd_division){
	    case "1" : 
	         board_division_name = "자유게시판";
	        break;
	    case "2" : 
	         board_division_name = "공지사항";
	        break;
	    case "3" :
	    	board_division_name = "건의사항";
	    	break;
	    case "4" : 
	    	board_division_name = "QNA 게시판";
	    	break;    
		}
		
		
		params.put("bd_division",bd_division);
		params.put("search_keyword",search_keyword);
		params.put("search_keycode",search_keycode);
		
		
	    
		System.out.println(search_keyword);
		System.out.println(search_keycode);
	    String totalCount = this.boardService.totalCount(params);
	    
	    pagination.RolePaginationUtil(request, Integer.parseInt(currentPage), Integer.parseInt(totalCount),bd_division, search_keyword, search_keycode);
	    String startCount = String.valueOf(pagination.getStartCount());
	    String endCount = String.valueOf(pagination.getEndCount());
	    params.put("startCount", startCount);
	    params.put("endCount", endCount);
		
	    List<BoardVO> boardList = this.boardService.boardList(params);  
		
		andView.addObject("boardList", boardList);
		andView.addObject("board_division_name", board_division_name);
		andView.addObject("bd_division", bd_division);
		andView.setViewName("user/board/boardList");		
		andView.addObject("pagination", pagination.getPagingHtmls());

		return andView;
	}
	
	
	// 검색에 필요한 아이 
		@RequestMapping("list")
		public ModelAndView list(String bd_division,
				                      Map<String, String> params,
				                      ModelAndView andView,
									  HttpSession session,
									  HttpServletRequest request, 
									  String currentPage, 
									  RolePaginationUtil_yun pagination, 
									  String search_keyword, 
									  String search_keycode) throws Exception{		
		
			if(currentPage == null){
		         currentPage = "1";
		      }
			
			System.out.println(bd_division);
			
			String board_division_name = "";

			switch(bd_division){
		    case "1" : 
		         board_division_name = "자유게시판";
		        break;
		    case "2" : 
		         board_division_name = "공지사항";
		        break;
		    case "3" :
		    	board_division_name = "건의사항";
		    	break;
		    case "4" : 
		    	board_division_name = "QNA 게시판";
		    	break;    
			}
			
			params.put("bd_division",bd_division);
			params.put("search_keyword",search_keyword);
			params.put("search_keycode",search_keycode);
		    		
		    String totalCount = this.boardService.totalCount(params);
		    
		    pagination.RolePaginationUtil(request, Integer.parseInt(currentPage), Integer.parseInt(totalCount),bd_division, search_keyword, search_keycode);
		    String startCount = String.valueOf(pagination.getStartCount());
		    String endCount = String.valueOf(pagination.getEndCount());
		    params.put("startCount", startCount);
		    params.put("endCount", endCount);
			
		    List<BoardVO> boardList = this.boardService.boardList(params);  
			
			andView.addObject("boardList", boardList);
			andView.addObject("board_division_name", board_division_name);
			andView.addObject("bd_division", bd_division);
			andView.setViewName("jsonConvertView");		
			andView.addObject("pagination", pagination.getPagingHtmls());

			return andView;
		}
	
	
	
	
	// 상세보기
	@RequestMapping("boardView")
		public BoardVO boardView(String bd_division,
								 String bd_no,
							     Map<String, String> params,
							     ModelMap modelMap,
							     BoardVO boardInfo)throws Exception{
		
		params.put("bd_no", bd_no);
		boardInfo = this.boardService.boardInfo(params);
		
		boardService.countHit(bd_no);
		modelMap.addAttribute("bd_division", bd_division);
		modelMap.addAttribute("boardInfo", boardInfo);
		
		return boardInfo;
	}

	// 수정
	@RequestMapping("updateBoardInfo")       
	public String updateBoard(String bd_division,
						      BoardVO boardVO, 
						      ModelMap modelMap,
						      @RequestParam("files") MultipartFile[] items) throws Exception{
        
        this.boardService.updateBoard(boardVO, items);
        modelMap.addAttribute("bd_division", bd_division);
        
		return "redirect:/user/board/boardList.do";
	}
	
	// 삭제
	@RequestMapping("deleteBoardInfo")
	public String deleteBoard(String bd_division,
			                  ModelMap modelMap,
			                  String bd_no) throws Exception {
		
		System.out.println("deleteBoard");
		modelMap.addAttribute("bd_division", bd_division);
		this.boardService.deleteBoard(bd_no);
		
		return "redirect:/user/board/boardList.do";
	}
	
	// 등록
	@RequestMapping("insertBoardInfo")       
	public String insertBoard(String bd_division,
			                  ModelMap modelMap,
			                  BoardVO boardVO,
							  @RequestParam("files") MultipartFile[] items) throws Exception {
		                               
		String board_division_name = "";
		
		System.out.println(boardVO.getBd_division());
		modelMap.addAttribute("bd_division", bd_division);
		boardService.insertBoard(boardVO, items);
		
		return "redirect:/user/board/boardList.do";
	}
	
	// 게시판 폼
	@RequestMapping("boardForm")
	public ModelAndView boardForm(String bd_division, 
								  ModelAndView andView ) {
		
		System.out.println(bd_division);
		
		andView.addObject("bd_division", bd_division);
		andView.setViewName("user/board/boardForm");
		
		return andView;
	}
	
	
	
}

