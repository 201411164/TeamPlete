package kr.co.teamplete.handler;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.sun.org.apache.xml.internal.utils.URI;

public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor{
	  
    @Override
    public boolean beforeHandshake(ServerHttpRequest request,ServerHttpResponse response, WebSocketHandler wsHandler,
         Map<String, Object> attributes) throws Exception {    
    
        // 위의 파라미터 중, attributes 에 값을 저장하면 웹소켓 핸들러 클래스의 WebSocketSession에 전달된다
        System.out.println("Before Handshake");
          
          
        ServletServerHttpRequest ssreq = (ServletServerHttpRequest) request;
		
		  System.out.println("URI:"+ssreq.getURI());
		  String[] uri=ssreq.getURI().toString().split("=",5);
		  
		  
		  String teamid = uri[1];
		  attributes.put("teamid", teamid);
		  
		  String memberid=uri[2];
		  attributes.put("memberid", memberid);
		  
		  String profile=uri[3];
		  attributes.put("profile", profile);
		  
		  String roomId=uri[4];
		  attributes.put("roomId", roomId);
		  
		  
		  System.out.println("teamid="+teamid);
		  System.out.println("memberid="+memberid);
		  System.out.println("profile="+profile);
		  System.out.println("roomId=" + roomId);
        return super.beforeHandshake(request, response, wsHandler, attributes);
    }
  
    @Override
    public void afterHandshake(ServerHttpRequest request,
            ServerHttpResponse response, WebSocketHandler wsHandler,
            Exception ex) {
        System.out.println("After Handshake");
  
        super.afterHandshake(request, response, wsHandler, ex);
    }
  
}


