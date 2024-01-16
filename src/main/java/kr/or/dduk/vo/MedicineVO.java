package kr.or.dduk.vo;

import lombok.Data;

@Data
public class MedicineVO {
	private String mediCd;		// 약품코드
	private String mediType;	// 약품분류코드(공통상세코드)
	private String mediNm;		// 약품이름
	private int mediStock;		// 재고
	private String mediMaker;	// 제조사
	private String mediDetail;	// 약품상세
	private int mediCont;		// 총함량
	private int mediPrice;		// 가격
	private String insuYn;		// 보험적용여부(공통상세코드)
}
