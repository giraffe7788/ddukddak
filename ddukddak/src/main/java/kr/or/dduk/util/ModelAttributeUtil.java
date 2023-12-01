package kr.or.dduk.util;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import kr.or.dduk.security.CommonController;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@ControllerAdvice
public class ModelAttributeUtil {
	 @ModelAttribute("getCurrentLoginName")
	 public String getCurrentLoginName() {
	    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

	     if (authentication != null && authentication.isAuthenticated()) {
	         log.info("로그인된 사번 : " + authentication.getName());
	         String name = authentication.getName();
	         
	         return name;
	     }
	     
	     return "현재로그인된사번";
	 }
}
