<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/resources/js/jquery-3.6.0.js"></script>
<title>문자인증</title>
</head>
<body>
	<div id="contents"> 
		받는사람 : <input type="text" id="to" name="to"/>   <!-- 인증번호 받을사람 휴대폰 번호 -->
		<button type="button" id="send" disabled>전송</button><br> <!-- 문자보내는 전송버튼 -->
		
<!-- 		인증번호 : <input type="text" id="userNum">   인증번호 입력창 -->
<!-- 		<button type="button" id="enterBtn">확인</button>  인증번호와 내가 입력창에 입력한 인증번호 비교하는 창 -->
		<br/>
		<button type="button" id="addForm">양식 추가</button>
		<button type="button" id="updateForm">양식 수정</button>
		<button type="button" id="deleteForm">양식 삭제</button>
		<br/>
		<br/>
	</div>
	
	<select id="formSlct">
		<option>양식선택</option>
			<c:forEach var="mmsFormVO" items="${mmsFormVOList}">
				<option data-cont="${mmsFormVO.getMmsFormCont()}">${mmsFormVO.getMmsFormCd()}</option><br/>
			</c:forEach>
    </select>
	<textarea rows="20" cols="30" id="textArea" name="textArea"></textarea>
</body>

<script type="text/javascript">

$(document).ready(function() {
	$('#formSlct').change(formSlctChange);
	sendMMS();
	addForm();
	updateForm();
	deleteForm();
});

function formSlctChange(){
	let MmsFormCont = $('#formSlct option:selected').data('cont');
	$('#textArea').val(MmsFormCont);
};

function sendMMS(){
	$('#send').click(function() {
		
		var to = $('#to').val();
		
		$.ajax ({
			url: '/sendMMS',
			type: 'GET',
			data: {
				"to" : to
			},
			success: function(data) {
				console.log(data);
			}
		});
	});
};

function addForm(){
	$('#addForm').click(function() {
	
		var mmsFormCont = $('#textArea').val();
		
		var mmsFormVO = {"mmsFormCont":mmsFormCont}
		
		$.ajax ({
			url: '/mms/addForm',
			type: 'POST',
			data: JSON.stringify(mmsFormVO),
	// 		dataType: "json",
			contentType:"application/json;charset=utf-8",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: function(data) {
				console.log(data);
				if(data!=null){
					alert("추가 성공");	
					$('#formSlct option:selected').removeAttr('selected');
					$('#formSlct').append("<option data-cont='"+data.mmsFormCont+"' selected>"+data.mmsFormCd+"</option>");
					
				}
			},
		    error: function(jqXHR, textStatus, errorThrown) {
		        // 에러 처리
		        console.error('에이젝스 요청 중 에러 발생:', textStatus, errorThrown);
		    }
		});
	});
};

function updateForm(){
	$('#updateForm').click(function() {
		
		var mmsFormCont = $('#textArea').val();
		var mmsFormCd = $('#formSlct option:selected').val();
	
		var mmsFormVO = {"mmsFormCd":mmsFormCd, "mmsFormCont":mmsFormCont}
		
		$.ajax ({
			url: '/mms/updateForm',
			type: 'POST',
			data: JSON.stringify(mmsFormVO),
	// 		dataType: "json",
			contentType:"application/json;charset=utf-8",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: function(data) {
				console.log(data);
				if(data>0){
					alert("수정 성공");				
				}
			}
		});
	});
};

function deleteForm(){
	$('#deleteForm').click(function() {
		
		var mmsFormCd = $('#formSlct option:selected').val();
	
		var mmsFormVO = {"mmsFormCd":mmsFormCd}
		
		$.ajax ({
			url: '/mms/deleteForm',
			type: 'POST',
			data: JSON.stringify(mmsFormVO),
	// 		dataType: "json",
			contentType:"application/json;charset=utf-8",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: function(data) {
				console.log(data);
				if(data>0){
					alert("삭제 성공");
					$('#formSlct option:selected').remove(); // 선택된 옵션 삭제
					$('#textArea').val("");
				}
			}
		});
	});
};
</script>
</html>