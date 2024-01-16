package kr.or.dduk.ams.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.dduk.clinic.service.OrderSetService;
import kr.or.dduk.nurse.service.MedicineManagementService;
import kr.or.dduk.vo.MedicineVO;
import kr.or.dduk.vo.PurchaseMedicineVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/ams")
public class ApprovalContoroller {

	@Autowired
	MedicineManagementService medicineManagementService;
	
	@Autowired
	OrderSetService orderSetService;
	/**
	 * 결재 화면
	 * @return approval.jsp
	 */
	@GetMapping("/approval")
	public String approval(Model model) {
		List<MedicineVO> medicineVOList = orderSetService.getMedicineVOList();
		List<PurchaseMedicineVO> purchaseMedicineVOList = medicineManagementService.getAllPurchase();
		
		model.addAttribute(medicineVOList);
		model.addAttribute(purchaseMedicineVOList);
		return "ams/approval";
	}
	
	/**
	 * ajax를 이용한 약품 구매 신청 2차 승인하는 메서드
	 * @param purchaseMedicineVO 구매 신청자와 약품 정보들을 담은 VO
	 * @return 1 : 성공, 0 : 실패
	 */
	@ResponseBody
	@PostMapping("/secondApprove")
	public int secondApprove(@RequestBody PurchaseMedicineVO purchaseMedicineVO) {
		int result = 0;
		result = medicineManagementService.secondApprove(purchaseMedicineVO);
		return result;
	}
}
