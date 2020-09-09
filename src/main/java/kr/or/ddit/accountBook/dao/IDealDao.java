package kr.or.ddit.accountBook.dao;

import java.util.List;
import java.util.Map;

import org.springframework.scheduling.annotation.Scheduled;

import kr.or.ddit.vo.CardVO;
import kr.or.ddit.vo.DealVO;

public interface IDealDao {
	public int insertDeal (DealVO dealInfo) throws Exception;
	public List<DealVO> dealList (String mem_no) throws Exception;
	public List<DealVO> dealListView (Map<String, String> params) throws Exception;
	public List<CardVO> cardList (String mem_no) throws Exception;
	public void registCard(CardVO cardInfo) throws Exception;
	public void deleteCard(String card_no) throws Exception;
	public List<DealVO> searchList(Map<String, String> params) throws Exception;
	public void deletedeal(String deal_no) throws Exception;
	public String totalCount(Map<String, String> params) throws Exception;
	public List<DealVO> selectexpenditure() throws Exception;
	public List<DealVO> selectrevenue() throws Exception;
	public List<DealVO> staticList(String mem_no) throws Exception;

}
