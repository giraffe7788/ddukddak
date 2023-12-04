package kr.or.dduk.service;

import kr.or.dduk.vo.EmployeeVO;

public interface EmployeeService {

	public int create(EmployeeVO employeeVO);

	public EmployeeVO detail(String empNo);

}
