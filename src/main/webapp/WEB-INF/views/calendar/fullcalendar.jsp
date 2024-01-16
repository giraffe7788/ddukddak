<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<style>
/* 닫기 버튼 스타일 */
.aside-doc-sche{
	width: 196px;
	border-radius: 16px 0px 0px 16px;
	background: var(--bg-02, #DBF2F4);
	height: 56px;
	border-right: 4px solid var(--ci-01, #0ABAB5);
	margin-left: 4px;
	color: var(--ci-01, #0ABAB5);
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

.close {
	color: #aaa;
	float: right;
	width: 10%;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

/* 풀캘린더 스타일 */
.cal {
	width: 50%;
	min-height: 500px;
	margin: 20px 50px;
}

.date-group {
	display: inline-block;
	margin-right : 30px;
}

.dduk-dir-col {
	display: flex;
    flex-direction: column;
    gap: 16px;
    width: 40%;
}

.fc-button-group {
	margin-left: -30px !important;
}

.fc-day-today {
	background-color: #dedfe0 !important;
	border : 3px solid #878787 inset !important;
}

.fc-day-past {
	background-color: #F8F9FC !important;
}
.selected {
	box-shadow: 0 0 0 3px #0ABAB5 inset !important;
}

.scheduleArea {
    width: 100%;
    height: 700px;
    overflow-y : scroll;
    position: relative;
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

.schedualTable {
	width: calc(100% - 100px);
    height: 100%;
    display: flex;
    justify-content: space-around;
}

.timeLine {
	height: calc(100% - 50px);
    width: 100px;
    display: flex;
    gap: 77px;
    flex-direction: column;
}

.timeTable {
	height: fit-content;
    width: 40%;
    display: flex;
    flex-direction: column;
    gap: 8px;
}

.partTime {
	padding: 16px;
	width: 100%;
	border-radius: 16px;
	background-color: #FAFAD2;
}

.full-day {
	padding: 16px;
	height: 1758px;
	width: 100%;
	border-radius: 16px;
	background-color: #FAFAD2;
}

.waiting-text {
	position: absolute;
    top: 180px;
    left: 240px;
    font-size: 20px;
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
</style>

<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.10/index.global.min.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<!-- sweetalert -->
<script src="/resources/fullcalendar-6.1.10/sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- 월별 캘린더 -->
<div id="calendar" class="cal"></div>
<!-- 일별 캘린더 -->
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
				<div class="schedualTable">
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

<!-- 일정 추가 모달    -->
<c:import url="../common/modal.jsp"></c:import>

<script>
// 날짜 선택 제한
// 현재 날짜 불러와서 문자 형태 맞추기
const date = new Date();
const year = date.getFullYear();
const month = ('0' + (date.getMonth() + 1)).slice(-2);
const day = ('0' + (date.getDate())).slice(-2);
const today = year+"-"+month+"-"+day;
const endOfDay = new Date(date);
// 현재 날짜 이전으로는 선택 불가
$("#eventStart").attr("min", today);
$("#eventEnd").attr("min", today);
// input값 가져오기
let start = $("#eventStart").val();
let startTime = $("#start").val();
let end = $("#eventEnd").val();
var endTime = $("#end").val();
let content = $("#eventContent").val();
let color = $("#color").val();
// 종일 여부
var isAllday = $("#wholeTime").is(':checked'); // '예'면 true, '아니오'면 false
let dsCate = $("#color option:selected").text();
//월별 달력 특정
let calendarEl = $("#calendar")[0];
let calendar;

// 날짜 클릭 수따라 이벤트
var numClicks = 0;
var timeOut;

// 날짜칸 한 번 클릭 시
function EventClick() {
	numClicks = 0 ;
}
//날짜칸 두 번 클릭 시
function EventDoubleClick(arg) {
	clearTimeout(timeOut) ;
	numClicks = 0 ;
	var selectedDay = arg.dateStr;
	// 과거 날짜는 예약 못함
// 	if(selectedDay < today) {
// 		Swal.fire({
//           title: '선택 불가',
//           text: '이전 날짜로 예약하실 수 없습니다.',
//           icon: 'error',
//           showCancelButton: false,
//           confirmButtonColor: '#0ABAB5',
//           cancelButtonColor: '#8D9EA5',
//           confirmButtonText: '확인',
//           cancelButtonText: '취소'
// 			});
// 		return;
// 	}
	// 해당 날짜 시작으로 일정 추가하는 모달 뜨기
	$(".schHead").text("일정 추가");
	$("#eventStart").val(selectedStart);
	$("#createSchModal").modal("show");
}

//월별 캘린더 설정 시작
document.addEventListener('DOMContentLoaded', function() {
	calendar = new FullCalendar.Calendar(calendarEl, {
		// 한국 언어, 시간 설정
		locale : 'ko',
		timeZone: 'Asia/Seoul',
		// 화면에 맞게 높이 재설정
		expandRows : true,
		// 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
		dayMaxEvents: true,
		// 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
		initialView : 'dayGridMonth',
		// 날짜를 클릭하면
		dateClick : function(arg) {
			console.log($(this));
			numClicks++ ;
			selectedStart = arg.dateStr;
			switch(numClicks) {
				case 2:
					EventDoubleClick(arg) ;
					break ;
				case 1:
					timeOut = setTimeout( function() {
						EventClick() ;
					},400) ;
					break ;
			}
		},
		// 드래그해서 수정 가능
		editable: true,
		eventDrop: function(arg) {
		    Swal.fire({
		        title: '날짜를 수정하시겠습니까?',
		        icon: 'question',
		        showCancelButton: true,
		        confirmButtonColor: '#0ABAB5',
		        cancelButtonColor: '#FF4040',
		        confirmButtonText: '확인',
		        cancelButtonText: '취소',
		    }).then(result => {
		        // 확인
		        if (result.isConfirmed) {
		            // 여기에서 바로 업데이트하도록 변경
		            dragUpdateSch(arg);
		            // calendar.refetchEvents(); // 주석 처리
		        } else if (result.isDismissed) { 
		            // 취소할 경우 revert가 아니라 여기서 revert
		            arg.revert();
		        }
		    });
		},
		// 일정 클릭 시 발생할 이벤트
		eventClick: function(arg) {
			// 모달창 열기
			$("#createSchModal").modal("show");
			var dsNoM = arg.event.id;
			console.log("eventClick->dsNoM>>>>>",dsNoM);
			// 클릭한 일정 내용  DB에서 가져오기
			selectSch(dsNoM);
			if(dsNoM !== ""){
				$(".schHead").text("상세 일정");
				// 함수에 넘길 스케줄코드 변수에 담기
				$(".dsNo").val(dsNoM);
				console.log($(".dsNo").val());
				// 있던 일정 클릭 시 저장 버튼 없애고 삭제 버튼 있게
				$("#updateEvent").css('display','block');
				$("#realSaveEvent").css('display','none');
				$("#delEvent").css('display','block');
				
			// 새 일정이면 저장 버튼만 나오게
			} else {
				console.log(dsNoM);
				$(".schHead").text("일정 추가");
				$("#updateEvent").css('display','none');
				$("#delEvent").css('display','none');
				$("#realSaveEvent").css('display','block');
			}
			
		},
		// 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
		navLinks : false,
		// +more 표시 전 최대 이벤트 갯수, true는 셀 높이에 의해 결정
		dayMaxEvents: true,
		// 버튼 만들기
		customButtons : {
			saveEvent : {
				text : "일정 추가 +",
				click : function() {
					// 모달 열기
					$("#createSchModal").modal("show");
					$(".schHead").text("일정 추가");
					$("#updateEvent").css('display','none');
					$("#delEvent").css('display','none');
					$("#realSaveEvent").css('display','block');
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
	calendar.render();
	
	// 달력 DB 로딩
	let data2 = { 
			"year" : year,
			"empNo" : empNo
	};
	
	$.ajax({
		url:"/calendar/schListEmpNo",
		type:"post",
		contentType:"application/json;charset=utf-8",
		data: JSON.stringify(data2),
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
					if(dbCate === '연구'){
						color = "#DBF2F4";
					}else{
						color = "#ffcccc";
					}
				let listInAllDay = data[key].dsAd; // if => allDay
					if(listInAllDay === 0){
						isAllDay = false;
					}else{
						isAllDay = true;
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
				
				// 월별 달력에 이벤트 추가
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
});
//월별 캘린더 설정 끝


$(document).ready(function() {
	// aside 선택 설정
	$('.aside-doc-sche').find('svg').find('path').attr('fill', '#0ABAB5');
	$('.dduk-nav-li').mouseleave(
		function()	{
			 $('.aside-doc-sche').find('svg').find('path').attr('fill', '#0ABAB5');
		}	
	);
	$('.aside-doc-sche').find('.dduk-nav-menu').css('color', '#0ABAB5'); 
	
	//수정 버튼 눌렀을 때
	$("#updateEvent").on("click", function(arg){
		updateSch(arg);
		calendar.refetchEvents();
		$("#createSchModal").modal("hide");
	});

	//모달 뜰 때 작성자 명시
	$("#createSchModal").on('show.bs.modal', function () {
		let docName = "<div id='docName' style='margin-top:5px; margin-left:15px;'>작성자 : "+ empName + "</div>";
		$(".modal-title.schHead").after(docName);
	});

	//모달이 숨겨질 때 초기화 함수를 연결
	$("#createSchModal").on('hidden.bs.modal', function () {
		$("#docName").remove();
		initModal();
	});
	
	// 종일 여부 체크하면 시간 선택 막기
	$('input[type="radio"][name="allDay"]').change(function(){
	    let checkInAllday = $("#wholeTime").is(':checked'); // '예'면 true, '아니오'면 false
	    console.log(checkInAllday);
		
		// '예' 체크됐으면 시간 선택 막기
		if(checkInAllday){
			$("select[name='time-set']").attr('disabled', 'disabled');
			$("#start").val('09:00');
			$("#end").val('19:00');
			$("select[name='time-set']").attr('style',"background-color: #ddd");
		}else{
			$("select[name='time-set']").removeAttr('disabled');
			$("#start").val('09:00');
			$("#end").val('09:30');
			$("select[name='time-set']").removeAttr('style');
		}
	});
	
	//의사 select 값 바꾸기 이벤트
	 $('#reservDoctorList').change(function() {
		 $('#timePic1').removeClass('timePic-disabled');
		 $('#timePic16').removeClass('timePic-disabled');
		 let rsvtDt = $('.fc-day.selected').data('date');
// 		 let empNo = $("#empNo").data('empno');
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
// 		let empNo = $("#empNo").data('empno');
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
	
});

let updateArg;


//모달 설정 함수 시작
//빈 값 입력 시 오류
function nullCheck() {
	if (start == "" || startTime == "" || end == "" || endTime == "" || content == "") {
		Swal.fire({
		   	title: '입력 오류',
		   	text: '입력이 부족합니다. 모든 항목을 입력해주세요.',
		   	icon: 'error',
		   	confirmButtonColor: '#0ABAB5',
		   	confirmButtonText: '확인',
		})
		return;
	} else {
		modalSave();
	}
}

//모달칸 비우기
function initModal(){
	$("#eventStart").val("");
	$("#start").val('09:00');
	$("#eventEnd").val("");
	$("#end").val('09:30');
	$("#eventContent").val("");
	$("#color").val("#DBF2F4");
	$("#createSchModal").css("display", "none");
}

//모달 내 삭제 버튼 눌렀을 때
function delBtnEvent(){
	let dsNo = document.getElementById("dsNo").value;
	//console.log("delEvent->dsNo : ", dsNo);
	Swal.fire({
    	title: '삭제하시겠습니까?',
    	text: '복구 불가능 유의',
    	icon: 'question',
    	showCancelButton: true, // cancel버튼 보이기
    	confirmButtonColor: '#0ABAB5',
    	cancelButtonColor: '#FF4040',
    	confirmButtonText: '확인',
    	cancelButtonText: '취소',
	}).then(result => {
		// 확인
	    if (result.isConfirmed) { 
	    	deleteSch(dsNo);
	    	calendar.refetchEvents();
		//취소
	    } else if (result.isDismissed) {
	    	$("#createSchModal").modal("hide"); 
	    }
	});
}
//모달 설정 함수 끝

// 일정 삭제
function deleteSch(dsNoM) {
	let selectSchdsNo = dsNoM;
	let data4 = { dsNo : dsNoM };
	console.log(data4);
	// 선택된 일정 번호로 DB에서 찾아서 삭제
	$.ajax({
		url:"/calendar/deleteSch",
		type:"post",
		data: data4,
		async: false,
		dataType: "JSON",
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
		success: function(res){
			if(res.result === 'success'){
				Swal.fire({
			    	title: '삭제되었습니다',
			    	icon: 'success',
			    	confirmButtonColor: '#0ABAB5',
			    	confirmButtonText: '확인',
				}).then(() => {
                    // 일정 삭제 후 캘린더 새로고침
                    //calendar.refetchEvents();
                    location.reload();
                });
			}
		},
		error : function(xhr, status, error){
		 Swal.fire({
		    	title: '일정 삭제 실패!',
		    	text: '재시도 해주세요.',
		    	icon: 'error',
		    	confirmButtonColor: '#0ABAB5',
		    	confirmButtonText: '확인',
			})
		}
	});
}

// 새 일정 저장
function modalSave(){
	// 모달창 입력값 확인
	start = $("#eventStart").val();
	startTime = $("#start").val();
	end = $("#eventEnd").val();
	endTime = $("#end").val();
	content = $("#eventContent").val();
	color = $("#color").val();
	dsCate = $("#color option:selected").text();
	var sisAllday = $('input[type="radio"][id="wholeTime"]').is(':checked');
	let saveAllday;
	
	// 캘린더 표시용 데이터
	let eventData = {
	    start: start + 'T' + startTime,
	    end: end + 'T' + endTime,
	    title: content,
	    color: color,
	 	// 종일 여부에 따라 true 또는 false 설정
	    allDay: (sisAllday === 'true'),
	};
	
	// 빈 값 입력 시 오류
	if (content == "" || start == "" || end == "") {
		Swal.fire({
		   	title: '입력 오류',
		   	text: '입력이 부족합니다. 모든 항목을 입력해주세요.',
		   	icon: 'error',
		   	confirmButtonColor: '#0ABAB5',
		   	confirmButtonText: '확인',
		})
		return;
		
	} else {
	   // 달력에 이벤트 추가
	   calendar.addEvent(eventData);
	   calendar.render();
	   
		// DB 저장
	 	// 오라클 boolean 안됨.. 종일 여부에 따라 1 또는 0 설정
		if(sisAllday){
			saveAllday = 1;
		} else {
			saveAllday = 0;
		}
		
		// DB 저장용 데이터
	   let data = {
			dsStrDate: start + 'T' + startTime,
			dsEndDate: end + 'T' + endTime,
			dsCont: content,
			dsCate: dsCate,
			dsAd: saveAllday,
			empNo : empNo
		};
	
		$.ajax({
			url: "/calendar/createSch",
			contentType:"application/json;charset=utf-8",
			data: JSON.stringify(data),
			type: "post",
			dataType:"json",
			async: false,
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: function(res){
				// 일정 등록 후 캘린더 새로고침
		        calendar.refetchEvents();
				
				if(res.result === 'success'){
					Swal.fire({
				    	title: '일정 등록 성공!',
				    	icon: 'success',
				    	confirmButtonColor: '#0ABAB5',
				    	confirmButtonText: '확인',
					}).then(result => {
						location.reload();
					});
					
				}
				
				initModal();
				$("#createSchModal").modal("hide");
			},
			error : function(xhr, status, error){
			 Swal.fire({
			    	title: '일정 등록 실패!',
			    	text: '재시도 해주세요.',
			    	icon: 'error',
			    	confirmButtonColor: '#0ABAB5',
			    	confirmButtonText: '확인',
				}).then(result => {
					$("#createSchModal").modal("hide");
				 	location.reload();
				});
				
			}
		});
	}
}

// 시작일 전으로 종료일 체크 방지
function dayCheck() {
	let start = $("#eventStart").val();
	let end = $("#eventEnd").val();
	
	if (end != '' && start > end) {
	   //끝나는 날짜가 시작하는 날짜보다 값이 크면 안됨
	   Swal.fire({
			title: '날짜 설정 오류',
			text: '시작보다 이전 날짜로 설정할 수 없습니다.',
		   	icon: 'error',
		   	confirmButtonColor: '#0ABAB5',
		   	confirmButtonText: '확인',
		})
	// 시작일로 변경
	$('#eventEnd').val(start);
	return;
	}
}

// 선택 시간따라 30분 뒤 값 설정	
function timeSet() {
	let start = $("#start").val();
	let end = $("#end").val();
	
	if(start.substring(3, 5) == '00') // 19:00
		end = start.substring(0, 2) + ':30';
	else
		end = (parseInt(start.substring(0, 2))+1) + ':00';
	// 선택지에 30분 뒤 값 적용
	$('#end').val(end);
}

// 시작 시간 전으로 종료 시간 체크 방지
function timeCheck() {
	let eventStart = $("#eventStart").val();
	let eventEnd = $("#eventEnd").val();
	let start = $("#start").val();
	let end = $("#end").val();
	// 종료가 시작보다 빠른 시간이면
	if( eventStart > eventEnd && end <= start) {
		Swal.fire({
		   	title: '시간 설정 오류',
		   	text: '시작보다 이전 시간으로 설정할 수 없습니다.',
		   	icon: 'error',
		   	confirmButtonColor: '#0ABAB5',
		   	confirmButtonText: '확인',
		})
		if(start.substring(3, 5) == '00') // 19:00
			end = start.substring(0, 2) + ':30';
		else
			end = (parseInt(start.substring(0, 2))+1) + ':00';
		// 선택지에 30분 뒤 값 적용
		$('#end').val(end);
		return;
	}
}

// 스케줄번호로 일정 정보 조회
function selectSch(dsNo){
	let selectSchdsNo = dsNo;
	let data3 = { dsNo : selectSchdsNo };
	
	$.ajax({
		url:"/calendar/selectSch",
		type:"post",
		data: data3,
		dataType: "JSON",
		async: false,
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
		success : function(data){
			// 값 가져오기
			let selectAllday;
			dsNo = data.dsNo;
			start = data.dsStrDate.split("T");		// "2023-12-20T09:30"
			end = data.dsEndDate.split("T");		// "2023-12-05T09:00"
			content = data.dsCont;
			dbCate = data.dsCate;
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
			selectAllday = data.dsAd;
			console.log("datadata>>>>",data);
			console.log("selectAlldayselectAllday>>>>",selectAllday);
				if(selectAllday == 1){
					// 종일 여부 체크 바꾸기
					$("#partTime").prop("checked", false); 
					$("#wholeTime").prop("checked", true);
					// 시간 선택 변경 막기
					$("select[name='time-set']").attr('disabled', 'disabled');
					$("#start").val('09:00');
					$("#end").val('19:00');
					$("select[name='time-set']").attr('style',"background-color: #ddd");
				} else {
					$("#partTime").prop("checked", true); 
					$("#wholeTime").prop("checked", false);
					$("select[name='time-set']").attr('disabled', false);
					$("select[name='time-set']").css('background-color','');
				}
			// 모달에 값 세팅
			$("#eventStart").val(start[0]);
			$("#start").val(start[1]);
			$("#eventEnd").val(end[0]);
			$("#end").val(end[1]);
			$('input[name="allDay"]:checked').val();
			$("#eventContent").val(content);
			$("#color").val(color);
			$('#color').val(color).prop("selected",true);
		}
	});
}

// 모달 내 버튼으로 일정 수정
function updateSch() {
	// 클릭한 모달 일정 정보
	// 모달창 입력값 확인
	start = $("#eventStart").val();
	startTime = $("#start").val();
	end = $("#eventEnd").val();
	endTime = $("#end").val();
	content = $("#eventContent").val();
	color = $("#color").val();
	dsCate = $("#color option:selected").text();
	let upDsAd;
		if(!isAllDay){
			upDsAd = '0';
		}else{
			upDsAd = '1';
		}
	let upSelectedDsNo = $(".dsNo").val();
	
	let data5 = {
		dsStrDate: start + 'T' + startTime,
		dsEndDate: end + 'T' + endTime,
		dsCont: content,
		dsCate: dsCate,
		dsAd: upDsAd,
	    dsNo: upSelectedDsNo
	};
	
	// data5로 보낸 일정 번호로 DB에서 해당 일정 찾아서 나머지 내용 바꿈(사번 제외)
	$.ajax({
		url:"/calendar/updateSch",
		contentType:"application/json;charset=utf-8",
		data: JSON.stringify(data5),
		type:"post",
		async: false,
		dataType: "JSON",
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
		success: function(res){
			if(res.result === 'success'){
				Swal.fire({
			    	title: '수정되었습니다',
			    	icon: 'success',
			    	confirmButtonColor: '#0ABAB5',
			    	confirmButtonText: '확인',
				}).then(result =>{
					location.reload();
				});
			}
		},
		error : function(xhr, status, error){
			Swal.fire({
			   	title: '일정 수정 실패',
			   	text: '재시도 해주세요.',
			   	icon: 'error',
			   	confirmButtonColor: '#0ABAB5',
			   	confirmButtonText: '확인',
			}).then(result => {
				location.reload();
			});
		}
	});
}

// 달력에서 드래그로 일정 수정
function dragUpdateSch(arg) {
	console.log(arg);
	// 클릭한 일정 정보
	let start = arg.event.start;
	let upStrDate = start.toISOString().substring(0, 16);
	let end = arg.event.end;
	let upEndDate = end ? end.toISOString().substring(0, 16) : null;
	let upDsCont = arg.event.title;
	let upDsCate = arg.event.groupId;
	let upDsAd = arg.event.allDay;
		if(!upDsAd){
			upDsAd = '0';
		}else{
			upDsAd = '1';
		}
	let upSelectSchDsNo = arg.event.id;
	
	let data5 = {
		dsStrDate: upStrDate,
		dsEndDate: upEndDate,
		dsCont: upDsCont,
		dsCate: upDsCate,
		dsAd: upDsAd,
	    dsNo: upSelectSchDsNo
	};
	// data5로 보낸 일정 번호로 DB에서 해당 일정 찾아서 나머지 내용 바꿈(사번 제외)
	$.ajax({
		url:"/calendar/updateSch",
		contentType:"application/json;charset=utf-8",
		data: JSON.stringify(data5),
		type:"post",
		dataType: "JSON",
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
		success: function(res){
			if(res.result === 'success'){
				Swal.fire({
			    	title: '수정되었습니다',
			    	icon: 'success',
			    	confirmButtonColor: '#0ABAB5',
			    	confirmButtonText: '확인',
				}).then(result => {
					location.reload();
				})
			}
		},
		error : function(xhr, status, error){
		 Swal.fire({
		    	title: '일정 수정 실패',
		    	text: '재시도 해주세요.',
		    	icon: 'error',
		    	confirmButtonColor: '#0ABAB5',
		    	confirmButtonText: '확인',
			})
		}
		
	});
}


// 일별 캘린더 설정 시작
// 예약 리스트 가져오기
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
			
			$('.timePic').html(" ");
			$('.timePic').addClass("abled");
			$('.timePic').css('background-color','transparent !important');
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
					$('.timePic').css('background-color', 'transparent');
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



</script>