package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.member.dao.IMemberDAO;
import kr.or.ddit.vo.FriendVO;
import kr.or.ddit.vo.MemberVO;

// 설정 파일 : <bean name="iMemberServiceImpl"
//				  class = "kr.or.ddit.member.service.IMemberServiceImpl"/>
@Service
public class IMemberSerivceImpl implements IMemberService {
	@Autowired
	private IMemberDAO dao;
	
	@Override
	public MemberVO memberInfo(Map<String, String> params) throws Exception {
		MemberVO memberInfo = null;
			memberInfo = dao.memberInfo(params);
		return memberInfo;
	}

	@Override
	public List<MemberVO> memberList(Map<String, String> params)throws Exception {
		List<MemberVO> memberList = null;
		memberList = dao.memberList(params);
		return memberList;
	}

	@Override
	public void deleteMemberInfo(Map<String, String> params) throws Exception{
			dao.deleteMemberInfo(params);
	}

	@Override
	public void updateMemberInfo(MemberVO memberInfo)throws Exception {
			dao.updateMemberInfo(memberInfo);
		
	}

	@Override
	public void insertMember(MemberVO memberVO)throws Exception {
			dao.insertMember(memberVO);
		
	}

	@Override
	public String selectSeq() throws Exception {
		String mem_no = dao.selectSeq();
		return mem_no;
	}
	
	
	@Override
	public List<FriendVO> friendMemberList(Map<String, String> params) throws Exception {
		return dao.friendMemberList(params);
	}

	@Override
	public String searchID(Map<String, String> params) throws Exception {
		return dao.searchID(params);
	}

	@Override
	public String searchPW(Map<String, String> params) throws Exception {
		return dao.searchPW(params);
	}

	@Override
	public void makePass(Map<String, String> params) throws Exception {
		dao.makePass(params);
	}
}
