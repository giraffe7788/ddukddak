package kr.or.dduk.ams.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.dduk.ams.service.AdmissionService;
import kr.or.dduk.mapper.AdmissionMapper;
import kr.or.dduk.mapper.ClinicChartMapper;
import kr.or.dduk.util.FileController;
import kr.or.dduk.vo.AdmissionChartVO;
import kr.or.dduk.vo.AdmissionRoomVO;
import kr.or.dduk.vo.ClinicChartVO;
import kr.or.dduk.vo.DataWrapper;
import kr.or.dduk.vo.InjuryDiagnosisVO;
import kr.or.dduk.vo.MedicineOrderVO;
import kr.or.dduk.vo.PatientVO;
import kr.or.dduk.vo.TestOrderVO;
import kr.or.dduk.vo.TreatmentOrderVO;

@Service
public class AdmissionServiceImpl implements AdmissionService {

	@Autowired
	private AdmissionMapper admissionMapper;

	@Autowired
	private ClinicChartMapper clinicChartMapper;
	
	// 입원대기 환자 조회
	@Override
	public List<PatientVO> selectAdmissionList(String clinicNo) {
		return admissionMapper.selectAdmissionList(clinicNo);
	}

	// 퇴원대기 환자 조회
	@Override
	public List<PatientVO> selectDischargeList(String clinicNo) {
		return admissionMapper.selectDischargeList(clinicNo);
	}

	// 환자 상세 정보 조회
	@Override
	public List<PatientVO> getPatientDetail(String paNo) {
		return this.admissionMapper.getPatientDetail(paNo);
	}

	// 진료 차트 조회(의사 소견 가져오기)
	@Override
	public List<ClinicChartVO> getClinicOpinion(String clinicNo) {
		return admissionMapper.getClinicOpinion(clinicNo);
	}

	// 입원실 정보 조회
	@Override
	public List<AdmissionRoomVO> admissionRoomVOList() {
		return admissionMapper.admissionRoomVOList();
	}

	// 입원 등록
	@Override
	public int admissionInsert(DataWrapper dataWrapper) {

		int result = 0;

		AdmissionChartVO admissionChartVO = dataWrapper.getAdmissionChartVO();
		ClinicChartVO clinicChartVO = dataWrapper.getClinicChartVO();

		// 진료 차트 update 및 진단, 오더 insert 부분
		// 진료차트 테이블을 업데이트 시켜준다
		result += this.clinicChartMapper.updateClinicChart(clinicChartVO);

		// 접수번호로 진료번호를 가져온다(진단과 오더를 insert 시켜주기 위해)
		String clinicNo = this.clinicChartMapper.getClinicNoByHsrpNo(clinicChartVO.getHsrpNo());

		// 상병진단 업데이트
		List<InjuryDiagnosisVO> injuryDiagnosisVOList = clinicChartVO.getInjuryDiagnosisVOList();
		for (InjuryDiagnosisVO vo : injuryDiagnosisVOList) {
			vo.setClinicNo(clinicNo);
			result += this.clinicChartMapper.insertInjuryDiagnosis(vo);
		}

		// 검사오더 업데이트
		List<TestOrderVO> testOrderVOList = clinicChartVO.getTestOrderVOList();
		for (TestOrderVO vo : testOrderVOList) {
			vo.setClinicNo(clinicNo);
			result += this.clinicChartMapper.insertTestOrder(vo);
		}

		// 처방오더 업데이트
		List<MedicineOrderVO> medicineOrderVOList = clinicChartVO.getMedicineOrderVOList();
		for (MedicineOrderVO vo : medicineOrderVOList) {
			vo.setClinicNo(clinicNo);
			result += this.clinicChartMapper.insertMedicineOrder(vo);
		}

		// 치료오더 업데이트
		List<TreatmentOrderVO> treatmentOrderVO = clinicChartVO.getTreatmentOrderVOList();
		for (TreatmentOrderVO vo : treatmentOrderVO) {
			vo.setClinicNo(clinicNo);
			result += this.clinicChartMapper.insertTreatmentOrder(vo);
		}

		
		// 입원 차트 insert 부분
		// 환자의 입원정보를 입력해서 입원차트 테이블 생성
		result += admissionMapper.admissionInsert(admissionChartVO);
		// 환자의 입원상태를 입원필요로 바꿈
		PatientVO patientVO = new PatientVO();
		patientVO.setPaNo(admissionChartVO.getPaNo());
		patientVO.setPaAdmDt("AMYN03");
		result += admissionMapper.updatePatientAdmDt(patientVO);
		return result;
	}
	
