package kr.or.dduk.mapper;

import java.util.List;
import java.util.Map;

import kr.or.dduk.vo.EmployeeVO;
import kr.or.dduk.vo.NurScheduleVO;

public interface WorkforceManagementMapper {

	int createNurSchedule(NurScheduleVO nurScheduleVO);

	List<NurScheduleVO> getNurScheduleList(Map<String, Object> map);

	List<NurScheduleVO> createWorkforceExcel(Map<String, Object> map);

	int deleteNurSchedule(Map<String, Object> parameterMap);

}
