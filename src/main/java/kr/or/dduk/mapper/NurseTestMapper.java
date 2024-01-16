package kr.or.dduk.mapper;

import java.util.List;

import kr.or.dduk.vo.PatientVO;
import kr.or.dduk.vo.TestOrderVO;

public interface NurseTestMapper {

	public List<PatientVO> getTestPatList();

	public PatientVO getTestPatDetail(String clinicNo);

	public int updateTestOrder(TestOrderVO testOrderVO);
}
