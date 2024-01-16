package kr.or.dduk.mapper;

import java.util.List;

import kr.or.dduk.vo.ComDetailCodeInfoVO;

public interface ComCodeMapper {
	public List<ComDetailCodeInfoVO> getComDetailCodeInfo(String empJbpsCd);

	public List<ComDetailCodeInfoVO> getComDetailCodeList(String empDeptcd);
}
