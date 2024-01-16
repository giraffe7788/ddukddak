package kr.or.dduk.clinic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/doctor")
public class DoctorChartController {

	/**
	 * 차트 페이지 이동
	 */
	@GetMapping("/chart")
	public void doctorChart() {
		
	}
}
