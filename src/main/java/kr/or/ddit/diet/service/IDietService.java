package kr.or.ddit.diet.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.Diet_infoVO;
import kr.or.ddit.vo.Diet_memVO;
import kr.or.ddit.vo.MenuVO;

public interface IDietService {
	public void insertMenu(Map<String, String> params) throws Exception;
	
		// 식단관리 기초 삽입
		public void insertDietMem(Diet_memVO diet_memInfo) throws Exception;
		
		
		// 식단 등록
		public void insertDietInfo(Diet_infoVO dietInfo ) throws Exception;
		
		
		//메뉴 테이블 리스트
		public List<MenuVO> menuList(Map<String, String> params) throws Exception;
}
