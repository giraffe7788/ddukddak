package kr.or.dduk.clinic.service;

import java.util.List;

import kr.or.dduk.vo.HospitalReceptionVO;

public interface HospitalReceptionService {

	public List<HospitalReceptionVO> getReceptionList(String empNo);
}
