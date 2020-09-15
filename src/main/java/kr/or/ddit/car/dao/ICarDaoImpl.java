package kr.or.ddit.car.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.MyCarDetailVO;
import kr.or.ddit.vo.MyCarVO;

@Repository
public class ICarDaoImpl implements ICarDao{
	@Resource
	private SqlSessionTemplate client;

	@Override
	public void insertMycar(MyCarVO carInfo) throws Exception {
		client.insert("car.insertMycar", carInfo);
	}

	@Override
	public List<MyCarVO> selectMycar(String mem_no) throws Exception {
		return client.selectList("car.selectMycar", mem_no);
	}

	@Override
	public void updateMycar(MyCarVO carInfo) throws Exception {
		client.update("car.updateMycar", carInfo);
	}

	@Override
	public MyCarVO selectchoiceMycar(Map<String, String> params) throws Exception {
		return client.selectOne("car.selectchoiceMycar",params);
	}

	@Override
	public void updateCarno(Map<String, String> params) throws Exception {
		client.update("car.updateCarno", params);
	}

	@Override
	public void deleteMycar(Map<String, String> params) throws Exception {
		client.delete("car.deleteMycar",params);
	}

	@Override
	public void insertKm(MyCarDetailVO carDetailInfo) throws Exception {
		client.insert("car.insertKm",carDetailInfo);
	}

	@Override
	public void insertEngine(MyCarDetailVO carDetailInfo) throws Exception {
		client.insert("car.insertEngine",carDetailInfo);
	}

	@Override
	public void insertBreak(MyCarDetailVO carDetailInfo) throws Exception {
		client.insert("car.insertBreak",carDetailInfo);
	}

	@Override
	public List<MyCarDetailVO> selectKm(Map<String, String> params) throws Exception {
		return client.selectList("car.selectKM",params);
	}

	@Override
	public List<MyCarDetailVO> selectEngine(Map<String, String> params) throws Exception {
		return client.selectList("car.selectEngine",params);
	}

	@Override
	public List<MyCarDetailVO> selectBreak(Map<String, String> params) throws Exception {
		return client.selectList("car.selectBreak",params);
	}
	
}
