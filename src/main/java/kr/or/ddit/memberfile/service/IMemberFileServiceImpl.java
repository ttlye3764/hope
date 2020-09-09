package kr.or.ddit.memberfile.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.fileitem.dao.IFileItemDAO;
import kr.or.ddit.memberfile.dao.IMemberFileDAO;
import kr.or.ddit.vo.MemberFileVO;

@Service
public class IMemberFileServiceImpl implements IMemberFileService {
	@Autowired
	private IMemberFileDAO dao;
	
	@Override
	public void insertFileItem(List<MemberFileVO> fileitemList)throws Exception {

	}
	
	@Override
	public MemberFileVO fileitemInfo(Map<String, String> params)throws Exception {
		return dao.fileitemInfo(params);
	}


}
