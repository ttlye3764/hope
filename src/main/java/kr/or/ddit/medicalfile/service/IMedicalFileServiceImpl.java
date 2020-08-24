package kr.or.ddit.medicalfile.service;

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
import kr.or.ddit.medicalfile.dao.IMedicalFileDAO;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.MypillFileVO;

@Service
public class IMedicalFileServiceImpl implements IMedicalFileService {
	@Autowired
	private IMedicalFileDAO dao;
	
	@Override
	public void insertFileItem(List<MypillFileVO> fileitemList)throws Exception {

	}
	
	
	@Override
	public MypillFileVO fileitemInfo(Map<String, String> params)throws Exception {
		return dao.fileitemInfo(params);
	}


	@Override
	public MypillFileVO selectImg(String pill_no) throws Exception {
		return dao.selectImg(pill_no);
	}

}
