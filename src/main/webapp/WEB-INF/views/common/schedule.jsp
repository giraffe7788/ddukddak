<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.fc-col-header-cell-cushion, .fc-daygrid-day-number {
    color: #000000 !important;
}

#calendar-container {
	width:750px;
	height:720px;
}

.fc .fc-daygrid-more-link {
	font-size: 12px !important;
}

.fc .fc-daygrid-day-number {
	font-size: 13px !important;
}

.fc-daygrid-block-event .fc-event-title {
	font-size: 12px !important;
}

.fc .fc-toolbar-title {
	font-size: 18px !important;
}

.fc .fc-toolbar.fc-header-toolbar {
    margin-bottom: 4px !important;
}

.fc .fc-button-primary {
    background-color: transparent !important;
    border-color: transparent !important;
    color: #000000 !important;
}

.fc .fc-button-primary:hover {
    background-color: transparent !important;
    border-color: transparent !important;
    color: #0ABAB5 !important;
}

.dduk-body-border {
	height: 100% !important;
}

.dduk-dir-col {
	display: flex;
    flex-direction: column;
    gap: 16px;
    width: 40%;
}

.dduck-input {
	height: 30px;
}

.patient-info-div {
	display: flex;
	padding: 16px 8px;
	justify-content: space-between;
}

.patient-info-cal {
	display: flex;
    width: 40%;
    justify-content: space-between;
}

.patient-info-left {
	display: flex;
    gap: 26px;
    flex-direction: column;
}

.patient-info-right {
	display: flex;
    flex-direction: column;
    gap: 16px;
    width: 160px;
}

.form-check-reception {
	display: flex;
    gap: 32px;
}

.autocomplete {
	display: none;
    position: absolute;
    gap: 8px;
    left: 1320px;
    padding: 8px 16px 16px 16px;
    flex-direction: column;
    z-index: 10;
}

.autocomplete > div {
	padding: 8px;
  	background: #ffffff;
  	color: #000;
  	width: 290px;
}

.autocomplete > div.active {
	padding: 8px;
 	background: transparent;
  	color: #000;
}

#reservDoctorList {
	font-size: 18px;
    border: none;
    margin-top: -8px;
    margin-left: 8px;
}

:focus-visible {
    outline: -webkit-focus-ring-color auto 0px;
}

.scheduleArea {
    width: 100%;
    height: 700px;
    overflow-y : scroll;
    position: relative;
}

.timeLine {
	height: calc(100% - 50px);
    width: 100px;
    display: flex;
    gap: 77px;
    flex-direction: column;
}

.schdualTable {
	width: calc(100% - 100px);
    height: 100%;
    display: flex;
    justify-content: space-around;
}

.schedualDiv {
	width: 100%;
    height: 50px;
    display: flex;
    padding: 8px 0px 0px 100px;
    justify-content: space-around;
}

.schedualDiv > div {
	font-size: 16px;
}

.timeTable {
	height: fit-content;
    width: 40%;
    display: flex;
    flex-direction: column;
    gap: 8px;
}

.timePic {
	width: 100%;
	height: 90px;
	border-radius: 16px;
	background-color: transparent;
	padding: 16px;
}

.timePic-disabled {
	width: 100%;
	height: 90px;
	border-radius: 16px;
	background-color: transparent !important;
	padding: 16px;
}

.selected {
	box-shadow: 0 0 0 3px #0ABAB5 inset;
}

.search {
    background-image: url(/resources/images/Search.png);
    background-repeat: no-repeat;
    background-position: 262px center;
    height: 40px;
    margin-left: 18px;
}

.picPaName {
	font-size: 16px;
}

.waiting-text {
	position: absolute;
    top: 180px;
    left: 240px;
    font-size: 20px;
}

.full-day {
	padding: 16px;
	height: 1758px;
	width: 100%;
	border-radius: 16px;
	background-color: #FAFAD2;
}

.partTime {
	padding: 16px;
	width: 100%;
	border-radius: 16px;
	background-color: #FAFAD2;
}

.fc-saveEvent-button, .fc-calButton-button {
	display: none !important; 
}

.fc-day-today {
	background-color: #EDF8F9 !important;
}

