package kr.co.teamplete.handler;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {

	@Bean
	public WebSocketHandler EchoHandler() {
		return new EchoHandler();
	}

	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {

		HttpSessionHandshakeInterceptor HandshakeInterceptor = new HandshakeInterceptor();
		HandshakeInterceptor.setCreateSession(true);
		//HandshakeInterceptor.setCopyAllAttributes(true);

		registry.addHandler(EchoHandler(), "/echo/*").setAllowedOrigins("*")
				.addInterceptors(HandshakeInterceptor).withSockJS();

	}
	
	
	
	
	
	
}