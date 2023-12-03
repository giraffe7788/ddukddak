package kr.or.dduk.ams.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/ams")
@Controller
public class AmsController {
	
	@GetMapping("/patient")
	public String patient() {
		return "ams/patient";
	}
	

}
