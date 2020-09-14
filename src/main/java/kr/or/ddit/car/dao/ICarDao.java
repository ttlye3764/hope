package kr.or.ddit.car.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MyCarVO;

public interface ICarDao {
	public void insertMycar(MyCarVO carInfo) throws Exception;
	public void updateMycar(MyCarVO carInfo) throws Exception;
	public void updateCarno(Map<String,String> params) throws Exception;
	public List<MyCarVO> selectMycar(String mem_no) throws Exception;
	public MyCarVO selectchoiceMycar(Map<String,String> params) throws Exception;
}
