<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>
<style>
.aside-ams-patient{
	width: 196px;
	border-radius: 16px 0px 0px 16px;
	background: var(--bg-02, #DBF2F4);
	height: 56px;
	border-right: 4px solid var(--ci-01, #0ABAB5);
	margin-left: 4px;
	color: var(--ci-01, #0ABAB5);
}

.patient-list {
	width: 324px;
	height: 100%;
	flex-shrink: 0;
}
.patient-detail {
	width: 892px;
	height: 100%;
	flex-shrink: 0;
}	
.patient-note {
	width: 360px;
}

</style>
<script>
$(document).ready(function() {
	$('.aside-ams-patient').find('svg').find('path').attr('fill', '#0ABAB5');
});
</script>
<html>
	<div class="dduk-body-border patient-list">
		<div class="dduk-title-area">
			<h2>환자 목록</h2>
			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
				<g clip-path="url(#clip0_142_1638)">
					<path d="M18 13H13V18C13 18.55 12.55 19 12 19C11.45 19 11 18.55 11 18V13H6C5.45 13 5 12.55 5 12C5 11.45 5.45 11 6 11H11V6C11 5.45 11.45 5 12 5C12.55 5 13 5.45 13 6V11H18C18.55 11 19 11.45 19 12C19 12.55 18.55 13 18 13Z" fill="#8D9EA5"/>
				</g>
				<defs>
				<clipPath id="clip0_142_1638">
					<rect width="24" height="24" fill="white"/>
				</clipPath>
				</defs>
			</svg>
		</div>
		<table class="patient-list-table">
			<tr>
				<th class="patient-list-th gray-text">No</th>
				<th class="patient-list-th gray-text" style="width:120px;">이름</th>
				<th class="patient-list-th gray-text">생년월일</th>
			</tr>
			<c:forEach var="patient" items="${patientVO}">
				<tr>
					<td></td>
					<td>${patientVO.paName}</td>
					<td></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	<div class="dduk-body-border patient-detail">
		<div class="dduk-title-area">
			<h2>노르망디 크롱스 블레이드</h2>
		</div>
	</div>
	
		<div class="dduk-body-border patient-note">
	</div>
</html>