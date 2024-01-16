package kr.or.dduk.comcode.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dduk.comcode.service.ComCodeService;
import kr.or.dduk.mapper.ComCodeMapper;
import kr.or.dduk.vo.ComDetailCodeInfoVO;

@Service
public class ComCodeServiceImpl implements ComCodeService {

	@Autowired
	ComCodeMapper comCodeMapper;
	
	// 직책 조회용
	@Override
	public List<ComDetailCodeInfoVO> getComDetailCodeInfo(String empJbpsCd) {
		return this.comCodeMapper.getComDetailCodeInfo(empJbpsCd);
	}

	// 직무별 직책리스트 조회
	@Override
	public List<ComDetailCodeInfoVO> getComDetailCodeList(String empDeptcd) {
		return this.comCodeMapper.getComDetailCodeList(empDeptcd);
	}

}
