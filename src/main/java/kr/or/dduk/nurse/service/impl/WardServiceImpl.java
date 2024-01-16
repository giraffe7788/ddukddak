package kr.or.dduk.nurse.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.dduk.mapper.WardMapper;
import kr.or.dduk.nurse.service.WardService;
import kr.or.dduk.util.SessionInfo;
import kr.or.dduk.vo.AdmissionChartVO;
import kr.or.dduk.vo.ClinicChartVO;
import kr.or.dduk.vo.DietVO;
import kr.or.dduk.vo.IoVO;
import kr.or.dduk.vo.MealVO;
import kr.or.dduk.vo.MedicineOrderVO;
import kr.or.dduk.vo.NurChartVO;
import kr.or.dduk.vo.VitalVO;

@Service
public class WardServiceImpl implements WardService{
	
	@Autowired
	WardMapper wardMapper;
	
	@Autowired
	SessionInfo sessionInfo;
	
	/**
	 * 병동관리에서 병상 누를 때 보여줄 간단한 입원정보와 간호차트를 가져오는 메서드
	 * @param admiNo 입원번호
	 * @return AdmissionChartVO 입원VO
	 */
	@Override
	public AdmissionChartVO getNurseChartList(String admiNo) {
		return this.wardMapper.getNurseChartList(admiNo);
	}


	/**
	 * 병동관리에서 간호차트 날짜 클릭시 간호차트의 detail 출력
	 * @param nurNo 간호차트번호
	 * @return NurChartVO 간호차트VO
	 */
	@Override
	public NurChartVO getNurseChartDetail(String nurNo) {
		return this.wardMapper.getNurseChartDetail(nurNo);
	}
	
	
	/**
	 * 간호차트/인수인계 insert
	 * @param insert시킬 데이터
	 * @return 결과
	 */
	@Override
	public Map<String, Object> createNurseChart(NurChartVO nurChartVO) {
		Map<String, Object> map = new HashMap<>();
		// 현재 접속중인 사번 불러와서 작성자 사번에 넣어주기
		String empNo = sessionInfo.getEmpNo();
		nurChartVO.setNurChartEmpNo(empNo);
		int result = this.wardMapper.createNurseChart(nurChartVO);
		// 결과에 성공여부와 간호차트번호를 넣어준다
		map.put("nurNo", nurChartVO.getNurNo());
		map.put("result", result);
		return map;
	}
	
	
	/**
	 * 인수인계 리스트 뽑아오기
	 * @param admiNo 입원번호
	 * @return NurChartVOList 간호차트 리스트(인수인계만)
	 */
	@Override
	public List<NurChartVO> getHandOverList(String admiNo){
		return this.wardMapper.getHandOverList(admiNo);
	}
	
	
	/**
	 * DB에서 처치내역 리스트를 가져온다
	 * @param admiNo 입원번호
	 * @return clinicChartVOList 진료차트 리스트
	 */
	@Override
	public List<ClinicChartVO> getMedicineOrderList(String admiNo){
		return this.wardMapper.getMedicineOrderList(admiNo);
	}
	
	
	/**
	 * DB에서 처치내역 디테일을 가져온다
	 * @param clinicNo 진료번호
	 * @return clinicChartVO 진료차트VO
	 */
	@Override
	public ClinicChartVO getMedicineOrderDetail(String clinicNo){
		return this.wardMapper.getMedicineOrderDetail(clinicNo);
	}
	
	
	/**
	 * 처방 오더의 상태를 처방대기에서 처방완료로 바꾸는 메소드
	 * @param MedicineOrderVO 바꿀 처방오더
	 * @return result 결과
	 */
	@Override
	public int updateMedicineOrderState(MedicineOrderVO medicineOrderVO) {
		return this.wardMapper.updateMedicineOrderState(medicineOrderVO);
	}
	
	
	/**
	 * 특정 입원의 식이 리스트를 가져옴
	 * @param admiNo 입원번호
	 * @return 식이List
	 */
	@Override
	public List<DietVO> getDietList(String admiNo){
		return this.wardMapper.getDietList(admiNo);
	}
	
	
	/**
	 * 식이 기록을 DB에 넣는다
	 * @param DietVO 식이VO
	 * @return result 실행결과
	 */
	@Override
	public int insertDiet(DietVO dietVO) {
		return this.wardMapper.insertDiet(dietVO);
	}
	
	
	/**
	 * 식단의 리스트를 가져온다
	 * @return MealVOList 식단List
	 */
	@Override
	public List<MealVO> getMealList(){
		return this.wardMapper.getMealList();
	}
	
	
	/**
	 * 식단 삭제 메소드
	 * @param mealCd 식단번호
	 * @return result 성공여부
	 */
	@Override
	public int deleteMeal(String mealCd) {
		return this.wardMapper.deleteMeal(mealCd);
	}
	
	
	/**
	 * 식단 추가 메소드
	 * @param mealVO 식단VO
	 * @return result 성공여부
	 */
	@Override
	public int insertMeal(MealVO mealVO) {
		return this.wardMapper.insertMeal(mealVO);
	}
	
	
	/**
	 * 특정 입원의 혈압 리스트를 가져옴
	 * @param admiNo 입원번호
	 * @return VitalVOList 혈압List
	 */
	@Override
	public List<VitalVO> getBloodList(String admiNo){
		return this.wardMapper.getBloodList(admiNo);
	}
	
	
	/**
	 * 혈압 기록을 DB에 넣는다
	 * @param DietVO 식이VO
	 * @return result 실행결과
	 */
	@Override
	public int insertBlood(VitalVO vitalVO) {
		return this.wardMapper.insertBlood(vitalVO);
	}
	
	
	/**
	 * 특정 입원의 체온 리스트를 가져옴
	 * @param admiNo 입원번호
	 * @return VitalVOList 체온List
	 */
	@Override
	public List<VitalVO> getTempList(String admiNo){
		return this.wardMapper.getTempList(admiNo);
	}
	
	
	/**
	 * 체온 기록을 DB에 넣는다
	 * @param VitalVO 체온VO
	 * @return result 실행결과
	 */
	@Override
	public int insertTemp(VitalVO vitalVO) {
		return this.wardMapper.insertTemp(vitalVO);
	}
	
	
	/**
	 * 특정 입원의 IO 리스트를 가져옴
	 * @param admiNo 입원번호
	 * @return IoVOList IOList
	 */
	@Override
	public List<IoVO> getIoList(String admiNo){
		return this.wardMapper.getIoList(admiNo);
	}
	
	
	/**
	 * IO 기록을 DB에 넣는다
	 * @param IoVO IOVO
	 * @return result 실행결과
	 */
	@Override
	public int insertIo(IoVO ioVO) {
		return this.wardMapper.insertIo(ioVO);
	}
}