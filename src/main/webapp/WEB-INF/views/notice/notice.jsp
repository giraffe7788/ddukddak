<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="../common/modal.jsp"></c:import>
<style>
* {
	font-size: 16px;
}

a {
	color: #323537;
}

h1 {
	margin-top: 0;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	border-style: none !important;
}

thead{
	display: contents;
	padding: 16px 24px;
	border-radius: 16px;
	background-color: var(--BG-01, #F8F9FC);
}

th:first-child {
	border-radius: 16px 0px 0px 16px;
	padding-left: 24px;
}

th:last-child {
	border-radius: 0px 16px 16px 0px;
	padding-right: 24px;
}

td:first-child {
	padding-left: 24px;
}

td:last-child {
	padding-right: 24px;
}

th {
	background-color: var(--BG-01, #F8F9FC);
}

th, td {
	text-align: left;
	padding: 8px;
}

td {
	border-bottom: 1px solid #EBEFF0;
}

button {
	margin-top: 20px;
	padding: 10px 20px;
	font-size: 16px;
	background-color: #007bff;
	color: #ffffff;
	border: none;
	cursor: pointer;
}

button:hover {
	background-color: #0056b3;
}

.dduk-body-border{
	width: 1280px;
}

#title-td {
	width: 850px;
}

#title-no-td {
	width: 100px;
}

#title-date-td {
	width: 160px;
}

#title-count-td {
	text-align: center;
}

#noticeTitle {
	width: 100%;
}

#noticeWriteBody {
    padding: 0px 48px;
}

.modal-header {
	padding: 40px 0px 20px 32px !important;
}

#clip {
	width: 24px;
    position: absolute;
    margin-left: -40px;
    margin-top: 15px;
}

#atchFileLabel {
	width: 245px;
}

#selectAll {
	color: #8D9EA5;
	cursor: pointer;
}

.space-bw {
	display: flex;
	justify-content: space-between;
}

