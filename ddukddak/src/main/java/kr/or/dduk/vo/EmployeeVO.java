package kr.or.dduk.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class EmployeeVO {
	private String empNo;			//사번   
    private String empPh;           //전화번호 
    private String empName;         //성명 
    private String empPw;           //비밀번호 
    private String empAcntState;    //비밀번호 오류 횟수 
    private Date empIn;             //입사일 
    private Date empOut;            //퇴사일 
    private String empMail;         //이메일 
    private String empReg;          //등록일자
    private int empZip;             //우편번호
    private String empAdd1;         //주소
    private String empAdd2;         //상세주소
    private String fileCd;          //파일코드
    private String empDeptCd;       //직무코드
    private String empJbpsCd;       //직책코드
    
    private List<AuthorityVO> authorityVOList; //권한 VO 리스트
}
