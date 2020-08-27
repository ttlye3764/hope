package kr.or.ddit.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.board.service.IBoardService;

import kr.or.ddit.utiles.CryptoGenerator;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.Board_FileVO;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.FreeboardVO;
import kr.or.ddit.vo.KnowledgeVO;

@Controller
@RequestMapping("/user/board/")
public class BoardController {
	@Autowired
	private IBoardService boardService;
//	@Autowired
//	private IBoard_FileService board_fileService;
	
	//컨트롤러에서의 리턴타입
	
	// 1. void
	
	// 2. String
	
	// 3. model
	
	// 4. modelAndView
	
	
	// 조회
	@RequestMapping("boardList")
	public ModelAndView boardList(Map<String, String> params) throws Exception{
		
	    List<BoardVO> boardList = this.boardService.boardList(params);  
		 
		ModelAndView andView = new ModelAndView();
		
		andView.addObject("boardList", boardList);
		andView.setViewName("user/board/boardList");

		return andView;
	}
	
	// 상세보기
	@RequestMapping("boardView")
		public BoardVO boardView(String bd_no,
							     Map<String, String> params,
							     ModelMap modelMap,
							     BoardVO boardInfo)throws Exception{
		params.put("bd_no", bd_no);
		 boardInfo = this.boardService.boardInfo(params);
		
		modelMap.addAttribute("boardInfo", boardInfo);
		
		return boardInfo;
	}

	// 수정
	@RequestMapping("updateBoardInfo")       //, @RequestParam("files") MultipartFile[] items
	public String updateBoard(BoardVO boardVO ) throws Exception{
                                            //, items
        this.boardService.updateBoard(boardVO);
		return "redirect:/user/board/boardList.do";
	}
	
	// 삭제
	@RequestMapping("deleteBoardInfo")
	public String deleteBoard(String bd_no) throws Exception {
		
		System.out.println("deleteBoard");
		
		this.boardService.deleteBoard(bd_no);
		return "redirect:/user/board/boardList.do";
	}
	
	// 등록
	@RequestMapping("insertBoardInfo")       //, @RequestParam("files") MultipartFile[] items 
	public String insertBoard(BoardVO boardVO ) throws Exception {
		                                //, items
		boardService.insertBoard(boardVO );
		return "redirect:/user/board/boardList.do";
	}
	
	// 게시판 폼
	@RequestMapping("boardForm")
	public void boardForm() {}
	
	
	// 파일 다운로드
//	@RequestMapping("fileDownload")
//	public ModelAndView fileDownload(String file_seq, Map<String, String> params, ModelAndView andView) throws Exception {
//			params.put("file_seq", file_seq);
//
//			Board_FileVO fileitemInfo = this.board_fileService.board_fileInfo(params);
//
//			andView.addObject("fileitemInfo", fileitemInfo);
//			andView.setViewName("fileDownloadView");
//
//			return andView;
//
//		}
	
}

