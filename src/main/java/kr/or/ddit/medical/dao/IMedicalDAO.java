package kr.or.ddit.medical.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FreeboardVO;
import kr.or.ddit.vo.MypillVO;

public interface IMedicalDAO {
	public String insertMedicalInfo(MypillVO mypillInfo) throws Exception;

	public List<MypillVO> medicalList(String mem_no) throws Exception;

	public void deleteMedicalInfo(String pill_no) throws Exception;

	public MypillVO medicalInfo(String pill_no) throws Exception;

	public String selectPill_no() throws Exception;

	public void updateMedicalInfo(MypillVO mypillInfo) throws Exception;
}
