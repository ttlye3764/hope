package kr.or.ddit.car.service;

import kr.or.ddit.vo.MyCarVO;

public interface ICarService {
	public void insertMycar(MyCarVO carInfo) throws Exception;
	public MyCarVO selectMycar(String mem_no) throws Exception;
}
