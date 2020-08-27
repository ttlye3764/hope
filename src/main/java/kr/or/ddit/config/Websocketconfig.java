package kr.or.ddit.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import kr.or.ddit.chat.controller.MyHandshakeInterceptor;
import kr.or.ddit.chat.controller.WebSocketChat;

@Configuration
@EnableWebSocket
public class Websocketconfig implements WebSocketConfigurer{

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		
		System.out.println("webSocket준");
//		registry.addHandler(webSocketChat(), "/echo").setAllowedOrigins("*").addInterceptors(new  HttpSessionHandshakeInterceptor()).withSockJS();
		registry.addHandler(webSocketChat(), "/echo").setAllowedOrigins("*").addInterceptors(new  MyHandshakeInterceptor()).withSockJS();

	
		
	}
	
	@Bean
	public WebSocketChat webSocketChat() {
	System.out.println("webSocket bean빈빈빈");
		return new WebSocketChat();
				
	}
	
}
