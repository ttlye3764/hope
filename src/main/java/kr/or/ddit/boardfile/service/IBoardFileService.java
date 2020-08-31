package kr.or.ddit.boardfile.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.Board_FileVO;

public interface IBoardFileService {
	public void insertFileItem(List<Board_FileVO> fileitemList) throws Exception;

	public Board_FileVO fileitemInfo(Map<String, String> params) throws Exception;
}
