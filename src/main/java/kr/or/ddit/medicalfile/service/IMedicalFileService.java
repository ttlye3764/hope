package kr.or.ddit.medicalfile.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.MypillFileVO;

public interface IMedicalFileService {
	public void insertFileItem(List<MypillFileVO> fileitemList)throws Exception;
	public MypillFileVO fileitemInfo(Map<String, String> params)throws Exception;
}
