package kr.or.dduk.common.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.dduk.common.service.CommonService;
import kr.or.dduk.vo.PatientVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/common")
@Controller
public class CommonController {
	
	@Autowired
	private CommonService commonService;

	/**
	 * 메인페이지 이동
	 * @return
	 */
	@GetMapping("/main")
	public String main() {

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

		if (authentication != null && authentication.isAuthenticated()) {
			log.info("로그인된 사번 : " + authentication.getName());
		}

		return "common/main";
	}

	
	/**
	 * 로그인 페이지 이동, 로그인 실패시 에러 정보를 받아서 로그로 출력
	 * @param error
	 * @param model
	 * @return
	 */
	@GetMapping("/login")
	public String loginForm(String error, Model model) {

		log.info("error : " + error);

		if (error != null) {
			model.addAttribute("error", "LoginError!");
		}

		return "common/loginForm";
	}

	
	/**
	 * a태그로 로그아웃을 구현 하기 위해 선언한 메소드
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String loout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}

		return "redirect:/common/login";
	}
	
	
	/**
	 *	권한이 없는 사이트 접속 시 접근거부 사이트로 보냄 
	 */
	@RequestMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Denied : " + auth);
		model.addAttribute("msg", "Access Denied");
	}
	
	/**
	 * 환자정보 가져와서 페이지로 가져감
	 * @return
	 */
	@GetMapping("/patient")
	public String list(Model model) {
		List<PatientVO> patientVOList = this.commonService.list();
		log.info("patientVOList: ",patientVOList);
		
		model.addAttribute("patientVOList",patientVOList);
		
		return "common/patient";
	}
}
