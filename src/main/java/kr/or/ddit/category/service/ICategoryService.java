package kr.or.ddit.category.service;

import java.util.Map;

public interface ICategoryService {
	public void insertCategory(Map<String,String> params) throws Exception;
	public String selectCategory(String mem_no) throws Exception;
	public void updateCategory(Map<String,String> params) throws Exception;
}
