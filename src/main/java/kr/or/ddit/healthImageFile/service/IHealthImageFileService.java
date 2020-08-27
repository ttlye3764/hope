package kr.or.ddit.healthImageFile.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.HealthFileVO;

public interface IHealthImageFileService {
	
	// 파일 등록
		public void inserthealthFile(List<HealthFileVO> fileitemList) throws Exception;
		
		// 파일 상세
		public HealthFileVO healthFileInfo(Map<String, String> param) throws Exception;
		
}
