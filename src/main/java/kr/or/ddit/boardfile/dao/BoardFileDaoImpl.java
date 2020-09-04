package kr.or.ddit.boardfile.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.Board_FileVO;

@Repository
public class BoardFileDaoImpl implements IBoardFileDao {
	@Resource
	private SqlSessionTemplate client;

	@Override
	public void insertFileItem(List<Board_FileVO> fileItemList) throws Exception {
		for(Board_FileVO fileItemInfo : fileItemList) {
			client.insert("boardfile.insertFile", fileItemInfo);
		}
	}

	@Override
	public Board_FileVO fileitemInfo(Map<String, String> params) throws Exception {
		return (Board_FileVO) client.selectOne("boardfile.fileitemInfo", params);
	
	}

	@Override
	public void updateFileItem(List<Board_FileVO> fileItemList) throws Exception {
		for(Board_FileVO fileItemInfo : fileItemList) {
			client.update("boardfile.updateFile", fileItemInfo);
		}
	}
}
