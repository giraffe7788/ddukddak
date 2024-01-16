<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<style>
	 /* 팝오버 창 크기 조절 */
.popover {
    width: 160px; /* 원하는 최대 폭 설정 */
    height: 102px;
    border-radius: 16px;
	border: 1px solid var(--border, #E0E8E6);
	background: var(--white, #FFF);
	box-shadow: 0px 4px 16px 0px rgba(0, 48, 47, 0.08);
}
.popover-body {
	width: 160px; /* 원하는 최대 폭 설정 */
    height: 102px;
}
    /* 팝오버 내용 컨텐츠 크기 조절 */
.popover-content {
    max-height: 200px; /* 원하는 최대 높이 설정 */
    overflow-y: auto; /* 컨텐츠가 넘칠 경우 스크롤 표시 */
}

.popover{
	background-color: white !important;
}	

.current-login-info {
	position: absolute;
    margin: -104px 0px 0px 400px;
    font-size: 30px;
    font-family: 'Pretendard6';
    color: black;
}

</style>
<script>

$(document).ready(function(){
	
	
	$('.header-icon').mouseenter(
			function() {
				$(this).find('path').attr('fill',
						'var(--ci-02, #00A9A4)');
			});
	
	$('.header-icon').mouseleave(function() {
		$(this).find('path').attr('fill', '#8D9EA2');
	});
	
	 if (window.location.href.includes('/notice/list')) {
		 $('.header-icon').filter('.header-notice-icon').off('mouseenter').off('mouseleave');
	  };
	  
	 if (window.location.href.includes('/common/schedule')) {
		 $('.header-icon').filter('.header-schedule-icon').off('mouseenter').off('mouseleave');
	  };
	  
	 if (window.location.href.includes('/notice/list')) {
		 $('.header-icon').filter('.header-notice-icon').off('mouseenter').off('mouseleave');
	  };
	  
	 if (window.location.href.includes('/notice/list')) {
		 $('.header-icon').filter('.header-notice-icon').off('mouseenter').off('mouseleave');
	  };
	
	function getPopoverContent() {
		let empNo = $('#empNo').data('empno');
		let str="";
		
		str += "<a href='/emp/detail?empNo=";
		str += empNo;
		str += "' class='d-flex dduk-popover'> 마이페이지 </a>";
		str += "</br><a href='/common/logout.do' class='d-flex dduk-popover popover-b'>로그아웃</a>";
		
        return str;
     }
	
	$('[data-toggle="popover"]').popover({
		trigger : 'click', // 이벤트를 hover로 설정 (마우스를 올렸을 때)
		placement : 'bottom', // 팝오버가 표시될 위치 (top, bottom, left, right 등)
		offset: '-50,16',
		html: true,
		content: function () {
	        return getPopoverContent();
		}
	});
});
	
	
	function updateClock() {
	    var now = new Date();
	    var hours = now.getHours();
	    var minutes = now.getMinutes();
	    var seconds = now.getSeconds();
	
	    // 시, 분, 초를 두 자리 숫자로 표시하기
	    hours = hours < 10 ? '0' + hours : hours;
	    minutes = minutes < 10 ? '0' + minutes : minutes;
	    seconds = seconds < 10 ? '0' + seconds : seconds;
	
	    // 화면에 시계 업데이트
	    document.getElementById('clock').innerText = hours + ':' + minutes + ':' + seconds;
	  }
	
	  // 1초마다 updateClock 함수 호출하여 시계 업데이트
	  setInterval(updateClock, 1000);
		

// 	function setClock() {
// 		var dateInfo = new Date();
// 		var hour = modifyNumber(dateInfo.getHours());
// 		var min = modifyNumber(dateInfo.getMinutes());
// 		var sec = modifyNumber(dateInfo.getSeconds());
// 		document.getElementById("time").innerHTML = hour + ":" + min + ":"
// 				+ sec;

// 	}

	function setDayLabel() {
		var dateInfo = new Date();
		var dayLabel = dateInfo.getDay();

		var week = new Array('일', '월', '화', '수', '목', '금', '토');
		var today = new Date().getDay();
		var todayLabel = week[today];
		document.getElementById("todayLabel").innerHTML = "(" + todayLabel
				+ ")";
	}

	function modifyNumber(time) {
		if (parseInt(time) < 10) {
			return "0" + time;
		} else
			return time;
	}

	window.onload = function() {
		setClock();
		setDayLabel();
		setInterval(setClock, 1000); //1초마다 setClock 함수 실행
	}
	
	function openRoadMapModal(){
		$('#loadmapModal').modal('show');
	}
	
</script>
<%
	Date date = new Date();
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat simpleTime = new SimpleDateFormat("HH:mm:ss");
	String strDate = simpleDate.format(date);
	String strTime = simpleTime.format(date);
%>
<nav class="dduk-nav-header">
	<div
		class="d-flex justify-content-between align-items-center header-div">
		<div class="header-text-bold">
			<span style="font-family: 'Pretendard7'; font-size: 24px;">
				<sec:authorize access="hasRole('ROLE_DOC')">
					의사
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_NUR')">
					간호사
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_AMS')">
					원무과
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_TRM')">
					치료사
				</sec:authorize>
				<sec:authorize access="hasRole('ROLE_PER')">
					인사과
				</sec:authorize>
				<sec:authentication property="principal.employeeVO" var="empVO"/>
				${empVO.empName}
				<div id="empNo" data-empno="${empVO.empNo}"></div>
			</span> 
			<span style="font-family: 'Pretendard5'; font-size: 24px;">님
				안녕하세요😊
			</span>
		</div>

		<div class="d-flex dduk-nav-header-right align-items-center">
			<div style="width:200px;">
				<span class="header-text"><%=strDate%> <span id="todayLabel"></span> &nbsp;</span> 
				<span id="clock" class="header-text time">00:00:00</span>
			</div>
			<div class="d-flex header-icon-set">
				<span>
					<a href="#" onclick="openRoadMapModal()">
						<svg class="header-icon" style="margin-top: 2.5px; width: 45px; height: 45px;" xmlns="http://www.w3.org/2000/svg" height="12" width="12" viewBox="0 0 512 512">
							<path fill="#8d9ea2" d="M224 32H64C46.3 32 32 46.3 32 64v64c0 17.7 14.3 32 32 32H441.4c4.2 0 8.3-1.7 11.3-4.7l48-48c6.2-6.2 6.2-16.4 0-22.6l-48-48c-3-3-7.1-4.7-11.3-4.7H288c0-17.7-14.3-32-32-32s-32 14.3-32 32zM480 256c0-17.7-14.3-32-32-32H288V192H224v32H70.6c-4.2 0-8.3 1.7-11.3 4.7l-48 48c-6.2 6.2-6.2 16.4 0 22.6l48 48c3 3 7.1 4.7 11.3 4.7H448c17.7 0 32-14.3 32-32V256zM288 480V384H224v96c0 17.7 14.3 32 32 32s32-14.3 32-32z"/>
						</svg>
					</a>
				</span>
				<span>
					<a href="/notice/list">
						<svg class="header-icon header-notice-icon" width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M9.5396 19.0107H7.54227C6.56816 19.0107 5.73425 18.6638 5.04055 17.9701C4.34685 17.2764 4 16.4424 4 15.4683V12.4536C4 11.4795 4.34685 10.6455 5.04055 9.95185C5.73425 9.25812 6.56816 8.91125 7.54227 8.91125H15.1169L21.2104 5.26717C21.8008 4.91294 22.3962 4.91095 22.9967 5.2612C23.5971 5.61141 23.8974 6.12215 23.8974 6.79341V21.1285C23.8974 21.7998 23.5971 22.3105 22.9967 22.6607C22.3962 23.011 21.8008 23.009 21.2104 22.6547L15.1169 19.0107H12.4789V25.1909C12.4789 25.6074 12.338 25.9564 12.0562 26.2381C11.7744 26.5197 11.4252 26.6606 11.0086 26.6606C10.592 26.6606 10.243 26.5197 9.96165 26.2381C9.68028 25.9564 9.5396 25.6074 9.5396 25.1909V19.0107ZM25.5674 20.0734V7.84851C26.3362 8.54443 26.9555 9.42277 27.4253 10.4835C27.8951 11.5443 28.13 12.7049 28.13 13.9656C28.13 15.2262 27.8951 16.3853 27.4253 17.443C26.9555 18.5007 26.3362 19.3775 25.5674 20.0734Z" fill="#8D9EA2"/>
						</svg>
					</a>
				</span>
				<span>
					<a href="/common/schedule">
						<svg class="header-icon header-schedule-icon" width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M19.1853 23.736C18.3218 23.736 17.592 23.4379 16.9958 22.8417C16.3996 22.2455 16.1015 21.5157 16.1015 20.6522C16.1015 19.7888 16.3996 19.059 16.9958 18.4628C17.592 17.8666 18.3218 17.5685 19.1853 17.5685C20.0487 17.5685 20.7785 17.8666 21.3747 18.4628C21.9709 19.059 22.269 19.7888 22.269 20.6522C22.269 21.5157 21.9709 22.2455 21.3747 22.8417C20.7785 23.4379 20.0487 23.736 19.1853 23.736ZM7.467 28.67C6.78858 28.67 6.2078 28.4284 5.72468 27.9453C5.24156 27.4622 5 26.8814 5 26.203V8.934C5 8.25558 5.24156 7.6748 5.72468 7.19168C6.2078 6.70856 6.78858 6.467 7.467 6.467H8.7005V5.2335C8.7005 4.88401 8.81871 4.59105 9.05513 4.35463C9.29155 4.11821 9.58451 4 9.934 4C10.2835 4 10.5764 4.11821 10.8129 4.35463C11.0493 4.59105 11.1675 4.88401 11.1675 5.2335V6.467H21.0355V5.2335C21.0355 4.88401 21.1537 4.59105 21.3901 4.35463C21.6266 4.11821 21.9195 4 22.269 4C22.6185 4 22.9114 4.11821 23.1479 4.35463C23.3843 4.59105 23.5025 4.88401 23.5025 5.2335V6.467H24.736C25.4144 6.467 25.9952 6.70856 26.4783 7.19168C26.9614 7.6748 27.203 8.25558 27.203 8.934V26.203C27.203 26.8814 26.9614 27.4622 26.4783 27.9453C25.9952 28.4284 25.4144 28.67 24.736 28.67H7.467ZM7.467 26.203H24.736V13.868H7.467V26.203Z" fill="#8D9EA2"/>
						</svg>
					</a>
				</span>
				<!-- 메세지 아이콘 -->
				<span>
					<a>
						<jsp:include page="chat.jsp"/>
					</a>
				</span>
			</div>
			<img id="header-profile" role="button" data-toggle="popover" data-placement="bottom"
				src="/resources/upload/empProfile/${empVO.profileNm}">
		</div>
	</div>
</nav>

<!-- 로드맵 모달 시작 -->
<div id="loadmapModal" class="modal fade" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="top: 75px; width: 1156px; margin-left: -340px;">
			<div class="modal-body">
				<img src="/resources/images/roadMap.png">
				<div class="current-login-info">
					현재 접속한 권한 : 
					<sec:authorize access="hasRole('ROLE_DOC')">
						<span style="color: #4dc1b5; font-size: 30px">의사</span>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_NUR')">
						<span style="color: #f6c23e; font-size: 30px">간호사</span>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_AMS')">
						<span style="color: #f5857d; font-size: 30px">원무과</span>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_TRM')">
						<span style="color: #2ed312; font-size: 30px">치료사</span>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_PER')">
						<span style="color: #8E7CF2; font-size: 30px">인사과</span>
					</sec:authorize>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" id="btnCancelCreateDietModal" class="dduk-btn-normal" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<!-- 로드맵 모달 끝 -->

<script>
const empName = '${empVO.empName}';
const empNo = '${empVO.empNo}';
const empJbpsCd = '${empVO.empJbpsCd}'
</script>