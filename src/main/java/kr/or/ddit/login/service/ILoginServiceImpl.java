package kr.or.ddit.login.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.login.dao.ILoginDao;
import kr.or.ddit.vo.LoginVO;

@Service
public class ILoginServiceImpl implements ILoginService{
	@Autowired
	private ILoginDao dao;
	
	@Override
	public void insertLogin(LoginVO loginVO) throws Exception {
		dao.insertLogin(loginVO);
	}
	
	@Override
	public List<LoginVO> loginList(Map<String,String> params) throws Exception{
		return dao.loginList(params);
	}
}
