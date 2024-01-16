package kr.or.dduk.mapper;

import java.util.HashMap;
import java.util.List;

import org.springframework.http.ResponseEntity;

import kr.or.dduk.vo.ClinicChartVO;
import kr.or.dduk.vo.ComDetailCodeInfoVO;
import kr.or.dduk.vo.PatientRecordVO;
import kr.or.dduk.vo.PatientVO;
import kr.or.dduk.vo.TreatmentOrderVO;
import kr.or.dduk.vo.TreatmentRoomVO;

public interface TreatementMapper {
		public List<PatientVO> list(HashMap<String, Object> param);
		
		public List<PatientVO> selectpatient(ClinicChartVO clinicChartVO);
		
		public List<TreatmentRoomVO> selectroom(int treatmentroomNumber);
		
		public int updatetre(TreatmentRoomVO treatmentRoomVO);
		
		public int updateTreatmentOrderEmpNo(TreatmentOrderVO treatmentOrderVO);
	}

