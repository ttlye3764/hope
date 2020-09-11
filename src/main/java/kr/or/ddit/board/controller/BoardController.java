package kr.or.ddit.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.boardfile.service.IBoardFileService;
import kr.or.ddit.utiles.CryptoGenerator;
import kr.or.ddit.utiles.RolePaginationUtil_yun;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.Board_FileVO;
import kr.or.ddit.vo.Board_ReplyVO;
import kr.or.ddit.vo.DealVO;
import kr.or.ddit.vo.MemberVO;

@Controller
@RequestMapping("/user/board/")
public class BoardController {
	@Autowired
	private IBoardService boardService;
	@Autowired
	private IBoardFileService boardfileService;

	@Autowired
	private ObjectMapper mapper;
	@Autowired
	private CryptoGenerator cryptoGen;
	
	//파일경로
	public String FILE_PATH = "D:\\temp\\files\\";
	
	
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
								  @RequestParam(defaultValue = "", required = false) String search_keyword, 
								  @RequestParam(defaultValue = "TOTAL", required = false)String search_keycode) throws Exception{		
		
	
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
	    
	    pagination.RolePaginationUtil(request, Integer.parseInt(currentPage), Integer.parseInt(totalCount),bd_division, search_keycode, search_keyword);
	    

	    String startCount = String.valueOf(pagination.getStartCount());
	    String endCount = String.valueOf(pagination.getEndCount());
	    params.put("startCount", startCount);
	    params.put("endCount", endCount);
		
	    List<BoardVO> boardList = this.boardService.boardList(params);  
		
		andView.addObject("boardList", boardList);
		andView.addObject("board_division_name", board_division_name);
		andView.addObject("bd_division", bd_division);
		
		andView.addObject("currentPage", currentPage);
		andView.addObject("search_keycode", search_keycode);
		andView.addObject("search_keyword", search_keyword);
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

			System.out.println("bd_division : " + bd_division);
			
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
		    
		    pagination.RolePaginationUtil(request, Integer.parseInt(currentPage), Integer.parseInt(totalCount),bd_division, search_keycode, search_keyword);
		    
		    String startCount = String.valueOf(pagination.getStartCount());
		    String endCount = String.valueOf(pagination.getEndCount());
		    params.put("startCount", startCount);
		    params.put("endCount", endCount);
			
		    List<BoardVO> boardList = this.boardService.boardList(params);  
			
			andView.addObject("boardList", boardList);
			andView.addObject("board_division_name", board_division_name);
			andView.addObject("bd_division", bd_division);
			andView.addObject("search_keycode", search_keycode);
			andView.addObject("search_keyword", search_keyword);
			andView.setViewName("jsonConvertView");		
			andView.addObject("pagination", pagination.getPagingHtmls());

			return andView;
		}
	
	
	
	// 상세보기
	@RequestMapping("boardView")
		public BoardVO boardView(String bd_division,
								 String bd_no,
								 String rnum,
								 String currentPage, 
								 String search_keyword, 
								 String search_keycode,
							     Map<String, String> params,
							     ModelMap modelMap,
							     BoardVO boardInfo)throws Exception{
		
		params.put("bd_no", bd_no);
		boardInfo = this.boardService.boardInfo(params);
		
		List<Board_ReplyVO> replyList = new ArrayList<Board_ReplyVO>();
		replyList = boardService.selectBoardReply(bd_no);
		modelMap.addAttribute("replyList", replyList);
		
		System.out.println(boardInfo);
		
		params.put("currentPage", currentPage);
		params.put("search_keyword", search_keyword);
		params.put("search_keycode", search_keycode);
		
		modelMap.addAttribute("currentPage", currentPage);
		modelMap.addAttribute("search_keyword", search_keyword);
		modelMap.addAttribute("search_keycode", search_keycode);
		
		boardService.countHit(bd_no);
		modelMap.addAttribute("bd_division", bd_division);
		//JSP...에
		modelMap.addAttribute("boardInfo", boardInfo);
		if(rnum==null) {
			rnum = "nu";
		}
		modelMap.addAttribute("rnum", rnum);
		
		return boardInfo;
	}
	
	@RequestMapping("replyList")
	public ModelAndView replyList(ModelAndView andView,
									String bd_no
									) throws Exception{
		
		
		List<Board_ReplyVO> replyList = new ArrayList<Board_ReplyVO>();
		
		replyList = boardService.selectBoardReply(bd_no);
		
		andView.addObject("replyList", replyList);
		andView.setViewName("jsonConvertView");
		
		
		return andView;
	}

	// 수정
	@RequestMapping("updateBoardInfo")       
	public String updateBoard(String bd_division, 
							  String bd_no, String re_no, 
							  String currentPage, String search_keyword, 
							  String search_keycode,
						      BoardVO boardVO, 
						      ModelMap modelMap,
						      @RequestParam("files") MultipartFile[] items) throws Exception{
        
        this.boardService.updateBoard(boardVO, items);
        modelMap.addAttribute("bd_division", bd_division);
        
		return "redirect:/user/board/boardView.do?bd_no="+ bd_no + "&re_no=" + re_no + "&bd_division=" + bd_division + "&currentPage=" + currentPage + "&search_keyword=" + search_keyword + "&search_keycode=" + search_keycode;
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
		
		System.out.println("bd_division" + bd_division);
		
		andView.addObject("bd_division", bd_division);
		andView.setViewName("user/board/boardForm");
		
		return andView;
	}
	
	
	
	
	// 파일 다운로드
	@RequestMapping("fileDownload")
	public void  fileDownload(String fileName, String fileNo, 
			                  String fileBdNo,
							  ModelAndView andView, 
							  HttpServletResponse response, 
							  HttpServletRequest request) throws Exception {
		
		// 다운받는 실제 경로
		String filePath = FILE_PATH + fileName;
						// D:\temp\files + 0901 저녁fec211c71a844ab0904bce919e027d96.zip
						// D:\temp\files\8a4244942ee04f618a2413952fce0509.jpg
		String downFileName = "";
		
		Board_FileVO boardFileVO = boardService.selectBoardFileInfo(fileNo, fileBdNo);

		downFileName = boardFileVO.getFile_name();
		response.setContentType("application/octet-stream");
		response.setHeader("Accept-Ranges", "bytes");

		// 다운로드 시 파일명 브라우저 별 한글 깨침 처리
		String userAgent = request.getHeader("User-Agent");

		boolean ie = (userAgent.indexOf("MSIE") > -1 || userAgent.indexOf("Trident") > -1);

		if(ie) {
			downFileName = URLEncoder.encode( downFileName, "utf-8" ).replaceAll("\\+", "%20");
		} else {
			downFileName = new String( String.valueOf(downFileName).getBytes("utf-8"), "iso-8859-1");
		}

		response.setHeader("Content-Disposition", "attachment; filename=\"" + downFileName + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		
		
		// 파일다운로드 
		File file = new File(filePath);
		FileInputStream fileIn = new FileInputStream(file);
		ServletOutputStream out = response.getOutputStream();
		 
		byte[] outputByte = new byte[4096];
		while(fileIn.read(outputByte, 0, 4096) != -1)
		{
			out.write(outputByte, 0, 4096);
		}
		fileIn.close();
		out.flush();
		out.close();
	}
	
	
	// 댓글 등록 
	@RequestMapping("insertBoardReply")
	public ModelAndView insertBoardReply(HttpSession session, 
			                     		String re_content, 
			                     		String bd_no) {
		System.out.println("///////////////////////////////bd_no : " + bd_no);
		ModelAndView andView = new ModelAndView();
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		String re_writer = memberInfo.getMem_nickname();
		boardService.insertBoardReply(re_content, bd_no, re_writer);
		List<Board_ReplyVO> board_replyList = boardService.selectBoardReply(bd_no);
		andView.addObject("board_replyList", board_replyList);
		andView.setViewName("jsonConvertView");
		return andView;
	}
	

	
	// 댓글 수정 
	@RequestMapping("updateBoardReply")
	public String updateBoardReply(HttpSession session, 
			                       String re_content, 
			                       String bd_no, 
			                       String bd_division, 
			                       String re_no, String currentPage, 
			                       String search_keyword, String search_keycode) {
		
		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
		
		String mem_id = memberInfo.getMem_nickname();
		
		boardService.updateBoardReply(re_content, bd_no, mem_id, re_no);
		
		return "redirect:/user/board/boardView.do?bd_no="+ bd_no + "&re_no=" + re_no + "&bd_division=" + bd_division + "&currentPage=" + currentPage + "&search_keyword=" + search_keyword + "&search_keycode=" + search_keycode;
	}
	
	// 댓글 삭제
//	@RequestMapping("deleteBoardReply")
//	public String deleteBoardReply (HttpSession session, String reContent, String bdNo, String bd_division, String re_no, String currentPage, String search_keyword, String search_keycode) {
//		
//		MemberVO memberInfo = (MemberVO) session.getAttribute("LOGIN_MEMBERINFO");
//		
//		String mem_id = memberInfo.getMem_nickname();
//		
//		boardService.deleteBoardReply(reContent, bdNo, re_no, currentPage, search_keyword, search_keycode);
//		
//		return "redirect:/user/board/boardView.do?bd_no="+ bdNo + "&re_no=" + re_no + "&bd_division=" + bd_division + "&currentPage=" + currentPage + "&search_keyword=" + search_keyword + "&search_keycode=" + search_keycode;
//	}
//	
	
	
}