.header-schedule-icon {
	border-radius: 16px;
    background: var(--bg-02, #DBF2F4);
}
</style>

<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<!-- sweetalert -->
<script src="/resources/fullcalendar-6.1.10/sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<div class="dduk-body-border">
	<div class="dduk-title-area">
		<h2>월간 일정</h2>
		<div class="d-flex">
			<select id="reservDoctorList" class="reservDoctorList">
			</select> <h2>의사</h2>
		</div>
	</div>
	<div id='calendar-container'>
	    <div id='calendar'></div>
	</div>
</div>
	
<div class="dduk-dir-col">
	<div class="dduk-body-border w-100 h-100">
		<div class="dduk-title-area" style="margin-bottom: -8px;">
			<div class="d-flex">
				<h2 class="schedualDate">날짜를 선택해주세요</h2>
				
			</div>
		</div>
		<div>
			<div class="schedualDiv">
				<div>진료</div>
				<div>외부일정</div>
			</div>
			<div class="scheduleArea d-flex">
				<div class="timeLine">
					<div>9:00</div>
					<div>9:30</div>
					<div>10:00</div>
					<div>10:30</div>
					<div>11:00</div>
					<div>11:30</div>
					<div>12:00</div>
					<div>12:30</div>
					<div>13:00</div>
					<div>13:30</div>
					<div>14:00</div>
					<div>14:30</div>
					<div>15:00</div>
					<div>15:30</div>
					<div>16:00</div>
					<div>16:30</div>
					<div>17:00</div>
					<div>17:30</div>
					<div>18:00</div>
				</div>
				<div class="schdualTable">
					<div class="timeTable" id="clinicTable">
						<div>
							<div class="waiting-text gray-text">날짜를 선택해주세요</div>
						</div>
					</div>
					<div class="timeTable" id="scheduleTable">
					</div>
				</div>
			</div>
		</div>
	
	</div>
	
</div>


<!-- 	모달	 -->
	<c:import url="../common/modal.jsp"></c:import>

<script>
var today = new Date();
var year = today.getFullYear();
var month = ('0' + (today.getMonth() + 1)).slice(-2);
var day = ('0' + today.getDate()).slice(-2);
var year2 = String(year).substring(2,4);	

var dateString = year + '-' + month  + '-' + day;

var hours = ('0' + today.getHours()).slice(-2); 
var minutes = ('0' + today.getMinutes()).slice(-2);
var seconds = ('0' + today.getSeconds()).slice(-2); 

var timeString = hours + ':' + minutes;
$(document).ready(function() {
	$('.fc-day-today').addClass('selected');
	
	//의사 리스트 가져오기
	$.ajax({
		url: "/emp/getDoctorList",
		dataType: 'json',
		type: 'get',
		beforeSend:function(xhr){
		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(rst){
			console.log('getDoctorList', rst);
			
			let reservDoc = "<option value='whole'>전체</option>";
			
			$.each(rst, function(idx){
				reservDoc += `
					<option value="\${rst[idx].empNo}">\${rst[idx].empName}</option>
				`;
			});
			$('#reservDoctorList').append(reservDoc);
			
		},
		error: function(xhr, status, error){
			console.log('Error:', xhr, status, error);
		}
	});

})


// 달력 자리 지정
const calendarEl = $('#calendar')[0];
// 현재 날짜 불러와서 문자 형태 맞추기
document.addEventListener('DOMContentLoaded', function() {
	$('.header-schedule-icon').find('path').attr('fill', '#00A9A4');
	
	$('.fc-day-today').addClass('selected');
	loadCalendar();
	
	});
	
	
	//의사 select 값 바꾸기 이벤트
	 $('#reservDoctorList').change(function() {
		 $('#timePic1').removeClass('timePic-disabled');
		 $('#timePic16').removeClass('timePic-disabled');
		 let rsvtDt = $('.fc-day.selected').data('date');
		 let empNo = $("#reservDoctorList option:selected").val();
		 if(empNo == 'whole') {
			 loadCalendar();
			 $('.timeTable').html("");
		 } else {
			 $('.timeTable').html("");
			 getReservationList(rsvtDt);
			 selectByDate(empNo, rsvtDt);
			 loadEmpCalendar(empNo);
		 }
	 });
	
	
	//캘린더 날짜 클릭 이벤트!!!!
	$(document).on("click",".fc-day", function(){
		
		 var today = new Date();

		 var year = today.getFullYear();
		 var month = ('0' + (today.getMonth() + 1)).slice(-2);
		 var day = ('0' + today.getDate()).slice(-2);
		 var year2 = String(year).substring(2,4);	
		 
		 
		 var dateString = year + '-' + month  + '-' + day;
		 
		 var hours = ('0' + today.getHours()).slice(-2); 
		 var minutes = ('0' + today.getMinutes()).slice(-2);
		 var seconds = ('0' + today.getSeconds()).slice(-2); 

		 var timeString = hours + ':' + minutes;
		
		let rsvtDt = $(this).data('date');
		let empNo = $("#reservDoctorList option:selected").val();
		var dateObject = new Date(rsvtDt);
		
		$('#scheduleTable').html("");
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
		$('.schdualTable').attr('data-reserv','0');
		
		let clinicTable = `
			<div id="timePic1" class="timePic" data-strtime="09:00" data-endtime="09:30" data-rsvttime="1"> </div>
			<div id="timePic2" class="timePic" data-strtime="09:30" data-endtime="10:00" data-rsvttime="2"> </div>
			<div id="timePic3" class="timePic" data-strtime="10:00" data-endtime="10:30" data-rsvttime="3"> </div>
			<div id="timePic4" class="timePic" data-strtime="10:30" data-endtime="11:00" data-rsvttime="4"> </div>
			<div id="timePic5" class="timePic" data-strtime="11:00" data-endtime="11:30" data-rsvttime="5"> </div>
			<div id="timePic6" class="timePic" data-strtime="11:30" data-endtime="12:00" data-rsvttime="6"> <div></div></div>
			<div class="timePic-disabled" data-rsvttime="" style="height: 188px; background-color: rgb(224, 230, 233) !important;">점심시간</div>
			<div id="timePic7" class="timePic" data-strtime="13:00" data-endtime="13:30" data-rsvttime="7"> </div>
			<div id="timePic8" class="timePic" data-strtime="13:30" data-endtime="14:00" data-rsvttime="8"> </div>
			<div id="timePic9" class="timePic" data-strtime="14:00" data-endtime="14:30" data-rsvttime="9"> </div>
			<div id="timePic10" class="timePic" data-strtime="14:30" data-endtime="15:00" data-rsvttime="10"> </div>
			<div id="timePic11" class="timePic" data-strtime="15:00" data-endtime="15:30" data-rsvttime="11"> </div>
			<div id="timePic12" class="timePic" data-strtime="15:30" data-endtime="16:00" data-rsvttime="12"> </div>
			<div id="timePic13" class="timePic" data-strtime="16:00" data-endtime="16:30" data-rsvttime="13"> </div>
			<div id="timePic14" class="timePic" data-strtime="16:30" data-endtime="17:00" data-rsvttime="14"> </div>
			<div id="timePic15" class="timePic" data-strtime="17:00" data-endtime="17:30" data-rsvttime="15"> </div>
			<div id="timePic16" class="timePic" data-strtime="17:30" data-endtime="18:00"  data-rsvttime="16"> </div>
		`;
		
		$('#clinicTable').html("");
		$('#clinicTable').append(clinicTable);
		
		$(".abled").removeClass("selected");
		$('.fc-day').removeClass('selected');
		$(this).addClass('selected');
		
		let calMonth = rsvtDt.substring(5,7);
		let calDay = rsvtDt.substring(8,10);
		
		$('.schedualDate').html("");
		$('.schedualDate').append(calMonth+"월 "+calDay+"일 ");
		
		$('#reservRsvtDt').val(rsvtDt);
		
		console.log('이건 돼?',empNo);
		
		 if(empNo == 'whole') {
			 let timeDiv = `
				 <div>
					<div class="waiting-text gray-text">의사를 선택해주세요</div>
				</div>
			 `
			 $('.timeTable').html(timeDiv);
		 } else {
			 console.log('이거는?',empNo, rsvtDt); 
			//예약 리스트 가져오기
			getReservationList(rsvtDt);
			selectByDate(empNo, rsvtDt);
		 }
		
	});
	
	
	


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

//환자 클릭시 이벤트
$(document).on("click", ".tr-patient-info", function() {
	// 환자 번호 저장
	let paNo = $(this).data('pano');
	// 이전에 선택된 요소의 클래스 초기화
    $(".tr-patient-info").removeClass("selected");
    //현재 클릭한 요소에 select클래스 추가
    $(this).addClass("selected");
    
    //예약이 없음을 알기 위한 값
    $("#rsvtYN").val("RCTY01");
    
    searchPatientByNo(paNo);
});

//전체 달력 로드 이벤트
function loadCalendar() {
	$('#calendar').html("");
	// 달력 세부 설정
	const calendar = new FullCalendar.Calendar(calendarEl, {
		// 한국 언어, 시간 설정
		locale : 'ko',
		timeZone: 'Asia/Seoul',
		height: '720px',
		// 화면에 맞게 높이 재설정
		expandRows : true,
		// 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
		dayMaxEvents: true,
		// 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
		initialView : 'dayGridMonth',
		// 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
		navLinks : false,
		eventDataTransform: function(event) {                                                                                                                                
			  if(event.allDay) {                                                                                                                                               
			    event.end = moment(event.end).add(1, 'days')                                                                                                                 
			  }
			  return event;  
			},   
		// +more 표시 전 최대 이벤트 갯수, true는 셀 높이에 의해 결정
		dayMaxEvents: true,
		// 버튼 만들기
		customButtons : {
			calButton : {
				text : "캘린더",
				click : function() {
					calendar1.refetchEvents();
				}
			},
			saveEvent : {
				text : "일정 추가 +",
				click : function() {
					// 의사나 원무과인지 확인
					authCheck();
					// 모달 열기
					$("#createSchModal").modal("show");
					calendar1.refetchEvents();
				}
			}
		},
		// 해더에 표시할 툴바
		headerToolbar : {
			left : 'calButton prev,next',
			center : 'title',
			right : 'saveEvent'
		},

		
	});
	// 달력 띄우기
	calendar.render();
	
	// 달력 DB 로딩
	let listData = { year : year };
	
	$.ajax({
		url:"/calendar/schList",
		type:"post",
		data: listData,
		dataType: "JSON",
		async: false,
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
		success : function(data, status, xhr){
			
			$.each(data, function(key, value){
				// DB에서 가져온 일정 리스트 배치
				dsNo = data[key].dsNo;
				start = data[key].dsStrDate;
				end = data[key].dsEndDate;
				content = data[key].dsCont;
				dbCate = data[key].dsCate; // if => color
					if(dbCate === '진료'){
						color = "#0ABAB5";
					}else if(dbCate === '수술'){
						color = "#cce6ff";
					}else if(dbCate === '검사'){
						color = "#d9ccff";
					}else if(dbCate === '연구'){
						color = "#DBF2F4";
					}else{
						color = "#ffcccc";
					}
				isAllDay = data[key].dsAd; // if => allDay
					if(isAllDay == '0'){
						isAllDay = $('input[name="allDay"]').val(false);
					}else{
						isAllDay = $('input[name="allDay"]').val(true);
					}
				
				let eventData = {
				    start: start,
				    end: end,
				    title: content,
				    color: color,
				 	// 종일 여부에 따라 true 또는 false 설정
				    allDay: (isAllDay === 'true'),
				    id : dsNo,
				    groupId : dbCate,
				};
				
				// month 달력에 이벤트 추가
				calendar.addEvent(eventData);
				calendar.render();
				
			});
			
		}, error : function(xhr, status, error){
		  Swal.fire({
			   	title: '데이터 로딩 실패',
			   	text: '새로고침 해주세요.',
			   	icon: 'error',
			   	confirmButtonColor: '#0ABAB5',
			   	confirmButtonText: '확인',
			})
			return;
	  }
	});
};

//의사선택 달력 로드 이벤트
function loadEmpCalendar(empNo) {
	$('#calendar').html("");
	// 달력 세부 설정
	const calendar = new FullCalendar.Calendar(calendarEl, {
		// 한국 언어, 시간 설정
		locale : 'ko',
		timeZone: 'Asia/Seoul',
		height: '720px',
		// 화면에 맞게 높이 재설정
		expandRows : true,
		// 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
		dayMaxEvents: true,
		// 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
		initialView : 'dayGridMonth',
		// 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
		navLinks : false,
		eventDataTransform: function(event) {                                                                                                                                
			  if(event.allDay) {                                                                                                                                               
			    event.end = moment(event.end).add(1, 'days')                                                                                                                 
			  }
			  return event;  
			},   
		// +more 표시 전 최대 이벤트 갯수, true는 셀 높이에 의해 결정
		dayMaxEvents: true,
		// 버튼 만들기
		customButtons : {
			calButton : {
				text : "캘린더",
				click : function() {
					calendar1.refetchEvents();
				}
			},
			saveEvent : {
				text : "일정 추가 +",
				click : function() {
					// 의사나 원무과인지 확인
					authCheck();
					// 모달 열기
					$("#createSchModal").modal("show");
					calendar1.refetchEvents();
				}
			}
		},
		// 해더에 표시할 툴바
		headerToolbar : {
			left : 'calButton prev,next',
			center : 'title',
			right : 'saveEvent'
		},

		
	});
	// 달력 띄우기
	calendar.render();
	
	// 달력 DB 로딩
	
	let listData = { 
		year : year, 
	};
	
	let data = {
		"year" : year,
		"empNo" : empNo
	};
	
	$.ajax({
		url:"/calendar/schListEmpNo",
		type:"post",
		data: JSON.stringify(data),
		dataType: "JSON",
		contentType:"application/json;charset:utf-8",
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
		success : function(data, status, xhr){
			
			$.each(data, function(key, value){
				// DB에서 가져온 일정 리스트 배치
				dsNo = data[key].dsNo;
				start = data[key].dsStrDate;
				end = data[key].dsEndDate;
				content = data[key].dsCont;
				dbCate = data[key].dsCate; // if => color
					if(dbCate === '진료'){
						color = "#0ABAB5";
					}else if(dbCate === '수술'){
						color = "#cce6ff";
					}else if(dbCate === '검사'){
						color = "#d9ccff";
					}else if(dbCate === '연구'){
						color = "#DBF2F4";
					}else{
						color = "#ffcccc";
					}
				isAllDay = data[key].dsAd; // if => allDay
					if(isAllDay == '0'){
						isAllDay = $('input[name="allDay"]').val(false);
					}else{
						isAllDay = $('input[name="allDay"]').val(true);
					}
				
				let eventData = {
				    start: start,
				    end: end,
				    title: content,
				    color: color,
				 	// 종일 여부에 따라 true 또는 false 설정
				    allDay: (isAllDay === 'true'),
				    id : dsNo,
				    groupId : dbCate,
				};
				
				// month 달력에 이벤트 추가
				calendar.addEvent(eventData);
				calendar.render();
				
			});
			
		}, error : function(xhr, status, error){
		  Swal.fire({
			   	title: '데이터 로딩 실패',
			   	text: '새로고침 해주세요.',
			   	icon: 'error',
			   	confirmButtonColor: '#0ABAB5',
			   	confirmButtonText: '확인',
			})
			return;
	  }
});


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
			
			let empNo = $("#reservDoctorList option:selected").val();
			let empName = $("#reservDoctorList option:selected").text();
			
			let reservBtn = `
				<button class="dduk-btn-active" id="createReservationBtn" type="button" data-bs-toggle="modal" data-bs-target="#createReservationModal"
				style="position: relative; width: 100px;">예약</button>
			`
			//예약버튼 생성
			
			$('#reservBtnArea').append(reservBtn);
			
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
			
			//예약 모달에 정보 넣기
			$('#reservPaName').attr('value',rst.paName);
			$('#reservPaNo').attr('value',rst.paNo);
			$('#reservEmpNo').attr('value',empNo);
			$('#reservEmpName').attr('value',empName);
			
			
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
// 			else{
// 				$("#rsvtNo").attr('checked',true);
// 			}
			
			$("#search").val("");
		},
		error: function(xhr, status, error){
			console.log('Error:', xhr, status, error);
		}
	});
};


