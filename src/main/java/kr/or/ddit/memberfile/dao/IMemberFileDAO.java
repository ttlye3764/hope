package kr.or.ddit.memberfile.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MemberFileVO;

public interface IMemberFileDAO {
	public void insertFileItem(List<MemberFileVO> fileitemList) throws Exception;
	
	public MemberFileVO fileitemInfo(Map<String, String> params) throws Exception;
	
	public void updateFileItem(List<MemberFileVO> fileItemList) throws Exception;
}
