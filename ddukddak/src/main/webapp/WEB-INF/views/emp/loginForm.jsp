<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<style>
body {
	background: var(--bg-01, #F8F9FC);
}

a {
	cursor: pointer;
}
</style>
<body>
	<div class="d-flex">
		<div class="login-left">
			<img class="login-img" src="/resources/images/login-img.png">
		</div>
		<h2>
			<c:out value="${error}" />
		</h2>
		<h2>
			<c:out value="${logout}" />
		</h2>
		<div class="dduk-login-form">
			<div class="login-form-content">
				<div class="login-ci">
					<svg width="80" height="80" viewBox="0 0 80 80" fill="none" xmlns="http://www.w3.org/2000/svg">
						<path fill-rule="evenodd" clip-rule="evenodd" d="M25 4C18.3726 4 13 9.37258 13 16V28C13 31.3137 15.6863 34 19 34H29.2309C30.2547 34 31 33.0238 31 32C31 27.5817 34.5817 24 39 24C43.4183 24 47 27.5817 47 32C47 33.8955 46.3408 35.6371 45.2391 37.0079C44.5442 37.8724 44 38.8908 44 40C44 41.1092 44.5442 42.1276 45.2391 42.9921C46.3408 44.363 47 46.1045 47 48C47 52.4183 43.4183 56 39 56C34.5817 56 31 52.4183 31 48C31 46.9762 30.2547 46 29.2309 46H19C15.6863 46 13 48.6863 13 52V64C13 70.6274 18.3726 76 25 76H37C54.6731 76 69 61.6731 69 44V36C69 18.3269 54.6731 4 37 4H25Z" fill="#0ABAB5"/>
					</svg>
					<p class="login-ci-title">뚝딱 정형외과 EMR</p>
				</div>
				<form method="post" action="/login">
					<div class="dduk-login-d">
						<div class="login-input-label">사번</div>
						<input class="dduk-login-input" type="text" name="username" value="admin">
					</div>
					
					<div class="dduk-login-d">
						<div class="login-input-label">비밀번호</div>
						<input class="dduk-login-input" type="password" name="password" value="pwd4">
						<p><a class="search-passwd">비밀번호 찾기</a>
					</div>
					<div>
						<button class="dduk-login-btn" type="submit"><span>로그인</span></button>
					</div>
					<sec:csrfInput/>
				</form>
				<div class="join-link">
					<span>아직 회원이 아닌가요?</span><a href="/emp/create">회원가입 신청하기</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>