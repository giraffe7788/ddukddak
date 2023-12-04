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
	
	function getPopoverContent() {
        return `
        		<a class="d-flex dduk-popover">
        			마이페이지
        		</a>
        		</br>
        		<a href="/common/logout.do" class="d-flex dduk-popover popover-b">
        			로그아웃
        		</a>
   			`;
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
				${getCurrentLoginName}
			</span> 
			<span style="font-family: 'Pretendard5'; font-size: 24px;">님
				안녕하세요😊
			</span>
		</div>

		<div class="d-flex dduk-nav-header-right align-items-center">
			<div style="width:200px;">
				<span class="header-text"><%=strDate%> <span id="todayLabel"></span> &nbsp;</span> 
				<span id="time" class="header-text time"><%=strTime%></span>
			</div>
			<div class="d-flex header-icon-set">
				<span>
					<a>
						<svg class="header-icon" width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M9.5396 19.0107H7.54227C6.56816 19.0107 5.73425 18.6638 5.04055 17.9701C4.34685 17.2764 4 16.4424 4 15.4683V12.4536C4 11.4795 4.34685 10.6455 5.04055 9.95185C5.73425 9.25812 6.56816 8.91125 7.54227 8.91125H15.1169L21.2104 5.26717C21.8008 4.91294 22.3962 4.91095 22.9967 5.2612C23.5971 5.61141 23.8974 6.12215 23.8974 6.79341V21.1285C23.8974 21.7998 23.5971 22.3105 22.9967 22.6607C22.3962 23.011 21.8008 23.009 21.2104 22.6547L15.1169 19.0107H12.4789V25.1909C12.4789 25.6074 12.338 25.9564 12.0562 26.2381C11.7744 26.5197 11.4252 26.6606 11.0086 26.6606C10.592 26.6606 10.243 26.5197 9.96165 26.2381C9.68028 25.9564 9.5396 25.6074 9.5396 25.1909V19.0107ZM25.5674 20.0734V7.84851C26.3362 8.54443 26.9555 9.42277 27.4253 10.4835C27.8951 11.5443 28.13 12.7049 28.13 13.9656C28.13 15.2262 27.8951 16.3853 27.4253 17.443C26.9555 18.5007 26.3362 19.3775 25.5674 20.0734Z" fill="#8D9EA2"/>
						</svg>
					</a>
				</span>
				<span>
					<a>
						<svg class="header-icon" width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M19.1853 23.736C18.3218 23.736 17.592 23.4379 16.9958 22.8417C16.3996 22.2455 16.1015 21.5157 16.1015 20.6522C16.1015 19.7888 16.3996 19.059 16.9958 18.4628C17.592 17.8666 18.3218 17.5685 19.1853 17.5685C20.0487 17.5685 20.7785 17.8666 21.3747 18.4628C21.9709 19.059 22.269 19.7888 22.269 20.6522C22.269 21.5157 21.9709 22.2455 21.3747 22.8417C20.7785 23.4379 20.0487 23.736 19.1853 23.736ZM7.467 28.67C6.78858 28.67 6.2078 28.4284 5.72468 27.9453C5.24156 27.4622 5 26.8814 5 26.203V8.934C5 8.25558 5.24156 7.6748 5.72468 7.19168C6.2078 6.70856 6.78858 6.467 7.467 6.467H8.7005V5.2335C8.7005 4.88401 8.81871 4.59105 9.05513 4.35463C9.29155 4.11821 9.58451 4 9.934 4C10.2835 4 10.5764 4.11821 10.8129 4.35463C11.0493 4.59105 11.1675 4.88401 11.1675 5.2335V6.467H21.0355V5.2335C21.0355 4.88401 21.1537 4.59105 21.3901 4.35463C21.6266 4.11821 21.9195 4 22.269 4C22.6185 4 22.9114 4.11821 23.1479 4.35463C23.3843 4.59105 23.5025 4.88401 23.5025 5.2335V6.467H24.736C25.4144 6.467 25.9952 6.70856 26.4783 7.19168C26.9614 7.6748 27.203 8.25558 27.203 8.934V26.203C27.203 26.8814 26.9614 27.4622 26.4783 27.9453C25.9952 28.4284 25.4144 28.67 24.736 28.67H7.467ZM7.467 26.203H24.736V13.868H7.467V26.203Z" fill="#8D9EA2"/>
						</svg>
					</a>
				</span>
				<span>
					<a>
					<svg class="header-icon" width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
						<path d="M11.101 15.6515C11.4363 15.6515 11.7174 15.5381 11.9442 15.3112C12.1711 15.0844 12.2845 14.8033 12.2845 14.468C12.2845 14.1327 12.1711 13.8516 11.9442 13.6248C11.7174 13.3979 11.4363 13.2845 11.101 13.2845C10.7657 13.2845 10.4846 13.3979 10.2578 13.6248C10.0309 13.8516 9.9175 14.1327 9.9175 14.468C9.9175 14.8033 10.0309 15.0844 10.2578 15.3112C10.4846 15.5381 10.7657 15.6515 11.101 15.6515ZM15.835 15.6515C16.1703 15.6515 16.4514 15.5381 16.6782 15.3112C16.9051 15.0844 17.0185 14.8033 17.0185 14.468C17.0185 14.1327 16.9051 13.8516 16.6782 13.6248C16.4514 13.3979 16.1703 13.2845 15.835 13.2845C15.4997 13.2845 15.2186 13.3979 14.9918 13.6248C14.7649 13.8516 14.6515 14.1327 14.6515 14.468C14.6515 14.8033 14.7649 15.0844 14.9918 15.3112C15.2186 15.5381 15.4997 15.6515 15.835 15.6515ZM20.569 15.6515C20.9043 15.6515 21.1854 15.5381 21.4122 15.3112C21.6391 15.0844 21.7525 14.8033 21.7525 14.468C21.7525 14.1327 21.6391 13.8516 21.4122 13.6248C21.1854 13.3979 20.9043 13.2845 20.569 13.2845C20.2337 13.2845 19.9526 13.3979 19.7258 13.6248C19.4989 13.8516 19.3855 14.1327 19.3855 14.468C19.3855 14.8033 19.4989 15.0844 19.7258 15.3112C19.9526 15.5381 20.2337 15.6515 20.569 15.6515ZM8.734 23.936L6.01195 26.658C5.63717 27.0328 5.20816 27.1167 4.72489 26.9095C4.24163 26.7024 4 26.3326 4 25.8V7.367C4 6.71607 4.23177 6.15884 4.69531 5.69531C5.15884 5.23177 5.71607 5 6.367 5H25.303C25.9539 5 26.5112 5.23177 26.9747 5.69531C27.4382 6.15884 27.67 6.71607 27.67 7.367V21.569C27.67 22.2199 27.4382 22.7772 26.9747 23.2407C26.5112 23.7042 25.9539 23.936 25.303 23.936H8.734Z" fill="#8D9EA2"/>
					</svg>
					</a>
				</span>
				<span>
					<a>
						<svg class="header-icon" width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M7.2335 24.9695C6.88401 24.9695 6.59105 24.8513 6.35463 24.6149C6.11821 24.3784 6 24.0855 6 23.736C6 23.3865 6.11821 23.0936 6.35463 22.8571C6.59105 22.6207 6.88401 22.5025 7.2335 22.5025H8.467V13.868C8.467 12.1617 8.98096 10.6455 10.0089 9.31947C11.0368 7.99346 12.3731 7.12487 14.0178 6.7137V5.85025C14.0178 5.33629 14.1976 4.89943 14.5574 4.53966C14.9172 4.17989 15.354 4 15.868 4C16.382 4 16.8188 4.17989 17.1786 4.53966C17.5384 4.89943 17.7183 5.33629 17.7183 5.85025V6.7137C19.3629 7.12487 20.6992 7.99346 21.7271 9.31947C22.755 10.6455 23.269 12.1617 23.269 13.868V22.5025H24.5025C24.852 22.5025 25.145 22.6207 25.3814 22.8571C25.6178 23.0936 25.736 23.3865 25.736 23.736C25.736 24.0855 25.6178 24.3784 25.3814 24.6149C25.145 24.8513 24.852 24.9695 24.5025 24.9695H7.2335ZM15.868 28.67C15.1896 28.67 14.6088 28.4284 14.1257 27.9453C13.6426 27.4622 13.401 26.8814 13.401 26.203H18.335C18.335 26.8814 18.0934 27.4622 17.6103 27.9453C17.1272 28.4284 16.5464 28.67 15.868 28.67Z" fill="#8D9EA2"/>
						</svg>
					</a>
				</span>
			</div>
			<img id="header-profile" role="button" data-toggle="popover" data-placement="bottom"
				src="/resources/images/403022_business man_male_user_avatar_profile_icon.png">
		</div>
	</div>
</nav>