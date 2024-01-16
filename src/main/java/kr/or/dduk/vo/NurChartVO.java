package kr.or.dduk.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class NurChartVO {
	private String nurNo;	// 간호기록번호
	private String nurChartEmpNo;	// 간호사사번
	private String nurCont; // 간호일지내용
	private Date nurEndt;	// 작성일, 일부러 format 안맞춤(다양한 포맷으로 쓸꺼임)
	private String nurType;	// 간호일지구분
	private String admiCd;	// 입원코드
	
	private String nurChartEmpName; // 간호사이름
	private String nurChartProfileSavenm;	// 간호사 프사 저장이름
	private String nurChartProfileOrlng;	// 간호사 프사 원본이름
}
