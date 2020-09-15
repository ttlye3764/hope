package kr.or.ddit.car.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.car.dao.ICarDao;
import kr.or.ddit.vo.MyCarDetailVO;
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

	@Override
	public void deleteMycar(Map<String, String> params) throws Exception {
		dao.deleteMycar(params);
	}

	@Override
	public void insertKm(MyCarDetailVO carDetailInfo) throws Exception {
		dao.insertKm(carDetailInfo);
	}

	@Override
	public void insertEngine(MyCarDetailVO carDetailInfo) throws Exception {
		dao.insertEngine(carDetailInfo);
	}

	@Override
	public void insertBreak(MyCarDetailVO carDetailInfo) throws Exception {
		dao.insertBreak(carDetailInfo);
	}

	@Override
	public List<MyCarDetailVO> selectKm(Map<String, String> params) throws Exception {
		return dao.selectKm(params);
	}

	@Override
	public List<MyCarDetailVO> selectEngine(Map<String, String> params) throws Exception {
		return dao.selectEngine(params);
	}

	@Override
	public List<MyCarDetailVO> selectBreak(Map<String, String> params) throws Exception {
		return dao.selectBreak(params);
	}

}
