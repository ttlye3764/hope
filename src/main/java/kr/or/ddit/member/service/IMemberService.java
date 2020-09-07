package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.vo.FriendVO;
import kr.or.ddit.vo.MemberVO;

public interface IMemberService {
	public MemberVO memberInfo(Map<String, String> params)throws Exception;
	public List<MemberVO> memberList(Map<String, String> params)throws Exception;
	public void deleteMemberInfo(Map<String, String> params)throws Exception;
	public void updateMemberInfo(MemberVO memberInfo, MultipartFile[] items)throws Exception;
	public String insertMember (MemberVO memberVO, MultipartFile[] items)throws Exception;
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
	public String selectMem_no(String mem_id) throws Exception;
}
