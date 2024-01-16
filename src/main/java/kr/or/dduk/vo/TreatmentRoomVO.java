package kr.or.dduk.vo;

import lombok.Data;

@Data
public class TreatmentRoomVO {
	private String tmrmBedno;   //치료실병상번호
	private String tmrmRoomno;  //치료실병실번호
	private String empNo;		//치료자
	private String paNo;		//피치료자
	private String tmCd;		//치료코드
	private String paName;		//치료코드
}

