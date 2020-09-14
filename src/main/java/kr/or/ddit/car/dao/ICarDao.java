package kr.or.ddit.car.dao;

import kr.or.ddit.vo.MyCarVO;

public interface ICarDao {
	public void insertMycar(MyCarVO carInfo) throws Exception;
	public MyCarVO selectMycar(String mem_no) throws Exception;
}
