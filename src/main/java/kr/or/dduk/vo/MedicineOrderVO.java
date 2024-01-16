package kr.or.dduk.vo;

import lombok.Data;

@Data
public class MedicineOrderVO {
	private String mediCd;		// 약품코드
	private String clinicNo;	// 진료번호
	private int mdodQt;			// 처방량
	private int mdodDay;		// 투여주기
	private int mdodPer;		// 투여횟수
	private int mdodDose;		// 투여량
	private String mdodPfyn;		// 처치여부
		
	private MedicineVO medicineVO; // 약품코드VO
}
