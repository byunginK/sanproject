package com.san.spring.websock;

import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class WebSocket extends TextWebSocketHandler {
	
	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();

	public WebSocket() {
		System.out.println("EchoHandler 생성"+ new Date());
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("Connect "+session.getId()+" "+ new Date());
		users.put(session.getId(), session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("Message:"+ message.getPayload()+" "+ new Date());
		
		for (WebSocketSession s : users.values()) {
			s.sendMessage(message);
		}
	}

	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		System.out.println(session.getId() + "Exception 발생" + new Date());
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("Disconnect"+ session.getId());
		users.remove(session.getId());
	}

}
