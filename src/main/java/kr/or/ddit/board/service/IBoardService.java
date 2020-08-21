package kr.or.ddit.board.service;

import java.util.List;

import kr.or.ddit.vo.BoardVO;

public interface IBoardService {
	//테이블 조회
		public List<BoardVO> boardList() throws Exception;
		//테이블 수정
		public void updateBoarsd(BoardVO boardVO) throws Exception;
		//테이블 삭제
		public void deleteBoard(int bd_no) throws Exception;
		//테이블 등
		public void insertBoard(BoardVO boardVO) throws Exception;
}
