package kr.or.ddit.chat.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.or.ddit.member.dao.IMemberDAO;
import kr.or.ddit.vo.MemberVO;

public class WebSocketChat extends TextWebSocketHandler{
	
	@Autowired
	IMemberDAO memberDao;
    
    private static final List<WebSocketSession> sessionList=new ArrayList<WebSocketSession>();;
    private static final Logger logger = LoggerFactory.getLogger(WebSocketChat.class);
    
    private static Map<String, Object> userMap;
    
    private MemberVO memberInfo = null;
    
    	// 웹소켓에 연결 -> 
	
 		// 눌렀을때 누구한테 보낼지 타겟유저 mem_no을 보
    
    	// 61이라는 걸로 session에서 어떻게 특정하지??
    
    
    //HttpSession정보를 바로 가져다 쓸 수 있으면 Map<Object, Object> userMap 만들어서
    
    // 혹은 Map<String, Object> 해서
    
    // String에 아이디 혹은 넘버
    
    // Object에 webSocketSession넣고
    
    // 메세지 보낼 때 if문으로 나 자신 제외하고
    
    // 웹소켓에 접속하고 있는 session에 타겟유저번호로 session비교해서메세지를 보낸다
    
    // 그러면 웹소케셍 접속하지 않는 사람들은 ??? 아예못보내는 건가??
    
    // -> 그러면 디비에 메세지 보낼때 누가, 누구한테 보냈는지 저장해서
    
    // 채팅방에 출력해논다?
    
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
		
		String targetMemNo = message.getPayload().split(",")[1];
		
		String text = message.getPayload().split(",")[0];
		
 
		sendOneSessionToMessage(my_mem_no, text, userMap, targetMemNo);
		
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
	
    
    
    private void sendOneSessionToMessage(String my_mem_no, String text, Map<String, Object> userMap, String targetMemNo) {
        try {
        	for (String mem_no : userMap.keySet()) {
                if(!my_mem_no.equals(mem_no) && targetMemNo.equals(mem_no)) {
                	WebSocketSession currentSession = (WebSocketSession) userMap.get(mem_no);
                	currentSession.sendMessage(new TextMessage(mem_no + " : " + text));
                }              
            }
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
    }
    
    
    
    
    
    /*
     * ���� �Է��ϴ� �޼���
     * @param message
     * @param session
     */
    @OnMessage
    public void onMessage(String message,Session session) {
    	
    	String targetMemNo = message.split(",")[2];
    	String sender = message.split(",")[1];
    	message = message.split(",")[0];
    	
    	userMap.put(sender, session);
    	
    	Map<String, String> params = new HashMap<String, String>();
    	
    	params.put("mem_no", sender);
    	
    	
    	
    	try {
			memberInfo = memberDao.memberInfo(params);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	
    	String mem_name = memberInfo.getMem_no();
    	
        logger.info("Message From "+mem_name + ": "+message);
        
        try {
            final Basic basic=session.getBasicRemote();
            basic.sendText("<보낸사람> : "+message);
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
//        sendAllSessionToMessage(session, sender, message);
        //  sendOneSessionToMessage(session, sender, message, userMap, targetMemNo);
    }
 
}
