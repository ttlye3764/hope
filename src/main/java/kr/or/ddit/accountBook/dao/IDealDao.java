package kr.or.ddit.accountBook.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.DealVO;

public interface IDealDao {
	public int insertDeal (DealVO dealInfo) throws Exception;
	public List<DealVO> dealList (String mem_no) throws Exception;
	public List<DealVO> dealListView (Map<String, String> params) throws Exception;

}
