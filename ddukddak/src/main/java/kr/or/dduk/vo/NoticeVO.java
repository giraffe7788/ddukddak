package kr.or.dduk.vo;

import java.util.Date;

import lombok.Data;

@Data
public class NoticeVO {
	private String noticeNo;
	private String empNo;
	private String noticeTitle;
	private String noticeCont;
	private Date noticeDt;
	private int noticeViews;
	private String fileCd;

}
