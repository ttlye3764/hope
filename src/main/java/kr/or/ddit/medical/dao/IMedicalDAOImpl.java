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


	@Override
	public void deleteMedicalInfo(String pill_no) throws Exception {
		client.delete("medical.deleteMedicalInfo",pill_no);
	}


	@Override
	public MypillVO medicalInfo(String pill_no) throws Exception {
		return client.selectOne("medical.medicalInfo",pill_no);
	}

	@Override
	public String selectPill_no() throws Exception {
		return client.selectOne("medical.selectPill_no");
	}


	@Override
	public void updateMedicalInfo(MypillVO mypillInfo) throws Exception {
		client.update("medical.updateMedicalInfo", mypillInfo);
	}


	@Override
	public List<MypillVO> todayMedical(String mem_no) throws Exception {
		return client.selectList("medical.todayMedical",mem_no); 
	}


	@Override
	public List<MypillVO> weekMedical(String mem_no) throws Exception {
		return client.selectList("medical.weekMedical",mem_no); 
	}
	
		
	

}
