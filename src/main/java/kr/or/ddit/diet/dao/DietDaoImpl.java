package kr.or.ddit.diet.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.DietBoardVO;
import kr.or.ddit.vo.DietVO;
import kr.or.ddit.vo.Diet_dayVO;
import kr.or.ddit.vo.Diet_day_infoVO;
import kr.or.ddit.vo.Diet_infoVO;
import kr.or.ddit.vo.Diet_memVO;
import kr.or.ddit.vo.MenuVO;

@Repository
public class DietDaoImpl implements IDietDao {

	@Resource
	private SqlSessionTemplate client;

	@Override
	public void insertMenu(Map<String, String> params) throws Exception {
		client.insert("diet.insertMenu", params);
	}

	@Override
	public void insertDietMem(Diet_memVO diet_memInfo) throws Exception {
		client.insert("diet.insertDietMem", diet_memInfo);
	}

	@Override
	public void insertDietInfo(Diet_infoVO dietInfo) throws Exception {
		client.insert("diet.insertDietInfo", dietInfo);
	}
	
	@Override
	public List<MenuVO> menuList(Map<String, String> params) throws Exception {
		return client.selectList("diet.menuList", params);
	}
	
	// diet_mem 테이블 조회
	public List<Diet_memVO> dietMemList(Map<String, String> params) throws Exception{
		return client.selectList("diet.dietMemList", params);
	}
	
	@Override
	public List<MenuVO> menuSearch(Map<String, String> params) throws Exception {
		return client.selectList("diet.menuSearch", params);
	}
	
	@Override
	public int insertDietDay(Diet_dayVO dietDay) throws Exception {
		 client.insert("diet.insertDietDay", dietDay);
		 return	Integer.valueOf(String.valueOf(dietDay.getDd_no()));
	}
	
	@Override
	public void InsertDietDayInfo(Diet_day_infoVO dietDayInfo) throws Exception {
		client.insert("diet.insertDietDayInfo", dietDayInfo);	
	}
	
	@Override
	public List<Diet_day_infoVO> dietDayInfoList(Map<String, String> params) throws Exception {
		return client.selectList("diet.dietDayInfoList", params);
	}
	
	@Override
	public Diet_dayVO selectDietDay(Map<String, String> params) throws Exception {
		return client.selectOne("diet.selectDietDay", params);
	}
	
	@Override	
	public void updateDietDayKcal(Map<String, String> params) throws Exception {
		client.update("diet.updateDietDayKcal", params);
	}
	
	@Override
	public void deleteDietDayInfo(Map<String, String> params) throws Exception {
		client.delete("diet.deleteDietDayInfo", params);
	}
	
	@Override
	public List<Diet_dayVO> dietMemGraphList(Map<String, String> params) throws Exception {
		return client.selectList("diet.dietMemGraphList", params);
	}
	
	@Override
	public List<DietBoardVO> dietBoardList(Map<String, String> params) throws Exception {
		return client.selectList("diet.dietBoardList", params);
	}
	
	@Override
	public void updateDietBoard(List<DietBoardVO> dietBoardList) throws Exception {
		 client.update("diet.updateDietBoard", dietBoardList);	
	}
	
	@Override
	public void insertDietBoard(Map<String, String> params) throws Exception {
		client.insert("diet.insertDietBoard", params);
	}
	
	@Override
	public void insertDietBoardFirst(Map<String, String> params) throws Exception {
		client.insert("diet.insertDietBoardFirst",params);
	}
	
	@Override
	public List<DietVO> recommendDietList(Map<String, String> params) throws Exception {
		return client.selectList("diet.recommendDietList",params);
	}
	
	@Override
	public List<Diet_infoVO> recommendDietInfo(Map<String, String> params) throws Exception {
		return client.selectList("diet.recommendDietInfo", params);
	}
	
	@Override
	public int updateDietMemInfo(Diet_memVO dietMemInfo) throws Exception {
		return client.update("diet.updateDietMemInfo", dietMemInfo);
	}
	
	@Override
	public int deleteDietMemInfo(Map<String, String> params) throws Exception {
		return client.delete("diet.deleteDietMemInfo", params);
	}
	
	@Override
	public int deleteDietDay(Map<String, String> params) throws Exception {
		return client.delete("diet.deleteDietDay", params);
	}
	
	@Override
	public int InsertDietDayInfoList(List<Diet_day_infoVO> dietDayInfoInsert) throws Exception {
		return client.insert("diet.insertDietDayInfoList", dietDayInfoInsert);
	}
	
	@Override
	public DietVO selectDietInfo(Map<String, String> params) throws Exception {
		return client.selectOne("diet.selectDietInfo", params);
	}
	
	@Override
	public Diet_dayVO checkCalendar(Map<String, String> params) throws Exception {
		return client.selectOne("diet.checkCalendar", params);
	}
}
