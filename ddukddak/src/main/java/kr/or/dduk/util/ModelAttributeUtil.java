package kr.or.dduk.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import kr.or.dduk.mapper.AtchFileMapper;
import kr.or.dduk.vo.AtchFileVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@ControllerAdvice
public class ModelAttributeUtil {

	@Autowired
	AtchFileMapper atchFileMapper;

	/**
	 * 로그인된 사원의 사번으로 사원의 VO를 가져옴 TODO 이거 VO리턴하도록 나중에 변경해야됨
	 * 
	 * @return 사원의 VO
	 */
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
