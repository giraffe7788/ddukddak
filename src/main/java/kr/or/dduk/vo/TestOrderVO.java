package kr.or.dduk.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class TestOrderVO {
	private String testCd;		// 검사코드
	private String clinicNo;	// 진료번호
	private String teodRst;		// 검사결과
	private String atchFileCd;	// 영상검사결과(첨부파일코드)
	private String testOrderBodyCd;		// 환부코드(공통상세코드)
	private String testOrderEmpNo;		// 검사자(간호사사번)
	
	private TestVO testVO;		// 검사코드VO
	
	private AtchFileVO atchFileVO; 			// 사진 검사결과의 VO가 들어옴
	private MultipartFile[] uploadFile;		// 파일업로드시 파일정보드를 임시 저장하기 위한 변수
	
	// 조인을 위해 넣은 변수
	private String testOrderBodyCdNm; // 환부코드 이름
	private String testOrderEmpName;  // 검사자이름
}
