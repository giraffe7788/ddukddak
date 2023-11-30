<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<title>게시판</title>
</head>
<body>
<form id="frm">
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성자</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>	
		</thead>
		<tbody>
			<c:forEach items="${list}" var="list">
	 			<tr>
	 				<td>${list.seq}</td>
	  				<td>${list.subject}</td>
					 <td>${list.content}</td>
	 				 <td>${list.name}</td>
	 				 <fmt:parseDate value="${list.reg_date}" var="dateValue" pattern="yyyyMMddHHmmss"/> 
	 				 <td><fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd"/></td>
	 				 <td>${list.readCount}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<button type="button" onclick="location.href='/board/regiView'">글쓰기</button>
</form>
</body>
</html>