package kr.or.dduk.vo;

import lombok.Data;

@Data
public class TreatmentOrderVO {
	private String tmCd;		// 치료코드
	private String clinicNo;	// 진료번호
	private String bodyCd;		// 환부코드(공통상세코드)
	private String trodCont;	// 치료기록
	private String treatmentOrderEmpNo;		// 치료사사번
	
	private TreatmentVO	treatmentVO;	 // 치료코드VO
	
	// 조인을 위해 넣은 변수
	private String treatmentOrderBodyCdNm; // 환부코드 이름
	private String treatmentOrderEmpName;  // 치료사이름
	private String treatmentOrderEmpJbpsNm;  // 치료사직급
	
	private int treatmentCount; // 해당 환부의 치료 횟수
}
