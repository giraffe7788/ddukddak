package kr.or.dduk.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class PayVO {
	private String payNo;		// 수납번호
	private String paNo;		// 환자번호
	private String clinicNo;	// 진료번호
	private String admiNo;		// 입원번호
	private String payState;	// 수납상태
	private int payTotalmn;		// 수납총액
	private Date payStdt;		// 수납시작일
	
	private List<PayRecordVO> payRecordVOList; // 수납기록
	private ReceiptVO receiptVO;	// 영수증
	private PatientVO patientVO;	// 환자정보
}
