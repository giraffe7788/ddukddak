package kr.or.dduk.vo;

import java.util.List;

import lombok.Data;

@Data
public class AdmissionRoomVO {
	private String adrmRoomno;	//호수
	private String adrmBedno;	//병상번호
	private int adrmPrice;	//가격
	private String paNo;	//환자번호
	private String paName;
	private String empNo;
	private String empName;
	
	List<AdmissionChartVO> admissionChartVOList;	// 입원차트 리스트
	//List<ClinicChartVO> clinicChartVOList;	// 입원차트 리스트
}
