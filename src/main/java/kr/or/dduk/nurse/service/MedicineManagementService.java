package kr.or.dduk.nurse.service;

import java.util.List;

import kr.or.dduk.vo.PurchaseMedicineDetailVO;
import kr.or.dduk.vo.PurchaseMedicineVO;

public interface MedicineManagementService {
	/**
	 * ajax를 이용한 약품 구매 신청을 처리하는 메서드
	 * @param purchaseMedicineVO 구매 신청자와 약품 정보들을 담은 VO
	 * @return 1 : 성공, 0 : 실패
	 */
	public int purchaseMedicines(PurchaseMedicineVO purchaseMedicineVO);

	/**
	 * 모든 발주를 가져오는 메서드
	 * @return 발주 VO 리스트
	 */
	public List<PurchaseMedicineVO> getAllPurchase();

	/**
	 * 첫번째 결재승인권자(수간호사)가 결재하는 메서드
	 * @param purchaseMedicineVO
	 * @return 1 : 성공, 0 : 실패
	 */
	public int firstApprove(PurchaseMedicineVO purchaseMedicineVO);
	
	/**
	 * 두번째 결재승인권자(원무과)가 결재하는 메서드
	 * @param purchaseMedicineVO
	 * @return 1 : 성공, 0 : 실패
	 */
	public int secondApprove(PurchaseMedicineVO purchaseMedicineVO);

	/**
	 * 발주 반려하는 메서드
	 * @param purchaseMedicineVO
	 * @return 1 : 성공, 0 : 실패
	 */
	public int denyPurchase(PurchaseMedicineVO purchaseMedicineVO);

	public List<PurchaseMedicineDetailVO> getAllPurchasedMedicine();

}
