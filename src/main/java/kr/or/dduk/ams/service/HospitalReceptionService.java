package kr.or.dduk.ams.service;

import java.util.List;
import java.util.Map;

import kr.or.dduk.vo.HospitalReceptionVO;
import kr.or.dduk.vo.PatientVO;
import kr.or.dduk.vo.ProofApplicationVO;

public interface HospitalReceptionService {

	public List<HospitalReceptionVO> getReceptionList(String empNo);

	public List<HospitalReceptionVO> getTodayReceptionList();

	public int createProofApplication(ProofApplicationVO proofApplicationVO);

	public int addReception(HospitalReceptionVO hospitalReceptionVO);

	public int updateProofApplication(ProofApplicationVO proofApplicationVO);

	public List<HospitalReceptionVO> getAllReceptionList();

	public Map<String, Object> getRevisitPatient();

}
