package kr.or.dduk.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class EmployeeVO {
	private String empNo;
    private String empPh;
    private String empName;
    private String empPw;
    private String empAcntState;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date empIn;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date empOut;
    private String empMail;
    private String empReg;
    private int empZip;
    private String empAdd1;
    private String empAdd2;
    private String atchFileCd;
    private String empDeptCd;
    private String empJbpsCd;
    
    private List<AuthorityVO> authorityVOList;	// 직원의 권한리스트
    private MultipartFile[] uploadFile;			// 파일업로드시 파일정보드를 임시 저장하기 위한 변수
    private AtchFileVO atchFileVO;				// 프로필사진 저장을 위한VO

    // 조인을 위해 넣은 변수
    // DB엔 없는 컬럼명이지만 값을 가져오기 위해 선언
    private String empDeptNm;
    private String empJbpsNm;
    private String profileNm;  //PROFILE_NM
    private String atchFileDetailSavenm;
    
    private List<AdmissionChartVO> admissionChartVOList;	//입원차트 리스트
    
}
