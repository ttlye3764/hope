package kr.or.ddit.accountBook.dao;

import java.util.List;
import java.util.Map;

import org.springframework.scheduling.annotation.Scheduled;

import kr.or.ddit.vo.CardVO;
import kr.or.ddit.vo.DealVO;

public interface IDealDao {
	//거래등록
	public int insertDeal (DealVO dealInfo) throws Exception;
	//거래목록
	public List<DealVO> dealList (String mem_no) throws Exception;
	//거래목록(페이징추가)
	public List<DealVO> dealListView (Map<String, String> params) throws Exception;
	//카드목록
	public List<CardVO> cardList (String mem_no) throws Exception;
	//카드등록
	public void registCard(CardVO cardInfo) throws Exception;
	//카드삭제
	public void deleteCard(String card_no) throws Exception;
	//
	public List<DealVO> searchList(Map<String, String> params) throws Exception;
	//거래삭제
	public void deletedeal(String deal_no) throws Exception;
	//전체사이즈
	public String totalCount(Map<String, String> params) throws Exception;
	//고정지출리스트
	public List<DealVO> selectexpenditure() throws Exception;
	//고정수입리스트
	public List<DealVO> selectrevenue() throws Exception;
	//고정리스트(멤버별)
	public List<DealVO> staticList(String mem_no) throws Exception;
	public DealVO dealInfo(String deal_no) throws Exception;
	public void updateAccount(Map<String, String> params) throws Exception;
	
	public String totalPlus(String mem_no) throws Exception;
	public String totalMinus(String mem_no) throws Exception;
	public String fix_plus(String mem_no) throws Exception;
	public String fix_minus(String mem_no) throws Exception;
	public List<DealVO> groupPlus(String mem_no) throws Exception;
	public List<DealVO> groupMinus(String mem_no) throws Exception;
	public List<DealVO> accountList_Minus(Map<String, String> params)throws Exception;
	public List<DealVO> accountList_Plus(Map<String, String> params)throws Exception;
	public List<DealVO> accountList2_Plus(Map<String, String> params)throws Exception;
	public List<DealVO> accountList2_Minus(Map<String, String> params)throws Exception;
	public List<DealVO> accountLabel(Map<String, String> params)throws Exception;
	public List<DealVO> accountLabel2(Map<String, String> params)throws Exception;

}
