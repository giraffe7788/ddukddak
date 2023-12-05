package kr.or.dduk.mapper;

import java.util.List;

import kr.or.dduk.vo.HospitalReceptionVO;

public interface HospitalReceptionMapper {

	public List<HospitalReceptionVO> getReceptionList(String empNo);
}
