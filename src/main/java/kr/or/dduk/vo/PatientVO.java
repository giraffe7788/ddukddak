package kr.or.dduk.vo;

import java.util.List;

import lombok.Data;

@Data
public class PatientVO {
	private String paNo;		// 환자번호
	private String paReg;       // 주민번호
	private String paName;      // 이름
	private String paSex;       // 성별
	private String paPh;        // 전화번호
	private String paAdd1;      // 기본주소
	private String paAdd2;      // 상세주소
	private int pzZip;          // 우편번호
	private String paNoknm;     // 보호자이름
	private String paNokph;     // 보호자전화번호
	private String paBldType;   // 혈액형
	private String paInsrYn;    // 보험여부
	private String paAdmDt;     // 입원여부
	private int paHeight;       // 키
	private int paWeight;       // 몸무게
	
	private List<PatientRecordVO> PatientRecordVOList;	// 환자 기록 리스트
	private List<ClinicChartVO>   clinicChartVOList;	// 환자의 진료정보 리스트
	private List<AdmissionChartVO> admissionChartVOList;// 입원차트 리스트
	private List<AdmissionRoomVO> admissionRoomVOList;	// 입원실 리스트
	private List<PayVO> payVOList;						// 수납 리스트
	
	// DB엔 없는 컬럼명이지만 값을 가져오기 위해 선언
    private String nowEmpNo;
}
