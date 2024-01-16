package kr.or.dduk.treatment.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dduk.mapper.TreatmentRecordMapper;
import kr.or.dduk.treatment.service.TreatmentRecordService;
import kr.or.dduk.vo.ClinicChartVO;
import kr.or.dduk.vo.PatientVO;
import kr.or.dduk.vo.TreatmentOrderVO;
import kr.or.dduk.vo.TreatmentStatsVO;

@Service
public class TreatmentRecordServiceImpl implements TreatmentRecordService{

	@Autowired
	TreatmentRecordMapper treatmentRecordMapper;
	
	@Override
	public List<PatientVO> treatmentPatientList() {
		return this.treatmentRecordMapper.treatmentPatientList();
	}

	@Override
	public PatientVO selectTreatmentPatientInfo(String paNo) {
		return this.treatmentRecordMapper.selectTreatmentPatientInfo(paNo);
	}

	@Override
	public PatientVO selectTreatmentInfo(String clinicNo) {
		return this.treatmentRecordMapper.selectTreatmentInfo(clinicNo);
	}
	
	@Override
	public PatientVO getTreatmentInfo(String paNo) {
		return this.treatmentRecordMapper.getTreatmentInfo(paNo);
	}

	@Override
	public PatientVO selectTodayTreatmentInfo(String paNo) {
		return this.treatmentRecordMapper.selectTodayTreatmentInfo(paNo);
	}

	@Override
	public int updateTrodCont(TreatmentOrderVO treatmentOrderVO) {
		return this.treatmentRecordMapper.updateTrodCont(treatmentOrderVO);
	}

	@Override
	public List<TreatmentStatsVO> bodyCdStatisticsList() {
		return treatmentRecordMapper.bodyCdStatisticsList();
	}

	@Override
	public List<ClinicChartVO> getAllTreatmentOrderList(){
		return this.treatmentRecordMapper.getAllTreatmentOrderList();
	}
}
