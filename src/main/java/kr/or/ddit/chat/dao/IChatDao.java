package kr.or.ddit.chat.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ChatFileVO;
import kr.or.ddit.vo.ChatingRoomVO;
import kr.or.ddit.vo.FriendVO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MessageVO;
import kr.or.ddit.vo.ParticipationVO;

public interface IChatDao {
		//채팅방 생성(삽입)
		public int createChatRoom(ChatingRoomVO chatingRoomInfo) throws Exception;
		//참여 테이블 삽입
		public int insertParticipation(ParticipationVO participationInfo) throws Exception;
		//메세지 삽입
		public int insertMessage(MessageVO messageInfo) throws Exception;
		//채팅방 리스트 조회
		public List<ChatingRoomVO> ChatingRoomList(Map<String, String> params) throws Exception;
		//참여 테이블 리스트 조회
		public List<ParticipationVO> participationList(Map<String, String> params) throws Exception;
		//친구 목록 id, name으로 조회
		public List<MemberVO> selectMemList(Map<String, String> params) throws Exception;
		//친구 등록
		public void insertFriendInfo(FriendVO freindInfo) throws Exception;
		//친구 등록시 자신, 친구의 정보 조회
		public FriendVO selectTwoMemInfo(Map<String, String> params) throws Exception; 
		//친구 정보 조회
		public List<MemberVO> selectFriendList(Map<String, String> params) throws Exception;
		//채팅에 참여중인 정보 조회
		public List<MemberVO> chatRoomList(Map<String, String> params) throws Exception;
		//메세지 테이블 조회
		public List<MessageVO> messageList(Map<String, String> params) throws Exception;
		//마지막 메세지 조회
		public MessageVO messageLast(Map<String, String> params) throws Exception;
		// 유저별, 채팅방별 배경화면 삽입
		public int insertChatFile(ChatFileVO chatFileInfo) throws Exception;
		// 유저별 채팅방별 배경화면 수정
		public int updateChatFile(ChatFileVO chatFileInfo) throws Exception;
		// 유저별, 채팅방별 등록한 사진이 있는지 확인p
		public ChatFileVO selectChatFileInfo(Map<String, String> params) throws Exception;
		
}
