package kr.or.ddit.memberfile.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MemberFileVO;

public interface IMemberFileService {
	public void insertFileItem(List<MemberFileVO> fileitemList)throws Exception;

	public MemberFileVO fileitemInfo(Map<String, String> params)throws Exception;

	
}
