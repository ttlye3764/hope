package kr.or.ddit.category.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.category.dao.ICategoryDao;

@Service
public class CategoryServiceImpl implements ICategoryService {
	@Autowired
	private ICategoryDao dao;

	@Override
	public void insertCategory(Map<String, String> params) throws Exception {
		dao.insertCategory(params);
	}

	@Override
	public String selectCategory(String mem_no) throws Exception {
		return dao.selectCategory(mem_no);
	}

	@Override
	public void updateCategory(Map<String, String> params) throws Exception {
		dao.updateCategory(params);
	}

}
