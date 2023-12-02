package kr.or.dduk.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dduk.mapper.EmployeeMapper;
import kr.or.dduk.service.EmployeeService;
import kr.or.dduk.vo.EmployeeVO;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	EmployeeMapper employeeMapper;

	@Override
	public int createEmp(EmployeeVO employeeVO) {
		return this.employeeMapper.createEmp(employeeVO);
	}

}
