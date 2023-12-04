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

import kr.or.dduk.service.EmployeeService;
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
		
		Map<String, Object> map = this.fileController.uploadFile(employeeVO.getUploadFile(), "사원프로필사진");
		
		int reuslt = (Integer)map.get("result"); // db에 insert 성공한 개수
		String atchFileCd = (String)map.get("atchFileCd"); // 파일코드
		
		employeeVO.setAtchFileCd(atchFileCd);
		
		String rawPw = employeeVO.getEmpPw();
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encodedPassword = encoder.encode(rawPw);
		employeeVO.setEmpPw(encodedPassword);
		
		// 이제 남은작업 -> employeeVO를 db에 넣어주면 끝
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
	public String detail(String empNo, Model model, String atchFileCd) {
		log.info("detail -> empNo : " + empNo);
		EmployeeVO employeeVO = this.employeeService.detail(empNo);
		log.info("detail -> employeeVO : " + employeeVO);
		
//		List<AtchFileVO> atchFileVOList = this.employeeService.getAtchFile(atchFileCd);
		
		model.addAttribute("employeeVO", employeeVO);
		
		return "emp/detail";
	}
}
