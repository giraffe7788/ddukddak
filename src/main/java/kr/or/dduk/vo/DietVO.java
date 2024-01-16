package kr.or.dduk.vo;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class DietVO {
	private String dietNo;	// 식이번호
	private String admiNo;	// 입원번호
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm")
	private Date dietTime;	// 섭취시간
	private String mealCd;	// 식단코드
	private int dietQty;	// 수량
	
	private MealVO mealVO; 	// 식단VO
}
