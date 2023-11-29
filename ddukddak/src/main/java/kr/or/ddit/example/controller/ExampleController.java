package kr.or.ddit.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("example")
public class ExampleController {
	
	@GetMapping("/home")
	public String home() {
		return "example/test";
	}
}
