package kr.or.dduk.mapper;

import kr.or.dduk.vo.EmployeeVO;

public interface EmployeeMapper {

	public EmployeeVO getMemberAuth(String empNo);

	public int create(EmployeeVO employeeVO);

	public EmployeeVO detail(String empNo);

	public int update(EmployeeVO employeeVO);
}
