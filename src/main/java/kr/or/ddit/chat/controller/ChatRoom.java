package kr.or.ddit.chat.controller;

import java.util.HashSet;
import java.util.Set;

import org.springframework.web.socket.WebSocketSession;

public class ChatRoom {
	private String roomID;
	private String name;
	private Set<WebSocketSession> sessions = new HashSet<>();
	
	public ChatRoom(String roomID, String name) {
		this.roomID = roomID;
		this.name = name;
	}
	
	public void handleActions(WebSocketSession session, ChatMessage chatMessage, ChatService chatService) {
		if (chatMessage.getType().equals(ChatMessage.MessageType.ENTER)) {
				sessions.add(session);
		        chatMessage.setMessage(chatMessage.getSender() + "님이 입장했습니다.");
		    }
		    sendMessage(chatMessage, chatService);
	}	  

	public <T> void sendMessage(T message, ChatService chatService) {
		        sessions.parallelStream().forEach(session -> chatService.sendMessage(session, message));
		    }
		

}
