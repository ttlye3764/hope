package kr.or.ddit.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.board.dao.IBoardDao;
import kr.or.ddit.domain.Criteria;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.Board_FileVO;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.MypillFileVO;

@Service("boardService")
public class BoardServiceImpl implements IBoardService{
	
	@Autowired
	private IBoardDao boardDao;
	@Autowired
	private kr.or.ddit.boardfile.dao.IBoardFileDao boardfileDao;

	
	// 조회
	@Override
	public List<BoardVO> boardList(Map<String, String> params) throws Exception {
		return boardDao.boardList(params);
	}
	
	// 삭제
	@Override
	public void deleteBoard(String bd_no) throws Exception {
		boardDao.deleteBoard(bd_no);
		
	}
	// 등록
	@Override            
	public int insertBoard(BoardVO boardVO, MultipartFile[] items) throws Exception {
			
		String bd_no = String.valueOf(boardDao.insertBoard(boardVO));
		  
		System.out.println(bd_no);
		
	    List<Board_FileVO> fileItemList =AttachFileMapper.boardMapper(items, bd_no);
	      
	    boardfileDao.insertFileItem(fileItemList);
		
		return boardDao.insertBoard(boardVO);
		
	}
	
	// 수정
	@Override         
	public void updateBoard(BoardVO boardVO, MultipartFile[] items) throws Exception {
		boardDao.updateBoard(boardVO);
		
		List<Board_FileVO> fileItemList = AttachFileMapper.boardMapper(items, boardVO.getBd_no());
		boardfileDao.updateFileItem(fileItemList);
	}
	
	@Override
	public BoardVO boardInfo(Map<String, String> params) throws Exception {
		return boardDao.boardInfo(params);
	}

	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return boardDao.totalCount(params);
	}
	
	// 조회수 
	@Override
	public void countHit(String bd_no) throws Exception {
		boardDao.countHit(bd_no);
		
	}


}
