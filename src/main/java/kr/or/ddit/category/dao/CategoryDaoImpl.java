package kr.or.ddit.category.dao;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;

public class CategoryDaoImpl implements ICategoryDao {
	@Resource
	private SqlSessionTemplate client;

	@Override
	public void insertCategory(Map<String, String> params) {
		client.insert("category.insertCategory",params);
	}

}
