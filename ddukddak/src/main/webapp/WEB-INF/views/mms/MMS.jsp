<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="/resources/js/jquery-3.6.0.js"></script>
<title>문자인증</title>
</head>

<style>
.left, .right {
	width: 720px;
	box-sizing: border-box;
}

.container {
	display: flex;
	flex-wrap: wrap;
}

.bottom {
	margin-top: 9px;
	width: 100%;
	height: 357px;
}

.crm-wrap {
	display: flex;
	height: 357px;
	gap: 9px;
}

hr {
	border-color: turquoise;
	border-width: 4px; /* 선 굵기를 2px로 지정 */
}
</style>

<body>
<div>
<div class="crm-wrap">
	<div class="dduk-body-border right">
		<div class="contents"> 
			<h2>문자 작성</h2>
			<hr/>
			받는사람 : <input class="dduck-input" type="text" id="to" name="to"/>   <!-- 인증번호 받을사람 휴대폰 번호 -->
			<button type="button" id="send">전송</button><br> <!-- 문자보내는 전송버튼 -->
			<br/>
	<!-- 		인증번호 : <input type="text" id="userNum">   인증번호 입력창 -->
	<!-- 		<button type="button" id="enterBtn">확인</button>  인증번호와 내가 입력창에 입력한 인증번호 비교하는 창 -->
	
			<div>
			<button type="button" id="addForm">양식 추가</button>
			<button type="button" id="updateForm">양식 수정</button>
			<button type="button" id="deleteForm">양식 삭제</button>
			</div>
			<br/>
			
			<div>
			양식제목 : <input class="dduck-input" type="text" id="formNm" name="formNm"/>
				<select id="formSlct">
					<option>양식 선택</option>
						<c:forEach var="mmsFormVO" items="${mmsFormVOList}">
							<option 
								data-json='{"cont": "${mmsFormVO.getMmsFormCont()}", "cd": "${mmsFormVO.getMmsFormCd()}" }'
								>${mmsFormVO.getMmsFormNm()}
								</option><br/>
						</c:forEach>
			    </select>
			</div>
			<br/>
		<textarea class="dduck-input" rows="5" cols="30" id="textArea" name="textArea"></textarea>
		</div>
	</div>
	
	<div class="dduk-body-border left">
		<div class="contents"> 
			<h2>문자 발송 내역</h2>
			<hr/>
		</div>
	</div>
</div>

<br/>

<div class="crm-wrap">
	<div class="dduk-body-border right">
		<div class="contents"> 
			<h2>환자 검색 : <input class="dduck-input" type="text"/></h2>
			<hr/>
		</div>
	</div>
	
	<div class="dduk-body-border left">
		<div class="contents"> 
			<h2>발송 대상</h2>
			<hr/>
		</div>
	</div>
</div>
</div>
</body>

<script type="text/javascript">

var dataJson="";
var data="";
var cd="";

$(document).ready(function() {
	$('#formSlct').change(formSlctChange);
	sendMMS();
	addForm();
	updateForm();
	deleteForm();
});

function formSlctChange(){
	//선택된 option에 들어있는 data-json 꺼내기
	dataJson = $('#formSlct option:selected').attr('data-json');
	data = JSON.parse(dataJson);
	cd = data.cd;
	cont = data.cont;
	
	$('#formNm').val($('#formSlct option:selected').val());
    nm = $('#formNm').val()
	$('#textArea').val(cont);
};

function addHstr(){
	
	var mmsCont = $('#textArea').val();
	
	var mmsHstrVO = {
			"mmsFormCd" : cd,
			"mmsSent" : '${getCurrentLoginName}',
			"mmsRecv" : '김환자',
			"mmsCont" : mmsCont
			};
	
	console.log(mmsHstrVO);
	
	$.ajax ({
		url: '/mms/addHstr',
		type: 'POST',
		data: JSON.stringify(mmsHstrVO),
// 		dataType: "json",
		contentType:"application/json;charset=utf-8",
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
		success: function(data) {
			console.log(data);
			if(data!=null){
				alert("addHstr");	
			}
		},
	    error: function(jqXHR, textStatus, errorThrown) {
	        // 에러 처리
	        console.error('에이젝스 요청 중 에러 발생:', textStatus, errorThrown);
	    }
	});
};

function sendMMS(){
	$('#send').click(function() {
		
		var to = $('#to').val();
		
		$.ajax ({
			url: '/mms/sendMMS',
			type: 'GET',
			data: {
				"to" : to
			},
			success: function(data) {
				console.log(data);
				addHstr();
			},
		    error: function(jqXHR, textStatus, errorThrown) {
		        // 에러 처리
		        console.error('sendMMS 에이젝스 요청 중 에러 발생:', textStatus, errorThrown);
		    }
		});
	});
};

function addForm(){
	$('#addForm').click(function() {
		var mmsFormNm = $('#formNm').val().trim();
		var mmsFormCont = $('#textArea').val();
		
		var mmsFormVO = {
				"mmsFormNm":mmsFormNm,
				"mmsFormCont":mmsFormCont}
		
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
					$('#formSlct').append(
						    '<option data-json=\'{"cont":"' + data.mmsFormCont + '", "cd":"' + data.mmsFormCd + '"}\' selected>' 
						    +data.mmsFormNm+
						    '</option>'
					);
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
		cont = $("#textArea").val();
		nm = $("#formNm").val();
	
		var mmsFormVO = {
				"mmsFormCd":cd,
				"mmsFormCont":cont,
				"mmsFormNm":nm}
		
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
					$('#formSlct option:selected').html(nm);
				}
			}
		});
	});
};

function deleteForm(){
	$('#deleteForm').click(function() {
		
		var mmsFormVO = {"mmsFormCd":cd}
		
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