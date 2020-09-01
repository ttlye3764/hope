package kr.or.ddit.accountBook.service;

import java.util.List;

import kr.or.ddit.vo.DealVO;

public interface IDealService {
		

	public int insertDeal (DealVO dealInfo) throws Exception;
	public List<DealVO> dealList (String mem_no) throws Exception;
	
}