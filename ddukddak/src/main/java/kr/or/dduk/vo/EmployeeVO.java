package kr.or.dduk.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class EmployeeVO {
	private String empNo;			//사번
    private String empPh;
    private String empName;
    private String empPw;
    private String empAcntState;
    private Date empIn;
    private Date empOut;
    private String empMail;
    private String empReg;
    private int empZip;
    private String empAdd1;
    private String empAdd2;
    private String fileCd;
    private String empDeptCd;
    private String empJbpsCd;
    
    private List<AuthorityVO> authorityVOList;
}