	@Override
	public int admissionUpdateYN(PatientVO patientVO) {
		int result = 0;

		String paNo = patientVO.getPaNo();
		String paNoknm = patientVO.getPaNoknm();
		String paNokph = patientVO.getPaNokph();
		
		List<AdmissionChartVO> admissionChartVOList = patientVO.getAdmissionChartVOList();
	    for (AdmissionChartVO admissionChartVO : admissionChartVOList) {
	    	String admiNo = admissionChartVO.getAdmiNo();
	    	String adrmRoomno = admissionChartVO.getAdrmRoomno();
	    	String adrmBedno = admissionChartVO.getAdrmBedno();
	    	
	        admissionChartVO.setAdmiNo(admiNo);
	        admissionChartVO.setAdrmRoomno(adrmRoomno);
	        admissionChartVO.setAdrmBedno(adrmBedno);
	        admissionChartVO.setPaNo(paNo);
	        
	        result += admissionMapper.updateAdmissionChart(admissionChartVO);
	    }
	    
	    List<AdmissionRoomVO> admissionRoomVOList = patientVO.getAdmissionRoomVOList();
	    for (AdmissionRoomVO admissionRoomVO : admissionRoomVOList) {
	    	String rmPaNo = admissionRoomVO.getPaNo();
	    	String adrmRoomno = admissionRoomVO.getAdrmRoomno();
	    	String adrmBedno = admissionRoomVO.getAdrmBedno();
	    	
	    	admissionRoomVO.setPaNo(paNo);
	    	admissionRoomVO.setAdrmRoomno(adrmRoomno);
	    	admissionRoomVO.setAdrmBedno(adrmBedno);
	        
	        result += admissionMapper.updateAdmissionRoom(admissionRoomVO);
	    }
	    
	    patientVO.setPaNoknm(paNoknm);
	    patientVO.setPaNokph(paNokph);
	    result += admissionMapper.updatePatient(patientVO);

	    return result;
	}

	@Override
	public String admissionUpdate(DataWrapper dataWrapper) {
		String result = null;
//
//	    result += admissionMapper.updateAdmissionChart(dataWrapper.getAdmissionChartVO());
//
//	    result += admissionMapper.updateAdmissionRoom(dataWrapper.getAdmissionRoomVO());
//
//	    result += admissionMapper.updatePatient(dataWrapper.getPatientVO());
//
	    return result;
	}

	@Override
	public String dischargeUpdate(DataWrapper dataWrapper) {
		String result = null;
		
		result += admissionMapper.updateDischargeChart(dataWrapper.getAdmissionChartVO());

	    result += admissionMapper.updateDischargeRoom(dataWrapper.getAdmissionRoomVO());

	    result += admissionMapper.updateDischargePatient(dataWrapper.getPatientVO());
		
		return null;
	}

	@Override
	public List<PatientVO> patientVOList() {
		return admissionMapper.patientVOList();
	}
	
	
	/**
	 * 입원실 현황, 담당의, 입원번호를 가져옴
	 * @return 해당 정보들이 모두 담긴 patientVO 리턴
	 */
	@Override
	public List<PatientVO> getAmsPatientVOList() {
		return this.admissionMapper.patientVOList();
	}

	@Override
	public List<PatientVO> selectAllPatient() {
		return this.admissionMapper.selectAllPatient();
	}

	@Override
	public int admiFileUpdate(AdmissionChartVO admissionChartVO) {
		return this.admissionMapper.admiFileUpdate(admissionChartVO);
	}

	@Override
	public List<PatientVO> getAllAdmissionPatient() {
		return this.admissionMapper.getAllAdmissionPatient();
	}

	@Override
	public List<AdmissionChartVO> getAllAdmission() {
		return this.admissionMapper.getAllAdmission();
	}

	@Override
	public List<AdmissionChartVO> getAdmissionListByMonth(Map<String, Object> map) {
		return this.admissionMapper.getAdmissionListByMonth(map);
	}

	@Override
	public List<PatientVO> getAllAdmissionPatientList() {
		return this.admissionMapper.getAllAdmissionPatientList();
	}

	@Override
	public List<PatientVO> getAdmissionPatientListByMonth(Map<String, Object> map) {
		return this.admissionMapper.getAdmissionPatientListByMonth(map);
	}

}
