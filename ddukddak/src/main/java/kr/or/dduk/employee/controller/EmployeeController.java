package kr.or.dduk.employee.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.dduk.employee.service.EmployeeService;
import kr.or.dduk.util.FileController;
import kr.or.dduk.vo.AtchFileVO;
import kr.or.dduk.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/emp")
@Controller
public class EmployeeController {

	@Autowired
	FileController fileController;
	
	@Autowired
	EmployeeService employeeService;
	
	/**
	 * 회원가입 화면 이동
	 * @return
	 */
	@GetMapping("/create")
	public String create() {
		return "emp/create";
	}
	
	/**
	 * 회원가입 진행
	 * @param employeeVO
	 * @return
	 */
	@PostMapping("/create")
	public String create(EmployeeVO employeeVO) {
		log.info("create -> employeeVO : " + employeeVO);
		
		// 파일 로컬+DB 저장, 파일코드 얻어오고 설정
		Map<String, Object> map = this.fileController.uploadFile(employeeVO.getUploadFile(), "사원프로필사진");
		int reuslt = (Integer)map.get("result"); // db에 insert 성공한 개수
		String atchFileCd = (String)map.get("atchFileCd"); // 파일코드
		employeeVO.setAtchFileCd(atchFileCd);
		
		// 비밀번호 보안화 인코딩
		String rawPw = employeeVO.getEmpPw();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodedPassword = encoder.encode(rawPw);
		employeeVO.setEmpPw(encodedPassword);
		
		//employeeVO를 db에 넣기
		int res = this.employeeService.create(employeeVO);
		log.info("createEmp -> res : " + res);
		
		return "redirect:/emp/detail?empNo="+employeeVO.getEmpNo();
	}
	
	/**
	 * 회원상세
	 * @param empNo
	 * @param model
	 * @param atchFileCd
	 * @return
	 */
	@GetMapping("/detail")
	public String detail(@RequestParam String empNo, Model model) {

		EmployeeVO employeeVO = this.employeeService.detail(empNo);
		model.addAttribute("employeeVO", employeeVO);
		return "emp/detail";
	}
	
	/**
	 * 회원수정
	 * 
	 */
	@PostMapping("/update")
	public String update(EmployeeVO employeeVO) {
		
		// 파일 로컬+DB 저장, 파일코드 얻어오고 설정
		Map<String, Object> map = this.fileController.uploadFile(employeeVO.getUploadFile(), "사원프로필사진");
		int result = (Integer)map.get("result"); // db에 insert 성공한 개수
		String atchFileCd = (String)map.get("atchFileCd"); // 파일코드
		employeeVO.setAtchFileCd(atchFileCd);
		
		// EmployeeVO DB 수정
		int res = this.employeeService.update(employeeVO);
		log.info("update -> res : " + res);
		
		return "redirect:/emp/detail?empNo="+employeeVO.getEmpNo();
	}
}
