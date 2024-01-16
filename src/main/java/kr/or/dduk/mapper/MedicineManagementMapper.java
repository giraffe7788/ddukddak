package kr.or.dduk.mapper;

import java.util.List;

import kr.or.dduk.vo.PurchaseMedicineDetailVO;
import kr.or.dduk.vo.PurchaseMedicineVO;

public interface MedicineManagementMapper {

	public int purchaseMedicines(PurchaseMedicineVO purchaseMedicineVO);

	public int addMedicineDetail(PurchaseMedicineDetailVO purchaseMedicineDetailVO);

	public List<PurchaseMedicineVO> getAllPurchase();

	public int firstApprove(PurchaseMedicineVO purchaseMedicineVO);

	public int denyPurchase(PurchaseMedicineVO purchaseMedicineVO);

	public int secondApprove(PurchaseMedicineVO purchaseMedicineVO);

	public List<PurchaseMedicineDetailVO> getAllPurchaseDetail(String prmeNo);

	public int modifyMedicineStock(PurchaseMedicineDetailVO purchaseMedicineDetailVO);

	public List<PurchaseMedicineDetailVO> getAllPurchasedMedicine();

}
