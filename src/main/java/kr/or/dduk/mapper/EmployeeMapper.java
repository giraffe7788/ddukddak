package kr.or.dduk.mapper;

import java.util.HashMap;
import java.util.List;

import kr.or.dduk.vo.ComDetailCodeInfoVO;
import kr.or.dduk.vo.DocOfficeVO;
import kr.or.dduk.vo.DocScheduleVO;
import kr.or.dduk.vo.EmployeeVO;

public interface EmployeeMapper {

	public EmployeeVO getMemberAuth(String empNo);

	public int create(EmployeeVO employeeVO);

	public EmployeeVO detail(String empNo);

	public int update(EmployeeVO employeeVO);

	public String getNewNo();

	public List<EmployeeVO> getDoctorList();

	public List<EmployeeVO> getAllEmp();

	public List<EmployeeVO> getPermEmpList();

	public EmployeeVO getHrdDetail(String empNo);

	public List<EmployeeVO> getSttDetail(String empAcntState);

	public int updateStt(EmployeeVO employeeVO);

	public List<EmployeeVO> getFirstApprovalHolder();

	public List<EmployeeVO> getSecondApprovalHolder();

	public List<EmployeeVO> getAllDoctorDetail();

	public DocScheduleVO getPresentSchedule(String empNo);

	public int assignDoctorToClinicRoom(DocOfficeVO docOfficeVO);

	public List<EmployeeVO> getNurseList();

	public int removeDoctorFromClinicRoom(String doNo);

	public List<HashMap<String, Object>> workingEmpListA();

	public List<HashMap<String, Object>> inEmpListA();

	public List<HashMap<String, Object>> outEmpListA();

	public List<HashMap<String, Object>> genEmpListA();

	
}
