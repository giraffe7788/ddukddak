<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/resources/js/jquery-3.6.0.js"></script>
<title>문자인증</title>
</head>
<body>
	<div id="contents"> 
		받는사람 : <input type="text" id="to" name="to"/>   <!-- 인증번호 받을사람 휴대폰 번호 -->
		<button type="button" id="send" disabled>전송</button><br> <!-- 문자보내는 전송버튼 -->
		
		인증번호 : <input type="text" id="userNum">   <!-- 인증번호 입력창 -->
		<button type="button" id="enterBtn">확인</button>  <!-- 인증번호와 내가 입력창에 입력한 인증번호 비교하는 창 -->
		<br/>
		<span>
		<button type="button" id="addForm">양식 추가</button>		
		<button type="button" id="updateForm">양식 수정</button>		
		<button type="button" id="deleteForm">양식 삭제</button>
		</span>		
		<br/>
		<br/>
		<textarea rows="20" cols="30" id="textArea" name="textArea"></textarea>
    </div>
</body>

<script type="text/javascript">
$('#send').click(function() {
	
	const to = $('#to').val();
	
	$.ajax ({
		url: '/sendMMS',
		type: 'GET',
		data: {
			"to" : to
		},
		success: function(data) {
			console.log(data);
// 			const checkNum = data;
// 			alert('checkNum:'+ checkNum);
			
// 			$('#enterBtn').click(function() {	
// 				const userNum = $('#userNum').val();
				
// 				if(checkNum === userNum) {
// 					alert('인증 성공하였습니다.');
// 				}
// 				else {
// 					alert('인증 실패하였습니다. 다시 입력해주세요.');
// 				}
		}
	})
});
	
$('#addForm').click(function() {

	const form = $('#textArea').val();
	
	$.ajax ({
		url: '/addForm',
		type: 'GET',
		data: {
			"form" : form
		},
		success: function(data) {
			console.log(data);
		}
	})
});

// $('#updateForm').click(function() {
// 	alert("잘돼요");
// 	$.ajax ({
// 		url: '/sendMMS',
// 		type: 'GET',
// 		data: {
// 			"to" : to
// 		},
// 		success: function(data) {
// 			console.log(data);
// 		}
// 	})
// });

// $('#deleteForm').click(function() {
// 	alert("잘돼요");
// 	$.ajax ({
// 		url: '/sendMMS',
// 		type: 'GET',
// 		data: {
// 			"to" : to
// 		},
// 		success: function(data) {
// 			console.log(data);
// 		}
// 	})
// });

</script>

</html>