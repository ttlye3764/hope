package kr.or.ddit.accountBook.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.accountBook.dao.IDealDao;
import kr.or.ddit.schedule.dao.IScheduleDAO;
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

	

	
	

}
