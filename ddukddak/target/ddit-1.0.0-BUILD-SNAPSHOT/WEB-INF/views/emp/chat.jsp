<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.employee.selectedEmployee {
	background-color: #dff0d8; /* 배경색 변경 */
}
.dayoung{
	text-align:right;
	font-size:13px;
}

#chatWindow {
	width: 390px;
	height: 568px;
}

#chatRoomWindow {
	width: 100%;
	height: 100%;
	padding: 16px;
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
		
	});
	$('#tab-button2').click(function(){
		$('#tab-section-2').attr('style','display:block');
		$('#tab-section-1').attr('style','display:none');
		
	});
	
	$('#chatRmPrint').click(function(){
		console.log("클릭되니?");
		$('.card-notification').attr('style','display:none');
		$('#chatRoomWindow').attr('style', 'display:block');
	});
	
	$('.back-btn').click(function(){
		$('.card-notification').attr('style','display:block');
		$('#chatRoomWindow').attr('style', 'display:none');
	});

});
</script>
<body>
	<div>
		<!-- 실시간 채팅 아이콘 -->
		<li class="nav-item dropdown">
		<a class="chat-dropdown-toggle nav-link notification-indicator notification-indicator-primary px-0 fa-icon-wait"
			id="chat" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
			data-hide-on-body-scroll="data-hide-on-body-scroll"> 
			<svg xmlns="http://www.w3.org/2000/svg" width="20px" height="20px" fill="currentColor" 
				class="bi bi-chat" viewBox="0 0 50 50">
				<path d="M26,4C12.7,4,2.1,13.8,2.1,25.9c0,3.8,1.1,7.4,2.9,10.6c0.3,0.5,0.4,1.1,0.2,1.7l-3.1,8.5
					c-0.3,0.8,0.5,1.5,1.3,1.3l8.6-3.3c0.5-0.2,1.1-0.1,1.7,0.2c3.6,2,7.9,3.2,12.5,3.2C39.3,48,50,38.3,50,26.1C49.9,13.8,39.2,4,26,4z
					M14,30c-2.2,0-4-1.8-4-4s1.8-4,4-4s4,1.8,4,4S16.2,30,14,30z M26,30c-2.2,0-4-1.8-4-4s1.8-4,4-4s4,1.8,4,4S28.2,30,26,30z M38,30
					c-2.2,0-4-1.8-4-4s1.8-4,4-4s4,1.8,4,4S40.2,30,38,30z" /></svg>

		</a>
			<!-- 실시간 채팅 클릭 -->
			<div id="chatWindow"
				class="chat-dropdown-menu dropdown-menu Sdropdown-caret dropdown-caret dropdown-menu-start dropdown-menu-card dropdown-menu-notification dropdown-caret-bg"
				aria-labelledby="chat">
				
				<div class="card card-notification "	style="width: 380px; height: 550px;">
					<div class="card-header row">
						<nav id="tab-button-nav">
							<button class="tab-button" id="tab-button1"	data-tab-section="tab-section-1">직원</button>
							<button class="tab-button" id="tab-button2"	data-tab-section="tab-section-2">채팅</button>
						</nav>
						<div class="col-8">
							<div class="col-14">
								<button id="openCreateRoomForm"	class="conversation-btn float-right">초대하기</button>
							</div>

							<!-- 대화방 생성 폼 -->
							<div id="createRoomForm" style="display: none;">
								<input type="text" id="chatRmNm" placeholder="대화방 이름 입력" class="form-control">
								<button type="button" class="btn btn-primary" id="submitChatRoom">생성</button>
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
					<!-- 채팅창 -->
				</div>
				<div id="chatRoomWindow" class="row pt-0" style=" display:none; height: 100%;">
					<button class="back-btn" style="width: 100px;">뒤로가기</button>
				</div>					
			</div>
		</li>

	</div>


