package kr.or.dduk.ams.service;

import java.util.List;
import java.util.Map;

import kr.or.dduk.vo.AdmissionChartVO;
import kr.or.dduk.vo.AdmissionRoomVO;
import kr.or.dduk.vo.ClinicChartVO;
import kr.or.dduk.vo.DataWrapper;
import kr.or.dduk.vo.PatientVO;

public interface AdmissionService {

	//입원대기 환자 조회
	List<PatientVO> selectAdmissionList(String clinicNo);

	//퇴원대기 환자 조회
	List<PatientVO> selectDischargeList(String clinicNo);
	
	//환자 상세 정보 조회
	List<PatientVO> getPatientDetail(String paNo);
	
	//진료 차트 조회(의사 소견 가져오기)
	List<ClinicChartVO> getClinicOpinion(String clinicNo);

	//입원실 정보 조회
	List<AdmissionRoomVO> admissionRoomVOList();

	//입원 등록
	int admissionInsert(DataWrapper dataWrapper);

	String admissionUpdate(DataWrapper dataWrapper);

	String dischargeUpdate(DataWrapper dataWrapper);

	List<PatientVO> patientVOList();
	
	public List<PatientVO> getAmsPatientVOList();

	List<PatientVO> selectAllPatient();

	int admiFileUpdate(AdmissionChartVO admissionChartVO);

	int admissionUpdateYN(PatientVO patientVO);

	List<PatientVO> getAllAdmissionPatient();

	List<AdmissionChartVO> getAllAdmission();

	List<AdmissionChartVO> getAdmissionListByMonth(Map<String, Object> map);

	List<PatientVO> getAllAdmissionPatientList();

	List<PatientVO> getAdmissionPatientListByMonth(Map<String, Object> map);
}
