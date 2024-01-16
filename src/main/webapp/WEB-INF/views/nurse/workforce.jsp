<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.aside-nur-schedule{
	width: 196px;
	border-radius: 16px 0px 0px 16px;
	background: var(--bg-02, #DBF2F4);
	height: 56px;
	border-right: 4px solid var(--ci-01, #0ABAB5);
	margin-left: 4px;
	color: var(--ci-01, #0ABAB5);
}

.dduk-body-border {
	width: 100%;
	height: 100%;
}

th, td {
	width: 40px;
	padding: 8px 6px;
	text-align: center;
}

th {
	background-color: #F8F9FC; 
	padding: 12px 6px;
	height: 44px;	
}

td {
	border: 4px solid white;
	padding: 8px 6px;
}

.filebox {
	display: flex;
	gap: 8px;
}

.filebox .upload-name {
	border-radius: 8px;
	border: 1px solid var(- -border, #EBEFF0);
	background: var(- -bg-01, #F8F9FC);
	padding-left: 16px;
	font-family: 'Pretendard5';
	font-size: 14px;
	line-height: 160%; /* 22.4px */
	height: 38px;
	color: #8D9EA5;
}

.filebox label {
	display: flex;
	padding: 5px 12px;
	align-items: center;
	gap: 10px;
	border-radius: 8px;
	border: 2px solid #0ABAB5;
	background: #0ABAB5 !important;
	color: #FFF;
	font-family: 'Pretendard5';
	font-style: normal;
	line-height: 160%; /* 22.4px */
	height: 38px;
}

.filebox label:hover {
	display: flex;
	padding: 5px 12px;
	align-items: center;
	gap: 10px;
	border-radius: 8px;
	border: 2px solid #0ABAB5 !important;
	background: #FFF !important;
	color: #0ABAB5;
	font-family: 'Pretendard5';
	font-style: normal;
	line-height: 160%; /* 22.4px */
	height: 38px;
}

.filebox input[type="file"] {
	position: absolute;
	width: 0;
	height: 0;
	padding: 0;
	overflow: hidden;
	border: 0;
}

#createNurSchedule {
	display: flex;
	gap: 8px;
}

.cal_nav {
	display: flex;
	justify-content: center;
	align-items: center;
	font-weight: 700;
	font-size: 48px;
	line-height: 78px;
}

.year-month {
	font-size: 24px;
	width: 300px;
	text-align: center;
	line-height: 1;
}

.cal_nav .go-prev, .cal_nav .go-next {
	display: block;
	width: 50px;
	height: 78px;
	font-size: 0;
	display: flex;
	justify-content: center;
	align-items: center;
}

.cal_nav .go-prev::before, .cal_nav .go-next::before {
	content: "";
	display: block;
	width: 20px;
	height: 20px;
	border: 3px solid #000;
	border-width: 3px 3px 0 0;
	transition: border 0.1s;
}

.cal_nav .go-prev:hover::before, .cal_nav .go-next:hover::before {
	border-color: #ed2a61;
}

.cal_nav .go-prev::before {
	transform: rotate(-135deg);
}

.cal_nav .go-next::before {
	transform: rotate(45deg);
}

#workforceTable {
}

.today {
	background-color: #DBF2F4;
}

.tdLeav {
	background-color: #0ABAB5 !important;
	color: #FFFFFF !important;
	
}

.tdOff {
	background-color: #DBF2F4 !important;
}

.gray-cell {
	background-color: #F8F9FC !important; 
	border: 1px solid #F8F9FC !important;
} 
</style>

<div class="dduk-body-border">
	<div class="dduk-title-area">
		<h2>간호 근무 일정</h2>
		<div class="filebox">
			<form id="createNurSchedule" method="post"
				enctype="multipart/form-data">
				<input type="file" class="upload-name" id="excelUpload"
					name="excelUpload" value="첨부파일" placeholder="첨부파일"> <label
					for="excelUpload" id="createNurScheduleBtn">일정등록</label>
			</form>
		</div>
	</div>

	<div style="height: calc(100% - 77px) !important">
		<div class="cal_nav">
			<a href="javascript:;" class="nav-btn go-prev">prev</a>
			<div class="year-month" id="year-month"></div>
			<a href="javascript:;" class="nav-btn go-next">next</a>
		</div>
		<div class="absolute-center w-100" style="height: calc(100% - 130px);">
			<table id="workforceTable">
				<thead id="workforceThead">
					<tr id="date"></tr>
					<tr id="week"></tr>
				</thead>
				<tbody id="workforceTbody">
				</tbody>
				<tfoot id="workforceTFoot">
				</tfoot>
			</table>
		</div>
		<div class="butttonBox flex-end">
			<button class="dduk-btn-normal" id="createWorkforceExcel">파일다운</button>
		</div>
	</div>
</div>


<script src="/resources/fullcalendar-6.1.10/sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
$(document).ready(function() {
	$('.aside-nur-schedule').find('svg').find('path').attr('fill', '#0ABAB5');
	
	 $('.dduk-nav-li').mouseleave(
			function()	{
				 $('.aside-nur-schedule').find('svg').find('path').attr('fill', '#0ABAB5');
			}	
		);
	 
	 $('.aside-nur-schedule').find('.dduk-nav-menu').css('color', '#0ABAB5');
	 
	 
	 calendarInit();
	 getNurScheduleList();
	 
	 
	 $("#excelUpload").on("change", function(){
		var year = $('#year-month').attr('data-year');
		var month = $('#year-month').attr('data-month');
		
		let data = {
				"year" : year,
				"month" : month
			}
		
		  const formData = new FormData();
		    formData.append("file", $("#excelUpload")[0].files[0]);
		    formData.append("jsonParams", JSON.stringify(data));
		    
		    $.ajax({
		      url: "/nurse/createNurSchedule",
		      type: "post",
		      contentType: false,
		      processData: false,
		      data: formData,
		      beforeSend: function (xhr) {
		        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		      },
		      success: res => {
		        if (res == "") {
		        	
		        	 Swal.fire({
						   	title: '등록 실패',
						   	text: '확장자가 .xlsx인 엑셀 파일을 첨부해주세요.',
						   	icon: 'error',
						   	confirmButtonColor: '#0ABAB5',
						   	confirmButtonText: '확인',
						})
		          
		        } else {
		        	 Swal.fire({
						   	title: '성공',
						   	text: '정상적으로 추가되었습니다.',
						   	icon: 'success',
						   	confirmButtonColor: '#0ABAB5',
						   	confirmButtonText: '확인',
						})
					getNurScheduleList();
		        }
		      },
		      error: xhr => {
		        console.log(xhr);
		        
		      }
		    })

	});
	 
	var currentYear = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate()).getFullYear();
	var currentMonth = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate()).getMonth();
	var currentDate = new Date(new Date().getFullYear(), new Date().getMonth(), new Date().getDate()).getDate();

	function calendarInit() {

	    // 날짜 정보 가져오기
	    var date = new Date(); // 현재 날짜(로컬 기준) 가져오기
	    var utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
	    var kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
	    var today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)
	  
	    var thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());
	    // 달력에서 표기하는 날짜 객체
	  
	    currentYear = thisMonth.getFullYear(); // 달력에서 표기하는 연
	    currentMonth = thisMonth.getMonth(); // 달력에서 표기하는 월
	    currentDate = thisMonth.getDate(); // 달력에서 표기하는 일

	    // kst 기준 현재시간
	    console.log(thisMonth);

	    // 캘린더 렌더링
	    renderCalender(thisMonth);
	}
	
    function renderCalender(thisMonth) {

        // 렌더링을 위한 데이터 정리
        currentYear = thisMonth.getFullYear();
        currentMonth = thisMonth.getMonth();
        currentDate = thisMonth.getDate();

        // 이전 달의 마지막 날 날짜와 요일 구하기
        var startDay = new Date(currentYear, currentMonth, 0);
        var prevDate = startDay.getDate();
        var prevDay = startDay.getDay();
        var startDayW = new Date(currentYear, currentMonth, 1);
        
        // 이번 달의 마지막날 날짜와 요일 구하기
        var endDay = new Date(currentYear, currentMonth + 1, 0);
        var nextDate = endDay.getDate();
        var nextDay = endDay.getDay();

        // console.log(prevDate, prevDay, nextDate, nextDay);

        // 현재 월 표기
        $('.year-month').text(currentYear + ' . ' + (currentMonth + 1));
        $('.year-month').attr('data-year',currentYear);
        $('.year-month').attr('data-month',currentMonth+1);

        // 렌더링 html 요소 생성
        calendar = document.querySelector('#date')
        calendarW = document.querySelector('#week')
        calendar.innerHTML = '';
        calendarW.innerHTML = '';

        // 이번달
        calendar.innerHTML = calendar.innerHTML + '<th colspan="2"></th>'
        for (var i = 1; i <= nextDate; i++) {
            calendar.innerHTML = calendar.innerHTML + '<th class="day current">' + i + '</th>'
        }
        calendar.innerHTML = calendar.innerHTML + '<th></th><th></th><th></th><th></th><th></th>'
        
        // 현재 달의 첫 번째 날부터 마지막 날까지 반복하면서 요일을 출력합니다.
        calendarW.innerHTML = calendarW.innerHTML + '<th>사번</th><th style="width: 70px;">이름</th>'
        for (let day = startDayW; day <= endDay; day.setDate(day.getDate() + 1)) {
          const weekday = day.toLocaleDateString('ko-KR', { weekday: 'short'});
          calendarW.innerHTML = calendarW.innerHTML + '<th class="week">' + weekday + '</th>'
        }
        	calendarW.innerHTML = calendarW.innerHTML + '<th>D</th><th>E</th><th>N</th><th>V</th><th>OFF</th>'
        
        // 오늘 날짜 표기
//         if (today.getMonth() == currentMonth) {
//             todayDate = today.getDate();
//             var currentMonthDate = document.querySelectorAll('.dates .current');
//             currentMonthDate[todayDate -1].classList.add('today');
//         }
    }

    // 이전달로 이동
    $(document).on('click', '.go-prev', function() {
        thisMonth = new Date(currentYear, currentMonth - 1, 1);
        renderCalender(thisMonth);
        getNurScheduleList();
    });

    // 다음달로 이동
    $('.go-next').on('click', function() {
        thisMonth = new Date(currentYear, currentMonth + 1, 1);
        renderCalender(thisMonth);
    	getNurScheduleList();
    });
    
    function getNurScheduleList() {
    	var year = $('#year-month').attr('data-year');
    	var month = $('#year-month').attr('data-month');
    	console.log(year, month);
    	
    	let data = {
    		"year" : year,
    		"month" : month
    	}
    	
    	$.ajax({
    		url:'/nurse/getNurseList',
    		contentType:"application/json;charset:utf-8",
			dataType: 'json',
			type: 'post',
			data: JSON.stringify(data),
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: function(rst){
				console.log("간호사 리스트",rst);
				
				var year = $('#year-month').attr('data-year');
		    	var month = $('#year-month').attr('data-month');
		    	
		    	
				var endDay = new Date(year, month, 0);
				
				var nextDate = endDay.getDate();
				
				let str ="";
				
				$.each(rst, function(idx){
					str += `
						<tr>
							<td class="gray-cell">\${rst[idx].empNo}</td>
							<td class="gray-cell">\${rst[idx].empName}</td>
					`;
					
					for (var i = 1; i <= nextDate; i++) {
						
						str += `
							<td class="day current" data-empNo="\${rst[idx].empNo}" data-day="\${i}"> 
							</td>
							`;
			        }
					str += `
						<td class="day current gray-cell eDay" data-empNo="\${rst[idx].empNo}"></td>
						<td class="day current gray-cell eEvening" data-empNo="\${rst[idx].empNo}"></td>
						<td class="day current gray-cell eNight" data-empNo="\${rst[idx].empNo}"></td>
						<td class="day current gray-cell eVac" data-empNo="\${rst[idx].empNo}"></td>
						<td class="day current gray-cell eOff" data-empNo="\${rst[idx].empNo}"></td>
						</tr>
						
					`;
					
				});
				$('#workforceTbody').html("");
				$('#workforceTbody').append(str);
				
				
			},
			error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
			}
    	});
    	
    	//tfoot 칸 만들어놓고 데이터값 주기
    	var year = $('#year-month').attr('data-year');
    	var month = $('#year-month').attr('data-month');
    	
    	console.log('ajax 밖에 년도, 달', year, month);
    	
		var endDay = new Date(year, month, 0);
		console.log('ajax 밖에 endDay', endDay);
		
		var nextDate = endDay.getDate();
		console.log('ajax 밖에 nextDate', nextDate);
		
		let dayTfootTr = `
			<tr>
				<td class="gray-cell"></td>
				<td class="gray-cell">D</td>
			`;
		for (var i = 1; i <= nextDate; i++) {
			dayTfootTr += `
				<td class="day wDay gray-cell" data-day="\${i}"> 
				</td>
				`;
        }
		dayTfootTr += "<td class='gray-cell'></td><td class='gray-cell'></td><td class='gray-cell'></td><td class='gray-cell'></td><td class='gray-cell'></td></tr>";
		$('#workforceTFoot').html("");
		$('#workforceTFoot').append(dayTfootTr);
		
		let eveningTfootTr = `
		<tr>
			<td class="gray-cell"></td>
			<td class="gray-cell">E</td>
		`;
		for (var i = 1; i <= nextDate; i++) {
			eveningTfootTr += `
				<td class="day wEvening gray-cell" data-day="\${i}"> 
				</td>
				`;
        }
		eveningTfootTr += "<td class='gray-cell'></td><td class='gray-cell'></td><td class='gray-cell'></td><td class='gray-cell'></td><td class='gray-cell'></td></tr>";
		$('#workforceTFoot').append(eveningTfootTr);
		
		let nightTfootTr = `
			<tr>
				<td class="gray-cell"></td>
				<td class="gray-cell">N</td>
			`;
		for (var i = 1; i <= nextDate; i++) {
			nightTfootTr += `
				<td class="day wNight gray-cell" data-day="\${i}"> 
				</td>
				`;
        }
		nightTfootTr += "<td class='gray-cell'></td><td class='gray-cell'></td><td class='gray-cell'></td><td class='gray-cell'></td><td class='gray-cell'></td></tr>";
		$('#workforceTFoot').append(nightTfootTr);
		
		let vacationTfootTr = `
			<tr>
				<td class="gray-cell"></td>
				<td class="gray-cell">V</td>
			`;
		for (var i = 1; i <= nextDate; i++) {
			vacationTfootTr += `
				<td class="day wVac gray-cell" data-day="\${i}"> 
				</td>
				`;
        }
		vacationTfootTr += "<td class='gray-cell'></td><td class='gray-cell'></td><td class='gray-cell'></td><td class='gray-cell'></td><td class='gray-cell'></td></tr>";
		$('#workforceTFoot').append(vacationTfootTr);
		
		let offTfootTr = `
			<tr>
				<td class="gray-cell"></td>
				<td class="gray-cell">OFF</td>`;
		for (var i = 1; i <= nextDate; i++) {
			offTfootTr += `
				<td class="day wOFF gray-cell" data-day="\${i}"> 
				</td>
				`;
        }
		offTfootTr += "<td class='gray-cell'></td><td class='gray-cell'></td><td class='gray-cell'></td><td class='gray-cell'></td><td class='gray-cell'></td></tr>";
		$('#workforceTFoot').append(offTfootTr);
		
		
		
		
    	
    	$.ajax({
    		url:'/nurse/getNurScheduleList',
    		contentType:"application/json;charset:utf-8",
			dataType: 'json',
			type: 'post',
			data: JSON.stringify(data),
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: function(rst){
				console.log("간호근무일정 리스트",rst);
				
				$('.current').each(function() {
					  // 현재 td 요소의 data 속성 가져오기

					  var empNo = $(this).attr('data-empno');
					  var day = $(this).attr('data-day');
					  // rst 배열을 순회하며 조건을 만족하는 데이터 찾기
					  for (var idx = 0; idx < rst.length; idx++) {
						
						var nurscDtWithoutDay = "";
						if(rst[idx].nurscDt.slice(8, 9) == 0) {
							nurscDtWithoutDay += rst[idx].nurscDt.slice(9, 10);
						}else {
							nurscDtWithoutDay += rst[idx].nurscDt.slice(8, 10);
						}
						
						//근무상태 출력용 텍스트 저장
						let eStatus = "";
						if(rst[idx].nurscType == 'NSTY01') {
							eStatus += 'D';
						}else if (rst[idx].nurscType == 'NSTY02') {
							eStatus += 'E';
						}else if (rst[idx].nurscType == 'NSTY03') {
							eStatus += 'N';
						}else if (rst[idx].nurscType == 'NSTY04') {
							eStatus += 'OFF';
						}else {
							eStatus += 'V';
						}
						
					    if (rst[idx].empNo === empNo && nurscDtWithoutDay === day) {
					      // 조건을 만족하는 경우 해당 td에 nurscType 추가
					      if(eStatus == 'OFF') {
					    	 $(this).text(eStatus);
					    	 $(this).addClass('tdOff');
					      }else if(eStatus == 'V') {
					     	 $(this).text(eStatus);
					    	 $(this).addClass('tdLeav');
					      } else {
					     	 $(this).text(eStatus);
					      }
					      break;  // 조건을 만족하는 경우 더 이상 순회하지 않도록 break
					    }
					  }
					});
				
				//일별 데이근무 합계 구하기
				$('tr td.day.wDay').each(function() {
					  // 현재 td 요소의 data-day 속성 가져오기
					  var day = $(this).data('day');

					  // rst 배열을 순회하며 조건을 만족하는 데이터 개수 찾기
					  var count = 0;  // 각 td에 대한 count를 초기화

					  $.each(rst, function(idx){
						var nurscDtWithoutDay = "";
						if(rst[idx].nurscDt.slice(8, 9) == 0) {
							nurscDtWithoutDay += rst[idx].nurscDt.slice(9, 10);
						}else {
							nurscDtWithoutDay += rst[idx].nurscDt.slice(8, 10);
						}
						
					    if (rst[idx].nurscType == 'NSTY01' && nurscDtWithoutDay == day) {
					      count++;
					    }
					  });

					  // 해당 td에 데이터 개수 추가
					  $(this).text(count);
					});
				
				//일별 이브닝근무 합계 구하기
				$('tr td.day.wEvening').each(function() {
					  // 현재 td 요소의 data-day 속성 가져오기
					  var day = $(this).data('day');

					  // rst 배열을 순회하며 조건을 만족하는 데이터 개수 찾기
					  var count = 0;  // 각 td에 대한 count를 초기화

					  $.each(rst, function(idx){
						var nurscDtWithoutDay = "";
						if(rst[idx].nurscDt.slice(8, 9) == 0) {
							nurscDtWithoutDay += rst[idx].nurscDt.slice(9, 10);
						}else {
							nurscDtWithoutDay += rst[idx].nurscDt.slice(8, 10);
						}
						
					    if (rst[idx].nurscType == 'NSTY02' && nurscDtWithoutDay == day) {
					      count++;
					    }
					  });

					  // 해당 td에 데이터 개수 추가
					  $(this).text(count);
					});
				
				//일별 나이트근무 합계 구하기
				$('tr td.day.wNight').each(function() {
					  // 현재 td 요소의 data-day 속성 가져오기
					  var day = $(this).data('day');

					  // rst 배열을 순회하며 조건을 만족하는 데이터 개수 찾기
					  var count = 0;  // 각 td에 대한 count를 초기화

					  $.each(rst, function(idx){
						var nurscDtWithoutDay = "";
						if(rst[idx].nurscDt.slice(8, 9) == 0) {
							nurscDtWithoutDay += rst[idx].nurscDt.slice(9, 10);
						}else {
							nurscDtWithoutDay += rst[idx].nurscDt.slice(8, 10);
						}
						
					    if (rst[idx].nurscType == 'NSTY03' && nurscDtWithoutDay == day) {
					      count++;
					    }
					  });

					  // 해당 td에 데이터 개수 추가
					  $(this).text(count);
					});
				
				//일별 오프 합계 구하기
				$('tr td.day.wOFF').each(function() {
					  // 현재 td 요소의 data-day 속성 가져오기
					  var day = $(this).data('day');

					  // rst 배열을 순회하며 조건을 만족하는 데이터 개수 찾기
					  var count = 0;  // 각 td에 대한 count를 초기화

					  $.each(rst, function(idx){
						var nurscDtWithoutDay = "";
						if(rst[idx].nurscDt.slice(8, 9) == 0) {
							nurscDtWithoutDay += rst[idx].nurscDt.slice(9, 10);
						}else {
							nurscDtWithoutDay += rst[idx].nurscDt.slice(8, 10);
						}
						
					    if (rst[idx].nurscType == 'NSTY04' && nurscDtWithoutDay == day) {
					      count++;
					    }
					  });

					  // 해당 td에 데이터 개수 추가
					  $(this).text(count);
					});
				
				//일별 휴가 합계 구하기
				$('tr td.day.wVac').each(function() {
					  // 현재 td 요소의 data-day 속성 가져오기
					  var day = $(this).data('day');

					  // rst 배열을 순회하며 조건을 만족하는 데이터 개수 찾기
					  var count = 0;  // 각 td에 대한 count를 초기화

					  $.each(rst, function(idx){
						var nurscDtWithoutDay = "";
						if(rst[idx].nurscDt.slice(8, 9) == 0) {
							nurscDtWithoutDay += rst[idx].nurscDt.slice(9, 10);
						}else {
							nurscDtWithoutDay += rst[idx].nurscDt.slice(8, 10);
						}
						
					    if (rst[idx].nurscType == 'NSTY05' && nurscDtWithoutDay == day) {
					      count++;
					    }
					  });

					  // 해당 td에 데이터 개수 추가
					  $(this).text(count);
					});
				
				
				//사원별 데이근무 합계 구하기
				$('.eDay').each(function() {
					  // 현재 td 요소의 data-day 속성 가져오기
					  var empNo = $(this).data('empno');

					  // rst 배열을 순회하며 조건을 만족하는 데이터 개수 찾기
					  var count = 0;  // 각 td에 대한 count를 초기화

					  $.each(rst, function(idx){
						
					    if (rst[idx].nurscType == 'NSTY01' && rst[idx].empNo == empNo) {
					      count++;
					    }
					  });

					  // 해당 td에 데이터 개수 추가
					  $(this).text(count);
					});
				
				//사원별 이브닝근무 합계 구하기
				$('.eEvening').each(function() {
					  // 현재 td 요소의 data-day 속성 가져오기
					  var empNo = $(this).data('empno');

					  // rst 배열을 순회하며 조건을 만족하는 데이터 개수 찾기
					  var count = 0;  // 각 td에 대한 count를 초기화

					  $.each(rst, function(idx){
						
					    if (rst[idx].nurscType == 'NSTY02' && rst[idx].empNo == empNo) {
					      count++;
					    }
					  });

					  // 해당 td에 데이터 개수 추가
					  $(this).text(count);
					});
				
				//사원별 나이트근무 합계 구하기
				$('.eNight').each(function() {
					  // 현재 td 요소의 data-day 속성 가져오기
					  var empNo = $(this).data('empno');

					  // rst 배열을 순회하며 조건을 만족하는 데이터 개수 찾기
					  var count = 0;  // 각 td에 대한 count를 초기화

					  $.each(rst, function(idx){
						
					    if (rst[idx].nurscType == 'NSTY03' && rst[idx].empNo == empNo) {
					      count++;
					    }
					  });

					  // 해당 td에 데이터 개수 추가
					  $(this).text(count);
					});
				
				//사원별 휴가 합계 구하기
				$('.eVac').each(function() {
					  // 현재 td 요소의 data-day 속성 가져오기
					  var empNo = $(this).data('empno');

					  // rst 배열을 순회하며 조건을 만족하는 데이터 개수 찾기
					  var count = 0;  // 각 td에 대한 count를 초기화

					  $.each(rst, function(idx){
						
					    if (rst[idx].nurscType == 'NSTY05' && rst[idx].empNo == empNo) {
					      count++;
					    }
					  });

					  // 해당 td에 데이터 개수 추가
					  $(this).text(count);
					});
				
				//사원별 오프 합계 구하기
				$('.eOff').each(function() {
					  // 현재 td 요소의 data-day 속성 가져오기
					  var empNo = $(this).data('empno');

					  // rst 배열을 순회하며 조건을 만족하는 데이터 개수 찾기
					  var count = 0;  // 각 td에 대한 count를 초기화

					  $.each(rst, function(idx){
						
					    if (rst[idx].nurscType == 'NSTY04' && rst[idx].empNo == empNo) {
					      count++;
					    }
					  });

					  // 해당 td에 데이터 개수 추가
					  $(this).text(count);
					});
				
			},
			error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
			}
    	});
    } 
});