//일정 시간 선택 시 이벤트
$(document).on("click", ".abled", function() {
	$(".abled").removeClass("selected");
	$(this).addClass("selected");
	let rsvtTime = $(this).data('rsvttime');
	$('#reservRsvtTime').attr('value',rsvtTime);
	
	
	if(rsvtTime == '1') {
		$('#reservDsStrTime').attr('value','09:00');
		$('#reservDsEndTime').attr('value','09:30');
	} else if(rsvtTime == '2') {
		$('#reservDsStrTime').attr('value','09:30');
		$('#reservDsEndTime').attr('value','10:00');
	} else if(rsvtTime == '3') {
		$('#reservDsStrTime').attr('value','10:00');
		$('#reservDsEndTime').attr('value','10:30');
	} else if(rsvtTime == '4') {
		$('#reservDsStrTime').attr('value','10:30');
		$('#reservDsEndTime').attr('value','11:00');
	} else if(rsvtTime == '5') {
		$('#reservDsStrTime').attr('value','11:00');
		$('#reservDsEndTime').attr('value','11:30');
	} else if(rsvtTime == '6') {
		$('#reservDsStrTime').attr('value','11:30');
		$('#reservDsEndTime').attr('value','12:00');
	} else if(rsvtTime == '7') {
		$('#reservDsStrTime').attr('value','13:00');
		$('#reservDsEndTime').attr('value','13:30');
	} else if(rsvtTime == '8') {
		$('#reservDsStrTime').attr('value','13:30');
		$('#reservDsEndTime').attr('value','14:00');
	} else if(rsvtTime == '9') {
		$('#reservDsStrTime').attr('value','14:00');
		$('#reservDsEndTime').attr('value','14:30');
	} else if(rsvtTime == '10') {
		$('#reservDsStrTime').attr('value','14:30');
		$('#reservDsEndTime').attr('value','15:00');
	} else if(rsvtTime == '11') {
		$('#reservDsStrTime').attr('value','15:00');
		$('#reservDsEndTime').attr('value','15:30');
	} else if(rsvtTime == '12') {
		$('#reservDsStrTime').attr('value','15:30');
		$('#reservDsEndTime').attr('value','16:00');
	} else if(rsvtTime == '13') {
		$('#reservDsStrTime').attr('value','16:00');
		$('#reservDsEndTime').attr('value','16:30');
	} else if(rsvtTime == '14') {
		$('#reservDsStrTime').attr('value','16:30');
		$('#reservDsEndTime').attr('value','17:00');
	} else if(rsvtTime == '15') {
		$('#reservDsStrTime').attr('value','17:00');
		$('#reservDsEndTime').attr('value','17:30');
	} else if(rsvtTime == '16') {
		$('#reservDsStrTime').attr('value','17:30');
		$('#reservDsEndTime').attr('value','18:00');
	}
	
	
});

