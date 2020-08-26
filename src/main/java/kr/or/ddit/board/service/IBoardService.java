package kr.or.ddit.board.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.BoardVO;

public interface IBoardService {
		//테이블 조회
		public List<BoardVO> boardList(Map<String, String> params) throws Exception;
		//테이블 수정
		public void updateBoard(BoardVO boardVO) throws Exception;
		//테이블 삭제
		public void deleteBoard(String bd_no) throws Exception;
		//테이블 등록
		public int insertBoard(BoardVO boardVO) throws Exception;
		
		public BoardVO boardInfo(Map<String, String> params) throws Exception;
		
		public String totalCount(Map<String, String> params) throws Exception;
	
	
}