package kr.or.dduk.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class InjuryDiagnosisVO {
	
	private String ijCd;		// 상병코드
	private String clinicNo;	// 진단번호
	private String indiType;	// 상병분류(공통상세코드)
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date indiDt;		// 발병일
	private String injuryBodyCd;		// 환부코드(공통상세코드)
	
	private InjuryVO injuryVO;	// 상병코드VO
	
	// 조인을 위해 넣은 변수
	private String injuryBodyCdNm; // 환부코드 이름
	private String indiTypeNm; // 상병코드 이름
}
