package com.poorip.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.poorip.security.AuthUser;
import com.poorip.vo.UserVo;

public class EchoHandler extends TextWebSocketHandler{
		
	
	private Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	private List<WebSocketSession> connectedUsers;
	
	public EchoHandler() {
		connectedUsers = new ArrayList<WebSocketSession>();
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		logger.info(session.getId() + "님 접속");
		logger.info("연결IP" + session.getRemoteAddress().getHostName()); 
	
		connectedUsers.add(session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		logger.info(session.getId() + "님이 메세지 전송" + message.getPayload());
		for(WebSocketSession webSocketSession : connectedUsers) {
			if(!session.getId().equals(webSocketSession)) {
				webSocketSession.sendMessage(new TextMessage(message.getPayload()));
			}
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
		connectedUsers.remove(session);
	}
	
	
	
	
	
	
}
