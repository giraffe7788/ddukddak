package kr.or.dduk.treatment.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import kr.or.dduk.common.service.CommonService;
import kr.or.dduk.mapper.CommonMapper;
import kr.or.dduk.mapper.TreatementMapper;
import kr.or.dduk.treatment.service.TreatementService;
import kr.or.dduk.util.SessionInfo;
import kr.or.dduk.vo.ClinicChartVO;
import kr.or.dduk.vo.DataWrapper;
import kr.or.dduk.vo.PatientRecordVO;
import kr.or.dduk.vo.PatientVO;
import kr.or.dduk.vo.TreatmentOrderVO;
import kr.or.dduk.vo.TreatmentRoomVO;

@Service
public class TreatementServiceImpl implements TreatementService{
	@Autowired
	TreatementMapper treatementMapper;
	
	@Autowired
	SessionInfo sessionInfo;
	
	@Override
	public List<PatientVO> list(HashMap<String, Object> param) {
		return this.treatementMapper.list(param);
	}

	@Override
	public List<PatientVO> selectpatient(ClinicChartVO clinicChartVO) {
		return this.treatementMapper.selectpatient(clinicChartVO);
	}

	@Override
	public List<TreatmentRoomVO> selectroom(int treatmentroomNumber) {
		return this.treatementMapper.selectroom(treatmentroomNumber);
	}

	@Override
	public int updatetre(DataWrapper dataWrapper) {
		
		String empNo = this.sessionInfo.getEmpNo();
		String clinicNo = dataWrapper.getClinicChartVO().getClinicNo();
		String tmCd = dataWrapper.getTreatmentRoomVO().getTmCd();
		
		TreatmentRoomVO treatmentRoomVO = dataWrapper.getTreatmentRoomVO();
		treatmentRoomVO.setEmpNo(empNo);
		
		TreatmentOrderVO treatmentOrderVO = new TreatmentOrderVO();
		treatmentOrderVO.setTreatmentOrderEmpNo(empNo);
		treatmentOrderVO.setTmCd(tmCd);
		treatmentOrderVO.setClinicNo(clinicNo);
		
		int result = 0;
		
		result += this.treatementMapper.updatetre(treatmentRoomVO);
		result += this.treatementMapper.updateTreatmentOrderEmpNo(treatmentOrderVO);
				
		return result;
	}


}
