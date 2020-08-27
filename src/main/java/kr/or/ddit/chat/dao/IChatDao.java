package kr.or.ddit.chat.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.vo.ChatingRoomVO;
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
}
