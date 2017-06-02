package com.poorip.crawling;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;


@ServerEndpoint("/WebSocket")
public class WebSocket {
	private static Set<Session> clients = Collections
			.synchronizedSet(new HashSet<Session>());
	/***
     * 웹 소켓이 연결되면 호출되는 이벤트
     */
	@OnMessage
	public void onMessage(String message, Session session) throws IOException {
		System.out.println(message);
		
		synchronized (clients) {
			// Iterate over the connected sessions
			// and broadcast the received message
			for (Session client : clients) {
				if (!client.equals(session)) {
					client.getBasicRemote().sendText(message);
				}
			}
		}
	}
	
	@OnOpen
	public void onOpen(Session session) {
		// Add session to the connected sessions set
		System.out.println("YO" + session);
		clients.add(session);
	}
    /**
     * 웹 소켓이 닫히면 호출되는 이벤트
     */
	@OnClose
	public void onClose(Session session) {
		// Remove session from the connected sessions set
		clients.remove(session);
	}
    /**
     * 웹 소켓이 에러가 나면 호출되는 이벤트
     * @param t
     */
    @OnError
    public void handleError(Throwable t){
        t.printStackTrace();
    }
}