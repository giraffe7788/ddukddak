<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>메인화면이유</p>
<sec:authorize access="hasRole('ROLE_DOC')">
<p>의사한테만 보이는거유~, 스프링 시큐리티 이용해서 어사이드 이렇게 구현하면 돼유~</p>
</sec:authorize>
</body>
</html>