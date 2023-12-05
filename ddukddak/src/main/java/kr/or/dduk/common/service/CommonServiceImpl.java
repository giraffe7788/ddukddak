package kr.or.dduk.common.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dduk.mapper.CommonMapper;
import kr.or.dduk.vo.PatientVO;

@Service
public class CommonServiceImpl implements CommonService{
	@Autowired
	CommonMapper commonMapper;
	
	@Override
	public List<PatientVO> list() {
		return this.commonMapper.list();
	}
}