<!-- 웹소켓 객체를 가져올 수 있게해준다 -->
<script	src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	var header = $("meta[name='_csrf_header']").attr("content");
	var token = $("meta[name='_csrf']").attr("content");
	var employeeCount = $("#employeeCount");
	var employeePrint = $("#employeePrint");
	var chatRmCount = $("#chatRmCount");
	var chatRmPrint = $("#chatRmPrint");
	var openCreateRoomForm = $("#openCreateRoomForm");
	var chatRmNm = $("#chatRmNm");
	var submitChatRoom = $("#submitChatRoom");
	
	console.log("chatRmPrint : ", openCreateRoomForm);
	console.log("chatRmNm : ", chatRmNm);
	
	//대화아이콘 클릭시
	$(".chat-dropdown-toggle").click(function() {
		 // 드롭다운
		 $(".chat-dropdown-menu").toggle(); 
		 $("#chatArea").html("");
		 console.log("Token : ", token);
		 console.log("Header : ", header);
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
	        		employeeCount.html(result.length);
	        		
		        	$(result).each(function(i){
		        		var dept = "";
		        		
		        		if(result[i].empDeptCd == 'DTCD01'){
		        			dept = "의사";
		        		}else if(result[i].empDeptCd =='DTCD02'){
		        			dept = "간호사";
		        		}else if(result[i].empDeptCd =='DTCD03'){
		        			dept = "치료사";
		        		}else if(result[i].empDeptCd =='DTCD04'){
		        			dept = "원무과"
		        		}else if(result[i].empDeptCd =='DTCD05'){
		        			dept = "인사과"
		        		}
		        		// 로그인/회원가입되면 나중에 추가해야함
// 		        		if(this.empNo != sessionUserId){
		        			
			        		employeeListHtml += "<tr class='employee' data-employee-id='" + result[i].empNo + "' style='height: 40px;'>";
							if (result[i].fileCd !== null && result[i].fileCd !== '') {
						    employeeListHtml += "    <td class='col-2'>";
						    employeeListHtml += "        <img src='프로필_이미지_주소' class='rounded-circle' alt='프로필 사진' style='width: 40px; height: 40px;' />";
						    employeeListHtml += "    </td>";
							} else {
							    // 파일이 등록되어 있지 않을 경우 대체 이미지 표시
						    employeeListHtml += "    <td class='col-2'>";
						    employeeListHtml += "        <img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-IIcYCTxyov5UIuoWBLrC2QmdBfT526Jk9g&usqp=CAU' class='rounded-circle' alt='프로필 사진 없음' style='width: 40px; height: 40px;' />";
						    employeeListHtml += "    </td>";
							}
							employeeListHtml += "    <td class='col-7'>" + result[i].empName +"</td>";
							employeeListHtml += "    <td class='col-3'>" + "<div class='text-right'>" + dept + "</div>" + "</td>";
							employeeListHtml += "</tr>";
// 		        		}
		        	});
		        	$('#employeePrint').html(employeeListHtml);
	        	}
	        }
		 });
	});
	
	//채팅탭 클릭 시
	$('#tab-button2').click(function(){
		console.log("채팅탭 클릭했다리");
        $.ajax({
			url : "/ddukddak/chatting/room/list",
			type : "POST",
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
	        		chatRmCount.html(result.length);
	        		
	        		$(result).each(function(i){
	        			
	        			//날짜 구하기
	        			var date = new Date();
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
	        				
	        				dsp_ampm = str_ampm + (hours.toString()).slice(1,2) + "시 " + (minutes.toString()) + "분";
	        				console.log(typeof dsp_ampm);
// 	        			if (hours <= 12 && hours >= 6) {
// 	        		        document.write('오전 ' + hours + '시 ' + minutes + '분');
// 	        		    } else if (hours >= 12 && hours < 22) {
// 	        		    	document.write('오후 ' + hours + '시 ' + minutes + '분 입니다.' );
// 	        		    }


	        			
	        			chatRmListHtml += "<tr class='room' id='' style='height: 80px;'>";
	        			chatRmListHtml += "<td class='col-2'>";
	        			chatRmListHtml += "<img src='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-IIcYCTxyov5UIuoWBLrC2QmdBfT526Jk9g&usqp=CAU' class='rounded-circle' alt='프로필 사진 없음' style='width: 40px; height: 40px;' />";
	        			chatRmListHtml += "</td>";
	        			chatRmListHtml += "<td class='col-7'>";
	        			chatRmListHtml += "<div>" + result[i].chatRmNm + "</div>";
	        			chatRmListHtml += "<div>" + result[i].chatMemberVOList[0].chatVOList[0].chatCont + "</div>";
	        			chatRmListHtml += "</td>";
	        			chatRmListHtml += "<td class='col-3'>";
	        			chatRmListHtml += "<div class='dayoung'>" + formatDate + "</div>";
	        			chatRmListHtml += "<div class='dayoung'>" + dsp_ampm + "</div>";
	        			chatRmListHtml += "</td>";
	        			chatRmListHtml += "</tr>";
	        		});
	        		$('#chatRmPrint').html(chatRmListHtml);
	        	}
	        }
        });
    });
	
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

	  	console.log('선택된 직원:', selectedEmployees);
	});
	
	$(document).ready(function() {
		
		var chatRmNm = $("#chatRmNm");
		console.log("chatRmNm2 : ", chatRmNm)
		
	    $('#openCreateRoomForm').on('click', function() {
	        $('#createRoomForm').show(); // 대화방 생성 폼 보이기
	    });

	    $('#submitChatRoom').on('click', function() {
	        var header = $("meta[name='_csrf_header']").attr("content");
	    	var token = $("meta[name='_csrf']").attr("content");
	        
	    	var chatRmNm = $('#chatRmNm').val();
	        var selectedEmployeeIds = selectedEmployees.map(function(employee) {
	            return employee.id;
	        });
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
	
	//채팅방 클릭하면 채팅방 열리게하기
	$("#chatRmPrint").on("click",".room",function(){
		$("#container").html("");
			console.log("채팅방 클릭되었다.");
			var chatRoomHidden = $("#chatRoomHidden")
			
			//채팅목록불러오기
			$.ajax({
				url : "/ddukddak/chatting/chat/list",
				type : "POST",
				data : JSON.stringify(),
				contentType : "application/json; charset=utf-8",
				async : false,
				beforeSend : function(xhr){            
		            xhr.setRequestHeader(header,token);
		        },
		        success : function(result){
		        	console.log("채팅내용 불러온다리");
		        }				
			});
			//채팅방멤버불러오기
			$.ajax({
				url : "/ddukddak/chatting/chat/employeeList",
				data : JSON.stringify(),
				contentType : "application/json; charset=utf-8",
				async : false,
				beforeSend : function(xhr){            
		            xhr.setRequestHeader(header,token);
		        },
		        success : function(result){
		        	console.log("채팅방 멤버 불러온다리");
		        }
			});
	});
	
// 	//채팅방 안에서 채팅 보내기/채팅 수신/채팅방 닫기 => 여기서 웹소켓
// // 	$("#채팅방채팅하는곳").on("change",function(){
		
// 		//전송 버튼 누르는 이벤트
// 		$("#button-send").on("click", function(e) {
// 			sendMessage();
// 			$('#msg').val('')
// 		});
// 		// "ws://localhost/chatting/" + chatRmNo
// 		var socket = new WebSocket("ws://localhost/chatting/");
// 		socket.onopen = onOpen; //websocket서버와 연결시킨다
// 		socket.onmessage= onMessage; //메세지를 보내면 자동으로 실행
// 		socket.onclose = onClose;   //접속 해제       
// // 		socket.onerror = onError;	//에러
		
// 		//채팅창에 들어왔을 때
// 		function onOpen(evt) {
			
// 			var user = '${pr.username}';
// 			var str = user + "님이 입장하셨습니다.";
			
// 			$("#msgArea").append(str);
// 		}
// 		//메세지 보내기
// 		function sendMessage() {
// 			socket.send($("#msg").val());
			
// 			//보낼 데이터랑 db에 저장할 데이터를 가져오고
			
// 			//그 데이터를 담아서
			
// 			//ajax로 insert...파일이랑 텍스트랑 따로 해야하는건가
			
			
// 		}
// 		//전달받은 데이터
// 		function onMessage(msg) {
			
// 			//또 데이터 가져오고
// 			var data = msg.data;
// 			var sessionId = null; //데이터를 보낸사람
// 			var message = null;
			
// 			var arr = data.split(":");
			
// 			for(var i=0; i<arr.length; i++){
// 				console.log('arr[' + i + ']: ' + arr[i]);
// 			}
			
// 			var cur_session = '${userid}'; //현재 세션에 로그인 한 사람
// 			console.log("cur_session : " + cur_session);
			
// 			sessionId = arr[0];
// 			message = arr[1];
			
// 			//로그인 한 사람과 다른사람을 분류
// 			//이건 내가 보낼때
// 			if(sessionId == cur_session){
				
// 				var str = "<div class='col-6'>";
// 				str += "<div class='alert alert-secondary'>";
// 				str += "<b>" + sessionId + " : " + message + "</b>";
// 				str += "</div></div>";
				
// 				$("#msgArea").append(str);
// 			}
// 			//다른사람이 보낼때
// 			else{
				
// 				var str = "<div class='col-6'>";
// 				str += "<div class='alert alert-warning'>";
// 				str += "<b>" + sessionId + " : " + message + "</b>";
// 				str += "</div></div>";
				
// 				$("#msgArea").append(str);
// 			}
// 		}
		
// 		//접속 해제...하면 대화방 목록에 표시되는 채팅내용 최신화....
// 		function onClose(evt) { //evt
// 			var user = '${pr.username}';
// 			var str = user + "님이 퇴장하셨습니다.";
			
// 			$("#msgArea").append(str);	
// 		}
// // 	});
});
</script>
</body>
</html>
