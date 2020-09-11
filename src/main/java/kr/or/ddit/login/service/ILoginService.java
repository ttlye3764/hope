package kr.or.ddit.login.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.LoginVO;

public interface ILoginService {
	public void insertLogin (LoginVO loginVO) throws Exception;
	public List<LoginVO> loginList(Map<String,String> params) throws Exception;
}
