package com.dondoc.backend.webSocket;

import com.dondoc.backend.common.jwt.JwtTokenProvider;
import com.dondoc.backend.notify.service.NotifyService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import java.util.*;
@Component
@Slf4j
@RequiredArgsConstructor
public class EchoHandler extends TextWebSocketHandler {

    // 접속한 모든 유저
    private List<WebSocketSession> sessions = new ArrayList<>();

    // 로그인중인 유저 1대1 매핑
    private Map<String, WebSocketSession> users = new HashMap<>();
    private final NotifyService notifyService;
    private final JwtTokenProvider jwtTokenProvider;


    /**
     * 사용자가 웹소켓 서버에 접속하게 되면 동작하는 메소드
     */
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        log.info("Socket 연결");
        sessions.add(session);
        String userId = getUserId(session);
        if(userId!=null){ // 로그인 값이 있는 경우에만
            log.info("[webSocket] 현재 접속한 사람의 userId : {}",userId); // 현재 접속한 사람의 userId
            users.put(userId, session);
        }
    }

    /**
     * 웹소켓 서버접속이 끝났을때 동작하는 메소드
     */
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        log.info("Socket 해제");
        sessions.remove(session);
        String userId = getUserId(session);
        if(userId!=null) {	// 로그인 값이 있는 경우만
            log.info(userId + " 연결 종료됨");
            users.remove(userId);
        }
    }

    /**
     * (클라이언트 -> 서버)
     * 클라이언트의 메시지를 받는 부분
     */
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        // 알림을 보낸 사용자의 ID
//        String userId = getUserId(session);

        String msg = message.getPayload();
        log.info("Socket Msg : {}",msg);
        if(msg!=null) {
            JSONParser jsonParser = new JSONParser();

            try {

                Object object = jsonParser.parse(msg);
                JSONObject jsonObj = (JSONObject) object;
                String token = (String)jsonObj.get("Authorization");
                String userId = null;

                if (token != null && token.startsWith("Bearer ")) {
                    token = token.substring(7);
                    if (!jwtTokenProvider.isTokenExpired(token)) {
                        // JWT 토큰이 유효한 경우, 사용자 정보를 추출하고 속성(attributes)에 저장합니다.
                        userId = jwtTokenProvider.getClaims(token).getSubject();
                        users.put(userId, session);
                    }
                }

                String alarm = (String)jsonObj.get("alarm");

                if(alarm!=null && userId!=null){
                    String[] strs = alarm.split(",");
                    log.info(strs.toString());

                    if (strs != null && strs.length == 4) {
                        /**
                         * 알림타입
                         *  - 1 : 모임초대
                         *  - 2 : 이체요청
                         *  - 3 : 미션요청
                         *  - 4 : 이체승인
                         *  - 5 : 이체거절
                         *  - 6 : 친구요청
                         */
                        String type = strs[0]; // 알림타입
                        String title = strs[1]; // 알림제목
                        String content = strs[2]; // 알림내용
                        Long target = Long.valueOf(strs[3]); // 회원ID (알림 받을사람의 ID)


                        // Notify 테이블에 저장
                        notifyService.createNotify(type, title, content, target);

                        // 알림을 받을 사용자의 webSocketSession
                        WebSocketSession targetSession = users.get(target.toString());
                        /**
                         * (서버 -> 클라이언트)
                         * 서버에서 클라이언트로 메시지 전송하는 부분
                         */
                        // 알림을 받을 사용자가 접속한 상태이면, 서버에서 클라이언트로 알림을 보내는 부분
                        if (targetSession != null) {
                            TextMessage textMessage = new TextMessage(type + "," + title + "," + content + "," + userId);
                            targetSession.sendMessage(textMessage);
                        }

                    }

                }

            } catch (Exception e) { // Parse Exception
                log.error(e.getMessage());
            }
        }
    }


    /**
     * 알람을 보내는 유저(댓글작성, 좋아요 누르는 유저)
     */
    private String getUserId(WebSocketSession session) {
        Map<String, Object> attributes = session.getAttributes();
        String loginUserId;
        if (attributes == null || attributes.get("userId")==null) {
            loginUserId = null;
        } else {
            loginUserId = (String) attributes.get("userId");
        }
        return loginUserId;
    }
}
