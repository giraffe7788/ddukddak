package kr.or.dduk.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class PayRecordVO {
	private String prNo;	  // 수납기록번호
	private String payNo;	  // 수납번호
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date prPaydt;	  // 수납일시
	private String prPaytype; // 수납방식
	private int prPaymn;	  // 수납금액
}
