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
    
    private List<AuthorityVO> authorityVOList;
    
    private MultipartFile[] uploadFile;
    
    private AtchFileVO atchFileVO;
}
