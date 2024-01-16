package kr.or.dduk.nurse.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dduk.mapper.MedicineManagementMapper;
import kr.or.dduk.nurse.service.MedicineManagementService;
import kr.or.dduk.vo.MedicineVO;
import kr.or.dduk.vo.PurchaseMedicineDetailVO;
import kr.or.dduk.vo.PurchaseMedicineVO;

@Service
public class MedicineManagementServiceImpl implements MedicineManagementService {

	@Autowired
	MedicineManagementMapper medicineManagementMapper;
	
	@Override
	public int purchaseMedicines(PurchaseMedicineVO purchaseMedicineVO) {
		//약품 발주 인서트
		int result = medicineManagementMapper.purchaseMedicines(purchaseMedicineVO);
		
		//purchaseMedicineVO에서 약품 발주 상세VOList를 꺼내기
		List<PurchaseMedicineDetailVO> purchaseMedicineDetailVOList= purchaseMedicineVO.getPurchaseMedicineDetailVOList();
		
		//포문을 돌면서 디테일을 하나씩 인서트 해보자
		for(PurchaseMedicineDetailVO purchaseMedicineDetailVO : purchaseMedicineDetailVOList) {
			result += medicineManagementMapper.addMedicineDetail(purchaseMedicineDetailVO);
		}
	return result;
	}

	@Override
	public List<PurchaseMedicineVO> getAllPurchase() {
		return medicineManagementMapper.getAllPurchase();
	}

	@Override
	public int firstApprove(PurchaseMedicineVO purchaseMedicineVO) {
		return medicineManagementMapper.firstApprove(purchaseMedicineVO);
	}

	@Override
	public int secondApprove(PurchaseMedicineVO purchaseMedicineVO) {
		int result = 0;
		
		medicineManagementMapper.secondApprove(purchaseMedicineVO);
		List<PurchaseMedicineDetailVO> purchaseMedicineDetailVOList = medicineManagementMapper.getAllPurchaseDetail(purchaseMedicineVO.getPrmeNo());
		
		for(PurchaseMedicineDetailVO purchaseMedicineDetailVO : purchaseMedicineDetailVOList) {
			result += medicineManagementMapper.modifyMedicineStock(purchaseMedicineDetailVO);
		}
		
		return result;
	}
	
	@Override
	public int denyPurchase(PurchaseMedicineVO purchaseMedicineVO) {
		return medicineManagementMapper.denyPurchase(purchaseMedicineVO);
	}

	@Override
	public List<PurchaseMedicineDetailVO> getAllPurchasedMedicine() {
		return medicineManagementMapper.getAllPurchasedMedicine();
	}
}
