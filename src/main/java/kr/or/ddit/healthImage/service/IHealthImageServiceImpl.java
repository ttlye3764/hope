package kr.or.ddit.healthImage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.healthImage.dao.IHealthImageDAO;
import kr.or.ddit.healthImageFile.dao.IHealthImageFileDAO;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.HealthFileVO;
import kr.or.ddit.vo.HealthImageVO;

@Service("healthImageService")
public class IHealthImageServiceImpl implements IHealthImageService{
	
	@Autowired 
	private IHealthImageDAO healthImageDAO;
	@Autowired
	private IHealthImageFileDAO healthFileDAO;

	@Override
	public List<HealthImageVO> healthList(Map<String, String> params) throws Exception {
		return healthImageDAO.healthList(params);
	}

	@Override
	public HealthImageVO healthInfo(Map<String, String> params) throws Exception {
		return healthImageDAO.healthInfo(params);
	}

	@Override
	public String insertHealth(HealthImageVO healthInfo, MultipartFile[] items) throws Exception {
		healthImageDAO.insertHealth(healthInfo);
		
		String fileSequence = healthImageDAO.fileSequence();
		List<HealthFileVO> fileItemList =AttachFileMapper.healthMapper(items, fileSequence);
		
	    healthFileDAO.inserthealthFile(fileItemList);
		
		return fileSequence;
	}

	@Override
	public void updateHealth(HealthImageVO healthInfo, MultipartFile[] items) throws Exception {
		healthImageDAO.updateHealth(healthInfo);
		
		List<HealthFileVO> fileItemList =AttachFileMapper.healthMapper(items, healthInfo.getHealthImage_no());
	    healthFileDAO.updatehealthFile(fileItemList);
	}

	@Override
	public void deleteHealth(String healthImage_no) throws Exception {
		healthImageDAO.deleteHealth(healthImage_no);
	}

}
