package kr.or.ddit.diet.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.diet.dao.IDietDao;
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
}
