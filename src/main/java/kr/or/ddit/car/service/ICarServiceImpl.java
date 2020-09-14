package kr.or.ddit.car.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.car.dao.ICarDao;
import kr.or.ddit.vo.MyCarVO;

@Service
public class ICarServiceImpl implements ICarService{
	@Autowired
	private ICarDao dao;

	@Override
	public void insertMycar(MyCarVO carInfo) throws Exception {
		dao.insertMycar(carInfo);
	}

	@Override
	public MyCarVO selectMycar(String mem_no) throws Exception {
		return dao.selectMycar(mem_no);
	}

}