//일정 리스트 가져오기
function selectByDate(empNo, rsvtDt){
	
	let data = {
		"empNo" : empNo,
		"rsvtDt" : rsvtDt
	};
	
	$.ajax({
		url:"/calendar/selectByDate",
		type:"post",
		data:JSON.stringify(data),
		dataType: 'json',
		contentType:"application/json;charset:utf-8",
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
		success : function(data, status, xhr){
			console.log('data',data);
			console.log('status',status);
			console.log('xhr',xhr);
			
			$.each(data, function(idx){
				let timeLength = new Date(data[idx].dsEndDate)-new Date(data[idx].dsStrDate);
				let timeLengthInt = timeLength / (1000 * 60 * 30);
				
				$('#scheduleTable').html("");
				
				let picLength = 96*timeLengthInt;
				if(data[idx].dsAd=='1') {
					$('.schdualTable').attr('data-reserv','1');
					$('.timePic').removeClass('abled');
					$('.timePic').css('background-color', 'transparent important!');
					$('.timePic').html(" ");
					
					$('#scheduleTable').html("");
					let fullDay = `
						<div class="full-day">
							\${data[idx].dsCont}
						</div>
					`
					
					$('#scheduleTable').append(fullDay);
				} else {
					
					// 데이터베이스에서 가져온 문자열을 Date 객체로 변환
					const dbStartTimeStr = data[idx].dsStrDate.substring(11, 16);
					const dbEndTimeStr = data[idx].dsEndDate.substring(11, 16);
					
					const dbStartTime = new Date();
					const dbEndTime = new Date();
					dbStartTime.setHours(parseInt(dbStartTimeStr.split(':')[0]));
					dbStartTime.setMinutes(parseInt(dbStartTimeStr.split(':')[1]));
					dbEndTime.setHours(parseInt(dbEndTimeStr.split(':')[0]));
					dbEndTime.setMinutes(parseInt(dbEndTimeStr.split(':')[1]));
					
					let startTime = new Date(rsvtDt+"T09:00");
					
					let startResult = new Date(data[idx].dsStrDate)-startTime;
					
					let topMargin = (96 * startResult / (1000 * 60 * 30))+16;
					
					if(dbStartTimeStr == "09:00") {
						topMargin = 0;
					}
						
					let fullDay = `
						<div class="partTime" style="height:\${picLength}px; width: 198px; position:absolute; top:\${topMargin}px;">
							\${data[idx].dsCont}
						</div>
					`
					
					highlightAvailableTimes(dbStartTime, dbEndTime);
					
					if (dbStartTimeStr == '09:00') {
						$('#timePic1').addClass('timePic-disabled');
						$('#timePic1').html(' ');
					} else if (dbEndTimeStr == '18:00') {
						$('#timePic16').addClass('timePic-disabled');
						$('#timePic16').html(' ');
					}
					
					$('#scheduleTable').append(fullDay);
				}
			});
		},
		error: function(xhr, status, error){
			console.log('Error:', xhr, status, error);
		}
	});
}


