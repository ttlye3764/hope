package kr.or.ddit.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.board.dao.IBoardDao;
import kr.or.ddit.vo.BoardVO;

@Service
public class BoardServiceImpl implements IBoardService{
	
	@Autowired
	private IBoardDao boardDao;
	
	@Override
	public List<BoardVO> boardList() throws Exception {
		return boardDao.boardList();
		

		
	}
	
	@Override
	public void deleteBoard(int bd_no) throws Exception {
		boardDao.deleteBoard(bd_no);
		
	}
	
	@Override
	public void insertBoard(BoardVO boardVO) throws Exception {
		boardDao.insertBoard(boardVO);
		
	}
	
	@Override
	public void updateBoarsd(BoardVO boardVO) throws Exception {
		boardDao.updateBoarsd(boardVO);
		
	}
}
