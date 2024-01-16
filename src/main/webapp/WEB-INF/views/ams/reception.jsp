<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
/* 어사이드 강조 */
.aside-ams-receipt{
	width: 196px;
	border-radius: 16px 0px 0px 16px;
	background: var(--bg-02, #DBF2F4);
	height: 56px;
	border-right: 4px solid var(--ci-01, #0ABAB5);
	margin-left: 4px;
	color: var(--ci-01, #0ABAB5);
}
/* 접수 페이지 전용 시작 */
.form-check-reception{
	margin-bottom: 52px;
	display: flex;
    gap: 40px;
/*     padding: 8px 16px; */
    margin-left: 16px;
}

.form-check-input:checked {
    background-color: #0ABAB5;
    border-color: #0ABAB5;
}

.info-input{
	height: 32px;
	margin-bottom: 45px;
	width: 180px;
}

.patient-info-div{
	gap: 18px;
	margin: 0px 10px 0px 10px;
	display: flex;
}
.patient-info-left{
	text-align: right;
	width: 80px;
}
.patient-info-right{
	text-align: left;
	width: 180px;
}

.in-h2{
	margin-bottom: 45px;
}
.patient-list{
	justify-content: normal;
	
}
.reception-center-div {
	height: 416px;
	width: 592px;
	margin-bottom: 8px;
}

.doctor-office-wrap {
	width: 660px;
}

.doctor-office{
	height: 365px;	
	width: 300px;
	float: left;
	margin: 4px 2px 4px 2px;
}

.search{
	background-image: url(/resources/images/Search.png);
	background-repeat: no-repeat;
	background-position: 372px center;
	width: 412px;
	height: 48px;
	margin-left: 18px;
}

.btn-state {
	font-size: 10.9px;
    padding: 4px 8px;
    width: 100%;
}
/* 자동 완성 창 */
.autocomplete{
position: absolute;
z-index: 1;
left: 740px;
top: 200px;
}

.autocomplete > div.active {
  background: #DBF2F4;
  color: #000;
  width: 400px;

}

.autocomplete > div {
  background: #f1f3f499;
  padding: .2rem .6rem;
  width: 400px;
}
/* 검색 창 강조 색 */
.option:hover{
	background-color:#EDF8F9;
}
/* 접수 페이지 전용 끝 */

/* 환자 선택 시 강조 */
.selected {
    background-color: #EDF8F9;
}

</style>
<html>
<body>
	<div class="dduk-body-border patient-list">
		<div class="dduk-title-area">
			<h2>환자 목록</h2>
			<br/>
			<div class="dduk-row">
				<div class="inner-tab" id="inner-tab1" style="border-bottom: 3px solid var(--ci-01, #0ABAB5);">
					<h3>대기</h3>
				</div>
				<div class="inner-tab" id="inner-tab2">
					<h3>완료</h3>
				</div>
			</div>
		</div>
<!-- 		대기환자 테이블 -->
		<div class="dduk-x-pd8">
		<table class="waiting" id="waiting">
			<tr class="tr-padding">
				<th class="td-padding gray-text" style="width:40px;">No</th>
				<th class="td-padding gray-text paName" style="width:90px;">이름</th>
				<th class="td-padding gray-text" style="width:90px">생년월일</th>
				<th class="td-padding gray-text" style="text-align:center">상태</th>
			</tr>
			<c:forEach var="patient" items="${waitingVOList}" varStatus="status">
				<tr class="tr-padding tr-patient-info" data-paNo="${patient.paNo}">
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
					<td class="td-padding">
			        	<c:if test="${patient.hsrpState=='RCST02'}">
				        	<button class='dduk-btn-disabled btn-state'>호출완료</button>
			        	</c:if>
			        	<c:if test="${patient.hsrpState=='RCST01'}">
			        	<button class='dduk-btn-info btn-state'>대기중</button>
			        	</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
		</div>
<!-- 		완료환자 테이블 -->
		<div class="dduk-x-pd8">
		<table class="complete" style="display:none;">
			<tr class="tr-padding">
				<th class="td-padding gray-text" style="width:40px;">No</th>
				<th class="td-padding gray-text paName" style="width:90px;">이름</th>
				<th class="td-padding gray-text" style="width:90px">생년월일</th>
				<th class="td-padding gray-text" style="text-align:center">상태</th>
			</tr>
			<c:forEach var="patient" items="${completeVOList}" varStatus="status">
				<tr class="tr-padding tr-patient-info" data-paNo="${completePatient.paNo}">
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
					<td>
						<button class="dduk-btn-danger btn-state" style="width: 57px;">진료완료</button>
					</td>
				</tr>
			</c:forEach>
		</table>
		</div>
	</div>
	
	
	<div>
		<div class="dduk-inner-border reception-center-div">
			<div class="dduk-title-area">
				<h2>환자 정보 조회<input type="text" id="search" class="dduck-input search" placeholder="환자 이름을 검색해주세요" autocomplete="off"></h2>
			</div>
			<div class="autocomplete"></div>
				<div class="patient-info-div">
				<input type="hidden" id="patientNo" name="patientNo"/>
					<div class="patient-info-left">
						<h2 class="in-h2">이름 : </h2>
						<h2 class="in-h2">나이 : </h2>
						<h2 class="in-h2">연락처 : </h2>
						<h2 class="in-h2">주소 : </h2>
					</div>
					<div class="patient-info-right">
						<input type="text" class="dduck-input info-input" id="patientName" disabled/>
						<input type="text" class="dduck-input info-input" id="patientAge" disabled/>
						<input type="text" class="dduck-input info-input" id="patientPh" disabled/>
						<input type="text" class="dduck-input info-input" id="patientAdd" disabled style="width:340px;"/>
					</div>
					<div class="patient-info-left">
						<h2 class="in-h2">성별 : </h2>
						<h2 class="in-h2">건강보험 : </h2>
						<h2 class="in-h2">예약여부 : </h2>
					</div>
					
					<div class="patient-info-right">
						<div class="form-check-reception">
							<span>
								<input type="radio" id="male" name="male" class="form-check-input" disabled/>
								<label for="male">남성</label>
							</span>
							<span>
								<input type="radio" id="female" name="female" class="form-check-input" disabled/>
								<label for="male">여성</label>
							</span>
						</div>
						
						<div class="form-check-reception">
							<span>
								<input type="radio" id="insrYes" name="insrYes" class="form-check-input" disabled/>
								<label for="insrYes">여</label>
							</span>
							<span>
								<input type="radio" id="insrNo" name="insrNo" class="form-check-input" disabled/>
								<label for="insrNo">부</label>
							</span>
						</div>
						
						<input type="hidden" value="" id="rsvtYN" name="rsvtYN">
						<div class="form-check-reception">
							<span>
								<input type="radio" id="rsvtYes" name="rsvtYes" class="form-check-input" disabled/>
								<label for="rsvtYes">여</label>
							</span>
							<span>
								<input type="radio" id="rsvtNo" name="rsvtNo" class="form-check-input" disabled/>
								<label for="rsvtNo">부</label>
							</span>
						</div>
						
						<button type="button" class="dduk-btn-active" id="btnAddReception" data-bs-toggle="modal" data-bs-target="#createReceptionModal"
						style="position: relative; left: 100px; top: 20px;">접수</button>
					</div>
				</div>
		</div>
		<div class="dduk-inner-border reception-center-div">
			<div class="dduk-title-area">
				<h2>오늘 예약 리스트</h2>
			</div>
			<div class="card-body table-responsive p-0" style="height: 250px;">
					<table class="table table-head-fixed text-nowrap">
						<thead>
							<tr class="tr-padding">
								<th>No</th>
								<th>예약시간</th>
								<th>이름</th>
								<th>담당의</th>
								<th>내원사유</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="reservation" items="${reservationVOList}" varStatus="status">
							<tr class="tr-padding tr-patient-reservation" data-paNo="${reservation.paNo}">
								<td class="td-padding gray-text">${status.count}</td>
<%-- 								<td class="td-padding gray-text"><fmt:formatDate value="${reservation.rsvtDt}" pattern="HH:mm"/></td> --%>
									<td class="td-padding gray-text">
									    <c:choose>
									        <c:when test="${reservation.rsvtTime == 1}">
									           09:00
									        </c:when>
									        <c:when test="${reservation.rsvtTime == 2}">
									           09:30
									        </c:when>
									        <c:when test="${reservation.rsvtTime == 3}">
									           10:00
									        </c:when>
									        <c:when test="${reservation.rsvtTime == 4}">
									           10:30
									        </c:when>
									        <c:when test="${reservation.rsvtTime == 5}">
									           11:00
									        </c:when>
									        <c:when test="${reservation.rsvtTime == 6}">
									           11:30
									        </c:when>
									        <c:when test="${reservation.rsvtTime == 7}">
									           13:00
									        </c:when>
									        <c:when test="${reservation.rsvtTime == 8}">
									           13:30
									        </c:when>
									        <c:when test="${reservation.rsvtTime == 9}">
									           14:00
									        </c:when>
									        <c:when test="${reservation.rsvtTime == 10}">
									           14:30
									        </c:when>
									        <c:when test="${reservation.rsvtTime == 11}">
									           15:00
									        </c:when>
									        <c:when test="${reservation.rsvtTime == 12}">
									           15:30
									        </c:when>
									        <c:when test="${reservation.rsvtTime == 13}">
									           16:00
									        </c:when>
									        <c:when test="${reservation.rsvtTime == 14}">
									           16:30
									        </c:when>
									        <c:when test="${reservation.rsvtTime == 15}">
									           17:00
									        </c:when>
									        <c:when test="${reservation.rsvtTime == 16}">
									           17:30
									        </c:when>
									    </c:choose>
									</td>
								<td class="td-padding gray-text">${reservation.paName}</td>
								<td class="td-padding gray-text">${reservation.empName}</td>
								<td class="td-padding gray-text">${reservation.rsvtReason}</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
		</div>
	</div>
	
	<div class="dduk-body-border doctor-office-wrap"  style="position: relative;">
		<div class="dduk-title-area">
			<h2>진료실 현황</h2>
		</div>
		<c:forEach var="docOfficeVO" items="${docOfficeVOList}" varStatus="stat">
		<div class="dduk-inner-border doctor-office">
			<div class='dduk-row'>
				<h3>진료실 ${stat.count}</h3><p class="doctor-office-name">담당의 : ${docOfficeVO.empName}</p>
			</div>
			<div>
				<table style="margin-left:10px;">
					<tr class="tr-padding">
						<th class="td-padding gray-text paName" style="width:90px;">이름</th>
						<th class="td-padding gray-text" style="width:110px">생년월일</th>
						<th class="td-padding gray-text" style="text-align:center">상태</th>
					</tr>
					<c:forEach var="patient" items="${docOfficePatientList}" varStatus="status">
						<c:if test="${patient.empNo == docOfficeVO.empNo}">
						<tr class="tr-padding">
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
							<td class="td-padding">
								<c:if test="${patient.hsrpState=='RCST01'}">
									<button class='dduk-btn-disabled btn-state'>대기중</button>
								</c:if>
								<c:if test="${patient.clinicState=='CRST01'}">
									<button class='dduk-btn-active btn-state'>진료중</button>
								</c:if>
								<c:if test="${patient.clinicState=='CRST02'}">
									<button class='dduk-btn-info btn-state'>검사중</button>
								</c:if>
								<c:if test="${patient.clinicState=='CRST03'}">
									<button class='dduk-btn-danger btn-state'>검사완료</button>
								</c:if>
								<c:if test="${patient.clinicState=='CRST05'}">
									<button class='dduk-btn-disabled btn-state'>검사대기</button>
								</c:if>
								<c:if test="${patient.clinicState=='CRST06'}">
									<button class='dduk-btn-disabled btn-state'>처치대기</button>
								</c:if>
								<c:if test="${patient.clinicState=='CRST07'}">
									<button class='dduk-btn-info btn-state'>처치중</button>
								</c:if>
								<c:if test="${patient.clinicState=='CRST08'}">
									<button class='dduk-btn-danger btn-state'>처치완료</button>
								</c:if>
							</td>
						</tr>
						</c:if>
					</c:forEach>
				</table>
			</div>
		</div>
		</c:forEach>
	</div>
	
	<!-- 모달 임포트 -->
	<c:import url="../common/modal.jsp"></c:import>
<script>
$(document).ready(function() {
	$('.aside-ams-receipt').find('svg').find('path').attr('fill', '#0ABAB5');
	$('.aside-ams-receipt').find('.dduk-nav-menu').css('color', '#0ABAB5');
});

// 검색 로직 시작
var dataList = [];


const $search = document.querySelector("#search");
const $autoComplete = document.querySelector(".autocomplete");

let nowIndex = 0;

$search.onkeyup = (event) => {
  // 검색어
  const value = $search.value.trim();

  // 자동완성 필터링
  const matchDataList = value
    ? dataList.filter((label) => label.includes(value))
    : [];

  switch (event.keyCode) {
    // UP KEY
    case 38:
      nowIndex = Math.max(nowIndex - 1, 0);
      break;

    // DOWN KEY
    case 40:
      nowIndex = Math.min(nowIndex + 1, matchDataList.length - 1);
      break;


    // ENTER KEY
    case 13:
      document.querySelector("#search").value = matchDataList[nowIndex].match(/[ㄱ-ㅎㅏ-ㅣ가-힣]+/g).join(" ") || "";
	  var patientId = matchDataList[nowIndex].substring(0,6);
	  console.log(patientId);
	  searchPatientByNo(patientId);
	  $("#rsvtYN").val("RCTY01");
      // 초기화
      nowIndex = 0;
      matchDataList.length = 0;
      break;
      
    // 그외 다시 초기화
    default:
      nowIndex = 0;
      break;
  }

  // 리스트 보여주기
  showList(matchDataList, value, nowIndex);
};

const showList = (data, value, nowIndex) => {
  // 정규식으로 변환
  const regex = new RegExp("(" + value + ")", "g");
  
  $autoComplete.innerHTML = data
  .map(function(label, index) {
    return "<div class='" + (nowIndex === index ? "active" : "") + "'>" +
      label.replace(regex, "<mark>$1</mark>") +
      "</div>";
  })
  .join("");
};

//검색 로직 끝
//주민번호를 생년월일로 변환
function formatResidentNumber(residentNumber) {
	
	// 00~39년생은 20을 붙이고 그 외엔 19를 붙인다
    let year = "";
    if(Number(residentNumber.substr(0,1)) <= 3){
    	year += "20";
    } else {
    	year += "19";
    }
    year += residentNumber.substr(0,2);
    
    
    let month = residentNumber.substr(2,2);
    let day = residentNumber.substr(4,2);
    
    let birthDay = year + "-" + month + "-" + day;
    return birthDay;
}

//생년월일로 만 나이 구하기
function getAge(paBirthDay) {
	
	// 현재날짜, 생일로 날짜계산
    const currentDate = new Date();
    const birthdateDate = new Date(paBirthDay);
    let age = currentDate.getFullYear() - birthdateDate.getFullYear();

    // 현재와 생일의 월, 날짜 얻어주기
	const currentMonth = currentDate.getMonth();
	const birthdateMonth = birthdateDate.getMonth();
	const currentDay = currentDate.getDate();
	const birthdateDay = birthdateDate.getDate();

	// 현재 날짜가 생년월일보다 앞 날짜면 아직 생일이 오지 않은 상태임(한살빼기)
	if (currentMonth <= birthdateMonth && currentDay < birthdateDay) {
   		age--;
	}
    return age;
}

var birthDay = "";

//환자 아이디로 환자 정보 가져오고 인풋창에 세팅
function searchPatientByNo(paNo){
	$.ajax({
		url: "/ams/searchPatientByNo",
		contentType:"application/json;charset=utf-8",
		data:paNo,
		type: 'post',
		beforeSend:function(xhr){
		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(rst){
			//주민번호 => 생년월일
			birthDay = formatResidentNumber(rst.paReg);
			//생년월일=> 나이
			let age = getAge(birthDay);
			
			//환자 번호 hidden에 넣기
			$("#patientNo").val(rst.paNo);
			
			$("#patientName").html("");
			$("#patientAge").html("");
			$("#patientPh").html("");
			$("#patientAdd").html("");
			$("#male").attr("checked",false);
			$("#female").attr("checked",false);
			$("#insrYes").attr("checked",false);
			$("#insrNo").attr("checked",false);					
			$("#rsvtYes").attr("checked",false);
			$("#rsvtNo").attr("checked",false);					
			
			$("#patientName").val(rst.paName);
			$("#patientAge").val("만 " + age + "세");
			$("#patientPh").val(rst.paPh);
			$("#patientAdd").val(rst.paAdd1 + " " + rst.paAdd2);
			if(rst.paSex===('남')){
				$("#male").prop("checked",true);
			}else{
				$("#female").prop("checked",true);
			}
			
			if(rst.paInsrYn===('ISYN01')){
				$("#insrYes").prop("checked",true);
			}else{
				$("#insrNo").prop("checked",true);
			}
			
			if($("#rsvtYN").val()===('RCTY02')){
				$("#rsvtYes").prop('checked',true);
			}
			else{
				$("#rsvtNo").prop('checked',true);
			}
			
			$("#search").val("");
		},
		error: function(xhr, status, error){
			console.log('Error:', xhr, status, error);
		}
	});
};

$(document).ready(function() {
	//자동 검색 데이터 불러오기
	$.ajax({
			url: "/ams/getPatientList",
			dataType: 'json',
			type: 'get',
			beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success: function(rst){
				$.each(rst, function(index,vo){
					let str = "";
					$.each(vo, function(index, column){
						if(index == 'paName'){
							str += (column + ' ');
						}
						if(index == 'paNo'){
							str += (column + ' ');
						}
						if(index == 'paPh'){
							str += (column);
						}
					})
					dataList.push(str);
				})
				console.log(dataList);
			},
			error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
			}
	});

	//환자 클릭시 이벤트
	$(document).on("click", ".tr-patient-info", function() {
		// 환자 번호 저장
		let paNo = $(this).data('pano');
		// 이전에 선택된 요소의 클래스 초기화
        $(".tr-patient-info").removeClass("selected");
        //현재 클릭한 요소에 select클래스 추가
        $(this).addClass("selected");
        // 모달창에 값 넣기
        searchPatientByNo(paNo);
	});
	
	//예약환자 클릭시 이벤트
	$(document).on("click", ".tr-patient-reservation", function() {
		// 환자 번호 저장
		let paNo = $(this).data('pano');
		
// 		// 이전에 선택된 요소의 클래스 초기화
//         $(".tr-patient-info").removeClass("selected");
//         //현재 클릭한 요소에 select클래스 추가
//         $(this).addClass("selected");
        
        $("#rsvtYN").val("RCTY02");
        searchPatientByNo(paNo);
	});
	
	//접수 저장 버튼 클릭 시
	$("#btnSaveReception").on('click',function(){
		let docNo = $('#doctorList option:selected').attr('data-docNo');
		let hsrpReason = $("#reasonForVisit").val();
		let patientNo = $("#patientNo").val();
		let hsrpType = $("#rsvtYN").val();
		console.log(hsrpType);
		
		let hospitalReceptionVO = {
				"hsrpReason":hsrpReason,
				"paNo":patientNo,
				"empNo":docNo,
				"hsrpType":hsrpType}
		
		$.ajax({
			url: "/ams/addReception",
			type: 'post',
			data: JSON.stringify(hospitalReceptionVO),
			contentType:"application/json;charset=utf-8",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success: function(rst){
				$("#createReceptionModal").modal('hide');
				$(".fade").attr('style', 'display: none');
				if(rst>0){
	           		Swal.fire({
	                    title: '접수 성공',
	                    icon: 'success',
	                    showCancelButton: false,
	                    confirmButtonColor: '#0ABAB5',
	                    cancelButtonColor: '#8D9EA5',
	                    confirmButtonText: '확인',
	                    cancelButtonText: '취소'
	                 }).then((result) => {
	                    // 확인버튼 클릭시
	                    if (result.isConfirmed) {
	                    	//waiting 테이블의 마지막 tr의 첫번째 td의 값(text)를 가져와서 int로 파싱 후 +1
	                    	let no = 0;
	                    	var lastText = $('.waiting tr:last td:first').text();
	                    	if (!isNaN(parseInt(lastText))) {
	                    	    no = parseInt(lastText) + 1;
	                    	} else {
	                    	    no = 1;
	                    	}
	                    	let name = $('#patientName').val();
	                    	
	                    	
	                    	let str = "";
                    		str += "<tr class='tr-padding'>";
                    		str += "<td class='td-padding'>"+no+"</td>";
                    		str += "<td class='td-padding'>"+name+"</td>";
                    		str += "<td class='td-padding'>"+birthDay+"</td>";
                    		str += "<td class='td-padding'><button class='dduk-btn-info btn-state'>대기중</button></td>'";
                   			str += "</tr>";
	                    	$('.waiting').append(str);
	                    	
	                    	let docName = $('#doctorList option:selected').val();
	                    	console.log(docName);
	                    	str = "";
		                    str += "<tr class='tr-padding'>"
		                    str += "<td height='48px' class='td-padding'>"+name+"</td>";
		                    str += "<td class='td-padding'>"+birthDay+"</td>";
		                    str += "<td class='td-padding'>"
		                    str += "<button class='dduk-btn-disabled btn-state'>대기중</button>"
		                    str += "</td>"
		                    str += "</tr>"
	                    	
							var doctorOfficeName = "";
	                    	$(".doctor-office").each(function() {
	                    	    doctorOfficeName = $(this).find('.doctor-office-name').text();
	                    	    doctorOfficeName = doctorOfficeName.substring(6); // 7번째부터 끝까지 자르기
	                    	    if (docName === doctorOfficeName) {
	                    	    	$(this).find('tbody').append(str); // 또는 $(this).children('tr:last').append(str);
	                    	        console.log(doctorOfficeName);
	                    	    }
	                    	});
	                    	
							
							}
						})
				}
			},
			error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
				$("#createReceptionModal").modal('hide');
				$(".fade").attr('style', 'display: none');
				Swal.fire({
	                  title: '환자를 선택하지 않았거나 이미 접수된 환자입니다.',
	                  icon: 'error',
	                  showCancelButton: false,
	                  confirmButtonColor: '#0ABAB5',
	                  cancelButtonColor: '#8D9EA5',
	                  confirmButtonText: '확인',
	                  cancelButtonText: '취소'
					});
			}
		});
	});
	
	 //대기 버튼을 누르면 완료가 사라짐
	 $('#inner-tab1').click(function(){
		$('.waiting').attr('style', 'display: block');
		$('.complete').attr('style', 'display: none');
		$('#inner-tab1').attr('style', 'border-bottom: 3px solid var(--ci-01, #0ABAB5)' );
		$('#inner-tab2').attr('style', 'border-bottom: 0px solid var(--ci-01, #0ABAB5)' );
	 });
	 //완료 버튼을 누르면 대기가 사라짐
	 $('#inner-tab2').click(function(){
		$('.complete').attr('style', 'display: block');
		$('.waiting').attr('style', 'display: none');
		$('#inner-tab1').attr('style', 'border-bottom: 0px solid var(--ci-01, #0ABAB5)' );
		$('#inner-tab2').attr('style', 'border-bottom: 3px solid var(--ci-01, #0ABAB5)' );
	 });
});

// 접수 버튼 누를 때 마다 접수내부 모달textarea 초기화
var addReceptionBtn = document.querySelector('#btnAddReception');
addReceptionBtn.addEventListener('click',function(event){
	$("#reasonForVisit").val("");
})

// $('#createReceptionModal').on('show.bs.modal', function (event) {
//     if ($('#patientName').val() === "") {
//         event.preventDefault(); // 모달 열리는 기본 동작 중지
//     }
// });
</script>
</body>
</html>