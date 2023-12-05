package kr.or.dduk.clinic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 의사 진료 컨트롤러
 * @author 김영남
 */
@Controller
@RequestMapping("/clinic")
public class ClinicController {

	@GetMapping("/chart")
	public String chart(String str) {
		return "clinic/chart";
	}
}
