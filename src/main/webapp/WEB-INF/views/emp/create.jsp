<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<script type="text/javascript">
//사진 등록 안하면 submit 못하고 경고창 뜨기
function createBtn() {
	if ($('#uploadFile')[0].files.length === 0) {
		// 사진이 등록되지 않았
           isInputEmpty = true;
           Swal.fire({
			title: '사진 등록은 필수입니다',
			icon: 'warning',
			confirmButtonColor: '#0ABAB5',
			confirmButtonText: '확인',
			})
       return false;  // 파일이 선택되지 않았으면 반복문 종료
    } else {
    	// 사진이 등록되었을 때 submit
        document.frm.submit();
    }
}

$(function() {
	// 이미지 미리보기 시작
	let alreadyWarned = false; // 플래그 변수 초기화

	$("#uploadFile").on("change", fileSelected);
	
	function fileSelected(e) {
		
		    let files = e.target.files;
		    let fileArr = Array.prototype.slice.call(files);
		
		    fileArr.forEach(function(f) {
		        let isImage = f.type.match("image.*");
		
		        if (!isImage && !alreadyWarned) {
		            Swal.fire({
		                title: '이미지 파일이 아닙니다.',
		                text: '문제가 계속된다면 관리자에게 문의하세요',
		                icon: 'error',
		                confirmButtonColor: '#0ABAB5',
		                confirmButtonText: '확인',
		            });
		            
		        }
		
		        if (isImage) {
		            let reader = new FileReader();
		            reader.onload = function(e) {
		                console.log(e.target.result);
		                $("#atchFileCd").attr("src", e.target.result)
		                e.target.result = '';
		            }
		            reader.readAsDataURL(f);
		        }
		    });
	}
	// 이미지 미리보기 끝
	
});
</script>


