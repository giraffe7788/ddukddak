package kr.or.dduk.treatment.service;

import java.util.List;

import kr.or.dduk.vo.ClinicChartVO;
import kr.or.dduk.vo.PatientVO;
import kr.or.dduk.vo.TreatmentOrderVO;
import kr.or.dduk.vo.TreatmentStatsVO;

public interface TreatmentRecordService {

	public List<PatientVO> treatmentPatientList();

	public PatientVO selectTreatmentPatientInfo(String paNo);

	public PatientVO selectTreatmentInfo(String clinicNo);
	
	public PatientVO getTreatmentInfo(String paNo);

	public PatientVO selectTodayTreatmentInfo(String paNo);

	public int updateTrodCont(TreatmentOrderVO treatmentOrderVO);

	public List<TreatmentStatsVO> bodyCdStatisticsList();

	public List<ClinicChartVO> getAllTreatmentOrderList();
}
