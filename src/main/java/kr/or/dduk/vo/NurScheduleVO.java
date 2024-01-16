package kr.or.dduk.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class NurScheduleVO {
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date nurscDt;
	private String empNo;
	private String nurscType;
	private Date nurscEndt;
	private Date nurscUpdt;
	private String nurscWt;
	private String nurscNo;
	
	private String empName;
}
