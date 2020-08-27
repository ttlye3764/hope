package kr.or.ddit.chat.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

public class MyHandshakeInterceptor extends HttpSessionHandshakeInterceptor{
	
	private static final Logger logger = LoggerFactory.getLogger(MyHandshakeInterceptor.class);

	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Map<String, Object> attributes) throws Exception {
		
		logger.debug("beforeHandShake");
		
		HttpServletRequest req = ((ServletServerHttpRequest)request).getServletRequest();
		
		if(req.getParameter("mem_no") != null)
			attributes.put("mem_no", req.getParameter("mem_no"));
		
		System.out.println(req.getParameter("mem_no"));
		System.out.println("세션걸러주는");
		return super.beforeHandshake(request, response, wsHandler, attributes);
	}

	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler, Exception exception) {
		logger.debug("afterHandShake");
	}

}
