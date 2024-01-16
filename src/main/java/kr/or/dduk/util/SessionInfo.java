package kr.or.dduk.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import kr.or.dduk.mapper.EmployeeMapper;
import kr.or.dduk.vo.EmployeeVO;

/**
 * 세션에 있는 정보를 가져오기위한 클래스
 * @author 영남
 */
@Component
public class SessionInfo {
	
	@Autowired
	EmployeeMapper employeeMapper;
	
	/**
	 * 세션에 저장된 사번(아이디)를 가져오는 메서드
	 * @return 접속중인 사번(아이디)
	 */
	public String getEmpNo() {
		return SecurityContextHolder.getContext().getAuthentication().getName();
	}
	
	/**
	 * 세션에 있는 사번으로 empVO를 가져오는 메서드
	 * @return 접속중인 사원정보VO
	 */
	public EmployeeVO getEmployeeVO() {
		String empNo = SecurityContextHolder.getContext().getAuthentication().getName();
		return this.employeeMapper.detail(empNo);
	}
}
