package kr.or.dduk.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class PurchaseMedicineVO {
	private String prmeNo;			//발주번호
	private Date prmeDt;			//신청일자
	private String prmeAppl;		//발주신청자
	private String prmeAtrlFst;		//1차결재자
	private String prmeAtrlSec;		//2차결재자
	private String prmeAtrlStat;	//승인상태코드
	
	List<PurchaseMedicineDetailVO> purchaseMedicineDetailVOList; //발주된 약품들 디테일
	
	private String prmeApplName; 		//신청자 이름
	private String prmeAtrlFstName; 	//1차 결재자 이름
	private String prmeAtrlSecName; 	//2차 결재자 이름
}
