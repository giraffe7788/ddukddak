package kr.or.dduk.nurse.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import kr.or.dduk.vo.EmployeeVO;
import kr.or.dduk.vo.NurScheduleVO;

public interface WorkforceManagementService {

	public int createNurSchedule(MultipartFile file, Map<String, Object> map);

	public List<NurScheduleVO> getNurScheduleList(Map<String, Object> map);

	List<EmployeeVO> getNurseList();

	public byte[] createWorkforceExcel(Map<String, Object> map) throws IOException;

}
