package kr.or.dduk.vo;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	private String ntNo;
	private String ntTitle;
	private String ntCont;
	private Date ntEndt;
	private String ntState;
	private String empNo;

}
