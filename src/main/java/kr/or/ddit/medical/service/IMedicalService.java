package kr.or.ddit.medical.service;

import java.util.List;
import java.util.Map;

import org.apache.commons.fileupload.FileItem;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.FreeboardVO;
import kr.or.ddit.vo.MypillFileVO;
import kr.or.ddit.vo.MypillVO;

public interface IMedicalService {
	public String insertMedicalInfo(MypillVO mypillInfo, MultipartFile[] items) throws Exception;

	public List<MypillVO> medicalList(String mem_no) throws Exception;

	public void deleteMedicalInfo(String pill_no) throws Exception;

	public MypillVO medicalInfo(String pill_no) throws Exception;

	public void updateMedicalInfo(MypillVO mypillInfo, MultipartFile[] items) throws Exception;

	public List<MypillVO> todayMedical(String mem_no) throws Exception;

	public List<MypillVO> weekMedical(String mem_no)throws Exception;
	
	

}


