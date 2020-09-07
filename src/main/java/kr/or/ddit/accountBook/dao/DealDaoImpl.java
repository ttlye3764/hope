package kr.or.ddit.accountBook.dao;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.DealVO;


@Repository("dealDao")
public class DealDaoImpl implements IDealDao{
	
	@Resource
	private SqlSessionTemplate client;

	@Override
	public int insertDeal(DealVO dealInfo) throws Exception {
		int cnt = 0;
	      try {
	         Object obj = client.insert("deal.insertDeal", dealInfo);
	         if(obj == null){
	            cnt = 1;
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      return cnt; 
	}

	@Override
	public List<DealVO> dealList(String mem_no) throws Exception {
		return client.selectList("deal.dealList",mem_no);
	}

	@Override
	public List<DealVO> dealListView(Map<String, String> params) throws Exception {
		return client.selectList("deal.dealListView",params);
	}

	@Override
	public List<DealVO> searchList(Map<String, String> params) throws Exception {
		return client.selectList("deal.searchList",params);
	}
	



}