$(document).on('click', '#createWorkforceExcel', function() {
	var year = $('#year-month').attr('data-year');
	var month = $('#year-month').attr('data-month');
	//*******
	//createWorkforceExcel(year, month);
	location.href="/excels?year="+year+"&month="+month;
});

//엑셀파일다운
function createWorkforceExcel(year, month) {
	
	let data = {
		"year" : year,
		"month" : month
	}
	
	$.ajax({
      	url: "/nurse/createWorkforceExcel",
      	contentType:"application/json;charset:utf-8",
		type: 'post',
		dataType: 'text',
		data: JSON.stringify(data),
     	beforeSend: function (xhr) {
        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
      	},
      	 success: function (res) {
      	    console.log("되는거임??",res);
      	      
      	    if (res) {
      	    	 // 사용자 에이전트에서 XMLHttpRequest를 사용하여 responseType을 blob으로 설정
      	        var xhr = new XMLHttpRequest();
      	        xhr.responseType = 'blob';
      	        
      	        xhr.onload = function () {
      	            var blob = xhr.response;
      	            
      	            // 파일 다운로드
      	            var link = document.createElement("a");
      	            link.href = window.URL.createObjectURL(blob);
      	            link.download = "workforce_schedule.xlsx";
      	            document.body.appendChild(link);
      	            link.click();
      	            document.body.removeChild(link);
      	        };
      	        
      	        xhr.open('GET', window.URL.createObjectURL(new Blob([res])), true);
      	        xhr.send();
      	      } else {
      	        Swal.fire({
      	          title: '다운 실패',
      	          text: '다운로드에 실패하였습니다.',
      	          icon: 'error',
      	          confirmButtonColor: '#0ABAB5',
      	          confirmButtonText: '확인',
      	        });
      	      }
      	    },
      	    error: function (request, status, error) {
      	      console.log("code: " + request.status);
      	      console.log("message: " + request.responseText);
      	      console.log("error: " + error);
      	    }
    })

}


</script>