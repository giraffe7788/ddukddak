package kr.or.dduk.security;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

/**
 * 각종 시큐리티 관련 로직을 처리하는 클래스
 * @author 영남
 */
@Slf4j
@Controller
@RequestMapping("/security")
public class CommonController {
	
	/**
	 *	권한이 없는 사이트 접속 시 접근거부 사이트로 보냄 
	 */
	@RequestMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		log.info("access Denied : " + auth);
		model.addAttribute("msg", "Access Denied");
	}
}
