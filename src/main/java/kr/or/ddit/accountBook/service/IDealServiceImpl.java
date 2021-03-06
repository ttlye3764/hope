package kr.or.ddit.accountBook.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.accountBook.dao.IDealDao;
import kr.or.ddit.schedule.dao.IScheduleDAO;
import kr.or.ddit.vo.CardVO;
import kr.or.ddit.vo.DealVO;
import kr.or.ddit.vo.ScheduleVO;

@Service("dealService")
public class IDealServiceImpl implements IDealService{

	 @Autowired
	   private IDealDao dao;
	 
	@Override
	public int insertDeal(DealVO dealInfo) throws Exception {
		int cnt = 0;
	      cnt = dao.insertDeal(dealInfo);
	   
	      return cnt;
	}

	@Override
	public List<DealVO> dealList(String mem_no) throws Exception {
		List<DealVO> dealList = dao.dealList(mem_no);
		return dealList;
	}

	@Override
	public List<DealVO> dealListView(Map<String, String> params) throws Exception {
		return dao.dealListView(params); 
	}

	@Override
	public List<CardVO> cardList(String mem_no) throws Exception {
		return dao.cardList(mem_no);
	}

	@Override
	public void registCard(CardVO cardInfo) throws Exception {
		dao.registCard(cardInfo);
	}
	@Override
	public void deleteCard(String card_no) throws Exception {
		dao.deleteCard(card_no);
	}

	@Override
	public List<DealVO> searchList(Map<String, String> params) throws Exception {
		return dao.searchList(params);
	}

	@Override
	public void deletedeal(String deal_no) throws Exception {
		dao.deletedeal(deal_no);
	}

	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return dao.totalCount(params);
	}

	@Override
	public List<DealVO> staticList(String mem_no) throws Exception {
		return dao.staticList(mem_no);
	}

	@Override
	public DealVO dealInfo(String deal_no) throws Exception {
		return dao.dealInfo(deal_no);
	}

	@Override
	public void updateAccount(Map<String, String> params) throws Exception {
		dao.updateAccount(params);		
	}

	@Override
	public String totalPlus(String mem_no) throws Exception {
		return dao.totalPlus(mem_no);	
	}

	@Override
	public String totalMinus(String mem_no) throws Exception {
		// TODO Auto-generated method stub
		return dao.totalMinus(mem_no);	
	}

	@Override
	public String fix_plus(String mem_no) throws Exception {
		return dao.fix_plus(mem_no);	
	}

	@Override
	public String fix_minus(String mem_no) throws Exception {
		return dao.fix_minus(mem_no);	
	}

	@Override
	public List<DealVO> groupPlus(String mem_no) throws Exception {
		return dao.groupPlus(mem_no);
	}

	@Override
	public List<DealVO> groupMinus(String mem_no) throws Exception {
		return dao.groupMinus(mem_no);
	}

	@Override
	public List<DealVO> accountList_Plus(Map<String, String> params) throws Exception {
		return dao.accountList_Plus(params);
	}
	@Override
	public List<DealVO> accountList_Minus(Map<String, String> params) throws Exception {
		return dao.accountList_Minus(params);
	}
	@Override
	public List<DealVO> accountList2_Plus(Map<String, String> params) throws Exception {
		return dao.accountList2_Plus(params);
	}
	@Override
	public List<DealVO> accountList2_Minus(Map<String, String> params) throws Exception {
		return dao.accountList2_Minus(params);
	}

	@Override
	public List<DealVO> accountLabel(Map<String, String> params) throws Exception {
		return dao.accountLabel(params);
	}
	@Override
	public List<DealVO> accountLabel2(Map<String, String> params) throws Exception {
		return dao.accountLabel2(params);
	}

	

	
	

}
