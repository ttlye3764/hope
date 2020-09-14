package kr.or.ddit.car.service;

import java.util.List;
import java.util.Map;

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
	public List<MyCarVO> selectMycar(String mem_no) throws Exception {
		return dao.selectMycar(mem_no);
	}
	
	@Override
	public void updateMycar(MyCarVO carInfo) throws Exception {
		dao.updateMycar(carInfo);
	}

	@Override
	public MyCarVO selectchoiceMycar(Map<String, String> params) throws Exception {
		return dao.selectchoiceMycar(params);
	}

	@Override
	public void updateCarno(Map<String, String> params) throws Exception {
		dao.updateCarno(params);
	}

}
