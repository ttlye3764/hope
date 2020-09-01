package kr.or.ddit.boardfile.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.Board_FileVO;

public interface IBoardFileDao {
	public void insertFileItem(List<Board_FileVO> fileitemList) throws Exception;
	
	public Board_FileVO fileitemInfo(Map<String, String> params) throws Exception;
	
	public void updateFileItem(List<Board_FileVO> fileItemList) throws Exception;

}
