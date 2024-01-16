package kr.or.dduk.nurse.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.dduk.nurse.service.WardService;
import kr.or.dduk.vo.AdmissionChartVO;
import kr.or.dduk.vo.ClinicChartVO;
import kr.or.dduk.vo.DietVO;
import kr.or.dduk.vo.IoVO;
import kr.or.dduk.vo.MealVO;
import kr.or.dduk.vo.MedicineOrderVO;
import kr.or.dduk.vo.NurChartVO;
import kr.or.dduk.vo.VitalVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 병동관리 컨트롤러
 * @author dpfvl
 */
@Slf4j
@Controller
@RequestMapping("/nurse")
public class WardController {

	@Autowired
	WardService wardService;
	
	/**
	 * 병동관리 페이지 이동
	 */
	@RequestMapping("/ward")
	public String home() {
		
		return "nurse/ward";
	}
	
	
	/**
	 * 병동관리에서 병상 누를 때 보여줄 간단한 입원정보와 간호차트를 가져오는 메서드
	 * @param admiNo 입원번호
	 * @return AdmissionChartVO 입원VO
	 */
	@ResponseBody
	@PostMapping("/getNurseChartList")
	public AdmissionChartVO getNurseChartList(String admiNo) {
		return this.wardService.getNurseChartList(admiNo);
	}
	
	
	/**
	 * 병동관리에서 간호차트 날짜 클릭시 간호차트의 detail 출력
	 * @param nurNo 간호차트번호
	 * @return NurChartVO 간호차트VO
	 */
	@ResponseBody
	@PostMapping("/getNurseChartDetail")
	public NurChartVO getNurseChartDetail(String nurNo) {
		return this.wardService.getNurseChartDetail(nurNo);
	}
	
	
	/**
	 * 간호차트/인수인계 insert
	 * @param insert시킬 데이터
	 * @return 결과
	 */
	@ResponseBody
	@PostMapping("/createNurseChart")
	public Map<String, Object> createNurseChart(@RequestBody NurChartVO nurChartVO) {
		return this.wardService.createNurseChart(nurChartVO);
	}


	/**
	 * 인수인계 리스트 뽑아오기
	 * @param admiNo 입원번호
	 * @return NurChartVOList 간호차트 리스트(인수인계만)
	 */
	@ResponseBody
	@PostMapping("/getHandOverList")
	public List<NurChartVO> getHandOverList(String admiNo){
		return this.wardService.getHandOverList(admiNo) == null ? new ArrayList<NurChartVO>() : this.wardService.getHandOverList(admiNo);
	}
	
	
	/**
	 * DB에서 처치내역 리스트를 가져온다
	 * @param admiNo 입원번호
	 * @return clinicChartVOList 진료차트 리스트
	 */
	@ResponseBody
	@PostMapping("/getMedicineOrderList")
	public List<ClinicChartVO> getMedicineOrderList(String admiNo){
		return this.wardService.getMedicineOrderList(admiNo);
	}
	
	
	/**
	 * DB에서 처치내역 디테일을 가져온다
	 * @param clinicNo 진료번호
	 * @return clinicChartVO 진료차트VO
	 */
	@ResponseBody
	@PostMapping("/getMedicineOrderDetail")
	public ClinicChartVO getMedicineOrderDetail(String clinicNo){
		return this.wardService.getMedicineOrderDetail(clinicNo);
	}
	
	
	/**
	 * 처방 오더의 상태를 처방대기에서 처방완료로 바꾸는 메소드
	 * @param MedicineOrderVO 바꿀 처방오더
	 * @return result 결과
	 */
	@ResponseBody
	@PostMapping("/updateMedicineOrderState")
	public int updateMedicineOrderState(@RequestBody MedicineOrderVO medicineOrderVO) {
		return this.wardService.updateMedicineOrderState(medicineOrderVO);
	}
	
	
	/**
	 * 특정 입원의 식이 리스트를 가져옴
	 * @param admiNo 입원번호
	 * @return 식이List
	 */
	@ResponseBody
	@PostMapping("/getDietList")
	public List<DietVO> getDietList(String admiNo){
		return this.wardService.getDietList(admiNo);
	}
	
	
	/**
	 * 식이 기록을 DB에 넣는다
	 * @param DietVO 식이VO
	 * @return result 실행결과
	 */
	@ResponseBody
	@PostMapping("/insertDiet")
	public int insertDiet(@RequestBody DietVO dietVO) {
		return this.wardService.insertDiet(dietVO);
	}
	
	
	/**
	 * 식단의 리스트를 가져온다
	 * @return MealVOList 식단List
	 */
	@ResponseBody
	@PostMapping("/getMealList")
	public List<MealVO> getMealList(){
		return this.wardService.getMealList();
	}
	
	
	/**
	 * 식단 삭제 메소드
	 * @param mealCd 식단번호
	 * @return result 성공여부
	 */
	@ResponseBody
	@PostMapping("/deleteMeal")
	public int deleteMeal(String mealCd) {
		return this.wardService.deleteMeal(mealCd);
	}
	
	
	/**
	 * 식단 추가 메소드
	 * @param mealVO 식단VO
	 * @return result 성공여부
	 */
	@ResponseBody
	@PostMapping("/insertMeal")
	public int insertMeal(@RequestBody MealVO mealVO) {
		return this.wardService.insertMeal(mealVO);
	}
	
	
	/**
	 * 특정 입원의 혈압 리스트를 가져옴
	 * @param admiNo 입원번호
	 * @return VitalVOList 혈압List
	 */
	@ResponseBody
	@PostMapping("/getBloodList")
	public List<VitalVO> getBloodList(String admiNo){
		return this.wardService.getBloodList(admiNo);
	}
	
	
	/**
	 * 혈압 기록을 DB에 넣는다
	 * @param VitalVO 혈압VO
	 * @return result 실행결과
	 */
	@ResponseBody
	@PostMapping("/insertBlood")
	public int insertBlood(@RequestBody VitalVO vitalVO) {
		return this.wardService.insertBlood(vitalVO);
	}
	
	
	/**
	 * 특정 입원의 체온 리스트를 가져옴
	 * @param admiNo 입원번호
	 * @return VitalVOList 체온List
	 */
	@ResponseBody
	@PostMapping("/getTempList")
	public List<VitalVO> getTempList(String admiNo){
		return this.wardService.getTempList(admiNo);
	}
	
	
	/**
	 * 체온 기록을 DB에 넣는다
	 * @param VitalVO 체온VO
	 * @return result 실행결과
	 */
	@ResponseBody
	@PostMapping("/insertTemp")
	public int insertTemp(@RequestBody VitalVO vitalVO) {
		return this.wardService.insertTemp(vitalVO);
	}
	
	
	/**
	 * 특정 입원의 IO 리스트를 가져옴
	 * @param admiNo 입원번호
	 * @return IoVOList IOList
	 */
	@ResponseBody
	@PostMapping("/getIoList")
	public List<IoVO> getIoList(String admiNo){
		return this.wardService.getIoList(admiNo);
	}
	
	
	/**
	 * IO 기록을 DB에 넣는다
	 * @param IoVO IOVO
	 * @return result 실행결과
	 */
	@ResponseBody
	@PostMapping("/insertIo")
	public int insertIo(@RequestBody IoVO ioVO) {
		return this.wardService.insertIo(ioVO);
	}
}
