package kr.or.dduk.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.dduk.example.service.ExampleService;
import kr.or.dduk.vo.ExampleVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/example")
public class ExampleController {
	
	@Autowired
	ExampleService exampleService;
	
	@GetMapping("/register")
	public String registerGet() {
		return "example/register";
	}

	@PostMapping("/register")
	public String registerPost(ExampleVO exampleVO) {
		
		int result = this.exampleService.insert(exampleVO);
		log.info("result : " + result);
		return "example/test";
	}
}
