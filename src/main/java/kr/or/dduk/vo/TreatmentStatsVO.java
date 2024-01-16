package kr.or.dduk.vo;

import lombok.Data;

@Data
public class TreatmentStatsVO {
	 private String bodyCd; // 환부 코드
	 private int treatmentCount; // 해당 환부의 치료 횟수
}
