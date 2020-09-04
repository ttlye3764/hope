package kr.or.ddit.category.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.ddit.category.dao.ICategoryDao;

public class CategoryServiceImpl implements ICategoryService {
	@Autowired
	private ICategoryDao dao;

	@Override
	public void insertCategory(Map<String, String> params) {
		dao.insertCategory(params);
	}

}
