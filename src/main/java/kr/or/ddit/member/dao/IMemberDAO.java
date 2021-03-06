package kr.or.ddit.member.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.FriendVO;
import kr.or.ddit.vo.MemberVO;

public interface IMemberDAO {
	public MemberVO memberInfo(Map<String, String> params) throws Exception;
	public List<MemberVO> memberList(Map<String, String> params) throws Exception;
	public void deleteMemberInfo(Map<String, String> params) throws Exception;
	public void updateMemberInfo(MemberVO memberInfo) throws Exception;
	public String insertMember (MemberVO memberVO) throws Exception;
	public String selectSeq() throws Exception;
	public List<FriendVO> friendMemberList(Map<String, String> params) throws Exception;
	public void addFriend(FriendVO friendInfo) throws Exception;
	public String searchID(Map<String, String>params) throws Exception;
	public String searchPW(Map<String, String>params) throws Exception;
	public void makePass(Map<String,String>params) throws Exception;
	public void deletePass(String mem_id) throws Exception;
	public void updatePass(Map<String,String>params) throws Exception;
	public String selectNick(String mem_nick) throws Exception;
	public String totalCount(Map<String, String> params) throws Exception;
	public String fileSequence() throws Exception; // 파일 시퀀스
	public String selectMem_no(String mem_id) throws Exception;
}
