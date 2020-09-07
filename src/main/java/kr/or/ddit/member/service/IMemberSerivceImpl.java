package kr.or.ddit.member.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.member.dao.IMemberDAO;
import kr.or.ddit.memberfile.dao.IMemberFileDAO;
import kr.or.ddit.utiles.AttachFileMapper;
import kr.or.ddit.vo.FileItemVO;
import kr.or.ddit.vo.FriendVO;
import kr.or.ddit.vo.MemberFileVO;
import kr.or.ddit.vo.MemberVO;

// 설정 파일 : <bean name="iMemberServiceImpl"
//				  class = "kr.or.ddit.member.service.IMemberServiceImpl"/>
@Service
public class IMemberSerivceImpl implements IMemberService {
	@Autowired
	private IMemberDAO dao;
	
	@Autowired
	private IMemberFileDAO fdao;

	@Override
	public MemberVO memberInfo(Map<String, String> params) throws Exception {
		MemberVO memberInfo = null;
		memberInfo = dao.memberInfo(params);
		return memberInfo;
	}

	@Override
	public List<MemberVO> memberList(Map<String, String> params) throws Exception {
		List<MemberVO> memberList = null;
		memberList = dao.memberList(params);
		return memberList;
	}

	@Override
	public void deleteMemberInfo(Map<String, String> params) throws Exception {
		dao.deleteMemberInfo(params);
	}

	@Override
	public void updateMemberInfo(MemberVO memberInfo, MultipartFile[] items) throws Exception {
		dao.updateMemberInfo(memberInfo);
		
		List<MemberFileVO> fileItemList =AttachFileMapper.memberMapper(items, memberInfo.getMem_no());
		fdao.updateFileItem(fileItemList);
	}

	@Override
	public String insertMember(MemberVO memberVO, MultipartFile[] items) throws Exception {
		dao.insertMember(memberVO);
		String mem_no = dao.selectSeq();
		List<MemberFileVO> fileItemList = AttachFileMapper.memberMapper(items, mem_no);
		
		fdao.insertFileItem(fileItemList);

		return mem_no;
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
	public void addFriend(FriendVO friendInfo) throws Exception {
		dao.addFriend(friendInfo);
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

	@Override
	public void deletePass(String mem_id) throws Exception {
		dao.deletePass(mem_id);
	}

	@Override
	public void updatePass(Map<String, String> params) throws Exception {
		dao.updatePass(params);
	}

	@Override
	public String selectNick(String mem_nick) throws Exception {
		return dao.selectNick(mem_nick);
	}

	@Override
	public String totalCount(Map<String, String> params) throws Exception {
		return dao.totalCount(params);
	}

	@Override
	public String selectMem_no(String mem_id) throws Exception {
		return dao.selectMem_no(mem_id);
	}
}
