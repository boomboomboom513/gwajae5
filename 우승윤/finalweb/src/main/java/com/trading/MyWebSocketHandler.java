package com.trading;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.google.gson.Gson;
import com.trading.service.TradingService;

public class MyWebSocketHandler extends TextWebSocketHandler {

    private final TradingService tradingService;

    private static final List<WebSocketSession> sessions = new CopyOnWriteArrayList<>();

    public MyWebSocketHandler(TradingService tradingService) {
        this.tradingService = tradingService;
    }

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        // 클라이언트와 연결이 수립되면 세션을 리스트에 추가
        sessions.add(session);
//        System.out.println("연결 됐");
    }

    public void sendDataToClients() {
        for (WebSocketSession session : sessions) {
            if (session.isOpen()) {
                try {

                    // 서비스를 통해 DB에서 데이터를 가져옵니다.
                	List<Map<String, Object>> todaylist = tradingService.Todaylist();
//                    List<Map<String, Object>> daylist = tradingService.daylist();

                    // JSON 형식의 데이터를 클라이언트로 전송합니다.
                    String jsonDataTodaylist = new Gson().toJson(todaylist);
//                    String jsonDataDaylist = new Gson().toJson(daylist);
                    // 데이터를 각각 다른 JSON 형식으로 전송합니다.
                    session.sendMessage(new TextMessage(jsonDataTodaylist));
//                    session.sendMessage(new TextMessage(jsonDataDaylist));
//                    System.out.println("들어갔당");
                    
                } catch (IOException e) {
                    e.printStackTrace();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        // 클라이언트와 연결이 닫히면 세션을 리스트에서 제거
        sessions.remove(session);
//        

    }
    
   }