.dduk-btn-select {
	display: flex;
	padding: 5px 12px;
	align-items: center;
	gap: 10px;
	border-radius: 8px;
	border: 0px solid var(--black-05, #EBEFF0);
	background: var(--black-05, #F8F9FC) !important;
	font-family: 'Pretendard5';
	color: var(--black-03, #8D9EA5);
	border: 0px;
	margin-top: 11px;
}

.dduk-btn-select.active {
	display: flex;
	padding: 5px 12px;
	align-items: center;
	gap: 10px;
	border-radius: 8px;
	border: 0px solid var(--black-05, #E0E6E9);
	background: var(--black-05, #DBF2F4) !important;
	font-family: 'Pretendard5';
	color: var(--black-03, #0abab5);
	border: 0px;
	margin-top: 11px;
}

.notice-table-wrapper {
	justify-content: center;
    height: calc(100% - 120px);
}

.notice-btn-box {
	display: flex;
	justify-content: flex-end;
	padding : 0px 16px;
}

.dduk-title-area {
	margin-bottom : -16px;
}

.header-notice-icon {
	border-radius: 16px;
    background: var(--bg-02, #DBF2F4);
}

.ck-editor__editable {
	height: 500px;
}

#writeNotice>.modal-dialog {
	max-width: 1080px;
}

.dduk-login-d {
	width: 100%;
}
</style>
<!-- 모달 임포트 -->
<div class="dduk-body-border" >
	<div class="dduk-title-area">
		<h2>공지사항</h2>
	</div>
	<div class="d-flex notice-table-wrapper">
		<table style=" width: 100%;">
			<thead>
				<tr>
					<th>NO</th>
					<th>제목</th>
					<th>작성일</th>
					<th style="text-align: center;">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="notice">
					<tr>
<!-- 						고유한 번호를 위해 사용 함 -->
						<td id="title-no-td">${notice.RM}</td>
						<input type="hidden" value="${notice.noticeNo}"/>
						<%--                         <td>${notice.empNo}</td> --%>
						<td id="title-td"><a href="/notice/detail?noticeNo=${notice.noticeNo}">${notice.noticeTitle}</a></td>
						<td id="title-date-td"><fmt:formatDate value="${notice.noticeDt}" pattern="yyyy-MM-dd" /></td>
						<td id="title-count-td"><fmt:formatNumber value="${notice.noticeViews}" /></td>
						<%--                         <fmt:parseDate value="${list.reg_date}" var="noticeDt" pattern="yyyyMMddHHmmss"/>  --%>
						<%-- 	 				 <td><fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd"/></td> --%>
	<%-- 					<td>${notice.noticeViews}</td> --%>
	<%-- 					<td>${notice.atchFileCd}</td> --%>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="notice-btn-box">
		<button id="writeNotice" type="button" class="dduk-btn-normal" data-bs-toggle="modal" data-bs-target="#writeNotice">글쓰기</button>
	</div>
</div>
<script>
//글쓰기 버튼 누를 시 모달창 띄우기
$('#writeNotice').on('click', function () {
    $('#writeNotice').modal('show');
});

// 알림 대상 버튼 누를 시 색깔변화
$('.dduk-btn-select').on('click', function(){
	$(this).toggleClass('active');
});

// 전체선택 누를 시 대상 전체선택
$('#selectAll').on('click', function(){

	let btn = $('.dduk-btn-select');
	
	// 전체선택 누를 때 이미 모든버튼이 다 눌려있으면 초기화
	if($('.active').length == 4){
		$.each(btn, function(index){
			btn.eq(index).toggleClass('active');
		});
		
		return;
	}
	
	// 모든 버튼의 toggleClass active 적용, 만약 버튼이 활성화되어있다면 제외
	$.each(btn, function(index){
		if(!btn.eq(index).hasClass('active')){
			btn.eq(index).toggleClass('active');
		}
	});
});

 $(function () {
	    // CKEditor 생성 및 설정
	    ClassicEditor.create(document.querySelector('#noticeCont'), {
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
 //ck에디터 이미지 조절,,? 근데 안됨
 ClassicEditor
    .create(document.querySelector('#editor'), {
        plugins: ['Image', 'ImageCaption', 'ImageStyle', 'ImageToolbar', 'ImageUpload', 'ImageResize'],
        image: {
            resizeOptions: [
                {
                    name: 'imageResize:original',
                    label: 'Original',
                    value: null
                },
                {
                    name: 'imageResize:50',
                    label: '50%',
                    value: '50'
                },
                {
                    name: 'imageResize:75',
                    label: '75%',
                    value: '75'
                }
            ],
            styles: [
                'alignLeft', 'alignCenter', 'alignRight'
            ],
            toolbar: [
                'imageStyle:alignLeft', 'imageStyle:alignCenter', 'imageStyle:alignRight',
                '|',
                'imageResize'
            ]
        },
        imageResize: {
            disableResizer: true
        },
        contentStyle: {
            width: '50%',
            height: '50%'
        }
    })
    .catch(error => {
        console.error(error);
    });

 //파일 이름 가져오기
 $(document).ready(function() {
	 
	 $('.header-notice-icon').find('path').attr('fill', '#00A9A4');
	 
     // 파일 선택 시 이벤트 처리
     $('#atchFile').change(function() {
         // 파일 이름 및 확장자 추출
         var filePath = $(this).val();
         var fileName = filePath.split('\\').pop(); // 파일 경로에서 파일 이름 추출
         var fileExtension = fileName.split('.').pop(); // 파일 이름에서 확장자 추출
         
         // 파일 이름이 너무 길 경우 일정 길이로 제한하고 "..." 추가
         var maxLength = 20; // 원하는 최대 길이 지정
         if (fileName.length > maxLength) {
             fileName = fileName.substring(0, maxLength) + '...';
         }

         // 파일 이름 및 확장자를 보여주기
         $('#atchFileLabel').text(fileName);
     });
 });
</script>
