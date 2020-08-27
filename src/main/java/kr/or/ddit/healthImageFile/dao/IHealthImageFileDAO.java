package kr.or.ddit.healthImageFile.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.HealthFileVO;

public interface IHealthImageFileDAO {

	// 파일 등록
	public void inserthealthFile(List<HealthFileVO> fileitemList) throws Exception;
	
	// 파일 상세
	public HealthFileVO healthFileInfo(Map<String, String> param) throws Exception;
	
	// 파일 수정
	public void updatehealthFile(List<HealthFileVO> fileitemList) throws Exception;
}
