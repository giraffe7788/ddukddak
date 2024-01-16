package kr.or.dduk.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class AdmissionChartVO {
	private String admiNo;	//입원번호
	private String adrmRoomno;	//호수
	private String adrmBedno;	//병상번호
	private String paNo;		//환자번호
	private String empNo;		//사번(담당의)
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date admiIndt;	//입원날짜
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date admiExpOutdt; //퇴원예상날짜
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date admiOutdt;	//실제퇴원일
	private String admiFile;	//입원동의서
	private String admiReason;	//입원사유
	
	List<ClinicChartVO> clinicChartVOList;	// 입원차트 리스트
	List<NurChartVO> nurChartVOList;		// 간호차트 리스트
	
	private MultipartFile[] uploadFile;			// 파일업로드시 파일정보드를 임시 저장하기 위한 변수
    private AtchFileVO atchFileVO;				// 프로필사진 저장을 위한VO
    private AtchFileDetailVO atchFileDetailVO;				// 프로필사진 저장을 위한VO
    
	// 조인을 위해 넣은 변수
	private String admiEmpName;				// 담당의 이름
}
