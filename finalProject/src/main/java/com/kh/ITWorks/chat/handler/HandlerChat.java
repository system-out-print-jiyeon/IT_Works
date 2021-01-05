package com.kh.ITWorks.chat.handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.kh.ITWorks.member.model.vo.Member;

@Component
public class HandlerChat extends TextWebSocketHandler {
	
	List<WebSocketSession> sessions = new ArrayList<WebSocketSession>();
	Map<String, WebSocketSession> userSessions = new HashMap<String, WebSocketSession>();

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		System.out.println("afterConnectionEstablished : " + session);
		sessions.add(session);
		String senderId = getId(session); 
		userSessions.put(senderId, session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		System.out.println("handleTextMessage : " + session + " : " + message);
		String senderName = getName(session);
		String senderId = getId(session);
		for(WebSocketSession sess:sessions) {
			sess.sendMessage(new TextMessage(senderId + " (" + senderName + ") : " + message.getPayload()));
		}
		
	}

	private String getName(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		Member loginUserr = (Member)httpSession.get("loginUser");
		if(null == loginUserr) {
			return session.getId();
		}else {
			return loginUserr.getMemName();
		}
	}
	
	private String getId(WebSocketSession session) {
		Map<String, Object> httpSession = session.getAttributes();
		Member loginUserr = (Member)httpSession.get("loginUser");
		if(null == loginUserr) {
			return session.getId();
		}else {
			return loginUserr.getMemId();
		}
	}
	

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		System.out.println("afterConnectionClosed : " + session + " : " + status);
	}
}
