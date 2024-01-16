package kr.or.dduk.mapper;

import org.springframework.web.bind.annotation.RequestBody;

import kr.or.dduk.vo.ClinicChartVO;
import kr.or.dduk.vo.InjuryDiagnosisVO;
import kr.or.dduk.vo.MedicineOrderVO;
import kr.or.dduk.vo.MedicineVO;
import kr.or.dduk.vo.PatientVO;
import kr.or.dduk.vo.TestOrderVO;
import kr.or.dduk.vo.TreatmentOrderVO;
import kr.or.dduk.vo.TreatmentVO;

public interface ClinicChartMapper {

	public PatientVO simpleClinicChartList(String paNo);
	
	public ClinicChartVO clinicChartDetail(String clinicNo);
	
	public ClinicChartVO lightWeightClinicChartDetail(String clinicNo);
	
	public int insertClinicChart(ClinicChartVO clinicChartVO);
	
	public ClinicChartVO continueClinicChart(String hsrpNo);
	
	public int updateClinicChart(ClinicChartVO clinicChartVO);
	
	public String getClinicNoByHsrpNo(String hsrpNo);

	public int insertInjuryDiagnosis(InjuryDiagnosisVO injuryDiagnosisVO);
	
	public int insertTestOrder(TestOrderVO testOrderVO);
	
	public int insertMedicineOrder(MedicineOrderVO medicineOrderVO);
	
	public int insertTreatmentOrder(TreatmentOrderVO treatmentOrderVO);
	
	public int updateClinicState(ClinicChartVO clinicChartVO);
}
