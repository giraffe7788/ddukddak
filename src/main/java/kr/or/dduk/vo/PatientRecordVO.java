package kr.or.dduk.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class PatientRecordVO {
	private String pareNo;		//환자기록번호
	private String paNo;        //환자번호
	private String pareCont;    //기록내용
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd hh:mm")
	private Date pareEndt;      //기록일시
	private String empNo;       //사번
	
	private EmployeeVO employeeVO;	// 사원직무, 이름, 프사 등 사원 정보를 같이 출력시키기 위한 vo
}
