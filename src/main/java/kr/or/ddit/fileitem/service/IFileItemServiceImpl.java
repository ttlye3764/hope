package kr.or.ddit.fileitem.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.NestedExceptionUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.fileitem.dao.IFileItemDAO;
import kr.or.ddit.fileitem.dao.IFileItemDAOImpl;
import kr.or.ddit.vo.FileItemVO;

@Service
public class IFileItemServiceImpl implements IFileItemService {
	@Autowired
	private IFileItemDAO dao;
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor={Exception.class})
	@Override
	public void insertFileItem(List<FileItemVO> fileitemList)throws Exception {

	}
	
	@Transactional(propagation=Propagation.REQUIRED, readOnly=true)
	@Override
	public FileItemVO fileitemInfo(Map<String, String> params)throws Exception {
		return dao.fileitemInfo(params);
	}

}
