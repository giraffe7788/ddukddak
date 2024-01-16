package kr.or.dduk.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProofApplicationVO {
	private String prapNo;
	private String clinicNo;
	private String prdcCd;
	private String prapCont;
	private String proofFileCd;
	private String prapState;
	
	private MultipartFile[] uploadFile;			// 파일업로드시 파일정보드를 임시 저장하기 위한 변수
    private AtchFileVO atchFileVO;				// pdf 저장을 위한VO
}