//주어진 시간 범위 내에 있는지 확인하는 함수
function isTimeInRange(checkTime, checkEndTime, rangeStartTime, rangeEndTime) {
  return (
    (checkTime >= new Date(rangeStartTime) && checkTime <= new Date(rangeEndTime)) ||
    (checkEndTime >= new Date(rangeStartTime) && checkEndTime <= new Date(rangeEndTime)) ||
    (checkTime <= new Date(rangeStartTime) && checkEndTime >= new Date(rangeEndTime))
  );
}

//배경 색상을 변경하는 함수
function highlightAvailableTimes(dbStartTime, dbEndTime) {
  // 모든 시간을 나타내는 div 요소를 선택
  const timeDivs = document.querySelectorAll('.timePic');
  
  // 주어진 시간 범위 내에 있는 요소들의 첫번째와 마지막 요소의 인덱스를 찾기
  let firstInRangeIndex = -1;
  let lastInRangeIndex = -1;

  timeDivs.forEach((timePic, index) => {
    const startTimeString = timePic.dataset.strtime;
    const endTimeString = timePic.dataset.endtime;

    const startTime = new Date();
    const endTime = new Date();
    startTime.setHours(parseInt(startTimeString.split(':')[0]));
    startTime.setMinutes(parseInt(startTimeString.split(':')[1]));
    endTime.setHours(parseInt(endTimeString.split(':')[0]));
    endTime.setMinutes(parseInt(endTimeString.split(':')[1]));

    if (
      isTimeInRange(startTime, endTime, dbStartTime, dbEndTime) &&
      (firstInRangeIndex === -1 || index < firstInRangeIndex)
    ) {
      firstInRangeIndex = index;
    }

    if (isTimeInRange(startTime, endTime, dbStartTime, dbEndTime)) {
      lastInRangeIndex = index;
    }
  });

  // 각 div에 대해 반복
  timeDivs.forEach((timePic, index) => {
    // 주어진 시간 범위 내에 있는 요소의 첫 번째와 마지막만 제외
    if (index !== firstInRangeIndex && index !== lastInRangeIndex) {
      const startTimeString = timePic.dataset.strtime;
      const endTimeString = timePic.dataset.endtime;

      const startTime = new Date();
      const endTime = new Date();
      startTime.setHours(parseInt(startTimeString.split(':')[0]));
      startTime.setMinutes(parseInt(startTimeString.split(':')[1]));
      endTime.setHours(parseInt(endTimeString.split(':')[0]));
      endTime.setMinutes(parseInt(endTimeString.split(':')[1]));

      // 데이터베이스 시작 시간과 종료 시간과 비교하여 배경 색상을 변경
      if (isTimeInRange(startTime, endTime, dbStartTime, dbEndTime)) {
    	 timePic.style.setProperty('background-color', 'transparent', 'important');
        timePic.innerHTML = ' ';
      }
    }
  });
}
}


