package kr.or.dduk.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import kr.or.dduk.mapper.EmployeeMapper;
import kr.or.dduk.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 입맛대로 인증/인가 테이블/컬럼 넣기위해 선언한 클래스
 * @author 영남
 */
@Slf4j
public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	private EmployeeMapper empMapper;
	
	@Override
	public UserDetails loadUserByUsername(String empNo) throws UsernameNotFoundException {
		EmployeeVO employeeVO = this.empMapper.getMemberAuth(empNo);
		log.info("로그인한 사람 정보 : " + employeeVO);
		return employeeVO == null ? null : new CustomUser(employeeVO);
	}
}
