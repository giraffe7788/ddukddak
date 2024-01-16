package kr.or.dduk.vo;

import java.util.Date;
import java.util.List;

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
	private String atchFileCd; //첨부파일
	private String atchFileNm; //첨부파일
	private String saveNm; //첨부파일
	private int RM; //로우넘
	
	//알림
	private String[] notification; //체크박스
	private MultipartFile[] uploadFile;	// 파일을 첨부하기 위한 변수
	
	private List<AtchFileDetailVO> AtchFileDetailVOList; //파일 가져오기,,
	
}
