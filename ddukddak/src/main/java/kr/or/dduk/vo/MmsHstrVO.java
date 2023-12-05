package kr.or.dduk.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MmsHstrVO {
	private String mmsNo;		//문자발송코드
	private String mmsFormCd;   //양식코드
	private String mmsSent;     //발신자
	private String mmsRecv;     //수신자
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date mmsDate;       //발송일시
	private String mmsCont;		//발송내용
}
