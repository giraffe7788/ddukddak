package kr.or.dduk.employee.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dduk.service.EmployeeService;
import kr.or.dduk.util.FileController;
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
	
	// 메인화면으로 이동(인증된 사람만 이동가능)
	@GetMapping("/main")
	public String main() {
		return "emp/main";
	}
	
	// 의사만 접근가능한 페이지로 이동(의사만 이동가능) 
	@GetMapping("/docOnly")
	public String docOnly() {
		return "emp/onlyDoctor";
	}
	
	@GetMapping("/login")
	public String loginForm(String error, String logout, Model model) {
		log.info("error : " + error);
		log.info("logout : " + logout);
		
		if (error != null) {
			model.addAttribute("error", "LoginError!");
		}
		
		if (logout != null) {
			model.addAttribute("logout", "Logout!!");
		}
		
		return "emp/loginForm";
	}
	
	@GetMapping("/logout")
	public String logout() {
		return "emp/logoutForm";
	}
	
	@GetMapping("/create")
	public String create() {
		return "emp/create";
	}
	
	@PostMapping("/createEmp")
	public String createEmp(EmployeeVO employeeVO) {
		log.info("createEmp -> employeeVO : " + employeeVO);
		
		// 파일 컨트롤러를 통해
		// 1. 파일을 로컬에 저장(컨트롤러에 있음)
		// 2. 파일 메타데이터들을 DB에 저장(컨트롤러에 있음)
		// 3. 파일코드를 가져와
		Map<String, Object> map = this.fileController.uploadFile(employeeVO.getUploadFile(), "사원프로필사진");
		
		int reuslt = (Integer)map.get("result"); // db에 insert 성공한 개수
		String fileCd = (String)map.get("fileCd"); // 파일코드
		
		employeeVO.setFileCd(fileCd);
		
		// 이제 남은작업 -> employeeVO를 db에 넣어주면 끝
		int res = this.employeeService.createEmp(employeeVO);
		log.info("createEmp -> res : " + res);
		
		return "redirect:/emp/create";
	}
}
