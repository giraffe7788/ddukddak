<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" 
%>
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
</style>
<script>

$(document).ready(function(){
	$('span').mouseenter(
			function() {
				$(this).find('svg').find('path').attr('fill',
						'var(--ci-02, #00A9A4)');
			});
	
	$('span').mouseleave(function() {
		$(this).find('svg').find('path').attr('fill', '#647675');
	});
	
	function getPopoverContent() {
        return `
        		<a class="d-flex dduk-popover">
        			마이페이지
        		</a>
        		</br>
        		<a href="/emp/logout.do" class="d-flex dduk-popover popover-b">
        			로그아웃
        		</a>
   			`;
     }
	
	$('[data-toggle="popover"]').popover({
		trigger : 'click', // 이벤트를 hover로 설정 (마우스를 올렸을 때)
		placement : 'bottom', // 팝오버가 표시될 위치 (top, bottom, left, right 등)
		offset: '-10,16',
		html: true,
		content: function () {
	        return getPopoverContent();
		}
	});
	
// 	$(document).on('click', '.popover-b', function(){
// 		 $.ajax({
// 	          type: 'POST',
// 	          url: '/logout', // 로그아웃을 처리할 서버 엔드포인트 URL로 변경해야 합니다.
// 	          success: function(response) {
// 	            // 로그아웃 성공 시 처리
// 	            window.location.href = '/emp/login';
// 	            console.log('로그아웃 성공:', response);
// 	          },
// 	          error: function(error) {
// 	            // 로그아웃 실패 시 처리
// 	            console.error('로그아웃 실패:', error);
// 	          }
// 	        });

// 	})
});

	

	function setClock() {
		var dateInfo = new Date();
		var hour = modifyNumber(dateInfo.getHours());
		var min = modifyNumber(dateInfo.getMinutes());
		var sec = modifyNumber(dateInfo.getSeconds());
		document.getElementById("time").innerHTML = hour + ":" + min + ":"
				+ sec;

	}

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
			<span style="font-family: 'Pretendard6';">
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
				${getCurrentLoginName}
			</span> 
			<span>님
				안녕하세요😊
			</span>
		</div>

		<div class="d-flex dduk-nav-header-right align-items-center">
			<div style="width:220px;">
				<span class="header-text"><%=strDate%> <span id="todayLabel"></span> &nbsp;</span> 
				<span id="time" class="header-text time"><%=strTime%></span>
			</div>
			<div class="d-flex header-icon-set">
				<span>
					<a>
						<svg class="header-icon" data-name="Layer 43" viewBox="0 0 50 50" xmlns="http://www.w3.org/2000/svg"><path d="M46 2H4a2 2 0 0 0-2 2v31a2 2 0 0 0 2 2h12.9l6.4 10.1a2 2 0 0 0 3.4 0L33.1 37H46a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2Zm-2 31H32a2 2 0 0 0-1.7.9L25 42.3 19.7 34a2 2 0 0 0-1.7-1H6V6h38v27Z" fill="#647675" class="fill-010101"></path><path d="M12 14h26a2 2 0 0 0 0-4H12a2 2 0 0 0 0 4ZM12 22h26a2 2 0 0 0 0-4H12a2 2 0 0 0 0 4Z" fill="#647675" class="fill-010101"></path></svg>
					</a>
				</span>
				<span>
					<a>
						<svg class="header-icon" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M1 4c0-1.1.9-2 2-2h14a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V4zm2 2v12h14V6H3zm2-6h2v2H5V0zm8 0h2v2h-2V0zM5 9h2v2H5V9zm0 4h2v2H5v-2zm4-4h2v2H9V9zm0 4h2v2H9v-2zm4-4h2v2h-2V9zm0 4h2v2h-2v-2z" fill="#647675" class="fill-000000"></path></svg>
					</a>
				</span>
				<span>
					<a>
						<svg class="header-icon" viewBox="0 0 576 512" xmlns="http://www.w3.org/2000/svg"><path d="M416 192c0-88.4-93.1-160-208-160S0 103.6 0 192c0 34.3 14.1 65.9 38 92-13.4 30.2-35.5 54.2-35.8 54.5-2.2 2.3-2.8 5.7-1.5 8.7S4.8 352 8 352c36.6 0 66.9-12.3 88.7-25 32.2 15.7 70.3 25 111.3 25 114.9 0 208-71.6 208-160zm122 220c23.9-26 38-57.7 38-92 0-66.9-53.5-124.2-129.3-148.1.9 6.6 1.3 13.3 1.3 20.1 0 105.9-107.7 192-240 192-10.8 0-21.3-.8-31.7-1.9C207.8 439.6 281.8 480 368 480c41 0 79.1-9.2 111.3-25 21.8 12.7 52.1 25 88.7 25 3.2 0 6.1-1.9 7.3-4.8 1.3-2.9.7-6.3-1.5-8.7-.3-.3-22.4-24.2-35.8-54.5z" fill="#647675" class="fill-000000"></path></svg>
					</a>
				</span>
				<span>
					<a>
						<svg class="header-icon" viewBox="0 0 448 512" xmlns="http://www.w3.org/2000/svg"><path d="M256 32v19.2c73 14.83 128 79.4 128 156.8v18.8c0 47.1 17.3 92.4 48.5 127.6l7.4 8.3c8.4 9.5 10.5 22.9 5.3 34.4S428.6 416 416 416H32c-12.6 0-24.029-7.4-29.191-18.9-5.162-11.5-3.097-24.9 5.275-34.4l7.416-8.3C46.74 319.2 64 273.9 64 226.8V208c0-77.4 54.1-141.97 128-156.8V32c0-17.67 14.3-32 32-32s32 14.33 32 32zm-32 480c-17 0-33.3-6.7-45.3-18.7S160 464.1 160 448h128c0 16.1-6.7 33.3-18.7 45.3S240.1 512 224 512z" fill="#647675"></path></svg>
					</a>
				</span>
			</div>
			<img id="header-profile" role="button" data-toggle="popover" data-placement="bottom"
				src="/resources/images/403022_business man_male_user_avatar_profile_icon.png">
		</div>
	</div>
</nav>