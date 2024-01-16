package kr.or.dduk.vo;

import lombok.Data;
/**
 * 문자 발송에서 쓰는 VO입니다
 * @author 지윤서
 *
 */
@Data
public class MmsVO {
	private String to; 		// 수신번호 
	private String from = "01023208258";	// 발신번호
	private String type = "sms";     
	private String text;	//문자내용     
}
