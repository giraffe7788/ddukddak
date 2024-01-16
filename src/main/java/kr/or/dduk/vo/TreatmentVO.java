package kr.or.dduk.vo;

import lombok.Data;

@Data
public class TreatmentVO {
	private String tmCd;	// 치료코드
	private String tmNm;	// 치료명
	private int tmPrice;	// 치료가격
	private String insuYn;	// 보험적용여부(공통상세코드)
	private int RM; //로우넘
}
