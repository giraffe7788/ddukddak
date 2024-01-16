package kr.or.dduk.comcode.service;

import java.util.List;

import kr.or.dduk.vo.ComDetailCodeInfoVO;

public interface ComCodeService {
	// 직책 상세 조회
	public List<ComDetailCodeInfoVO> getComDetailCodeInfo(String empJbpsCd);

	// 직무별 직책리스트 조회
	public List<ComDetailCodeInfoVO> getComDetailCodeList(String empDeptcd);
}
