package kr.or.dduk.vo;

import java.util.List;

import lombok.Data;

@Data
public class ChatVO {
	private int chatRmListNo;	//채팅멤버번호
	private int chatNo;		//채팅메시지번호
	private String chatRmNo;	//채팅방번호
	private String chatCont;	//채팅내용
	private String chatDate;	//채팅날짜
	private String empNo;			//사번
	private String empName;			//사원명
	private String chatFileCd;		//첨부파일
	private String atchFileCd;		//프로필사진
	private String atchFileDetailSavenm; //프사이름
	
	private List<EmployeeVO> employeeVOList;
}
