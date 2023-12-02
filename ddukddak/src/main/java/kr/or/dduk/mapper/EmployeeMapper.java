package kr.or.dduk.mapper;

import kr.or.dduk.vo.EmployeeVO;

public interface EmployeeMapper {

	public EmployeeVO getMemberAuth(String empNo);

	public int createEmp(EmployeeVO employeeVO);
}
