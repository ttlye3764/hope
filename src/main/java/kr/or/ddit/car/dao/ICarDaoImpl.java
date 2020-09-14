package kr.or.ddit.car.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
	public MyCarVO selectMycar(String mem_no) throws Exception {
		return (MyCarVO) client.selectOne("car.selectMycar", mem_no);
	}
	
}
