package kr.or.ddit.board.dao;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.BoardVO;

@Repository
public class BoardDaoImpl implements IBoardDao{
	
	@Resource
	private SqlSessionTemplate client;
	
	@Override
	public List<BoardVO> boardList() throws Exception{
		return client.selectList("board.boardList");
	}
	
	 
	@Override
	public void deleteBoard(int bd_no) throws Exception{
		client.delete("board.deleteBoard");
		
	}
	
	@Override
	public void insertBoard(BoardVO boardVO) throws Exception{
		client.insert("board.insertBoard");
		
	}
	
	@Override
	public void updateBoarsd(BoardVO boardVO) throws Exception {
		client.update("board.updateBoard");
		
	}

}
