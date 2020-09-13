package kr.or.ddit.chat.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.or.ddit.vo.ChatingRoomVO;
import kr.or.ddit.vo.FriendVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MessageVO;
import kr.or.ddit.vo.ParticipationVO;

@Repository
public class ChatDaoImpl implements IChatDao{
	
	@Resource
	private SqlSessionTemplate client;

	@Override
	public int createChatRoom(ChatingRoomVO chatingRoomInfo) throws Exception {
		return client.insert("chat.createChatRoom", chatingRoomInfo);
	}

	@Override
	public int insertParticipation(ParticipationVO participationInfo) throws Exception {
		return client.insert("chat.insertParticipation", participationInfo);
	}

	@Override
	public int insertMessage(MessageVO messageInfo) throws Exception {
		return client.insert("chat.insertMessage", messageInfo);
	}
	
	@Override
	public List<ChatingRoomVO> ChatingRoomList(Map<String, String> params) throws Exception {
		return client.selectList("chat.chatingRoomList",params);
	}
	@Override
	public List<ParticipationVO> participationList(Map<String, String> params) throws Exception {
		return client.selectList("chat.participationList", params);
	}
	@Override
	public void insertFriendInfo(FriendVO freindInfo) throws Exception {
		client.insert("insertFriendInfo", freindInfo);	
	}
	@Override
	public List<MemberVO> selectMemList(Map<String, String> params) throws Exception {
		return client.selectList("selectMemList", params);
	}
	
	@Override
	public FriendVO selectTwoMemInfo(Map<String, String> params) throws Exception {
		return client.selectOne("selectTwoMemInfo", params);
	}
	@Override
	public List<MemberVO> selectFriendList(Map<String, String> params) throws Exception {
		return client.selectList("selectFriendList", params);
	}
	@Override
	public List<MemberVO> chatRoomList(Map<String, String> params) throws Exception {	
		return client.selectList("chatRoomList", params);
	}
	@Override
	public List<MessageVO> messageList(Map<String, String> params) throws Exception {
		return client.selectList("messageList", params);
	}
@Override
	public MessageVO messageLast(Map<String, String> params) throws Exception {
		return client.selectOne("messageLast", params);
	}
}
