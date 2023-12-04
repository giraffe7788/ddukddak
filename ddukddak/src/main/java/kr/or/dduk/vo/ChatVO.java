package kr.or.dduk.vo;

import lombok.Data;

@Data
public class ChatVO {
	private int chatRmListNo;
	private int chatNo;		//채팅메시지번호
	private String chatRmNo;
	private String chatCont;	//채팅내용
	private String chatDate;	//채팅날짜
	private String empNo;
	private String chatFileCd;		//첨부파일
}
