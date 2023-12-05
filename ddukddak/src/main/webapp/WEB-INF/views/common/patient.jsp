<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

.patient-detail {
	width: 892px;
	height: 100%;
	flex-shrink: 0;
}	
.patient-note {
	width: 360px;
}

.search{
	background-image: url(/resources/images/Search.png);
	background-repeat: no-repeat;
	background-position: 252px center;
	width: 292px;
	height: 48px;
}

.dduk-vertical-line {
	height: 642px;
	margin-top: -18px;
	margin-left: 272px;
}

hr{
	margin: -8px 0 16px -16px;
	background: var(--border, #EBEFF0);
	height: 1px;
}

</style>
<script>
$(document).ready(function() {
	$('.aside-ams-patient').find('svg').find('path').attr('fill', '#0ABAB5');
	
	 var strPaName=( $('.paName').val()).substring(0,8);
});
</script>
<html>
	<div class="dduk-body-border patient-list">
		<div>
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
			<div class="dduk-x-pd8">
				<table class="patient-list-table">
					<tr class="tr-padding">
						<th class="td-padding gray-text" style="width:40px;">No</th>
						<th class="td-padding gray-text paName" style="width:120px;">이름</th>
						<th class="td-padding gray-text">생년월일</th>
					</tr>
					<c:forEach var="patient" items="${patientVOList}" varStatus="status">
						<tr class="tr-padding">
							<td class="td-padding">
								${status.count}
							</td>
							<td height="48px" class="td-padding">
								<c:choose>
							        <c:when test="${fn:length(patient.paName) gt 9}">
							        <c:out value="${fn:substring(patient.paName, 0, 7)}">
							        </c:out>...</c:when>
							        <c:otherwise>
							        <c:out value="${patient.paName}">
							        </c:out></c:otherwise>
								</c:choose>
							</td>
							<td class="td-padding">
								<c:choose>
							        <c:when test="${fn:substring(patient.paReg, 0, 1) gt 0}">
							        19<c:out value="${fn:substring(patient.paReg, 0, 2)}">
							        </c:out></c:when>
							        <c:otherwise>
							        20<c:out value="${fn:substring(patient.paReg, 0, 2)}">
							        </c:out></c:otherwise>
								</c:choose>
								-${fn:substring(patient.paReg, 2, 4)}-${fn:substring(patient.paReg, 4, 6)}
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>	
		</div>
		<input class="search dduck-input" placeholder="환자 이름을 검색해주세요">
	</div>
	
	<div class="dduk-body-border patient-detail"  style="position: relative;">
		<div class="dduk-title-area">
			<div class="d-flex align-items-center">
				<h2>노르망디 크롱스 블레이드</h2>
				<span class="gray-text mar-b-8 mar-l-8">남, 39세(1983-12-05)</span>
			</div>
			<div>
				<div class="d-flex patient-info">
					<div>
						<span class="gray-text">신장&nbsp;&nbsp;</span>180.6cm
					</div>
					<div>
						<span class="gray-text">체중&nbsp;&nbsp;</span>78.8kg
					</div>
					<div>
						<span class="gray-text">체온&nbsp;&nbsp;</span>36.8°C</div>
					</div>
			</div>
			<button class="dduk-btn-normal">상세보기</button>
		</div>
		<hr style="width: 892px;">
		<div class="d-flex">
			<div class="dduk-history">
				<div style="height: 520px;">
					<h3>진료 이력</h3>
					<div class="history-scroll">
						<div class="dduk-history-list">
							<div class="history-array">	
								<div>
									<div class="history-title">내원·2023-11-22(수)</div>
									<div>담당의 이은솔</div>
								</div>
								<button class="dduk-btn-active" style="height: 32px;"> 
									수납필요
								</button>
							</div>
							<div class="d-flex history-btn-list">
								<span class="history-btn">진료</span>
								<span class="history-btn">검사</span>
								<span class="history-btn">치료</span>
								<span class="history-btn">처방</span>
							</div>
						</div>
						<div class="dduk-history-list">
							<div class="history-array">	
								<div>
									<div class="history-title">내원·2023-11-22(수)</div>
									<div>담당의 이은솔</div>
								</div>
								<button class="dduk-btn-active" style="height: 32px;"> 
									수납필요
								</button>
							</div>
							<div class="d-flex history-btn-list">
								<span class="history-btn">진료</span>
								<span class="history-btn">검사</span>
								<span class="history-btn">치료</span>
								<span class="history-btn">처방</span>
							</div>
						</div>
						<div class="dduk-history-list">
							<div class="history-array">	
								<div>
									<div class="history-title">내원·2023-11-22(수)</div>
									<div>담당의 이은솔</div>
								</div>
								<button class="dduk-btn-active" style="height: 32px;"> 
									수납필요
								</button>
							</div>
							<div class="d-flex history-btn-list">
								<span class="history-btn">진료</span>
								<span class="history-btn">검사</span>
								<span class="history-btn">치료</span>
								<span class="history-btn">처방</span>
							</div>
						</div>
						<div class="dduk-history-list">
							<div class="history-array">	
								<div>
									<div class="history-title">내원·2023-11-22(수)</div>
									<div>담당의 이은솔</div>
								</div>
								<button class="dduk-btn-active" style="height: 32px;"> 
									수납필요
								</button>
							</div>
							<div class="d-flex history-btn-list">
								<span class="history-btn">진료</span>
								<span class="history-btn">검사</span>
								<span class="history-btn">치료</span>
								<span class="history-btn">처방</span>
							</div>
						</div>
					</div>
				</div>
				<hr style="width: 289px;">
				<div style="height: 239px;">
					<div class="spa-betw">
						<h3>문서 발급</h3>
						<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
							<g clip-path="url(#clip0_142_1806)">
							<path d="M18 13H13V18C13 18.55 12.55 19 12 19C11.45 19 11 18.55 11 18V13H6C5.45 13 5 12.55 5 12C5 11.45 5.45 11 6 11H11V6C11 5.45 11.45 5 12 5C12.55 5 13 5.45 13 6V11H18C18.55 11 19 11.45 19 12C19 12.55 18.55 13 18 13Z" fill="#8D9EA5"/>
							</g>
							<defs>
							<clipPath id="clip0_142_1806">
							<rect width="24" height="24" fill="white"/>
							</clipPath>
							</defs>
						</svg>
					</div>
					<div class="gap-ver-16 mar-t-8 p-8">
						<div class="spa-betw"><span class="text16">진단서</span><button class="dduk-btn-normal">발급하기</button></div>
						<div class="spa-betw"><span class="text16">소견서</span><button class="dduk-btn-disabled">발급완료</button></div>
						<div class="spa-betw"><span class="text16">처방전</span><button class="dduk-btn-danger">발급불가</button></div>
					</div>
				</div>
			</div>
			<div class="patient-record">
			
			</div>
		</div>
		
	</div>
	
		<div class="dduk-body-border patient-note">
	</div>
</html>