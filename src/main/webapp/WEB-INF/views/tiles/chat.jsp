<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
.selectedEmployee {
    background-color: var(--bg-02, #DBF2F4);
}

.dayoung{
	text-align:right;
	font-size:13px;
}

td{
	background-color: rgba( 255, 255, 255, 0 ) !important;
}

#chatWindow {
	display: none;
	width: 400px;
	height: 618px;
	border: 0px !important;
}

#chatRoomWindow {
	width: 100%;
	height: 100%;
	padding: 16px;
}

.chat-card {
	width: 400px;
	height: 618px;
	flex-shrink: 0;
	border-radius: 32px;
	border: 1px solid var(--border, #EBEFF0);
	background: var(--white, #FFF);
	/* Drop Shadow */
	box-shadow: 0px 2px 16px 0px rgba(0, 63, 57, 0.08);
}

.chat-card-3rd {
	padding: 32px;
	width: 400px;
	height: 618px;
	flex-shrink: 0;
	border-radius: 32px;
	border: 1px solid var(--border, #EBEFF0);
	background: var(--white, #FFF);
	/* Drop Shadow */
	box-shadow: 0px 2px 16px 0px rgba(0, 63, 57, 0.08);
}

.tab-button {
	background-color: rgba( 255, 255, 255, 0 );
	color: var(--black-01, #333);
	font-family: 'Pretendard6';
	font-size: 20px;

}

.chat-header {
	padding: 24px 24px 0px 24px;
	height: 72px;
	align-content: flex-end;
	justify-content: space-between;
}

.chat-message-container {
    display: flex;
    flex-direction: column;
    width: 100%;
    max-width: 300px; /* 원하는 최대 너비 설정 */
    margin: 10px;
}

.other-message {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    margin: 16px 0px;
}

.my-message {
    display: flex;
    flex-direction: column;
    align-items: flex-end;
    margin: 16px 0px;
}

.profile-picture img {
    width: 40px; /* 원하는 프로필 사진 크기 설정 */
    height: 40px; /* 원하는 프로필 사진 크기 설정 */
    border-radius: 50%;
    margin-right: 10px;
}

.message-content {
    display: inline-block;
    background-color: #EAEAEA;
    border-radius: 10px;
    padding: 8px 12px;
    margin-bottom: 4px;
}

.message-time {
    font-size: 12px;
    color: #888;
}

.openChat {
	display: block;
	position: absolute;
	z-index: 1000;
}
.chat-form {
	display: flex;
    flex-direction: row;
    width: calc(100% - 32px);
    margin: 16px;
    padding: 0px;
}
#createRoomForm {
	display: flex !important;
    gap: 16px;
    flex-direction: row;
}

.form-control {
    width: 73% !important;
}

#myModal > .modal-content {
    position: absolute !important;
    width: 300px !important;
    left: 1000px !important;
    top: 80px !important;
    display: flex !important;
    flex-direction: column !important;
    pointer-events: auto !important;
    background-color: #fff !important;
    padding: 16px;
	border-radius: 24px !important;
	background-clip: padding-box !important;
    border: 1px solid var(--border, #EBEFF0) !important;
    background: var(--white, #FFF) !important;
    box-shadow: 0px 2px 16px 0px rgba(0, 63, 57, 0.08) !important;
}

.rounded-circle{
	object-fit: cover;
}
</style>
<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html lang="en">
	<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
	<meta id="_csrf_header" name="_csrf_header"	content="${_csrf.headerName}" />

<!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome Icons -->
  <!-- Theme style -->
</head>
<script src="https://code.jquery.com/jquery-3.7.1.slim.js" integrity="sha256-UgvvN8vBkgO0luPSUl2s8TIlOSYRoGFAX4jlCIm9Adc=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
$(document).ready(function() {
	$('#tab-button1').click(function(){
		$('#tab-section-1').attr('style','display:block');
		$('#tab-section-2').attr('style','display:none');
		$('#tab-button1').attr('style','color:var(--ci-01, #0ABAB5)');
		$('#tab-button2').attr('style','color:var(--black-01, #333)');
		
	});
	$('#tab-button2').click(function(){
		$('#tab-section-2').attr('style','display:block');
		$('#tab-section-1').attr('style','display:none');
		$('#tab-button2').attr('style','color:var(--ci-01, #0ABAB5)');
		$('#tab-button1').attr('style','color:var(--black-01, #333)');
	});
	
	$('#chatRmPrint').click(function(){
		$('.chat-card-3rd').attr('style','display:block');
		$('.chat-card').attr('style', 'display:none');
	});
	
	$('.back-btn').click(function(){
		$('.chat-card-3rd').attr('style','display:none');
		$('.chat-card').attr('style', 'display:block');
	});

});

$(document).on('click','#chat', function(){
	$('#chatWindow').addClass('openChat');
	
});
</script>

<sec:authentication property="principal.employeeVO" var="empVO" />
<input type="hidden" id="sessionEmpNo" value="${empVO.empNo}" />
<input type="hidden" id="sessionEmpName" value="${empVO.empName}" />
<input type="hidden" id="sessionAtchFileCd" value="${empVO.atchFileCd}" /> 

<body>
	<div>
		<!-- 실시간 채팅 아이콘 -->
		<a class="chat-toggle"
			id="chat" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
			data-hide-on-body-scroll="data-hide-on-body-scroll"> 
			<svg class="header-icon" width="32" height="32" viewBox="0 0 32 32" fill="none" xmlns="http://www.w3.org/2000/svg">
				<path d="M11.101 15.6515C11.4363 15.6515 11.7174 15.5381 11.9442 15.3112C12.1711 15.0844 12.2845 14.8033 12.2845 14.468C12.2845 14.1327 12.1711 13.8516 11.9442 13.6248C11.7174 13.3979 11.4363 13.2845 11.101 13.2845C10.7657 13.2845 10.4846 13.3979 10.2578 13.6248C10.0309 13.8516 9.9175 14.1327 9.9175 14.468C9.9175 14.8033 10.0309 15.0844 10.2578 15.3112C10.4846 15.5381 10.7657 15.6515 11.101 15.6515ZM15.835 15.6515C16.1703 15.6515 16.4514 15.5381 16.6782 15.3112C16.9051 15.0844 17.0185 14.8033 17.0185 14.468C17.0185 14.1327 16.9051 13.8516 16.6782 13.6248C16.4514 13.3979 16.1703 13.2845 15.835 13.2845C15.4997 13.2845 15.2186 13.3979 14.9918 13.6248C14.7649 13.8516 14.6515 14.1327 14.6515 14.468C14.6515 14.8033 14.7649 15.0844 14.9918 15.3112C15.2186 15.5381 15.4997 15.6515 15.835 15.6515ZM20.569 15.6515C20.9043 15.6515 21.1854 15.5381 21.4122 15.3112C21.6391 15.0844 21.7525 14.8033 21.7525 14.468C21.7525 14.1327 21.6391 13.8516 21.4122 13.6248C21.1854 13.3979 20.9043 13.2845 20.569 13.2845C20.2337 13.2845 19.9526 13.3979 19.7258 13.6248C19.4989 13.8516 19.3855 14.1327 19.3855 14.468C19.3855 14.8033 19.4989 15.0844 19.7258 15.3112C19.9526 15.5381 20.2337 15.6515 20.569 15.6515ZM8.734 23.936L6.01195 26.658C5.63717 27.0328 5.20816 27.1167 4.72489 26.9095C4.24163 26.7024 4 26.3326 4 25.8V7.367C4 6.71607 4.23177 6.15884 4.69531 5.69531C5.15884 5.23177 5.71607 5 6.367 5H25.303C25.9539 5 26.5112 5.23177 26.9747 5.69531C27.4382 6.15884 27.67 6.71607 27.67 7.367V21.569C27.67 22.2199 27.4382 22.7772 26.9747 23.2407C26.5112 23.7042 25.9539 23.936 25.303 23.936H8.734Z" fill="#8D9EA2"/>
			</svg>
		</a>
			<!-- 실시간 채팅 클릭 -->
			<div id="chatWindow"
				class="chat-dropdown aria-labelledby="chat"
				style="top: 80px; right: 200px;">
				
				<div class="chat-card">
					<div id="chat-list-content">
					<div class="chat-header row">
						<nav class="gap-row-8 w-40">
							<button class="tab-button" id="tab-button1"	data-tab-section="tab-section-1">직원</button>
							<button class="tab-button" id="tab-button2"	data-tab-section="tab-section-2">채팅</button>
						</nav>
							<div class="w-30">
								<button id="openCreateRoomForm"	class="dduk-btn-active conversation-btn float-right">초대하기</button>
							</div>
					<div id="myModal" class="modal" style="display: none;">
        				<div class="modal-content">
        				<span class="close">&times;</span>
						<div class="chat-form">
							<!-- 대화방 생성 폼 -->
							<div class="createRoomForm" id="createRoomForm" stlye="display: flex;">
								<input type="text" id="chatRmNm" placeholder="대화방 이름 입력" class="form-control">
								<button type="button" class="btn dduk-btn-active" id="submitChatRoom">생성</button>
							</div>
						</div>
						</div>
					</div>
					</div>

					<div id="chatMenu" class="row card-body pt-0">
						<div class="tab-content" id="myTabContent" style="width: 100%">
						
							<!-- 직원목록 -->
							<section id="tab-section-1" class="tab-section">
								<div id="tab-employee">
									<div class="table-container" style="overflow-y: auto; max-height: 480px;">
										<table class="table table-sm">
											<thead>
												<tr class="bg-light">
													<th colspan="3" class="col-2" scope="col">직원 <span id="employeeCount"></span>명</th>
												</tr>
											</thead>
											<!-- 직원 목록 출력 -->
											<tbody id="employeePrint" style="overflow-y: auto; max-height: 480px;">
											</tbody>
										</table>
									</div>
								</div>
							</section>
							<!-- 직원 목록 끝 -->
							
							<!-- 채팅방목록 -->
							<section id="tab-section-2" class="tab-section" style="display: none;">
								<div id="tab-chat">
									<div class="table-container" style="overflow-y: auto; max-height: 480px;">
										<table class="table table-sm">
											<thead>
												<tr class="bg-light">
													<th colspan="3" class="col-2" scope="col">채팅방 수 <span id="chatRmCount"></span>개</th>
												</tr>
											</thead>
											<!-- 채팅방 목록 출력 -->
											<tbody id="chatRmPrint"	style="overflow-y: auto; max-height: 480px;">
											</tbody>
										</table>
									</div>
								</div>
							</section>
							<!-- 채팅방 목록 끝 -->
							
						</div>
					</div>
					</div>
				</div>
				<!-- 채팅창 -->
				<div class="chat-card-3rd" style="display: none; padding: 24px;">
					<input type="hidden" id="hiddenChatRmNo" />
					<div class="container" style="width: 382px; margin-left:-24px;">
						<button class="back-btn" style="width: 100px;">뒤로가기</button>
			            <div class="col-6">
			                <label class="col-8" id="chatRoomHeader">채팅방</label>
			            </div>
						<div id="chattingArea" style="height: 450px; overflow-y: scroll;">
			                <div id="chatArea" class="col">
			                </div>
						</div>
			            <div>
			                <div class="col-12">
			                    <div class="input-group mb-3">
			                        <input type="text" id="chatMessage" class="form-control" aria-label="Recipient's username" aria-describedby="button-addon2">
			                        <div class="input-group-append">
			                            <button class="btn btn-outline-secondary" type="button" id="sendButton">전송</button>
			                        </div>
			                    </div>
			                </div>
			            </div>
        			</div>
				</div>					
			</div>
	</div>


<!-- 웹소켓 객체를 가져올 수 있게해준다 -->
<script	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript">



$(document).ready(function() {
	
	console.log("현재 세션에 로그인한 아이디 : " + sessionEmpNo);
	console.log("현재 세션에 로그인한 이름 : " + sessionEmpName);
	
	var header = $("meta[name='_csrf_header']").attr("content");
	var token = $("meta[name='_csrf']").attr("content");
	var employeeCount = $("#employeeCount");
	var employeePrint = $("#employeePrint");
	var chatRmCount = $("#chatRmCount");
	var chatRmPrint = $("#chatRmPrint");
	var openCreateRoomForm = $("#openCreateRoomForm");
	var chatRmNm = $("#chatRmNm");
	var submitChatRoom = $("#submitChatRoom");
	var selectedRoom = $("#hiddenChatRmNo").val();
	console.log("선택한 방 번호 111: ", selectedRoom);
	console.log("chatRmPrint : ", openCreateRoomForm);
	console.log("chatRmNm : ", chatRmNm);
	function scrollToBottom(){
		$("#chattingArea").scrollTop($("#chattingArea")[0].scrollHeight);
		console.log("@@@"+$("#chattingArea")[0].scrollHeight)
		console.log("scrollToBottom")
	}
	window.onload = function () {
        scrollToBottom();
    }
	
	//대화아이콘 클릭시
	$(".chat-toggle").click(function() {
		 // 드롭다운
		 $(".chat-dropdown").toggle(); 
		 $("#chatArea").html("");
		 console.log("Token : ", token);
		 console.log("Header : ", header);
		 
		 
		 var empNoId = '${empVO.empNo}'; // 로그인한 직원 사번
		 console.log("empNoId : ", empNoId);
		 // 채팅 직원 목록 출력
		 $.ajax({
			url : "/ddukddak/chatting/employee/list",
			type : "POST",
			contentType : "application/json; charset=utf-8",
			async: false,
			beforeSend : function(xhr){            
	              xhr.setRequestHeader(header,token);
	        },
	        success : function(result) {
	        	console.log("result : ", result);
	        	
	        	var employeeListHtml = "";
	        	
	        	if(result.length == 0){
	        		console.log("직원 없음");
	        	}else{
	        		console.log("직원 있음");
	        		console.log('채팅 직원',result);
	        		employeeCount.html(result.length);
	        		
		        	$(result).each(function(i){
		        		var atchFileCd = result[i].atchFileCd;
// 			        	console.log("직원프사 : ", atchFileCd);
		        		
		        		var dept = "";
		        		
		        		if(result[i].empDeptCd == "DTCD01"){
		        			dept = "의사";
		        		}else if(result[i].empDeptCd == "DTCD02"){
		        			dept = "간호사";
		        		}else if(result[i].empDeptCd == "DTCD03"){
		        			dept = "치료사";
		        		}else if(result[i].empDeptCd == "DTCD04"){
		        			dept = "원무과"
		        		}else if(result[i].empDeptCd == "DTCD05"){
		        			dept = "인사과"
		        		}
		        		// 로그인/회원가입되면 나중에 추가해야함
 		        		if(this.empNo != empNoId){
		        			
			        		employeeListHtml += "<tr class='employee' data-employee-id='" + result[i].empNo + "' style='height: 40px;'>";
							if (atchFileCd !== null && atchFileCd !== '') {
						    employeeListHtml += "<td class='col-2'>";
						    employeeListHtml += "<img src='/resources/upload/empProfile/" + result[i].atchFileDetailSavenm+"'"+" class='rounded-circle' alt='' style='width: 40px; height: 40px;' />";
						    employeeListHtml += "</td>";
							} else {
							    // 파일이 등록되어 있지 않을 경우 대체 이미지 표시
						    employeeListHtml += "<td class='col-2'>";
						    employeeListHtml += "<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-IIcYCTxyov5UIuoWBLrC2QmdBfT526Jk9g&usqp=CAU' class='rounded-circle' alt='' style='width: 40px; height: 40px;' />";
						    employeeListHtml += "</td>";
							}
							employeeListHtml += "<td class='col-7'>" + result[i].empName +"</td>";
							employeeListHtml += "<td class='col-3'>" + "<div class='text-right'>" + dept + "</div>" + "</td>";
							employeeListHtml += "</tr>";
 		        		}
		        	});
		        	$('#employeePrint').html(employeeListHtml);
	        	}
	        	
	        	
	        }
		 });
	});
	
// 	var sessionEmpNo = $("#sessionEmpNo").val();
// 	var userChat = {
// 			sessionEmpNo : sessionEmpNo
// 	}
	//채팅탭 클릭 시
	$('#tab-button2').click(function(){
		$("#chatRmPrint").html("");
	
		console.log("채팅탭 클릭했다리");
		var empNoId = '${empVO.empNo}'; // 로그인한 직원 사번
		var chatUser = {
			empNoId : empNoId
		}
		console.log("empNoId : ", empNoId);
		
        $.ajax({
			url : "/ddukddak/chatting/room/list",
			type : "POST",
 			data : JSON.stringify(chatUser),
			contentType : "application/json; charset=utf-8",
			async: false,
			beforeSend : function(xhr){            
	              xhr.setRequestHeader(header,token);
	        },
	        success : function(result) {
	        	console.log("result : ", result);
	        	
				var chatRmListHtml = "";
	        	
	        	if(result.length == 0){
	        		console.log("대화방 없음");
	        	}else{
	        		
	        		console.log("대화방 있음");
	        		console.log("대화방 탭 누르면 : ", result);
	        		chatRmCount.html(result.length);
	        		
	        		$(result).each(function(i){
	        			var chatMembers = result[i].chatMemberVOList;
	        		    console.log("chatMembers : ", chatMembers);
	        		    var isUserInRoom = chatMembers.some(function(member) {
	        		        return member.empNo === empNoId; // 로그인한 사용자의 사번과 비교
	        		    });
	        		    var otherUser = chatMembers.find(function(member) {
	        		        return member.empNo !== empNoId; // 로그인한 사용자와 다른 사용자
	        		    });
	        		    console.log("otherUser : ", otherUser);
	        			var chatVOList = result[i].chatMemberVOList[0].chatVOList[0].chatDate;
	        			var atchFile = result[i].chatMemberVOList[0].atchFileCd;
	        		    console.log("atchFileCd : ", atchFile);
	        			//날짜 구하기
	        			var date = new Date(chatVOList);
	        			var day = date.getDate(); //일
	        			var month = (date.getMonth() + 1)//월
	        			var year = date.getFullYear();
	        			var formatDate = year+"-"+(("00"+month.toString()).slice(-2))+"-"+(("00"+day.toString()).slice(-2));
	        			console.log("formatDate : ", formatDate);
	        			
	        			// 현재 시:분
	        			
	        			var hours = date.getHours();
		        		var minutes = date.getMinutes();	
	        			var second = date.getSeconds();
	        			
	        			var str_ampm, dsp_ampm;
	        			
	        			if(hours == 0){
	        				str_ampm = "오후";
	        			}else if(hours < 13){
	        				str_ampm = "오전";
	        			}else{
	        				hours -=12;
	        				str_ampm = "오후";
	        			}
	        				
        				hours = (hours == 0) ? 12:hours;
        				
        				if(hours<10)
        					hours="0"+hours;
        				if(minutes<10)
        					minutes="0"+minutes;
        				if(second<10)
        					second="0"+second;
        				console.log("hours : ", hours);
        				
        				dsp_ampm = str_ampm + (hours.toString()).slice(0,2) + "시 " + (minutes.toString()) + "분";
        				console.log(typeof dsp_ampm);

	        			if (isUserInRoom) {
							console.log("프사이름이들어오닝 : ",result[i].chatMemberVOList[0].atchFileDetailSavenm);	        				
	        				// 로그인한 사용자의 프로필 사진 경로
	        				var currentUserAtchFile = ''; 
	        				// 상대방의 프로필 사진 경로	
	        			    var otherUserAtchFile = ''; 
	        			    chatMembers.forEach(function(member) {
	        			        if (member.empNo === empNoId) {
	        			            currentUserAtchFile = member.atchFileCd;
	        			        } else {
	        			            otherUserAtchFile = member.atchFileCd;
	        			        }
	        			    });
		        			chatRmListHtml += "<tr class='room' data-roomno='"+ result[i].chatRmNo +"' style='height: 80px;'>";
		        			if (otherUserAtchFile !== null && otherUserAtchFile !== '') {
		        				chatRmListHtml += "<td class='col-2'>";
		        				chatRmListHtml += "<img src='/resources/upload/empProfile/" + result[i].chatMemberVOList[0].atchFileDetailSavenm+"'"+" class='rounded-circle' alt='' style='width: 40px; height: 40px;' />";
		        				chatRmListHtml += "</td>";
		        			}else{
		        				chatRmListHtml += "<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-IIcYCTxyov5UIuoWBLrC2QmdBfT526Jk9g&usqp=CAU' class='rounded-circle' alt='' style='width: 40px; height: 40px;' />";
		        			}
		        			chatRmListHtml += "</td>";
		        			chatRmListHtml += "<td class='col-6'>";
		        			chatRmListHtml += "<div>" + result[i].chatRmNm + "</div>";
		        			//데이터 null 아닐때만 출력
		        			if (result[i].chatMemberVOList[0].chatVOList[0].chatCont != null) {
							    chatRmListHtml += "<div>" + result[i].chatMemberVOList[0].chatVOList[0].chatCont + "</div>";
							} else {
							    chatRmListHtml += "<div>대화 내용 없음</div>";
							}
		        			chatRmListHtml += "</td>";
		        			chatRmListHtml += "<td class='col-4'>";
		        			chatRmListHtml += "<div class='dayoung'>" + formatDate + "</div>";
		        			chatRmListHtml += "<div class='dayoung'>" + dsp_ampm + "</div>";
		        			chatRmListHtml += "</td>";
		        			chatRmListHtml += "</tr>";
	        			}
	        		});
	        			//$('#chatRmPrint').html(chatRmListHtml);
	        			$('#chatRmPrint').append(chatRmListHtml);
	        	}
	        }
        });
    });
	
	var inviteButton = document.getElementById('openCreateRoomForm');
	inviteButton.style.display = 'none';

	// 대화걸 상대 체크할 때 버튼 표시/숨김 함수
	function toggleInviteButton() {
	    if (selectedEmployees.length > 0) {
	        inviteButton.style.display = 'block';
	    } else {
	        inviteButton.style.display = 'none';
	    }
	}
	
	// 대화걸 상대 체크하기
	var selectedEmployees = [];

	$(document).on('click', '#employeePrint .employee', function() {
		var employeeId = $(this).attr('data-employee-id');
	  	var employeeName = $(this).find('.col-7').text().trim();
		var isSelected = $(this).hasClass('selectedEmployee');

	  	if(!isSelected) {
	    	$(this).addClass('selectedEmployee');
		    selectedEmployees.push({
		      id: employeeId,
		      name: employeeName
		    });
	  	}else{
	    	$(this).removeClass('selectedEmployee');
	    	selectedEmployees = selectedEmployees.filter(function(employee) {
	      		return employee.id !== employeeId;
	    	});
	  	}
	  	toggleInviteButton();
	  	console.log('선택된 직원:', selectedEmployees);
	});
	
	$(document).ready(function() {
		var empNoId = '${empVO.empNo}';
		var chatRmNm = $("#chatRmNm");
		console.log("chatRmNm2 : ", chatRmNm)
		
		// 대화방 생성 폼
// 	    $('#openCreateRoomForm').on('click', function() {
// 	        $('#createRoomForm').show(); 
// 	    });
		document.getElementById('openCreateRoomForm').onclick = function() {
		    document.getElementById('myModal').style.display = 'block';
		    document.getElementById('createRoomForm').style.display = 'block';
		};

		// 모달 닫기 함수
		function closeModal() {
		    document.getElementById('myModal').style.display = 'none';
		    document.getElementById('createRoomForm').style.display = 'none';
		}

		document.getElementsByClassName('close')[0].onclick = closeModal;
		document.getElementById('submitChatRoom').onclick = function() {
		    closeModal();
		};
		
		// 대화방 생성 버튼
	    $('#submitChatRoom').on('click', function() {
	        var header = $("meta[name='_csrf_header']").attr("content");
	    	var token = $("meta[name='_csrf']").attr("content");
	        
	    	var chatRmNm = $('#chatRmNm').val();
	    	var empNoId = '${empVO.empNo}';
	        var selectedEmployeeIds = selectedEmployees.map(function(employee) {
	            return employee.id;
	        });
	        selectedEmployeeIds.push(empNoId);
	        
	        //입력된 방 이름 : 11
	        console.log("입력된 방 이름 :", chatRmNm);	 
	        //selectedEmployeeIds :["a001","a002"]
	        console.log("selectedEmployeeIds :", selectedEmployeeIds);
	        
	        let data = {
	                "chatRmNm": chatRmNm,
	                "selectEmployee": selectedEmployeeIds
	            };
	        //{"chatRmNm":"ㅁㄴㅇㄹ","selectEmployee":["a001","a002"]}
	        console.log("data : " + JSON.stringify(data));
	        
	        $.ajax({
	            url: "/ddukddak/chatting/room/create",
	            type: "POST",
	            data: JSON.stringify({
	                "chatRmNm": chatRmNm,
	                "selectEmployee": selectedEmployeeIds
	            }),
	            contentType: "application/json; charset=utf-8",
	            beforeSend: function(xhr) {
	                xhr.setRequestHeader(header, token);
	            },
	            success: function(result) {
	                console.log("방 생성!", result);
	                
	                selectedEmployees = [];
	                $('.employee').removeClass('selectedEmployee');
	                $('#createRoomForm').hide();
	            }
	        });
	    });
	});
	
	var currentRoomNo;
	var atchFileDetailSavenm;
	//채팅방 클릭하면 채팅방 열리게하기
	$("#chatRmPrint").on("click",".room",function(){
		$("#container").html("");
		console.log("채팅방 클릭되었다.");
			
		var sendButton = $("#sendButton");
		var chatMessage = $("#chatMessage");
			
		// 지금 조회중인 방 번호
		var currentRoomNo = "";			
		currentRoomNo = $(this).data("roomno");
		console.log("선택된 방번호 : ", currentRoomNo);
			
		chatStart(currentRoomNo);
			
		var sendButton = $("#sendButton");
		
		//채팅방 열고나서
		function chatStart(selectedRoomNo){
			var chatRmListNo = "";
			$("#container").html("");
			//채팅내용 불러오기
			$.ajax({
				url : "/ddukddak/chatting/chat/list",
				type : "POST",
				data : JSON.stringify(currentRoomNo),
				contentType : "application/json; charset=utf-8",
				async : false,
				beforeSend : function(xhr){            
		            xhr.setRequestHeader(header,token);
		        },
		        success : function(result){
		        	console.log("채팅방열때 정보불러오기 : ", result);
		        	var chatMemberVOList = result.chatMemberVOList; //직원정보들 -> 프로필사진같은거 쓸때
		        	$("#chatRoomHeader").html(result.chatRmNm);
					chatRmListNo = result[0].chatRmListNo;
	        		console.log("채팅멤버번호 : ", chatRmListNo);
	        		
		        	$("#chatArea").html("");
		        	$(result).each(function(i){
		        		
		        		var empNoId = '${empVO.empNo}';
		        		atchFileDetailSavenm = $(".profile-picture img").data("atchFileDetailSavenm");
		        		
						var atchFile = this.atchFileCd;
	        			console.log("채팅방 프사 : ", atchFile);
	        			
		        		var date = new Date(this.chatDate);
		        		var hours = date.getHours();
	        			var minutes = date.getMinutes();	
        				var second = date.getSeconds();
        				
        				var str_ampm, dsp_ampm;
        				
        				if(hours == 0){
        					str_ampm = "오후";
        				}else if(hours < 13){
        					str_ampm = "오전";
        				}else{
        					hours -=12;
        					str_ampm = "오후";
        				}
        				
        				hours = (hours == 0) ? 12:hours;
        				
        				if(hours<10)
        					hours="0"+hours;
        				if(minutes<10)
        					minutes="0"+minutes;
        				if(second<10)
        					second="0"+second;
        				console.log("hours : ", hours);
        				
        				dsp_ampm = str_ampm + (hours.toString()).slice(0,2) + "시" + (minutes.toString()) + "분";
		        		
 		        		if(selectedRoomNo  == this.chatRmNo){
 		        			if(empNoId == this.empNo){
 		        		
			        			var str = "";
			        			
			        			str += "<div class='my-message'>";
			        			if(this.chatCont != null) {
				        			str += "<div class='message-content'>" + this.chatCont + "</div>";
				        			str += "<div class='message-time'>" + dsp_ampm + "</div>";
				        			str += "</div>";
			        			}
			        			$("#chatArea").append(str);
			        			scrollToBottom();
 		        			}else{
								var str = "";
			        			
			        			str += "<div class='other-message'>";
			        			if(this.chatCont != null) {
				        			if (result[i].atchFileDetailSavenm !== null && result[i].atchFileDetailSavenm !== '') {
					        			str += "<div class='d-flex'>";
					        			str += "<div class='profile-picture'>";
					        			str += "<img src='/resources/upload/empProfile/" + result[i].atchFileDetailSavenm + "'" + " class='rounded-circle' alt='' data-atchFileDetailSavenm='" + result[i].atchFileDetailSavenm + "'>";
					        	        str += "</div>";
				        			}else{
					        			str += " <div><div class='col-2'>";
					        			str += " <img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-IIcYCTxyov5UIuoWBLrC2QmdBfT526Jk9g&usqp=CAU' class='rounded-circle' alt='' style='width: 40px; height: 40px;' />";
					        			str += "</div>";
				        			}
				        		str += "<div class='message-text'>";
			        			str += "<div class='message-empName'>" + this.empName + "</div>";
			        			str += "<div class='message-content'>" + this.chatCont + "</div>";
			        			str += "</div>";
			        			str += "</div>";
			        			str += "<div class='message-time'>" + dsp_ampm + "</div>";
			        			str += "</div>";
			        			}
			        			
			        			$("#chatArea").append(str);
			        			scrollToBottom();
 		        			}
 		        		}
		        	});
		        	
		        	$("#chatArea").append("<div id='focus'></div>");
		        },
		        complete : function(){
		        	scrollToBottom();
		        }
		        
		        	        
			});
			$("#chatArea").on("change", "#focus", function(){
				console.log("focus됨!)");
				$(this).focus();
			});		    
			//전송버튼 클릭시
	        sendButton.on("click", function(){
	        	sendMessage();
	        	scrollToBottom();
	        	chatMessage.val("");
	        });
		 	//웹소켓 시작!!!!!!!!!!!!!!!!!!!!!!!!!!
			var chatRmNo =  selectedRoomNo;
 		 	
	 		var socket = new WebSocket("ws://192.168.145.11/ddukddak/chat/"+chatRmNo);
	 		//var socket = new SockJS("http://localhost:80/ddukddak/chat");
	 		socket.onopen = onOpen; //websocket서버와 연결시킨다
//	 		socket.onmessage= onMessage; //메세지를 보내면 자동으로 실행
//	 		socket.onclose = onClose;   //접속 해제       
// 			socket.onerror = onError;	//에러
		    
		    //채팅창에 들어왔을 때
			function onOpen(msg) {
				console.log("웹소켓 오픈!!!!!!!");
				scrollToBottom();
			}
		    
		    //웹소켓 메세지 전송
		    function sendMessage(){
		    	
		    	var header = $("meta[name='_csrf_header']").attr("content");
		    	var  token = $("meta[name='_csrf']").attr("content");
		    	
		    	//웹소켓으로 보낼 데이터들
		    	var empVO = '${empVO}';
		    	var chatRmNo =  selectedRoomNo;//방번호
		    	var empNo = '${empVO.empNo}'; //직원사번
		    	var empName = '${empVO.empName}'; //직원이름
		    	var chatCont = $("#chatMessage").val(); //대화
		    	var atchFileCd = '${empVO.atchFileCd}'; //프사코드
		    	var profileNm = '${empVO.profileNm}'; //프사파일명
		    	var chatDate = new Date(); //날짜
		    	
		    	console.log("emp정보 : ", empVO);
		    	console.log("방번호 : " + chatRmNo);
		    	console.log("사번 : " + empNo);
		    	console.log("내용 : " + chatCont);{}
		    	console.log("프사 : " + atchFileCd);
		    	console.log("프사파일명 : " + profileNm);
		    	console.log("날짜 : " + chatDate);
		    	
		    	var data = {
		    		"chatRmNo" : chatRmNo,
		    		"chatRmListNo" : chatRmListNo,
		    		"empNo" : empNo,
		    		"chatCont" : chatCont
		    	}
		    	
		    	console.log("메세지 전송!!!!!")
		    	socket.send(empNo + "::" + empName + "::" + chatCont + "::" + profileNm + "::" + chatDate);   	
				$.ajax({
					url : "/ddukddak/chatting/chat/Insert",
					type : "POST",
					data : JSON.stringify(data),
					contentType : "application/json; charset=utf-8",
					async : false,
					beforeSend : function(xhr){            
			            xhr.setRequestHeader(header,token);
			        },
			        success : function(result){
			        	console.log("채팅전송 : ",  result);
			        	let chatMessage = $("#chatMessage").val();
			        },
			        error: function(){
			        	console.log(data);
			        }
				});	    	
			}
		    //function onMessage(msg){
		    socket.onmessage = function(msg){
		    	console.log("메세지 받기!!!!!");
		    	
				var data = msg.data;
				console.log("data : ", data);
				var empNo = null;
				var empName = null;
		    	var chatCont = null;
				var atchFileCd = null;
		    	var chatDate = null;
				
	            var arr = data.split("::");
				
	            for(var i=0; i<arr.length; i++){
	               console.log('arr[' + i + ']: ' + arr[i]);
	            }
				
	            var cur_session = '${empVO.empNo}';
	            console.log("cur_session : " + cur_session);
	            
	            empNo = arr[0];
	            empName = arr[1];
	            chatCont = arr[2];
	            profileNm = arr[3];
	            chatDate = arr[4];
	            
	            var date = new Date(chatDate);
	            var hours = date.getHours();
    			var minutes = date.getMinutes();	
				var second = date.getSeconds();
				var str_ampm, dsp_ampm;
				
				if(hours == 0){
					str_ampm = "오후";
				}else if(hours < 13){
					str_ampm = "오전";
				}else{
					hours -=12;
					str_ampm = "오후";
				}
				
				hours = (hours == 0) ? 12:hours;
				
				if(hours<10)
					hours="0"+hours;
				if(minutes<10)
					minutes="0"+minutes;
				if(second<10)
					second="0"+second;
				console.log("hours : ", hours);
				
				dsp_ampm = str_ampm + (hours.toString()).slice(0,2) + ":" + (minutes.toString());
	            

				//정보찍히나 확인
				console.log("onMessage 현재 로그인한 사람번호 :  ", empNo);
				console.log("onMessage 현재 로그인한 사람이름 :  ", empName);
				console.log("onMessage 채팅 :  ", chatCont);
				console.log("onMessage 프로필사진 :  ", profileNm);
				console.log("onMessage 날짜 :  ", chatDate);
				
				//내가보낼때
				if(empNo == cur_session){
					var str = "";
						str += "<div class='my-message'>";
	        			str += "<div class='message-content'>" + chatCont + "</div>";
	        			str += "<div class='message-time'>" + dsp_ampm + "</div>";
	        			str += "</div>";
					$("#chatArea").append(str);
					scrollToBottom();
					
					//다른사람이 보낼때
				}else{ 
					var str = "";
					str += "<div class='other-message'>";
        			if (profileNm !== null && profileNm !== '') {
	        			str += "<div class='d-flex'><div class='profile-picture'>";
	        	        str += "<img src='/resources/upload/empProfile/" + profileNm+"'"+" class='rounded-circle' alt='''>";
	        	        str += "</div>";
        			}else{
	        			str += " <div><div class='col-2'>";
	        			str += " <img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-IIcYCTxyov5UIuoWBLrC2QmdBfT526Jk9g&usqp=CAU' class='rounded-circle' alt='' style='width: 40px; height: 40px;' />";
	        			str += " </div>";
        			}
        			str += "<div class='message-text'>";
        			str += "<div class='message-empName'>" + empName + "</div>";
        			str += "<div class='message-content'>" + chatCont + "</div>";
        			str += "</div>";
        			str += "</div>";
        			str += "<div class='message-time'>" + dsp_ampm + "</div>";
        			str += "</div>";
					
					$("#chatArea").append(str);
					scrollToBottom();
				}
				
		    }
		    
		  	//접속 해제...하면 대화방 목록에 표시되는 채팅내용 최신화....
	 		$('.back-btn').click(function() {
	 			socket.close();
				console.log("웹소켓 접속해제!!!!!!!")
	 		});
		}
	});
});
</script>
</body>
</html>
