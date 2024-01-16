package kr.or.dduk.mapper;

import java.util.List;
import java.util.Map;

import kr.or.dduk.vo.AdmissionChartVO;
import kr.or.dduk.vo.AdmissionRoomVO;
import kr.or.dduk.vo.ClinicChartVO;
import kr.or.dduk.vo.PatientVO;

public interface AdmissionMapper {

	//입원대기 환자 조회
	public List<PatientVO> selectAdmissionList(String clinicNo);
	
	//퇴원대기 환자 조회
	public List<PatientVO> selectDischargeList(String clinicNo);

	//환자 상세 정보 조회
	public List<PatientVO> getPatientDetail(String paNo);
	
	//진료 차트 조회(의사 소견 가져오기)
	public List<ClinicChartVO> getClinicOpinion(String clinicNo);

	//입원실 정보 조회
	public List<AdmissionRoomVO> admissionRoomVOList();

	//입원 등록
	public int admissionInsert(AdmissionChartVO admissionChartVO);
	
	//환자의 입원상태 변경
	public int updatePatientAdmDt(PatientVO patientVO);
	
	void updateClinicChart(Map<String, Object> map);

	//입원처리시
	public int updateAdmissionChart(AdmissionChartVO admissionChartVO);
	public int updateAdmissionRoom(AdmissionRoomVO admissionRoomVO);
	public int updatePatient(PatientVO patientVO);

	//퇴원처리시
	public int updateDischargeChart(AdmissionChartVO admissionChartVO);
	public int updateDischargeRoom(AdmissionRoomVO admissionRoomVO);
	public int updateDischargePatient(PatientVO patientVO);

	public List<PatientVO> patientVOList();

	public List<PatientVO> selectAllPatient();

	public int admiFileUpdate(AdmissionChartVO admissionChartVO);

	public List<PatientVO> getAllAdmissionPatient();
	
	public AdmissionChartVO getSimpleAdmissionInfo(String admiNo);

	public List<AdmissionChartVO> getAllAdmission();

	public List<AdmissionChartVO> getAdmissionListByMonth(Map<String, Object> map);

	public List<PatientVO> getAllAdmissionPatientList();

	public List<PatientVO> getAdmissionPatientListByMonth(Map<String, Object> map);
}
