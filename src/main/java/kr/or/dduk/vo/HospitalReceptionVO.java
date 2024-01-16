package kr.or.dduk.vo;

import java.util.Date;

import lombok.Data;

@Data
public class HospitalReceptionVO {
	
	// 접수VO
	private String hsrpNo;		// 접수번호
	private Date hsrpDt; 		// 접수일시
	private String hsrpReason;	// 내원사유
	private String paNo;		// 환자번호
	private String empNo;		// 담당의
	private String hsrpType;	// 접수분류
	private String hsrpState;	// 접수상태
	
	// 조인을 위해 넣은 변수
	private String paName;		// 환자이름
	private String paReg; 		// 주민번호
	private String clinicState; // 진료상태
}
