package kr.or.ddit.accountBook.dao;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.CardVO;
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
	public List<CardVO> cardList(String mem_no) throws Exception {
		return client.selectList("deal.cardList",mem_no);
	}

	@Override
	public void registCard(CardVO cardInfo) throws Exception {
		client.insert("deal.registCard",cardInfo);
	}

	@Override
	public void deleteCard(String card_no) throws Exception {
		client.update("deal.deleteCard",card_no);
	}

	@Override
	public List<DealVO> searchList(Map<String, String> params) throws Exception {
		return client.selectList("deal.searchList",params);
	}

	@Override
	public void deletedeal(String deal_no) throws Exception {
		client.update("deal.deletedeal",deal_no);
	}

	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return client.selectOne("deal.totalCount", params);
	}

	@Override
	public List<DealVO> selectexpenditure() throws Exception {
		return client.selectList("deal.selectexpenditure");
	}

	@Override
	public List<DealVO> selectrevenue() throws Exception {
		return client.selectList("deal.selectrevenue");
	}

	@Override
	public List<DealVO> staticList(String mem_no) throws Exception {
		return client.selectList("deal.staticList", mem_no);
	}

	@Override
	public DealVO dealInfo(String deal_no) throws Exception {
		return client.selectOne("deal.dealInfo", deal_no);	
	}

	@Override
	public void updateAccount(Map<String, String> params) throws Exception {
		client.update("deal.updateAccount",params);
	}


}
