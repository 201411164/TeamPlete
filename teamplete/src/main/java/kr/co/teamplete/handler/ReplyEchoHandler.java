package kr.co.teamplete.handler;

import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.amazonaws.services.simpleworkflow.model.CloseStatus;

public class ReplyEchoHandler extends TextWebSocketHandler {

	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		System.out.println("afterConnectionEstablished:"+session);
	}
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		
	}


	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		
	}

	
}
