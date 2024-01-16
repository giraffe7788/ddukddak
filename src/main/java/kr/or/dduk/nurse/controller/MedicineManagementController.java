package kr.or.dduk.nurse.controller;

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
import kr.or.dduk.employee.service.EmployeeService;
import kr.or.dduk.nurse.service.MedicineManagementService;
import kr.or.dduk.vo.EmployeeVO;
import kr.or.dduk.vo.MedicineVO;
import kr.or.dduk.vo.PurchaseMedicineVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/nurse")
@Controller
public class MedicineManagementController {
	//약품정보 가져오기 위한 서비스
	@Autowired
	OrderSetService orderSetService;
	
	//결재내역 가져오기 위한 서비스
	@Autowired
	MedicineManagementService medicineManagementService;
	
	//결재권자들을 가져오기 위한 서비스
	@Autowired
	EmployeeService employeeService;
	
	/**
	 * 약품관리 홈 화면
	 * @return medicineManagement.jsp
	 */
	@GetMapping("/medicineManagement")
	public String home(Model model) {
		
		//약품 리스트
		List<MedicineVO> medicineVOList = this.orderSetService.getMedicineVOList();
		//결재 리스트
		List<PurchaseMedicineVO> purchaseMedicineVOList = this.medicineManagementService.getAllPurchase();
		//첫번째 결재권자 리스트
		List<EmployeeVO> firstApprovalHolderList = this.employeeService.getFirstApprovalHolder();
		//최종 결재권자 리스트
		List<EmployeeVO> secondApprovalHolderVOList = this.employeeService.getSecondApprovalHolder();
		
		log.info("firstApprovalHolderList = >" + firstApprovalHolderList);
		log.info("secondApprovalHolderList = >" + secondApprovalHolderVOList);
		
		//medicineVO, purchaseMedicineVO는 존재하는 VO여서 name을 안정해고 model로 보낼 수 있음
		model.addAttribute(medicineVOList);
		model.addAttribute(purchaseMedicineVOList);
		model.addAttribute("firstApprovalHolderList",firstApprovalHolderList);
		model.addAttribute("secondApprovalHolderVOList",secondApprovalHolderVOList);
		
		return "nurse/medicineManagement";
	}
	
	/**
	 * ajax를 이용한 약품 구매 신청을 처리하는 메서드
	 * @param purchaseMedicineVO 구매 신청자와 약품 정보들을 담은 VO
	 * @return 1 : 성공, 0 : 실패
	 */
	@ResponseBody
	@PostMapping("/purchaseMedicines")
	public int purchaseMedicines(@RequestBody PurchaseMedicineVO purchaseMedicineVO) {
		int result = medicineManagementService.purchaseMedicines(purchaseMedicineVO);
		return result;
	}
	
	/**
	 * ajax를 이용한 약품 구매 신청 1차 승인하는 메서드
	 * @param purchaseMedicineVO 구매 신청자와 약품 정보들을 담은 VO
	 * @return 1 : 성공, 0 : 실패
	 */
	@ResponseBody
	@PostMapping("/firstApprove")
	public int firstApprove(@RequestBody PurchaseMedicineVO purchaseMedicineVO) {
		int result = 0;
		result = medicineManagementService.firstApprove(purchaseMedicineVO);
		return result;
	}
	
	/**
	 * ajax를 이용한 약품 구매 신청을 반려하는 메서드
	 * @param purchaseMedicineVO 구매 신청자와 약품 정보들을 담은 VO
	 * @return 1 : 성공, 0 : 실패
	 */
	@ResponseBody
	@PostMapping("/denyPurchase")
	public int denyPurchase(@RequestBody PurchaseMedicineVO purchaseMedicineVO) {
		int result = 0;
		result = medicineManagementService.denyPurchase(purchaseMedicineVO);
		return result;
	}
}