//일정 리스트 가져오기
function selectByDate(empNo, rsvtDt){
	
	let data = {
		"empNo" : empNo,
		"rsvtDt" : rsvtDt
	};
	
	$.ajax({
		url:"/calendar/selectByDate",
		type:"post",
		data:JSON.stringify(data),
		dataType: 'json',
		contentType:"application/json;charset:utf-8",
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
		success : function(data, status, xhr){
			console.log('data',data);
			console.log('status',status);
			console.log('xhr',xhr);
			
			$.each(data, function(idx){
				let timeLength = new Date(data[idx].dsEndDate)-new Date(data[idx].dsStrDate);
				let timeLengthInt = timeLength / (1000 * 60 * 30);
				
				$('#scheduleTable').html("");
				
				let picLength = 96*timeLengthInt;
				if(data[idx].dsAd=='1') {
					$('.schdualTable').attr('data-reserv','1');
					$('.timePic').removeClass('abled');
					$('.timePic').css('background-color', '#E0E6E9');
					$('.timePic').html(" ");
					
					$('#scheduleTable').html("");
					let fullDay = `
						<div class="full-day">
							\${data[idx].dsCont}
						</div>
					`
					
					$('#scheduleTable').append(fullDay);
				} else {
					
					// 데이터베이스에서 가져온 문자열을 Date 객체로 변환
					const dbStartTimeStr = data[idx].dsStrDate.substring(11, 16);
					const dbEndTimeStr = data[idx].dsEndDate.substring(11, 16);
					
					const dbStartTime = new Date();
					const dbEndTime = new Date();
					dbStartTime.setHours(parseInt(dbStartTimeStr.split(':')[0]));
					dbStartTime.setMinutes(parseInt(dbStartTimeStr.split(':')[1]));
					dbEndTime.setHours(parseInt(dbEndTimeStr.split(':')[0]));
					dbEndTime.setMinutes(parseInt(dbEndTimeStr.split(':')[1]));
					
					let startTime = new Date(rsvtDt+"T09:00");
					
					let startResult = new Date(data[idx].dsStrDate)-startTime;
					
					let topMargin = (96 * startResult / (1000 * 60 * 30))+16;
					
					if(dbStartTimeStr == "09:00") {
						topMargin = 0;
					}
						
					let fullDay = `
						<div class="partTime" style="height:\${picLength}px; width: 198px; position:absolute; top:\${topMargin}px;">
							\${data[idx].dsCont}
						</div>
					`
					
					highlightAvailableTimes(dbStartTime, dbEndTime);
					
					if (dbStartTimeStr == '09:00') {
						$('#timePic1').addClass('timePic-disabled');
						$('#timePic1').html(' ');
					} else if (dbEndTimeStr == '18:00') {
						$('#timePic16').addClass('timePic-disabled');
						$('#timePic16').html(' ');
					}
					
					$('#scheduleTable').append(fullDay);
				}
			});
		},
		error: function(xhr, status, error){
			console.log('Error:', xhr, status, error);
		}
	});
}

