package kr.or.ddit.fileitem.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FileItemVO;

public interface IFileItemService {
	public void insertFileItem(List<FileItemVO> fileitemList)throws Exception;

	public FileItemVO fileitemInfo(Map<String, String> params)throws Exception;
}
