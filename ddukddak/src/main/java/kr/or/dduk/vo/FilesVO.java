package kr.or.dduk.vo;

import lombok.Data;

@Data
public class FilesVO {
	private String fileCd;		// 파일코드
	private int fileSeq; 		// 파일순번
	private String fileOrlng;	// 원본파일명(사용자의 처음 파일명)
	private String fileSavenm;	// 저장파일명(웹경로)
	private String fileExt; 	// 파일확장자명
	private String filePath; 	// 파일저장경로(물리경로)

}
