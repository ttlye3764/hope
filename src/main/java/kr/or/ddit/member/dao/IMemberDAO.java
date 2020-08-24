package kr.or.ddit.member.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.MemberVO;

public interface IMemberDAO {
	public MemberVO memberInfo(Map<String, String> params) throws Exception;
	public List<MemberVO> memberList(Map<String, String> params) throws Exception;
	public void deleteMemberInfo(Map<String, String> params) throws Exception;
	public void updateMemberInfo(MemberVO memberInfo) throws Exception;
	public void insertMember (MemberVO memberVO) throws Exception;
	public String selectSeq() throws Exception;
	public List<MemberVO> friendMemberList(Map<String, String> params) throws Exception;
}
