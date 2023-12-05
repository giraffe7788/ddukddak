package kr.or.dduk.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeVO {
	private String noticeNo; //공지사항번호
	private String empNo; //사번
	private String noticeTitle; //제목
	private String noticeCont; //내용
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date noticeDt; //작성일시
	private int noticeViews; //조회수
	private String atchFileCd;; //첨부파일
	private String RW; //로우넘
	
	//알림
	private String[] notification; //체크박스
	
	private MultipartFile file;
	
}
