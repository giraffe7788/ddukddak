package kr.or.dduk.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;

import lombok.extern.slf4j.Slf4j;

/**
 * 로그인 성공시 로직을 처리하는 홴들러
 * @author 영남
 */
@Slf4j
public class CustomLoginSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

	/**
	 * 로그인 성공시 메인 Url로 이동
	 */
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth) throws IOException, ServletException{
		
		// 인증된 사용자 정보
		User customUser = (User)auth.getPrincipal();
		log.info("사번 = " + customUser.getUsername());
		log.info("비밀번호 = " + customUser.getPassword());
		
		// 보안이슈 방지를 위해 세션에서 인증 속성을 지움
		clearAuthenticationAttributes(request);
		
		// 메인 Url로 리다이렉트
		response.sendRedirect("/common/main");
	}
}
