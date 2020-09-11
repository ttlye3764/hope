package kr.or.ddit.login.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.LoginVO;

@Repository
public class ILoginDaoImpl implements ILoginDao {
	@Resource
	private SqlSessionTemplate client;
	
	@Override
	public void insertLogin(LoginVO loginVO) throws Exception {
		client.insert("login.insertLogin",loginVO);
	}

	@Override
	public List<LoginVO> loginList(Map<String, String> params) throws Exception {
		return client.selectList("login.loginList",params);
	}
	
}
