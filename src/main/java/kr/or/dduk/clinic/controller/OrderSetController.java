package kr.or.dduk.clinic.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.dduk.clinic.service.OrderSetService;
import kr.or.dduk.vo.InjuryVO;
import kr.or.dduk.vo.MedicineVO;
import kr.or.dduk.vo.OrderSetVO;
import kr.or.dduk.vo.TestVO;
import kr.or.dduk.vo.TreatmentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/orderSet")
public class OrderSetController {

	@Autowired
	OrderSetService orderSetService;
	
	
	/**
	 * 로그인한 의사의 사번으로 DB에서 오더세트VO 리스트를 가져와서 오더세트에 출력
	 */
	@ResponseBody
	@PostMapping("/getOrderSetList")
	public List<OrderSetVO> getOrderSetList(){
		List<OrderSetVO> orderSetVOList = this.orderSetService.getOrderSetList();
		return orderSetVOList;
	}
	
	
	/**
	 * 오더세트 추가시키는 함수
	 */
	@ResponseBody
	@PostMapping("/createOrderSet")
	public OrderSetVO createOrderSet(@RequestBody OrderSetVO orderSetVO) {
		int result = this.orderSetService.createOrderSet(orderSetVO);
		
		if(result > 0) {
			return orderSetVO;
		} else {
			return null;
		}
	}
	
	
	/**
	 * 오더세트 삭제시키는 함수
	 */
	@ResponseBody
	@PostMapping("/deleteOrderSet")
	public int deleteOrderSet(@RequestBody List<OrderSetVO> orderSetVOList) {
		return this.orderSetService.deleteOrderSet(orderSetVOList);
	}
	
	
	/**
	 * 오더세트 추가 모달 에서 오더카테고리 선택에 따른 검색 풀 갱신
	 * InjuryVO의 List 리턴
	 */
	@ResponseBody
	@PostMapping("/getInjuryVOList")
	public List<InjuryVO> getInjuryVOList(){
		List<InjuryVO> injuryVOList = this.orderSetService.getInjuryVOList();
		return injuryVOList;
	}
	
	
	/**
	 * 오더세트 추가 모달 에서 오더카테고리 선택에 따른 검색 풀 갱신
	 * TestVO의 List 리턴
	 */
	@ResponseBody
	@PostMapping("/getTestVOList")
	public List<TestVO> getTestVOList(){
		List<TestVO> testVOList = this.orderSetService.getTestVOList();
		return testVOList;
	}
	
	
	/**
	 * 오더세트 추가 모달 에서 오더카테고리 선택에 따른 검색 풀 갱신
	 * MedicineVO의 List 리턴
	 */
	@ResponseBody
	@PostMapping("/getMedicineVOList")
	public List<MedicineVO> getMedicineVOList(){
		List<MedicineVO> medicineVOList = this.orderSetService.getMedicineVOList();
		return medicineVOList;
	}
	
	
	/**
	 * 오더세트 추가 모달 에서 오더카테고리 선택에 따른 검색 풀 갱신
	 * TreatmentVO의 List 리턴
	 */
	@ResponseBody
	@PostMapping("/getTreatmentVOList")
	public List<TreatmentVO> getTreatmentVOList(){
		List<TreatmentVO> treatmentVOList = this.orderSetService.getTreatmentVOList();
		return treatmentVOList;
	}
	
	
	/**
	 * 오더세트에서 오더선택 후 본문에 반영할 때 자세한 정보를 가져오는 메소드
	 * InjuryVO를 리턴
	 */
	@ResponseBody
	@PostMapping("/getInjuryVODetail")
	public InjuryVO getInjuryVODetail(String orderCode){
		InjuryVO injuryVO = this.orderSetService.getInjuryVODetail(orderCode);
		return injuryVO;
	}
	
	
	/**
	 * 오더세트에서 오더선택 후 본문에 반영할 때 자세한 정보를 가져오는 메소드
	 * TestVO를 리턴
	 */
	@ResponseBody
	@PostMapping("/getTestVODetail")
	public TestVO getTestVODetail(String orderCode){
		TestVO testVO = this.orderSetService.getTestVODetail(orderCode);
		return testVO;
	}
	
	
	/**
	 * 오더세트에서 오더선택 후 본문에 반영할 때 자세한 정보를 가져오는 메소드
	 * MedicineVO를 리턴
	 */
	@ResponseBody
	@PostMapping("/getMedicineVODetail")
	public MedicineVO getMedicineVODetail(String orderCode){
		MedicineVO medicineVO = this.orderSetService.getMedicineVODetail(orderCode);
		return medicineVO;
	}
	
	
	/**
	 * 오더세트에서 오더선택 후 본문에 반영할 때 자세한 정보를 가져오는 메소드
	 * TreatmentVO를 리턴
	 */
	@ResponseBody
	@PostMapping("/getTreatmentVODetail")
	public TreatmentVO getTreatmentVODetail(String orderCode){
		TreatmentVO treatmentVO = this.orderSetService.getTreatmentVODetail(orderCode);
		return treatmentVO;
	}
}
