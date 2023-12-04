package kr.or.dduk.mapper;

import java.util.List;

import kr.or.dduk.vo.AtchFileDetailVO;
import kr.or.dduk.vo.AtchFileVO;

public interface AtchFileMapper {
	
	// 파일상세코드 목록
	public List<AtchFileDetailVO> atchFileDetailInfo();

	// ATCH_FILE 테이블에 insert
	public int insertFile(AtchFileVO atchFileVO);

	// ATCH_FILE_DETAIL 테이블에 insert
	public int insertFileDetail(AtchFileDetailVO atchFileDetailVO);


}
