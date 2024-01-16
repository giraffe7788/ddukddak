package kr.or.dduk.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class DocOfficeVO {
	private String doNo;	//진료실 번호
	private String empNo;	//진료중인 의사 사번
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date doStdt;	//사용시작일
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date doEddt;	//사용종료일
	
	private String empName; 				//의사 이름
	private String atchFileCd; 				//파일 코드
	private String atchFileDetailSaveNm; 	//파일 저장 이름
}
