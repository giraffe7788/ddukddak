package kr.or.dduk.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PatientRecordVO {
	private String pareNo;		//환자기록번호
	private String paNo;        //환자번호
	private String pareCont;    //기록내용
	private Date pareEndt;      //기록일시
	private String empNo;       //사번ㅇㅇㅇ
}
