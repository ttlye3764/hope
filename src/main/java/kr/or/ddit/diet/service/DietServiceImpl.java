package kr.or.ddit.diet.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.diet.dao.IDietDao;
import kr.or.ddit.vo.DietBoardVO;
import kr.or.ddit.vo.DietVO;
import kr.or.ddit.vo.Diet_dayVO;
import kr.or.ddit.vo.Diet_day_infoVO;
import kr.or.ddit.vo.Diet_infoVO;
import kr.or.ddit.vo.Diet_memVO;
import kr.or.ddit.vo.MenuVO;

@Service
public class DietServiceImpl implements IDietService {
	
	@Autowired
	private IDietDao dietDao;
	
	@Override
	public void insertMenu(Map<String, String> params) throws Exception {
		dietDao.insertMenu(params);
	}
	
	@Override
	public void insertDietMem(Diet_memVO diet_memInfo) throws Exception {
		dietDao.insertDietMem(diet_memInfo);
	}
	
	@Override
	public void insertDietInfo(Diet_infoVO dietInfo) throws Exception {
		dietDao.insertDietInfo(dietInfo);
		
	}
	
	@Override
	public List<MenuVO> menuList(Map<String, String> params) throws Exception {
		return dietDao.menuList(params);
	}
	
	@Override
	public List<Diet_memVO> dietMemList(Map<String, String> params) throws Exception {
		return dietDao.dietMemList(params);
	}
	
	@Override
	public List<MenuVO> menuSearch(Map<String, String> params) throws Exception {
		return dietDao.menuSearch(params);
	}
	
	@Override
	public int insertDietDay(Diet_dayVO dietDay) throws Exception {
		return dietDao.insertDietDay(dietDay);
	}
	
	@Override
	public void InsertDietDayInfo(Diet_day_infoVO dietDayInfo) throws Exception {
		dietDao.InsertDietDayInfo(dietDayInfo);		
	}
	
	@Override
	public Diet_dayVO selectDietDay(Map<String, String> params) throws Exception {
		return dietDao.selectDietDay(params);
	}
	
	@Override
	public List<Diet_day_infoVO> dietDayInfoList(Map<String, String> params) throws Exception {
		return dietDao.dietDayInfoList(params);
	}
	
	@Override
	public void updateDietDayKcal(Map<String, String> params) throws Exception {
		dietDao.updateDietDayKcal(params);
	}
	@Override
	public void deleteDietDayInfo(Map<String, String> params) throws Exception {
		dietDao.deleteDietDayInfo(params);
	}
	
	@Override
	public List<Diet_dayVO> dietMemGraphList(Map<String, String> params) throws Exception {
		return dietDao.dietMemGraphList(params);
	}
	
	@Override
	public List<DietBoardVO> dietBoardList(Map<String, String> params) throws Exception {
		return dietDao.dietBoardList(params);
	}
	
	@Override
	public void updateDietBoard(List<DietBoardVO> dietBoardList) throws Exception {
		dietDao.updateDietBoard(dietBoardList);
	}
	
	@Override
	public void insertDietBoard(Map<String, String> params) throws Exception {
		dietDao.insertDietBoard(params);
	}
	
	@Override
	public void insertDietBoardFirst(Map<String, String> params) throws Exception {
		dietDao.insertDietBoardFirst(params);
	}
}
