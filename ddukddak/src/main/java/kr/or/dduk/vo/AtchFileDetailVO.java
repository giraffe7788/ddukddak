package kr.or.dduk.vo;

import lombok.Data;

@Data
public class AtchFileDetailVO{
	private String atchFileCd;				// 파일코드
	private int atchFileDetailSeq; 			// 파일순번
	private String atchFileDetailOrlng;		// 원본파일명(사용자의 처음 파일명)
	private String atchFileDetailSavenm;	// 저장파일명(웹경로)
	private String atchFileDetailExt; 		// 파일확장자명
	private String atchFileDetailPath; 		// 파일저장경로(물리경로)

}
