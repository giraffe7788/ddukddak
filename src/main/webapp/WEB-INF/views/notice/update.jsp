<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, viewport-fit=cover">
<!-- CKEditor -->
<script
	src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
<script
	src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<!-- CKEditor의 너비와 높이를 위한 스타일 지정 -->
<style>
body {
	font-family: 'Arial', sans-serif;
}

h2 {
	border-bottom: 1px solid #ccc;
	padding-bottom: 10px;
}

.dduk-body-border {
	border: 1px solid #ccc;
	padding: 10px;
	margin-top: 10px;
}

.editor-container {
	max-width: 800px;
	margin: 20px auto;
}

#editor {
	min-height: 400px;
}

.file-input {
	margin-top: 10px;
}

.button-container {
	margin-top: 10px;
}

button {
	padding: 10px;
	margin-right: 10px;
	background-color: #4CAF50;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

button:hover {
	background-color: #45a049;
}

.ck-editor__editable {
	height: 400px;
}

.checkbox-container {
	margin-top: 10px;
}

.notice-wrap {
	display: flex;
}
#btnSubmit {
    float: right;
  }
</style>
</head>
<!-- <div class="dduk-body-border"> -->
<!--     <h2>공지사항</h2> -->
<sec:authentication property="principal.employeeVO" var="empVO" />
<div class="dduk-body-border">

	<form id="frm"
			action="/notice/updateNotice"
			method="post" enctype="multipart/form-data">
	
<!-- 	<button id="btnSubmit" type="button" >수정완룡</button> -->
	<button id="btnSubmit" type="button" class="dduk-btn-normal" style="float: right;right: 50%;">수정완료</button>
	<h2>공지사항</h2>
	<!-- 전송 및 확인 버튼 -->
	
	<div class="notice-wrap">
	<!-- 제목, 사진첨부 넣는 부분 -->
	<div>
		<input type="hidden" name="noticeNo" value="${noticeVO.noticeNo}"/>
		<h3>제목</h3>
			<input type="text" placeholder="제목" id="noticeTitle"
				name="noticeTitle" value="${noticeVO.noticeTitle}" />
		<br><br>
		<div>
			<button id="btnFileSelect" type="button" class="dduk-btn-normal" style="float:left;">파일선택</button>
			<span id="spanFileSelect"></span>
			<input type="file" id="uploadFile" name="uploadFile" style="display:none;" />
<%-- 			<c:if test="${noticeVO.atchFileNm eq null}"> --%>
<!--       	<p>파일이 없습니다</p> -->
<%--       </c:if> --%>
<%--      	${noticeVO.atchFileNm} --%>
			<br /><br /><br />
			<a href="/download?fileName=/notice/${noticeVO.saveNm}" target="_blank" onclick="downloadFile('${noticeVO.atchFileNm}')">
	        변경 전 : ${noticeVO.atchFileNm}
	    	</a>
		</div>
		<br><br>
			<input type="hidden" value="${noticeVO.empNo}" id="empNo" name="empNo" />
	</div>
	
	<!-- ckeditor 넣는 부분 -->
	<div>
		<!-- CKEditor 인스턴스를 위한 div 요소(id 'editor' 사용) -->
		<div id="editor">
			<p>이것은 샘플 내용입니다.</p>
		</div>
	</div>
	</div>

	<!-- noticeCont -->
<div class="file-input" style="display: none;">
    <label for="noticeCont">내용:</label>
    <textarea id="noticeCont">${noticeVO.noticeCont}</textarea>
</div>

<!-- 히든 필드로 변경된 noticeCont -->
<input type="hidden" id="hiddenNoticeCont" name="noticeCont" value="" />


	<sec:csrfInput />
	</form>
	<!--  </div> -->
</div>

<!-- 'classic' 인스턴스를 위한 CKEditor 초기화 스크립트 -->

<!-- 'frm' 폼이 submit 될 때 CKEditor의 내용을 숨겨진 필드에 복사하여 서버로 전송하는 스크립트 -->
<script type="text/javascript">
$(function () {
	//파일선택 버튼 클릭 시 파일 선택 작업 수행
	$("#btnFileSelect").on("click",function(){
		$("#uploadFile").click();
	});
	
	$("#uploadFile").on("change",function(){
		let fileValue = $("#uploadFile").val().split("\\");
		let fileName = fileValue[fileValue.length-1]; // 파일명
		
		$("#spanFileSelect").html("변경 후 : " + fileName);
	});
	
    // CKEditor 생성 및 설정
    ClassicEditor.create(document.querySelector('#editor'), {
        ckfinder: {
            uploadUrl: "/notice/image/upload?${_csrf.parameterName}=${_csrf.token}",
            withCredentials: true
        },
        language: "ko",
        height: "300"
    }).then(editor => {
        window.editor = editor;

        // 등록 버튼 클릭 시 서버로 데이터 전송
        $("#btnSubmit").on("click", function () {
            document.getElementById('hiddenNoticeCont').value = window.editor.getData();
            $("#frm").submit();
        });
    });
});

    $(document).ready(function () {
        // 문서가 로드될 때 실행되는 부분
        // noticeVO.noticeCont의 값으로 CKEditor 설정
        window.editor.setData('${noticeVO.noticeCont}');
    });
</script>
