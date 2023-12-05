package kr.or.dduk.clinic.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.dduk.vo.HospitalReceptionVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 의사 진료 컨트롤러
 * @author 김영남
 */
@Slf4j
@Controller
@RequestMapping("/clinic")
public class ClinicController {

	/**
	 * 진료화면 이동
	 * @return
	 */
	@GetMapping("/chart")
	public String chart() {
		return "clinic/chart";
	}
}
