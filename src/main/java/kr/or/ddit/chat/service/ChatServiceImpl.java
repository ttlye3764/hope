package kr.or.ddit.chat.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.chat.dao.IChatDao;
import kr.or.ddit.vo.ChatingRoomVO;
import kr.or.ddit.vo.MessageVO;
import kr.or.ddit.vo.ParticipationVO;

@Service
public class ChatServiceImpl implements IChatService {
	
	@Autowired
	private IChatDao chatDao;

	@Override
	public int createChatRoom(ChatingRoomVO chatingRoomInfo) throws Exception {
		return chatDao.createChatRoom(chatingRoomInfo);
	}

	@Override
	public int insertParticipation(ParticipationVO participationInfo) throws Exception {
		return chatDao.insertParticipation(participationInfo);
	}

	@Override
	public int insertMessage(MessageVO messageInfo) throws Exception {
		return chatDao.insertMessage(messageInfo);
	}

	@Override
	public List<ChatingRoomVO> ChatingRoomList(Map<String, String> params) throws Exception {
		return chatDao.ChatingRoomList(params);
	}

}
