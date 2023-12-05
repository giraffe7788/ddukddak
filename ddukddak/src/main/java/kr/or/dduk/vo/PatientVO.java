package kr.or.dduk.vo;

import java.util.List;

import lombok.Data;

@Data

public class PatientVO {
	private String paNo;		//환자번호
	private String paReg;       //주민번호
	private String paName;      //이름
	private String paSex;       //성별
	private String paPh;        //전화번호
	private String paAdd1;      //기본주소
	private String paAdd2;      //상세주소
	private int pzZip;          //우편번호
	private String paNoknm;     //보호자이름
	private String paNokph;     //보호자전화번호
	private String paBldType;   //키
	private String paInsrYn;    //몸무게
	private String paAdmDt;     //혈액형
	private int paHeight;       //보험여부
	private int paWeight;       //입원여부
	
	List<PatientRecordVO> PatientRecordVOList;	//환자 기록 리스트
}
