<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<title>가입ㄱ</title>
</head>
<body>
<form action="/example/register" method="post">
	<input type="text" name="id" placeholder="id">
	<input type="text" name="pw" placeholder="pw">
	<button type="submit">제출</button>
	<sec:csrfInput />
</form>
</body>
</html>