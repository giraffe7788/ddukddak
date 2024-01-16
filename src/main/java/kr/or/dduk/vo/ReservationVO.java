package kr.or.dduk.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class ReservationVO {
	private String rsvtCd;		//예약번호
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date rsvtDt;		//예약날짜
	private String rsvtReason;	//예약사유
	private String empNo;		//사번
	private String paNo;		//환자번호
	private String rsvtState;	//예약상태
	private String rsvtTime;	//예약시간
	
	private String empName;		//접수화면에서 이름을 띄우려고 넣은거임
	private String paName;		//이하동일
	
	private PatientVO patientVO;
}
