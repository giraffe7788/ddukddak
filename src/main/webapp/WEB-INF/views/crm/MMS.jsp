<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="/resources/js/jquery-3.6.0.js"></script>
<title>문자인증</title>
</head>

<style>
.left, .right {
	width: 810px;
	box-sizing: border-box;
	height: 370px;
/* 	display: flex; */
}

.container {
	display: flex;
}

.crm-wrap {
	display: flex;
	height: 357px;
	gap: 9px;
}

#formDiv{
	margin-left : 30px;
}
.fmrBtn{
	float: left;
	margin: 2px;
}

#send{
	width: 50px;
	height: 50px;
	cursor:pointer;
	float: right;
	margin-top: 13px;
}
</style>

<body>
<div>
	<div class="crm-wrap">
		<div class="dduk-body-border left">
			<div class="container">
				<h2>
					<select id="formSlct">
						<option>양식 선택</option>
							<c:forEach var="mmsFormVO" items="${mmsFormVOList}">
								<option 
									data-json='{"cont": "${mmsFormVO.getMmsFormCont()}", "cd": "${mmsFormVO.getMmsFormCd()}" }'
									>${mmsFormVO.getMmsFormNm()}
									</option><br/>
							</c:forEach>
				    </select>
				문자 작성
		    	</h2>
			    
			</div>
				<div class="container">
					<h3>양식제목 : <input class="dduck-input" type="text" id="formNm" name="formNm"/></h3>
						<div id="formDiv">
							<button type="button" id="addForm" class="dduk-btn-active fmrBtn">양식  추가</button>
							<button type="button" id="updateForm" class="dduk-btn-nomal fmrBtn">양식  수정</button>
							<button type="button" id="deleteForm" class="dduk-btn-danger fmrBtn">양식  삭제</button>
						</div>
				</div>
			<hr/>
				
			<div class="container">
				<textarea class="dduck-input" rows="10" cols="100" id="textArea" name="textArea"></textarea>
			</div>
		</div>
		
		<div class="dduk-body-border right">
			<div class="contents"> 
				<h2>문자 발송 내역</h2>
				
					<hr/>
					
				<table border="1">
					<thead>
						<tr>
							<th>번호</th>
							<th>발신자</th>
							<th>수신자</th>
							<th>날짜</th>
							<th>내용</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="mmsHstrVO" items="${mmsHstrVOList}" varStatus="stat">
							<tr>
								<td>${mmsHstrVO.mmsNo}</td>
								<td>${mmsHstrVO.mmsSent}</td>
								<td>${mmsHstrVO.mmsRecv}</td>
								<td><fmt:formatDate value="${mmsHstrVO.mmsDate}" pattern="yyyy-MM-dd" /></td>
								<td>${mmsHstrVO.mmsCont}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
<br/>

	<div class="crm-wrap">
		<div class="dduk-body-border left">
			<div class="contents"> 
				<h2>
				<select>
					<option>분류</option>
				</select>
				환자 검색 : <input class="dduck-input" type="text"/>
					<button type="submit" class="btn btn-default">
						<i class="fas fa-search"></i>
					</button>
				</h2>
				
				<hr/>
				
				<div class="card-body table-responsive p-0" style="height: 250px;">
					<table class="table table-head-fixed text-nowrap">
						<thead>
							<tr>
								<th>ID</th>
								<th>User</th>
								<th>Date</th>
								<th>Status</th>
								<th>Reason</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>183</td>
								<td>김환자</td>
								<td>11-7-2014</td>
								<td><span class="tag tag-success">완치</span></td>
								<td>빨리빨리 다니세요.</td>
							</tr>
							<tr>
								<td>219</td>
								<td>Alexander Pierce</td>
								<td>11-7-2014</td>
								<td><span class="tag tag-warning">Pending</span></td>
								<td>Bacon ipsum dolor sit</td>
							</tr>
							<tr>
								<td>657</td>
								<td>Bob Doe</td>
								<td>11-7-2014</td>
								<td><span class="tag tag-primary">Approved</span></td>
								<td>Bacon ipsum dolor sit</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
		<div class="dduk-body-border right">
			<div class="contents"> 
					<span>
					<!-- 문자보내는 전송버튼 -->
					발송 대상<img src="/resources/images/send.png" id="send"/>
					</span>
				<!-- 인증번호 받을사람 휴대폰 번호 -->
			</div>
			<hr/>
			받는사람 : <input class="dduck-input" type="text" id="to" name="to"/>
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
				alert("전송 성공");	
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
					formSlctChange();
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
					$('#formNm').val("");
					$('#textArea').val("");
				}
			}
		});
	});
};
</script>
</html>