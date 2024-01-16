package kr.or.dduk.nurse.service;

import java.util.List;

import kr.or.dduk.vo.PatientVO;
import kr.or.dduk.vo.TestOrderVO;

public interface NurseTestService {

	// 검사 대기 환자 목록 가져오기
	public List<PatientVO> getTestPatList();

	// 목록에서 선택한 환자 정보 가져오기
	public PatientVO getTestPatDetail(String clinicNo);

	// 검사 오더에서 검사 결과 각각 저장
	public int updateTestOrder(TestOrderVO testOrderVO);
}
