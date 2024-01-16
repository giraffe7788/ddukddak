package kr.or.dduk.vo;

import java.util.List;

import lombok.Data;

@Data
public class ChatRoomVO {
	private String chatRmNo; //방번호
	private String chatRmNm; //방이름
	
	//private String[] empNoArr;	//채팅직원배열
	
	private List<ChatMemberVO> chatMemberVOList;
}
