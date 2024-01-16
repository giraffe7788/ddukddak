package kr.or.dduk.calendar.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.dduk.vo.DocScheduleVO;

public interface CalendarService {

	// 일정 추가
	public int createSch(DocScheduleVO docScheduleVO);

	// 일정 삭제
	public int deleteSch(String dsNo);

	// 현재 일정 조회
	public List<DocScheduleVO> schList(String year);

	// 선택한 일정 정보 조회
	public DocScheduleVO selectSch(String dsNo);

	// 선택한 일정 정보 수정
	public int updateSch(DocScheduleVO docScheduleVO);
	
	// 날짜로 일정 조회
	public List<DocScheduleVO> selectByDate(Map<String, Object> map);
	
	// 사번 별 일정 조회
	public List<DocScheduleVO> schListEmpNo(Map<String, Object> map);

	// 해당 월 의사 스케줄 분포도
	public List<HashMap<String, Object>> docSchListA(String month);

	// 해당 월 간호사 스케줄 분포도
	public List<HashMap<String, Object>> nurSchListA(String month);

	public List<DocScheduleVO> schListByDoc(Map<String, Object> map);


}
