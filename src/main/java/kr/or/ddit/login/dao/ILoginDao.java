package kr.or.ddit.login.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.LoginVO;

public interface ILoginDao {
	public void insertLogin (LoginVO loginVO) throws Exception;
	public List<LoginVO> loginList(Map<String,String> params) throws Exception;
}