//예약 리스트 가져오기
function getReservationList(rsvtDt) {
	
	$('#scheduleTable').html("");
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
	
	let empNo = $("#reservDoctorList option:selected").val();
	var dateObject = new Date(rsvtDt);
	
	let data = {
			"rsvtDt" : rsvtDt,
			"empNo" : empNo
		}
	
	$.ajax({
		url: "/reserve/getReservationList",
		dataType: 'json',
		type: 'post',
		data:JSON.stringify(data),
		async: false,
		contentType:"application/json;charset:utf-8",
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(rst){
			
			$('.timePic').addClass("abled");
			$('.timePic').css('background-color','transparate');
			$.each(rst, function(idx){
				console.log(rst[idx].rsvtTime);
				if(rst[idx].rsvtTime=='1') {
					$('#timePic1').removeClass("abled");
					$('#timePic1').css('background-color','#FFECEC');
					$('#timePic1').html("");
					$('#timePic1').append("<div>9:00-9:30</div><div class='picPaName'>" + rst[idx].paName + "</div>");
				} else if(rst[idx].rsvtTime=='2') {
					$('#timePic2').removeClass("abled");
					$('#timePic2').css('background-color','#FFECEC');
					$('#timePic2').html("");
					$('#timePic2').append("<div>9:30-10:00</div><div class='picPaName'>" + rst[idx].paName + "</div>");
				} else if(rst[idx].rsvtTime=='3') {
					$('#timePic3').removeClass("abled");
					$('#timePic3').css('background-color','#FFECEC');
					$('#timePic3').html("");
					$('#timePic3').append("<div>10:00-10:30</div><div class='picPaName'>" + rst[idx].paName + "</div>");
				} else if(rst[idx].rsvtTime=='4') {
					$('#timePic4').removeClass("abled");
					$('#timePic4').css('background-color','#FFECEC');
					$('#timePic4').html("");
					$('#timePic4').append("<div>10:30-11:00</div><div class='picPaName'>" + rst[idx].paName + "</div>");
				} else if(rst[idx].rsvtTime=='5') {
					$('#timePic5').removeClass("abled");
					$('#timePic5').css('background-color','#FFECEC');
					$('#timePic5').html("");
					$('#timePic5').append("<div>11:00-11:30</div><div class='picPaName'>" + rst[idx].paName + "</div>");
				} else if(rst[idx].rsvtTime=='6') {
					$('#timePic6').removeClass("abled");
					$('#timePic6').css('background-color','#FFECEC');
					$('#timePic6').html("");
					$('#timePic6').append("<div>11:30-12:00<div><div class='picPaName'>" + rst[idx].paName + "</div>");
				} else if(rst[idx].rsvtTime=='7') {
					$('#timePic7').removeClass("abled");
					$('#timePic7').css('background-color','#FFECEC');
					$('#timePic7').html("");
					$('#timePic7').append("<div>13:00-13:30</div><div class='picPaName'>" + rst[idx].paName + "</div>");
				} else if(rst[idx].rsvtTime=='8') {
					$('#timePic8').removeClass("abled");
					$('#timePic8').css('background-color','#FFECEC');
					$('#timePic8').html("");
					$('#timePic8').append("<div>13:30-14:00</div><div class='picPaName'>" + rst[idx].paName + "</div>");
				} else if(rst[idx].rsvtTime=='9') {
					$('#timePic9').removeClass("abled");
					$('#timePic9').css('background-color','#FFECEC');
					$('#timePic9').html("");
					$('#timePic9').append("<div>14:00-14:30</div><div class='picPaName'>" + rst[idx].paName + "</div>");
				} else if(rst[idx].rsvtTime=='10') {
					$('#timePic10').removeClass("abled");
					$('#timePic10').css('background-color','#FFECEC');
					$('#timePic10').html("");
					$('#timePic10').append("<div>14:30-15:00</div><div class='picPaName'>" + rst[idx].paName + "</div>");
				} else if(rst[idx].rsvtTime=='11') {
					$('#timePic11').removeClass("abled");
					$('#timePic11').css('background-color','#FFECEC');
					$('#timePic11').html("");
					$('#timePic11').append("<div>15:00-15:30</div><div class='picPaName'>" + rst[idx].paName + "</div>");
				} else if(rst[idx].rsvtTime=='12') {
					$('#timePic12').removeClass("abled");
					$('#timePic12').css('background-color','#FFECEC');
					$('#timePic12').html("");
					$('#timePic12').append("<div>15:30-16:00</div><div class='picPaName'>" + rst[idx].paName + "</div>");
				} else if(rst[idx].rsvtTime=='13') {
					$('#timePic13').removeClass("abled");
					$('#timePic13').css('background-color','#FFECEC');
					$('#timePic13').html("");
					$('#timePic13').append("<div>16:00-16:30</div><div class='picPaName'>" + rst[idx].paName + "</div>");
				} else if(rst[idx].rsvtTime=='14') {
					$('#timePic14').removeClass("abled");
					$('#timePic14').css('background-color','#FFECEC');
					$('#timePic14').html("");
					$('#timePic14').append("<div>16:30-17:00</div><div class='picPaName'>" + rst[idx].paName + "</div>");
				} else if(rst[idx].rsvtTime=='15') {
					$('#timePic15').removeClass("abled");
					$('#timePic15').css('background-color','#FFECEC');
					$('#timePic15').html("");
					$('#timePic15').append("<div>17:00-17:30</div><div class='picPaName'>" + rst[idx].paName + "</div>");
				} else if(rst[idx].rsvtTime=='16') {
					$('#timePic16').removeClass("abled");
					$('#timePic16').css('background-color','#FFECEC');
					$('#timePic16').html("");
					$('#timePic16').append("<div>17:30-18:00</div><div class='picPaName'>" + rst[idx].paName + "</div>");
				}
				
			});
			
		},
		error: function(xhr, status, error){
			console.log('Error:', xhr, status, error);
		}
	});
}
</script>