package kr.or.ddit.healthImageFile.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.healthImageFile.dao.IHealthImageFileDAO;
import kr.or.ddit.vo.HealthFileVO;

@Service
public class IHealthImageFileServiceImpl implements IHealthImageFileService{
	@Autowired
	private IHealthImageFileDAO dao;

	@Override
	public void inserthealthFile(List<HealthFileVO> fileitemList) throws Exception {
		
	}

	@Override
	public HealthFileVO healthFileInfo(Map<String, String> param) throws Exception {
		return dao.healthFileInfo(param);
	}

}
