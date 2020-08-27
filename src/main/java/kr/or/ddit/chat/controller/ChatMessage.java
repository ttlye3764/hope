package kr.or.ddit.chat.controller;

public class ChatMessage {
	public enum MessageType{
		ENTER, TALK
	}
	
	private MessageType type;
	private String roomID;
	private String sender;
	private String message;
	
	public MessageType getType() {
		return type;
	}
	public void setType(MessageType type) {
		this.type = type;
	}
	public String getRoomID() {
		return roomID;
	}
	public void setRoomID(String roomID) {
		this.roomID = roomID;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
