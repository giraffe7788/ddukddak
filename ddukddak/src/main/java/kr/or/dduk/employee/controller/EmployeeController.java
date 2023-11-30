package kr.or.dduk.employee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/emp")
@Controller
public class EmployeeController {

	// 메인화면으로 이동(인증된 사람만 이동가능)h
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
}
