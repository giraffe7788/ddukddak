package kr.or.dduk.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MmsHstrVO {
	private String mmsCd;		//문자발송코드
	private String mmsFormCd;   //양식코드
	private String mmsSent;     //발신자
	private String mmsRecv;     //수신자
	private Date mmsDate;       //발송일시
}
