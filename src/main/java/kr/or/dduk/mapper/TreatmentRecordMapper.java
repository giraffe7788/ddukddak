package kr.or.dduk.mapper;

import java.util.List;

import kr.or.dduk.vo.ClinicChartVO;
import kr.or.dduk.vo.PatientVO;
import kr.or.dduk.vo.TreatmentOrderVO;
import kr.or.dduk.vo.TreatmentStatsVO;

public interface TreatmentRecordMapper {

	List<PatientVO> treatmentPatientList();

	PatientVO selectTreatmentPatientInfo(String paNo);

	PatientVO selectTreatmentInfo(String clinicNo);

	PatientVO selectTodayTreatmentInfo(String paNo);

	int updateTrodCont(TreatmentOrderVO treatmentOrderVO);

	PatientVO getTreatmentInfo(String paNo);

	List<TreatmentStatsVO> bodyCdStatisticsList();

	public List<ClinicChartVO> getAllTreatmentOrderList();
}
