package kr.or.dduk.employee.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dduk.mapper.EmployeeMapper;
import kr.or.dduk.vo.EmployeeVO;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	EmployeeMapper employeeMapper;

	@Override
	public int create(EmployeeVO employeeVO) {
		return this.employeeMapper.create(employeeVO);
	}

	@Override
	public EmployeeVO detail(String empNo) {
		return this.employeeMapper.detail(empNo);
	}

	@Override
	public int update(EmployeeVO employeeVO) {
		return this.employeeMapper.update(employeeVO);
	}
}
