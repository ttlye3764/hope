package kr.or.ddit.accountBook.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.CardVO;
import kr.or.ddit.vo.DealVO;

public interface IDealService {
		
	public int insertDeal (DealVO dealInfo) throws Exception;
	public List<DealVO> dealList (String mem_no) throws Exception;
	public List<DealVO> dealListView (Map<String, String> params) throws Exception;
	public List<DealVO> searchList(Map<String, String> params) throws Exception;
	public List<CardVO> cardList (String mem_no) throws Exception;
	public void registCard(CardVO cardInfo) throws Exception;
	public void deleteCard(String card_no) throws Exception;
	public void deletedeal(String deal_no) throws Exception;
	public String totalCount(Map<String, String> params) throws Exception;
	public List<DealVO> staticList(String mem_no) throws Exception;
	public DealVO dealInfo(String deal_no) throws Exception;
	public void updateAccount(Map<String, String> params) throws Exception;
	public String totalPlus(String mem_no) throws Exception;
	public String totalMinus(String mem_no) throws Exception;
	public String fix_plus(String mem_no) throws Exception;
	public String fix_minus(String mem_no) throws Exception;
	public List<DealVO> groupPlus(String mem_no) throws Exception;
	public List<DealVO> groupMinus(String mem_no)  throws Exception;
	public List<DealVO> accountList_Plus(Map<String, String> params)  throws Exception;
	public List<DealVO> accountList_Minus(Map<String, String> params)  throws Exception;
	public List<DealVO> accountList2_Plus(Map<String, String> params)  throws Exception;
	public List<DealVO> accountList2_Minus(Map<String, String> params)  throws Exception;
	public List<DealVO> accountLabel(Map<String, String> params)  throws Exception;
	public List<DealVO> accountLabel2(Map<String, String> params)throws Exception;

}