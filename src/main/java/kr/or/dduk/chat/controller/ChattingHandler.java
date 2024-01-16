package kr.or.dduk.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.BinaryMessage;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.or.dduk.vo.ChatMemberVO;
import kr.or.dduk.vo.ChatRoomVO;
import kr.or.dduk.vo.ChatVO;
import kr.or.dduk.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ChattingHandler extends TextWebSocketHandler{

	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();	
	private Map<String, WebSocketSession> sessionMap = new HashMap<String, WebSocketSession>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//		String chatMember = (String) session.getAttributes().get("user");
		
		log.info("#ChattingHandler, afterConnectionEstablished");
		sessionList.add(session);
		log.info("session : " + session);
		
		log.info(session.getPrincipal().getName() + "님이 입장하셨습니다.");
//		log.info("사용자가 입장하셨습니다.");
	}
	
	@Override		//메세지 보내기									//누가보냈는지 정보저장
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// 현재 로그인한 직원
//		String chatMember = (String) session.getAttributes().get("user");
		log.info("#ChattingHandler, handleMessage");
		log.info(session.getId() + ": " + message);
		log.info("메세지 : " + message.getPayload());
		log.info("session : " + session);
		//String empNo = message.getPayload();
		//String empName = message.getPayload();
		//String chatCont = message.getPayload();
		//String chatDate = message.getPayload();
		//String atchFileCd = message.getPayload();
		
		String[] chat = (message.getPayload()).split("::");
	      
	    for (String str : chat) {
			log.info("str ==> {}", str);
		}
	      
	    String empNo = chat[0];
	    String empName = chat[1];
	    String chatCont = chat[2];
	    String profileNm = chat[3];
	    String chatDate = chat[4];

		for(WebSocketSession ws : sessionList) {
			//이게 상대방에게 메세지 전달...?
			ws.sendMessage(new TextMessage(empNo + "::" + empName + "::" + chatCont + "::" + profileNm + "::" + chatDate));
			//session.sendMessage(new TextMessage(empNo + ":" + empName + ":" + chatCont + ":" + chatDate + ":" + atchFileCd));
			//session.sendMessage(new TextMessage(empNo + chatCont));
			//s.sendMessage(new TextMessage(session.getPrincipal().getName() + ":" + message.getPayload()));
			//s.sendMessage(new TextMessage(userData.toString()));
			//s.sendMessage(message);
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		log.info("#ChattingHandler, afterConnectionClosed");

		sessionList.remove(session);
		
		log.info(session.getPrincipal().getName() + "님이 퇴장하셨습니다.");
		log.info("사용자가 퇴장하셨습니다.");
	}
	
	//파일업로드할때 추가하자
	@Override
	public void handleBinaryMessage(WebSocketSession session, BinaryMessage message) {
		
	}
}
