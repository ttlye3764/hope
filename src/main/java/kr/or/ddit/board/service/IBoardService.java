package kr.or.ddit.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.Board_FileVO;
import kr.or.ddit.vo.Board_ReplyVO;

public interface IBoardService {
		//테이블 조회
		public List<BoardVO> boardList(Map<String, String> params) throws Exception;
		public List<BoardVO> myboardList(Map<String, String> params) throws Exception;
		//테이블 수정                                                             
		public void updateBoard(BoardVO boardVO, MultipartFile[] items) throws Exception;
		//테이블 삭제
		public void deleteBoard(String bd_no) throws Exception;
		//테이블 등록                                                             
		public void insertBoard(BoardVO boardVO, MultipartFile[] items) throws Exception;
		
		public BoardVO boardInfo(Map<String, String> params) throws Exception;
		
		public String totalCount(Map<String, String> params) throws Exception;
		
		// 조회수 증가
		public void countHit(String bd_no) throws Exception;
		
		// 게시판 파일정보 조회
		public Board_FileVO selectBoardFileInfo(String fileNo, String fileBdNo);
		
		// 게시판 댓글 등록
		public void insertBoardReply(String re_content, String bd_no, String re_writer);
		// 게시판 댓글 조회
		public List<Board_ReplyVO> selectBoardReply(String bd_no);
		// 게시판 댓글 수정 
		public void updateBoardReply(String re_content, String bd_no, String mem_id, String re_no);
		// 게시판 댓글 삭제
		public void deleteBoardReply( String bd_no, String re_no);
		
		// 답글등록
		public void insertReplyInfo(BoardVO boardVO);

		
		
		



	
	
}