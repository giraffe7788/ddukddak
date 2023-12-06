package kr.or.dduk.clinic.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dduk.mapper.HospitalReceptionMapper;
import kr.or.dduk.vo.HospitalReceptionVO;

@Service
public class HospitalReceptionServiceImpl implements HospitalReceptionService{

	@Autowired
	HospitalReceptionMapper hospitalReceptionMapper;
	
	public List<HospitalReceptionVO> getReceptionList(String empNo){
		return this.hospitalReceptionMapper.getReceptionList(empNo);
	}
}
