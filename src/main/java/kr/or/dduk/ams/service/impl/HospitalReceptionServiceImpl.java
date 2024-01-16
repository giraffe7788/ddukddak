package kr.or.dduk.ams.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dduk.ams.service.HospitalReceptionService;
import kr.or.dduk.mapper.HospitalReceptionMapper;
import kr.or.dduk.vo.HospitalReceptionVO;
import kr.or.dduk.vo.ProofApplicationVO;

@Service
public class HospitalReceptionServiceImpl implements HospitalReceptionService{

	@Autowired
	HospitalReceptionMapper hospitalReceptionMapper;
	
	/**
	 * 내 사번이 담당의인 모든 환자 대기목록을 출력
	 */
	public List<HospitalReceptionVO> getReceptionList(String empNo){
		return this.hospitalReceptionMapper.getReceptionList(empNo);
	}

	/**
	 * 모든 환자 대기목록을 출력
	 */
	@Override
	public List<HospitalReceptionVO> getTodayReceptionList() {
		return this.hospitalReceptionMapper.getTodayReceptionList();
	}

	@Override
	public int createProofApplication(ProofApplicationVO proofApplicationVO) {
		return this.hospitalReceptionMapper.createProofApplication(proofApplicationVO);
	}

	/**
	 * 접수 내역 추가
	 */
	@Override
	public int addReception(HospitalReceptionVO hospitalReceptionVO) {
		return this.hospitalReceptionMapper.addReception(hospitalReceptionVO);
	}

	@Override
	public int updateProofApplication(ProofApplicationVO proofApplicationVO) {
		return this.hospitalReceptionMapper.updateProofApplication(proofApplicationVO);
	}

	@Override
	public List<HospitalReceptionVO> getAllReceptionList() {
		return this.hospitalReceptionMapper.getAllReceptionList();
	}

	@Override
	public Map<String, Object> getRevisitPatient() {
		return this.hospitalReceptionMapper.getRevisitPatient();
	}
}
