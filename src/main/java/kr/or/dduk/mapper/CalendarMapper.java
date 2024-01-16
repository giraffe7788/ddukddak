package kr.or.dduk.mapper;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.dduk.vo.DocScheduleVO;

public interface CalendarMapper {

	public int createSch(DocScheduleVO docScheduleVO);

	public int deleteSch(String dsNo);

	public List<DocScheduleVO> schList(String year);

	public DocScheduleVO selectSch(String dsNo);

	public int updateSch(DocScheduleVO docScheduleVO);

	public List<DocScheduleVO> selectByDate(Map<String, Object> map);

	public List<DocScheduleVO> schListEmpNo(Map<String, Object> map);

	public List<HashMap<String, Object>> docSchListA(String month);

	public List<HashMap<String, Object>> nurSchListA(String month);

	public List<DocScheduleVO> schListByDoc(Map<String, Object> map);

}
