package kr.or.dduk.vo;

import lombok.Data;

@Data
public class ReceiptVO {
	private String payNo;	// 수납번호
	private int rctClinic;	// 진찰료
	private int rctAdmi;	// 입원료
	private int rctDiet;	// 식대
	private int rctMediact;	// 약품행위료
	private int rctMedi;	// 약품비
	private int rctInjeact; // 주사행위료
	private int rctInje;	// 주사료
	private int rctAnes;	// 마취료
	private int rctSurgery; // 처치 및 수술료
	private int rctTest;	// 검사료
	private int rctVideo;	// 영상진단료
	private int rctMedidev;	// 치료재료대
	private int rctRadio;	// 방사선치료로
	private int rctPhysic;	// 재활 및 물리치료료
	private int rctBlood;	// 전혈 및 혈액성분 체체료
	private int rctCt;		// CT진단료
	private int rctMri;		// MRI진단료
	private int rctPet;		// PET진단료
	private int rctUltra;	// 초음파진단료
	private int rctPros;	// 보철, 교정료
	private int rctEtc;		// 기타비용
	private int rctTotal;	// 총액
}
