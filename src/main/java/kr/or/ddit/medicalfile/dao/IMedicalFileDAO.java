package kr.or.ddit.medicalfile.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.MypillFileVO;

public interface IMedicalFileDAO {
	public void insertFileItem(List<MypillFileVO> fileitemList) throws Exception;
	public MypillFileVO fileitemInfo(Map<String, String> params) throws Exception;
	public MypillFileVO selectImg(String pill_no) throws Exception;
	public void updateFileItem(List<MypillFileVO> fileItemList) throws Exception;
}
