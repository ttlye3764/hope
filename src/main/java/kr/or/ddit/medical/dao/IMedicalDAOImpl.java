package kr.or.ddit.medical.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.vo.FreeboardVO;
import kr.or.ddit.vo.MypillVO;

@Repository("medicalDAO")
public class IMedicalDAOImpl implements IMedicalDAO {
	//@Autowired
	private SqlMapClient client;
	
	
	@Override
	public String insertMedicalInfo(MypillVO mypillInfo) throws Exception {
		return (String) client.insert("medical.insertMedicalInfo", mypillInfo);
	}
		
	

}
