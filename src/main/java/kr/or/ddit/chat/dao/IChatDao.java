package kr.or.ddit.chat.dao;

import java.util.List;

import kr.or.ddit.vo.MemberVO;

public interface IChatDao {
	// 친구목록조회
	public List<MemberVO> friendMember();
}
