package kr.or.dduk.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import kr.or.dduk.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 인증/인가시 db컬럼, 테이블 내 입맛대로 하기 위해 선언한 클래스
 * @author 영남
 */
@Slf4j
public class CustomUser extends User {

	private static final long serialVersionUID = 1L;
	
	private EmployeeVO employeeVO;
	
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	public CustomUser(EmployeeVO employeeVO) {
		super(employeeVO.getEmpNo(), employeeVO.getEmpPw(), employeeVO.getAuthorityVOList().stream().map(auth -> new SimpleGrantedAuthority(auth.getAuthName())).collect(Collectors.toList()));
		log.info("CustomUser -> employeeVO : " + employeeVO);
		this.employeeVO = employeeVO;
	}
	
	public EmployeeVO getEmployeeVO() {
		return employeeVO;
	}
}
