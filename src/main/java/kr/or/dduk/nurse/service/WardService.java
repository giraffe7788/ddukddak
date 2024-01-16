package kr.or.dduk.nurse.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestBody;

import kr.or.dduk.vo.AdmissionChartVO;
import kr.or.dduk.vo.ClinicChartVO;
import kr.or.dduk.vo.DietVO;
import kr.or.dduk.vo.IoVO;
import kr.or.dduk.vo.MealVO;
import kr.or.dduk.vo.MedicineOrderVO;
import kr.or.dduk.vo.NurChartVO;
import kr.or.dduk.vo.VitalVO;

public interface WardService {
	public AdmissionChartVO getNurseChartList(String admiNo);
	public NurChartVO getNurseChartDetail(String nurNo);
	public Map<String, Object> createNurseChart(NurChartVO nurChartVO);
	public List<NurChartVO> getHandOverList(String admiNo);
	public List<ClinicChartVO> getMedicineOrderList(String admiNo);
	public ClinicChartVO getMedicineOrderDetail(String clinicNo);
	public int updateMedicineOrderState(MedicineOrderVO medicineOrderVO);
	public List<DietVO> getDietList(String admiNo);
	public int insertDiet(DietVO dietVO);
	public List<MealVO> getMealList();
	public int deleteMeal(String mealCd);
	public int insertMeal(MealVO mealVO);
	public List<VitalVO> getBloodList(String admiNo);
	public List<VitalVO> getTempList(String admiNo);
	public List<IoVO> getIoList(String admiNo);
	public int insertBlood(VitalVO vitalVO);
	public int insertTemp(VitalVO vitalVO);
	public int insertIo(IoVO ioVO);
}
