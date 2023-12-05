package kr.or.dduk.employee.service;

import kr.or.dduk.vo.EmployeeVO;

public interface EmployeeService {

	// 회원 등록
	public int create(EmployeeVO employeeVO);

	// 회원 조회
	public EmployeeVO detail(String empNo);

	// 회원 수정
	public int update(EmployeeVO employeeVO);
}
