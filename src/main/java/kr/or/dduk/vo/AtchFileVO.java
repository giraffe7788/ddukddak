package kr.or.dduk.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class AtchFileVO{
	private String atchFileCd;		// 첨부파일일련번호
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date atchFileEndt;		// 등록일자
	
	// 첨부파일  : 첨부파일상세 = 1 : N
	private List<AtchFileDetailVO> atchFileDetailVOList;
}
