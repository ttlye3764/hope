package kr.or.ddit.fileitem.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


import kr.or.ddit.vo.FileItemVO;

@Repository
public class IFileItemDAOImpl implements IFileItemDAO {

	@Resource
	private SqlSessionTemplate client;
	
	@Override
	public void insertFileItem(List<FileItemVO> fileitemList) throws Exception {
		
			for(FileItemVO fileItemInfo : fileitemList){
				client.insert("fileitem.insertFileItem", fileItemInfo);
			}
	}

	@Override
	public FileItemVO fileitemInfo(Map<String, String> params) throws Exception {
		return (FileItemVO) client.selectOne("fileitem.fileitemInfo", params);
	}

	@Override
	public void updateFileItem(List<FileItemVO> fileItemList) throws Exception {
		client.update("fileitem.updateFileItem", fileItemList);
	}

}
