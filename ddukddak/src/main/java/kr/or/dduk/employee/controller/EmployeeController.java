package kr.or.dduk.employee.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	 @RequestMapping(value = "/logout.do", method = RequestMethod.GET)    
	 public String loout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 Authentication auth = SecurityContextHolder.getContext().getAuthentication();    
		 
		 if (auth != null) {            
			 new SecurityContextLogoutHandler().logout(request, response, auth);
			 }        
		 
		 return "redirect:/emp/login";    
		}
	
	
	@GetMapping("/create")
	public String create() {
		return "emp/create";
	}
	
	@PostMapping("/create")
	public String create(EmployeeVO employeeVO) {
		log.info("create -> employeeVO : " + employeeVO);
		
		Map<String, Object> map = this.fileController.uploadFile(employeeVO.getUploadFile(), "사원프로필사진");
		
		int reuslt = (Integer)map.get("result"); // db에 insert 성공한 개수
		String atchFileCd = (String)map.get("atchFileCd"); // 파일코드
		
		employeeVO.setAtchFileCd(atchFileCd);
		
		// 이제 남은작업 -> employeeVO를 db에 넣어주면 끝
		int res = this.employeeService.create(employeeVO);
		log.info("createEmp -> res : " + res);
		
		return "redirect:/emp/detail?empNo="+employeeVO.getEmpNo();
	}
	
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
