package kr.or.dduk.vo;

import java.util.Date;

import lombok.Data;

@Data
public class IoVO {
	private String ioNo;	// IO번호
	private String admiNo;	// 입원번호
	private Date ioDt;		// 측정일시
	private int ioIntake;	// 섭취량
	private int ioDrain;	// 배출량
}
