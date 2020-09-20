package kr.or.ddit.diet.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.DietBoardVO;
import kr.or.ddit.vo.DietVO;
import kr.or.ddit.vo.Diet_dayVO;
import kr.or.ddit.vo.Diet_day_infoVO;
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
		
		// diet_mem 테이블 조회
		public List<Diet_memVO> dietMemList(Map<String, String> params) throws Exception;
		
		// menu_search
		public List<MenuVO> menuSearch(Map<String, String> params) throws Exception;
		
		//dietDay 테이블 생성
		public int insertDietDay(Diet_dayVO dietDay) throws Exception;
		
		//diet_day_Info 테이블 삽입
		public void InsertDietDayInfo(Diet_day_infoVO dietDayInfo) throws Exception;
		
		//diet_day_info 테이블 조회
		public List<Diet_day_infoVO> dietDayInfoList(Map<String, String> params) throws Exception;
		
		// diet_day 테이블 날짜로 조회
		public Diet_dayVO selectDietDay(Map<String, String> params) throws Exception;
		
		// 총 칼로리 업데이트
		public void updateDietDayKcal(Map<String, String> params) throws Exception;
		
		// diet_day_info 삭제
		public void deleteDietDayInfo(Map<String, String> params) throws Exception;
		
		// graph
		public List<Diet_dayVO> dietMemGraphList(Map<String, String> params) throws Exception;

		// 다이어트 게시판 조회
		public List<DietBoardVO> dietBoardList(Map<String, String> params) throws Exception;
		
		//다이어트 게시판 삽입
		public void updateDietBoard(List<DietBoardVO> dietBoardList) throws Exception;
		
		//다이어트 게시판 삽입
		public void insertDietBoard(Map<String, String> params) throws Exception;
		
		//다이어트 게시판 처음 삽입
		public void insertDietBoardFirst(Map<String, String> params) throws Exception;
		
		// 추천식단 리스트 가져오기
		public List<DietVO> recommendDietList(Map<String, String> params) throws Exception;
		
		//추천식단 상세 가져오기
		public List<Diet_infoVO> recommendDietInfo(Map<String, String> params) throws Exception;
		
		// diet_mem 수정
		public int updateDietMemInfo(Diet_memVO dietMemInfo) throws Exception;
		
		// diet_mem 삭제
		public int deleteDietMemInfo(Map<String, String> params) throws Exception;
		
		// dietDayInfoList 삽입
		public int InsertDietDayInfoList(List<Diet_day_infoVO> dietDayInfoInsert) throws Exception;
		
		// dietDay 테이블 cascade로 삭제
		public int deleteDietDay(Map<String, String> params) throws Exception;
		
		// diet에서 값 하나 뽑아오기
		public DietVO selectDietInfo(Map<String, String> params) throws Exception;
		
		// calendar 그릴때 diet_day에 값이 있나 없나
		public Diet_dayVO checkCalendar(Map<String, String> params) throws Exception;
}
