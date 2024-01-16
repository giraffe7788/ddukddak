package kr.or.dduk.treatment.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.http.ResponseEntity;

import kr.or.dduk.vo.ClinicChartVO;
import kr.or.dduk.vo.DataWrapper;
import kr.or.dduk.vo.PatientVO;
import kr.or.dduk.vo.TreatmentRoomVO;

public interface TreatementService {
	public List<PatientVO> list(HashMap<String, Object> hashMap );
	
	public List<PatientVO> selectpatient(ClinicChartVO clinicChartVO );
	
	public List<TreatmentRoomVO> selectroom(int treatmentroomNumber);
	
	public int updatetre(DataWrapper dataWrapper);
	

}
