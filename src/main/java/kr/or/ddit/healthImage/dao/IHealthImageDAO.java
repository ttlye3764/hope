package kr.or.ddit.healthImage.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.HealthImageVO;

public interface IHealthImageDAO {
	
	// 운동법 리스트
	public List<HealthImageVO> healthList(Map<String, String> params) throws Exception;

	// 운동법 상세
	public HealthImageVO healthInfo(Map<String, String> params) throws Exception;
	
	// 운동법 등록
	public String insertHealth(HealthImageVO healthInfo) throws Exception;
	
	// 운동법 수정
	public void updateHealth(HealthImageVO healthInfo) throws Exception;
	
	// 운동법 삭제
	public void deleteHealth(String healthImage_no) throws Exception;

	// 파일 시퀀스
	public String fileSequence() throws Exception;
	
	// 페이지
	public String totalCount(Map<String, String> params) throws Exception;
}
