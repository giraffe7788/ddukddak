<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>


h1 {
	margin-top: 0;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	border: 1px solid #dddddd;
	text-align: left;
	padding: 8px;
}

th {
	background-color: #f2f2f2;
}

button {
	margin-top: 20px;
	padding: 10px 20px;
	font-size: 16px;
	background-color: #007bff;
	color: #ffffff;
	border: none;
	cursor: pointer;
}

button:hover {
	background-color: #0056b3;
}
</style>
<div class="dduk-body-border">
	<h1>공지사항</h1>
	<table>
		<thead>
			<tr>
				<th>번호</th>
<!-- 				<th>작성자</th> -->
				<th>제목</th>
				<th>작성일</th>
<!-- 				<th>파일 코드</th> -->
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="notice">
				<tr>
					<td>${notice.noticeNo}</td>
					<%--                         <td>${notice.empNo}</td> --%>
					<td>${notice.noticeTitle}</td>
					<td><fmt:formatDate value="${notice.noticeDt}" /></td>
					<%--                         <fmt:parseDate value="${list.reg_date}" var="noticeDt" pattern="yyyyMMddHHmmss"/>  --%>
					<%-- 	 				 <td><fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd"/></td> --%>
<%-- 					<td>${notice.noticeViews}</td> --%>
					<td>${notice.atchFileCd}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<button type="button" onclick="location.href='/notice/write'">글쓰기</button>
</div>
