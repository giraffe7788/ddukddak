package kr.or.dduk.vo;

import java.util.List;

import lombok.Data;

@Data
public class ChatMemberVO {
	private int chatRmListNo; //채팅멤버번호
	private String chatRmNo;	// 채팅방번호
	private String empNo;		// 사번
	private String empName;		// 직원명
	private String empDeptCd;		// 직무코드
	private String atchFileCd;		// 프로필사진
	private String atchFileDetailSavenm; //프사 이름
	
	private List<ChatVO> chatVOList;
}
