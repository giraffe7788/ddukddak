package kr.or.dduk.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class DocScheduleVO {
	private String dsNo;
	private String empNo;
	private String dsStrDate;
	private String dsEndDate;
	private String dsCont;
	private String dsCate;
	private String dsAd;
}
