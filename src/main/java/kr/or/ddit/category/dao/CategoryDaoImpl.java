package kr.or.ddit.category.dao;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDaoImpl implements ICategoryDao {
	@Resource
	private SqlSessionTemplate client;

	@Override
	public void insertCategory(Map<String, String> params) throws Exception{
		client.insert("category.insertCategory",params);
	}

	@Override
	public String selectCategory(String mem_no) throws Exception {
		return client.selectOne("category.selectCategory", mem_no);
	}

	@Override
	public void updateCategory(Map<String, String> params) throws Exception {
		client.update("category.updateCategory",params);
	}

}
