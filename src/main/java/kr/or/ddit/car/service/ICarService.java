package kr.or.ddit.car.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MyCarDetailVO;
import kr.or.ddit.vo.MyCarVO;

public interface ICarService {
	public void insertMycar(MyCarVO carInfo) throws Exception;
	public void updateMycar(MyCarVO carInfo) throws Exception;
	public void updateCarno(Map<String,String> params) throws Exception;
	public List<MyCarVO> selectMycar(String mem_no) throws Exception;
	public MyCarVO selectchoiceMycar(Map<String,String> params) throws Exception;
	public void deleteMycar(Map<String,String>params) throws Exception;
	public void insertKm(MyCarDetailVO carDetailInfo) throws Exception;
	public void insertEngine(MyCarDetailVO carDetailInfo) throws Exception;
	public void insertBreak(MyCarDetailVO carDetailInfo) throws Exception;
	public List<MyCarDetailVO> selectKm(Map<String,String> params) throws Exception;
	public List<MyCarDetailVO> selectEngine(Map<String,String> params) throws Exception;
	public List<MyCarDetailVO> selectBreak(Map<String,String> params) throws Exception;
	public void deleteMycarDetail (Map<String,String> params) throws Exception;
}
