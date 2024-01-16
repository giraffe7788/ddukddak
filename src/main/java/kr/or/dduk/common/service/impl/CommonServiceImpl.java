package kr.or.dduk.common.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dduk.common.service.CommonService;
import kr.or.dduk.mapper.CommonMapper;
import kr.or.dduk.vo.AtchFileDetailVO;
import kr.or.dduk.vo.DocOfficeVO;
import kr.or.dduk.vo.EmployeeVO;
import kr.or.dduk.vo.PatientRecordVO;
import kr.or.dduk.vo.PatientVO;

@Service
public class CommonServiceImpl implements CommonService{
	@Autowired
	CommonMapper commonMapper;
	
	@Override
	public List<PatientVO> list() {
		return this.commonMapper.list();
	}

	@Override
	public int createPatientPost(PatientVO patientVO) {
		// TODO Auto-generated method stub
		return this.commonMapper.createPatientPost(patientVO);
	}

	@Override
	public List<PatientRecordVO> patientRecordList(String paNo) {
		return this.commonMapper.patientRecordList(paNo);
	}

	@Override
	public int createPatientRecordPost(PatientRecordVO patientRecordVO) {
		return this.commonMapper.createPatientRecordPost(patientRecordVO);
	}

	@Override
	public List<PatientVO> searchPatient(String paName) {
		return this.commonMapper.searchPatient(paName);
	}

	@Override
	public PatientVO searchPatientByNo(String paNo) {
		return this.commonMapper.searchPatientByNo(paNo);
	}

	@Override
	public int updatePatientPost(PatientVO patientVO) {
		return this.commonMapper.updatePatientPost(patientVO);
	}

	@Override
	public AtchFileDetailVO getFileDetail(String atchFileCd) {
		return this.commonMapper.getFileDetail(atchFileCd);
	}

	@Override
	public List<DocOfficeVO> getOfficesCondition() {
		return this.commonMapper.getOfficesCondition();
	}

	@Override
	public List<PatientVO> getPatientList() {
		return this.commonMapper.getPatientList();
	}

}
