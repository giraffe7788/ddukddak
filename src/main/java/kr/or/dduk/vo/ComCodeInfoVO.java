package kr.or.dduk.vo;

import lombok.Data;

@Data
public class ComCodeInfoVO {
	private String comCode;
	private String comCodeNm;
	
	private ComDetailCodeInfoVO comDetailCodeInfoVO;
}
