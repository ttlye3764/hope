package kr.or.ddit.fileitem.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FileItemVO;

public interface IFileItemDAO {
	public void insertFileItem(List<FileItemVO> fileitemList) throws Exception;
	
	public FileItemVO fileitemInfo(Map<String, String> params) throws Exception;
	
	public void updateFileItem(List<FileItemVO> fileItemList) throws Exception;
}
