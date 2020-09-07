package kr.or.ddit.board.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.domain.Criteria;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.Board_FileVO;
import kr.or.ddit.vo.Board_ReplyVO;

@Repository("boardDao")
public class BoardDaoImpl implements IBoardDao{
	
	@Resource
	private SqlSessionTemplate client;
	
	// 조회
	@Override
	public List<BoardVO> boardList(Map<String, String> params) throws Exception{
		return client.selectList("board.boardList", params);
	}
	
	// 삭제 
	@Override
	public void deleteBoard(String bd_no) throws Exception{
		client.delete("board.deleteBoardInfo", bd_no);
		
	}
	
	// 등록
	@Override
	public int insertBoard(BoardVO boardVO) throws Exception{
		System.out.println("------------------------------------insertBoard");
		System.out.println(boardVO);
		return client.insert("board.insertBoardInfo", boardVO);
		
	}
	
	//수정
	@Override
	public void updateBoard(BoardVO boardVO) throws Exception {
		client.update("board.updateBoardInfo", boardVO);

	}


	@Override
	public BoardVO boardInfo(Map<String, String> params) throws Exception {
		return (BoardVO)client.selectOne("board.boardInfo", params);
	}

	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		System.out.println(params);
		return (String)client.selectOne("board.totalCount", params);
	}


	// 조회수 
	@Override
	public void countHit(String bd_no) throws Exception {
		client.update("board.countHit", bd_no);	
	}

	@Override
	public List<BoardVO> myboardList(Map<String, String> params) throws Exception {
		return client.selectList("board.myboardList", params);
	}
	
	@Override
	public String fileSequence() throws Exception{
		return client.selectOne("board.fileSequence");
	}

	@Override
	public Board_FileVO selectBoardFileInfo(Map<String, Object> params) {
		return client.selectOne("board.selectBoardFileInfo", params);
	}

	// 댓글 등록
	@Override
	public void insertBoardReply(Map<String, Object> params) {
		client.insert("boardReply.insertBoardReply", params );
	}

	@Override
	public List<Board_ReplyVO> selectBoardReply(String bd_no) {
		return client.selectList("boardReply.selectBoardReply", bd_no);
	}


}
