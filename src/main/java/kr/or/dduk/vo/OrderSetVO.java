package kr.or.dduk.vo;

import lombok.Data;

@Data
public class OrderSetVO {
	private String orderSetCd;		// 오더세트 코드
	private String empNo;			// 의사사번
	private String orderSetParcd;	// 오더세트 부모코드
	private String orderSetType;	// 오더세트 타입
	private String orderSetNm;		// 오더세트 이름
	private String orderSetOrdcd;	// 오더세트 오더코드
}
