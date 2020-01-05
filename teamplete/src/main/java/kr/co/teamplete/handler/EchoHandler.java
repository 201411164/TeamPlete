package kr.co.teamplete.handler;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


public class EchoHandler extends TextWebSocketHandler{
    
	private static Logger logger = LoggerFactory.getLogger(EchoHandler.class);
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
    /**
     * 클라이언트 연결 이후에 실행되는 메소드
     */
    @Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	Map<String, Object> sessionMap = new HashMap<String,Object>();
    	sessionMap=session.getAttributes();
    	String teamid = (String) sessionMap.get("teamid");
		sessionList.add(session);
		
	}

	// 클라이언트가 서버로 메시지를 전송했을 때 실행되는 메서드
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		logger.info("{}로 부터 {} 받음", session.getId(), message.getPayload());
		Map<String, Object> sessionMap = new HashMap<String,Object>();
		sessionMap=session.getAttributes();
    	String teamid = ((String) sessionMap.get("teamid")).replaceAll("(^\\p{Z}+|\\p{Z}+$)", "");
    	String userid = session.getId().split("&",2)[0];
    	String profile = session.getId().split("&",2)[1];
    	System.out.println("UserID="+userid);
		System.out.println("teamID="+teamid);
    	System.out.println("메시지 보냄");
		for (WebSocketSession sess : sessionList) {
			System.out.println("session의 팀 id들"+((String)sess.getAttributes().get("teamid")).replaceAll("(^\\p{Z}+|\\p{Z}+$)", ""));
			if(teamid.equals(((String)sess.getAttributes().get("teamid")).replaceAll("(^\\p{Z}+|\\p{Z}+$)", ""))==true) {
			sess.sendMessage(new TextMessage(userid+":"+profile+":"+message.getPayload()));
			System.out.println(sess.getId()+"에게"+message.getPayload()+"에게만 메세지 보냄");
			}
						
			
		}
	}

	// 클라이언트와 연결을 끊었을 때 실행되는 메소드
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		sessionList.remove(session);
		System.out.println("{} 연결 끊김"+session.getId());
		session.close();
	}
 
}