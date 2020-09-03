package kr.or.ddit.healthImage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.HealthImageVO;

public interface IHealthImageService {

	// 운동법 리스트
	public List<HealthImageVO> healthList(Map<String, String> params) throws Exception;

	// 운동법 상세
	public HealthImageVO healthInfo(Map<String, String> params) throws Exception;

	// 운동법 등록
	public String insertHealth(HealthImageVO healthInfo, MultipartFile[] items) throws Exception;

	// 운동법 수정
	public void updateHealth(HealthImageVO healthInfo, MultipartFile[] items) throws Exception;

	// 운동법 삭제
	public void deleteHealth(String healthImage_no) throws Exception;
	
	// 페이지
	public String totalCount(Map<String, String> params) throws Exception;

}
