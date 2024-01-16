package kr.or.dduk.chat.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

//chat.jsp를 띄워주는 컨트롤러
@Controller
public class ChattingController {
	@GetMapping("/chatting")
	public String chat (HttpServletRequest req, HttpServletResponse resp, HttpSession session) {
		return "chat";
	}
}
