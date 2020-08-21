package kr.or.ddit.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.vo.BoardVO;

@Controller
@RequestMapping("/user/board/")
public class BoardController {
	
	
	@Autowired
	private IBoardService boardService;
	
	//컨트롤러에서의 리턴타입
	
	// 1. void
	
	// 2. String
	
	// 3. model
	
	// 4. modelAndView
	
	//조회
	@RequestMapping("boardList")
	public ModelAndView boardList() throws Exception{
		
		List<BoardVO> boardList = boardService.boardList();
		
		ModelAndView andView = new ModelAndView();
		
		andView.addObject("boardList", boardList);
		andView.setViewName("user/board/boardList");
		
		return andView;
	}
	
	//수정
	@RequestMapping("updateBoard")
	public ModelAndView updateBoard(ModelAndView andView, BoardVO boardVO) throws Exception {
		
		boardService.updateBoarsd(boardVO);
		andView.setViewName("user/board/boardList");
		return andView;
	}
	
	//삭제
	@RequestMapping("deleteBoard")
	public ModelAndView deleteBoard(ModelAndView andView, int bd_no) throws Exception {
		
		boardService.deleteBoard(bd_no);
		andView.setViewName("user/board/boardList");
		return andView;
	}
	
	//등록
	@RequestMapping("insertBoard")
	public ModelAndView insertBoard(ModelAndView andView,BoardVO boardVO) throws Exception {
		
		boardService.insertBoard(boardVO);
		andView.setViewName("user/board/boardList");
		return andView;
	}
}
