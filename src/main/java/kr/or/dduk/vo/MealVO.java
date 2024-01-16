package kr.or.dduk.vo;

import lombok.Data;

@Data
public class MealVO {
	private String mealCd;		// 식단코드
	private String mealName;	// 식단명
	private int mealKcal;		// 열량
	private int mealPrice;		// 식대
}
