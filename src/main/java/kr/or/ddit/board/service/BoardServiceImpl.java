package kr.or.ddit.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.board.dao.IBoardDao;
import kr.or.ddit.boardfile.dao.IBoardFileDao;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.Board_FileVO;
import kr.or.ddit.vo.Board_ReplyVO;

@Service("boardService")
public class BoardServiceImpl implements IBoardService{
	
	@Autowired
	private IBoardDao boardDao;
	@Autowired
	private IBoardFileDao boardfileDao;

	
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
	public void insertBoard(BoardVO boardVO, MultipartFile[] items) throws Exception {
		boardDao.insertBoard(boardVO);
		  		
	    List<Board_FileVO> fileItemList = AttachFileMapper.boardMapper(items, boardVO.getBd_no());
	      
	    boardfileDao.insertFileItem(fileItemList);
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

	@Override
	public List<BoardVO> myboardList(Map<String, String> params) throws Exception {
		return boardDao.myboardList(params);
	}

	@Override
	public Board_FileVO selectBoardFileInfo(String fileNo, String fileBdNo) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("fileNo", fileNo);
		params.put("fileBdNo", fileBdNo);
		return boardDao.selectBoardFileInfo(params);
	}

	// 댓글 등록 
	@Override
	public void insertBoardReply(String re_content, String bd_no, String mem_id) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("re_content", re_content);
		params.put("bd_no", bd_no);
		params.put("memId", mem_id);
		
		boardDao.insertBoardReply(params);
	}
	
	
	// 댓글 조회
	@Override
	public List<Board_ReplyVO> selectBoardReply(String bd_no) {
		return boardDao.selectBoardReply(bd_no);
	} 

	// 댓글 수정
	@Override
	public void updateBoardReply(String re_content, String bd_no, String mem_id, String re_no) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		// xml 부분과 맞춰주지 않아서 수정이 되지 않았음  
		params.put("re_content", re_content);
		params.put("re_no", re_no);
		
		//params.put("bdNo", bdNo);
		//params.put("memId", mem_id);
		
		boardDao.updateBoardReply(params);
	}

//	@Override
//	public void deleteBoardReply(String reContent, String bdNo, String re_no, String currentPage, String search_keyword,
//			String search_keycode) {
//		boardDao.deleteBoardReply(re_no);
//	}

	




}
