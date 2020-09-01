package kr.or.ddit.diet.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
}
