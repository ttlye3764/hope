package kr.or.ddit.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.board.dao.IBoardDao;
import kr.or.ddit.vo.BoardVO;

@Service("boardService")
public class BoardServiceImpl implements IBoardService{
	
	@Autowired
	private IBoardDao boardDao;
	
	// 조회
	@Transactional(propagation = Propagation.REQUIRED, readOnly = true)
	@Override
	public List<BoardVO> boardList(Map<String, String> params) throws Exception {
		return boardDao.boardList(params);
	}
	
	// 삭제
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
	@Override
	public void deleteBoard(String bd_no) throws Exception {
		boardDao.deleteBoard(bd_no);
		
	}
	// 등록
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
	@Override
	public int insertBoard(BoardVO boardVO) throws Exception {
		return boardDao.insertBoard(boardVO);
		
	}
	
	// 수정
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
	@Override
	public void updateBoard(BoardVO boardVO) throws Exception {
		boardDao.updateBoard(boardVO);
	}
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
	@Override
	public BoardVO boardInfo(Map<String, String> params) throws Exception {
		return boardDao.boardInfo(params);
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = {Exception.class})
	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return boardDao.totalCount(params);
	}
	

}