<style>
body {
	background: var(--bg-01, #F8F9FC);
}

.dduk-login-input {
	width: 320px;
	height: 40px;
	flex-shrink: 0;
}

.dduk-login-d {
    margin-bottom: 16px;
}

.dduk-row {
	display: flex;
    gap: 24px;
}

.join-btn {
	width: 320px;
	height: 56px;
	border-radius: 12px;
	background: var(--black-01, #333);
	margin-top: 16px;
}

.search-btn {
	margin-left:8px; 
	padding: 4px 14px; 
	border-radius: 12px; 
	height: 38px;
}

.search-btn:hover {
	background: var(--ci-01, #0ABAB5);
}

.btn-group {
	width: 100%;
	gap: 8px;
}

.btn-outline{
	border: 1px soild var(--black-01, #333);
}
 
 #uploadFile {
  display: none;
}

.form-check {
	display: flex;
    gap: 40px;
    padding: 8px 16px;
    margin-top: 8px;
    margin-left: 16px;
}

.img-circle{
	width: 120px;
	height: 80px;
	border-radius: 64px;
	margin: 16px;
	object-fit: cover;
}

.form-check-input:checked {
	background-color: var(--ci-01, #0ABAB5);
	border-color: var(--ci-01, #0ABAB5);
}

h1{
	margin-top: 20px;
}

.button-margin {
	margin-left: 8px;
}

.gray-text {
	font-family: 'pretendard5'
}
</style>
<div class="d-flex">
	<div class="login-left">
		<img class="login-img" src="/resources/images/login-img.png">
	</div>
	<div class="dduk-login-form" style="width: 824px; margin-left: 72px; padding: 60px;">
		<form name="frm"
			action="/emp/create?${_csrf.parameterName}=${_csrf.token}"
			method="post" enctype="multipart/form-data">
			<div class="login-form-content">
				<div class="d-flex mar-b-16" style=" justify-content:space-between; gap: 24px;">
					<div>
						<a href="/common/login">
							<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
								<g clip-path="url(#clip0_82_1936)">
								<path d="M19 11H7.82998L12.71 6.11997C13.1 5.72997 13.1 5.08997 12.71 4.69997C12.32 4.30997 11.69 4.30997 11.3 4.69997L4.70998 11.29C4.31998 11.68 4.31998 12.31 4.70998 12.7L11.3 19.29C11.69 19.68 12.32 19.68 12.71 19.29C13.1 18.9 13.1 18.27 12.71 17.88L7.82998 13H19C19.55 13 20 12.55 20 12C20 11.45 19.55 11 19 11Z" fill="#333333"/>
								</g>
								<defs>
								<clipPath id="clip0_82_1936">
								<rect width="24" height="24" fill="white"/>
								</clipPath>
								</defs>
							</svg>
						</a>
						<h1>회원가입</h1>
					</div>
						<div style="width: 48%;">
							<div class="login-input-label">프로필</div> 
							<div class="d-flex" style="align-items: center;">
								<img class="img-circle"
									src="/resources/images/bpfl.jpg"
									alt="User profile picture" id="atchFileCd">
								<div class="custom-file">
									<label for="uploadFile">
										 <div type="button" class="dduk-btn-normal button-margin">파일</div>
									</label>
									<input type="file" class="dduk-login-input" name="uploadFile" id="uploadFile" style="display:none;" /> 
								</div>
							</div>
						</div>
				</div>
						<div class="dduk-row">
							<div class="dduk-login-d">
								<div class="login-input-label">사번</div> 
								<input id="empNo" name="empNo" class="dduk-login-input" type="text" readonly
									value="<c:out value='${newEmpNo}'/>" />
							</div>
							<div class="dduk-login-d">
								<div class="login-input-label">성명</div>
								<input id="empName" name="empName" class="dduk-login-input" type="text"/>
							</div>
						</div>
						<div class="dduk-row">
							<div class="dduk-login-d">
								<div class="login-input-label pw-container">비밀번호</div>
								<input id="empPw" name="empPw" class="dduk-login-input" type="password"/>
							</div>
							<div class="dduk-login-d">
								<div class="login-input-label pw-container">비밀번호 확인</div>
								<input id="pwConfirm" name="pwConfirm" class="dduk-login-input" type="password"/>
							</div>
						</div>
						
						<div style="margin: 12px 0px;">
							<div class="dduk-row">
							<div class="dduk-login-d"  style="margin-bottom: 0px;">
								<div class="login-input-label">주소</div>
								<div class="d-flex" style="align-items: baseline">
									<input type="text" id="empZip" name="empZip" class="dduk-login-input" style="width: 203px;"/>
									<button type="button" class="dduk-btn-nomal search-btn" id="btnPost" >우편번호 찾기</button>
								</div>
								
							</div>
						</div>
						<div class="dduk-row">
							<div class="dduk-login-d">
								<input id="empAdd1" name="empAdd1" class="dduk-login-input" type="text" />
							</div>
							<div class="dduk-login-d">
								<input id="empAdd2" name="empAdd2" class="dduk-login-input" type="text" placeholder="상세주소"/>
							</div>
						</div>
						</div>
						
						
						<div class="dduk-row">
							<div class="dduk-login-d">
								<div class="login-input-label">연락처</div> 
								<input id="empPh" name="empPh" class="dduk-login-input" type="text"/>
							</div>
							<div class="dduk-login-d">
								<div class="login-input-label">이메일</div> 
								<input id="empMail" name="empMail" class="dduk-login-input" type="text"/>
							</div>
						</div>
						<div class="dduk-login-d">
							<div class="login-input-label">주민번호</div> 
							<input id="empReg" name="empReg" class="dduk-login-input" type="text" style="width: 664px;" />
						</div>
						
						
						<div class="dduk-row">
							<div class="dduk-login-d">
								<div class="login-input-label">직무</div>
								<select name="empDeptCd" id="empDeptCd" class="dduk-login-input" style="padding-right: 8px;">
										<option value="">직무 선택</option>
										<option value="DTCD01">의사</option>
										<option value="DTCD02">간호사</option>
										<option value="DTCD03">치료사</option>
										<option value="DTCD04">원무과</option>
										<option value="DTCD05">인사과</option>
								</select>
							</div>
						
							<div class="dduk-login-d">
								<div class="login-input-label">직책</div>
								<select name="empJbpsCd" id="empJbpsCd" class="dduk-login-input" style="padding-right: 8px;">
									<option value="">직책 선택</option>
								</select>
							</div>
						</div>
						<div class="dduk-row">
							<button type="button" onclick="createBtn()" class="join-btn mar-b-8">
								회원가입 신청
							</button>
<!-- 							자동완성 버튼 -->
							<button type="button" class="auto-complete-btn">
				               <svg width="36" height="36" viewBox="0 0 600 600" fill="none" xmlns="http://www.w3.org/2000/svg">
				                  <path class="auto-complete-btn-path" d="m495.6 49.23-32.82-32.82C451.8 5.471 437.5 0 423.1 0c-14.33 0-28.66 5.469-39.6 16.41l-216 216.09c-8.4 7.5-12.7 17-15.1 27.3l-24.1 107.4c-1.8 8.9 5.1 16.8 12.8 16.8.916 0 1.852-.092 2.797-.281 0 0 74.03-15.71 107.4-23.56 10.1-2.377 19.13-7.46 26.46-14.79l217-217C517.5 106.5 517.4 71.1 495.6 49.23zM461.7 94.4l-217 217c-1.1 1.1-2.2 1.7-3.5 2-13.7 3.227-34.65 7.857-54.3 12.14l12.41-55.2c.29-1.44.99-2.84 2.09-3.84L417.5 50.4c1.9-1.99 4.1-2.4 5.6-2.4s3.715.406 5.65 2.342l32.82 32.83c3.23 3.168 3.23 8.098.13 11.228zM424 288c-13.25 0-24 10.75-24 24v128c0 13.23-10.78 24-24 24H72c-13.22 0-24-10.77-24-24V136c0-13.23 10.78-24 24-24h144c13.25 0 24-10.75 24-24s-10.7-24-24-24l-144.9-.01C32.31 63.99 0 96.29 0 135.1v304C0 479.7 32.31 512 71.1 512h303.1c39.69 0 71.1-32.3 71.1-72l2.7-128c0-13.2-10.7-24-24-24z" fill="#8d9ea5">
				                  </path>
				               </svg>
				            </button>
				        </div>
							<div>
								<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
									<g clip-path="url(#clip0_82_2361)">
									<path d="M11 7H13V9H11V7ZM12 17C12.55 17 13 16.55 13 16V12C13 11.45 12.55 11 12 11C11.45 11 11 11.45 11 12V16C11 16.55 11.45 17 12 17ZM12 2C6.48 2 2 6.48 2 12C2 17.52 6.48 22 12 22C17.52 22 22 17.52 22 12C22 6.48 17.52 2 12 2ZM12 20C7.59 20 4 16.41 4 12C4 7.59 7.59 4 12 4C16.41 4 20 7.59 20 12C20 16.41 16.41 20 12 20Z" fill="#E0E6E9"/>
									</g>
									<defs>
									<clipPath id="clip0_82_2361">
									<rect width="24" height="24" fill="white"/>
									</clipPath>
									</defs>
									<span class="gray-text">회원가입 신청이 승인되면 로그인할 수 있어요</span>
								</svg>
								
							</div>
			</div>
			<sec:csrfInput />
		</form>
	</div>
</div>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
$(function(){
	// 다음 우편 번호 검색
	$("#btnPost").on("click", function(){
		new daum.Postcode({
		//다음 창에서 검색이 완료되면 콜백함수에 의해 결과 데이터가 data 객체로 들어옴
			oncomplete:function(data){
				$("#empZip").val(data.zonecode);
				$("#empAdd1").val(data.address);
				$("#empAdd2").val(data.buildingName);
			}
		}).open();
	});
	
	// 직무 따라서 직책 선택지 바꾸기
	$('#empDeptCd').on("change", function(){
		let empDeptcd = $(this).val();
		let deptComCd = "";
		let temp = $("#empJbpsCd");
		// 직무 코드에 해당하는 직책 코드에서 공통되는 부분을 찾을 값으로 설정
		if(empDeptcd == 'DTCD01'){
			deptComCd = 'JBCD1';
		} else if (empDeptcd == 'DTCD02'){
			deptComCd = 'JBCD2';
		} else if (empDeptcd == 'DTCD03'){
			deptComCd = 'JBCD3';
		} else {
			deptComCd = 'JBCD0';
		}
		
		let data = {
				"empDeptCd" : deptComCd
		};
		
		$.ajax({
			url:"/comcode/detailCodeListAjax",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			type:"post",
			async: false,
			dataType:"json",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success:function(result){
				temp.html("");
	            $.each(result, function (idx) {
	                console.log(result[idx].comDetCode);
	                // 직책 선택지 출력
	                let temp_html = '';
	                temp_html +='<option value='+result[idx].comDetCode+'>'+result[idx].comDetCodeNm+'</option>';
	            	temp.append(temp_html);
	            });
			},
			error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
			}
		});
		
	});
	
	// 비밀번호 확인
    let pw = $("#empPw");
	let pwCf = $("#pwConfirm");
    
	// 확인란 입력되면 비밀번호와 일치하는지 검사
	pwCf.on("change", function(){
		if(pw.val() != pwCf.val()) {
	        Swal.fire({
		    	title: '비밀번호가 일치하지 않습니다.',
		    	text: '문제가 계속된다면 관리자에게 문의하세요',
		    	icon: 'error',
		    	confirmButtonColor: '#0ABAB5',
		    	confirmButtonText: '확인',
			})
	        
			// 비밀번호가 일치하지 않으면 내용을 비워줌
			$("#empPw").val("");
			$("#pwConfirm").val("");
			
	        return false;
	    } 
	})
	
	// 입력값 검사
	
	
	// 발표용 자동완성
	$(".auto-complete-btn").on("click", function(){
		$("#empName").val("최승현");
		$("#empPw").val("11");
		$("#pwConfirm").val("11");
		//$("#empZip").val("");
		//$("#empAdd1").val("");
		//$("#empAdd2").val("");
		$("#empPh").val("010-8584-1262");
		$("#empMail").val("chsh711@naver.com");
		$("#empReg").val("910211-2201703");
	});
	
	
});
</script>