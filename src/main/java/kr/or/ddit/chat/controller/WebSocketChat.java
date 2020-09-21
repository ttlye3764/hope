package kr.or.ddit.chat.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.or.ddit.chat.service.IChatService;
import kr.or.ddit.member.dao.IMemberDAO;
import kr.or.ddit.vo.MemberVO;
import kr.or.ddit.vo.MessageVO;
import kr.or.ddit.vo.ParticipationVO;

public class WebSocketChat extends TextWebSocketHandler{
	
	@Autowired
	IMemberDAO memberDao;
	
	@Autowired
	IChatService chatService;
    
    private static final List<WebSocketSession> sessionList=new ArrayList<WebSocketSession>();;
    private static final Logger logger = LoggerFactory.getLogger(WebSocketChat.class);
    
    private static Map<String, Object> userMap;
    private static Map<String, String> chatingRoomMap;
    
    private MemberVO memberInfo = null;
    
    	
    
    public WebSocketChat() {
        // TODO Auto-generated constructor stub
        System.out.println("웹소켓(서버) 객체 생");
        
        userMap = new HashMap<String, Object>();
    }
    
    @Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	
    	System.out.println("after connection est ");
    	
    	 logger.info("Open session id:"+session.getId());
    	 
    	 String mem_no = getUser(session);
    	 
    	 userMap.put(mem_no, session);
    	 
         try {
        	 sessionList.add(session);
        	 
        	 session.sendMessage(new TextMessage("Connection Established"));
        	 
         }catch (Exception e) {
             // TODO: handle exception
             System.out.println(e.getMessage());
         }
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		String my_mem_no = getUser(session);
		
		System.out.println("my_mem_no" +my_mem_no);
		
		System.out.println(message.getPayload());
		
		MessageVO messageInfo = new MessageVO();
		
		
		
		String chatingRoomNo = message.getPayload().split(",")[1];
		
		String text = message.getPayload().split(",")[0];
		
		//메세지 삽입
		
		messageInfo.setMem_no(my_mem_no);
		messageInfo.setMsg_content(text);
		messageInfo.setCh_no(chatingRoomNo);
		
		chatService.insertMessage(messageInfo);
		
		sendOneSessionToMessage(my_mem_no, text, userMap, chatingRoomNo);
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("after connection closed ");
		 logger.info("Session "+session.getId()+" has ended");
	      sessionList.remove(session);
	}

	private String getUser(WebSocketSession session) {
		return (String) session.getAttributes().get("mem_no");
	}

	public void serverToClient() throws IOException {
		for(WebSocketSession wSession : sessionList)
			wSession.sendMessage(new TextMessage("서버 전송 메세지"));				
	}
	
    
    
    private void sendOneSessionToMessage(String my_mem_no, String text, Map<String, Object> userMap, String chatingRoomNo) {
    	
    	
    	
    	// 채팅방 번호에 해당하는 유저들
    	Map<String, String> params = new HashMap<String, String>();
    	params.put("ch_no", chatingRoomNo);
    	List<ParticipationVO> participationList = null;
		try {
			participationList = chatService.participationList(params);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	
        try {
        	for(ParticipationVO participationInfo : participationList){
        		for (String mem_no : userMap.keySet()) {
        			if(participationInfo.getMem_no().equals(mem_no) && !mem_no.equals(my_mem_no)) {
        				WebSocketSession currentSession = (WebSocketSession) userMap.get(mem_no);
                    	currentSession.sendMessage(new TextMessage(my_mem_no + " : " + text));
        			}
        		}
        	}
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
    }

}
