package kr.or.dduk.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PurchaseMedicineDetailVO {
	private String prmeNo;	//발주번호
	private String mediCd;	//약품코드
	private int prmeQt;		//갯수
	private Date prmeStdt;	//입고일자
	
	private String mediNm; //약품이름
	private String prmeAtrlStat;	//승인상태코드
	private String prmeDt;
}
