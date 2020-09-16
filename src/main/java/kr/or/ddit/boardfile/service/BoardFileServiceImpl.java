package kr.or.ddit.boardfile.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.boardfile.dao.IBoardFileDao;
import kr.or.ddit.vo.Board_FileVO;

@Service
public class BoardFileServiceImpl implements IBoardFileService{
	
	@Autowired
	private IBoardFileDao dao;

	@Override
	public void insertFileItem(List<Board_FileVO> fileitemList) throws Exception {
		dao.insertFileItem(fileitemList);
	}

	@Override
	public Board_FileVO fileitemInfo(Map<String, String> params) throws Exception {
		return dao.fileitemInfo(params);
	}
	
}
