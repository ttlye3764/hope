package kr.or.ddit.medical.dao;



import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import kr.or.ddit.vo.MypillVO;

@Repository("medicalDAO")
public class IMedicalDAOImpl implements IMedicalDAO {

	@Resource
	private SqlSessionTemplate client;
	
	
	@Override
	public String insertMedicalInfo(MypillVO mypillInfo) throws Exception {
		return Integer.toString(client.insert("medical.insertMedicalInfo", mypillInfo));
	}


	@Override
	public List<MypillVO> medicalList(String mem_no) throws Exception {
		return client.selectList("medical.medicalList",mem_no); 
	}
	
		
	

}
