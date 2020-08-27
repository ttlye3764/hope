package kr.or.ddit.healthImage.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.healthImageVO;

public interface IHealthImageService {

		// 운동법 리스트
		public List<healthImageVO> healthList(Map<String, String> params) throws Exception;

		// 운동법 상세
		public healthImageVO healthInfo(Map<String, String> params) throws Exception;
		
		// 운동법 등록
		public String insertHealth(healthImageVO healthInfo) throws Exception;
		
		// 운동법 수정
		public void updateHealth(healthImageVO healthInfo) throws Exception;
		
		// 운동법 삭제
		public void deleteHealth(String healthImage_no) throws Exception;
}
