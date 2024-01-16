package kr.or.dduk.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class VitalVO {
	private String vitalNo;		// 바이탈번호
	private String admiNo;		// 입원번호
	private Date vitDt;			// 측정일시
	private int vitLowPress;	// 최저혈압
	private int vitHighPress;	// 최고혈압
	private double vitTemp;		// 체온
}
