package com.trading;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.trading.service.TradingService;

@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {

    private final TradingService tradingService;

    public WebSocketConfig(TradingService tradingService) {
        this.tradingService = tradingService;
    }

    @Override
    public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
        registry.addHandler(myWebSocketHandler(), "/websocket"); // "/websocket" 경로로 웹소켓 핸들러 등록
    }

    @Bean
    public MyWebSocketHandler myWebSocketHandler() {
        return new MyWebSocketHandler(tradingService);
    }
    public void registerStompEndpoints(StompEndpointRegistry registry) {
         registry.addEndpoint("/chat");
         registry.addEndpoint("/chat").withSockJS();
    }
}
