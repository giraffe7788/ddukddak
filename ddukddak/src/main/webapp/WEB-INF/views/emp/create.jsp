<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(function() {
		// 이미지 미리보기 시작
		$("#uploadFile").on("change", fileSelected);
		
		function fileSelected(e) { 
			let files = e.target.files;
			// 이미지 오브젝트 배열
			let fileArr = Array.prototype.slice.call(files);
			fileArr.forEach(function(f){
				if(!f.type.match("image.*")){
					alert("이미지만 가능합니다.");
					return;
				}
				
				let reader = new FileReader();
				reader.onload = function(e){
					console.log(e.target.result);
					$("#atchFileCd").attr("src", e.target.result)
				}
				reader.readAsDataURL(f);
			});
		}
		// 이미지 미리보기 끝 
	});
</script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<style>
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
	width: 100px;
	height: 100px;
	border-radius: 64px;
	margin: 16px;
	overflow: hidden;
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
<<<<<<< HEAD
					</div>
=======
					</div>
>>>>>>> branch 'DDDDDDDayoung' of https://github.com/giraffe7788/ddukddak.git
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
									<input type="file" class="dduk-login-input" name="uploadFile" id="uploadFile" /> 
<<<<<<< HEAD
								</div>
=======
								</div>
>>>>>>> branch 'DDDDDDDayoung' of https://github.com/giraffe7788/ddukddak.git
							</div>
						</div>
				</div>
						<div class="dduk-row">
							<div class="dduk-login-d">
								<div class="login-input-label">사번</div> 
								<input id="empNo" name="empNo" class="dduk-login-input" type="text" />
							</div>
							<div class="dduk-login-d">
								<div class="login-input-label">성명</div>
								<input id="empName" name="empName" class="dduk-login-input" type="text"/>
							</div>
						</div>
						<div class="dduk-row">
							<div class="dduk-login-d">
								<div class="login-input-label">비밀번호</div>
								<input id="empPw" name="empPw" class="dduk-login-input" type="password"/>
							</div>
							<div class="dduk-login-d">
								<div class="login-input-label">비밀번호 확인</div>
								<input id="empPw" name="empPw" class="dduk-login-input" type="password"/>
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
										<option value="JBCD1">의사</option>
										<option value="JBCD2">간호사</option>
								</select>
							</div>
							<div class="dduk-login-d">
								<div class="login-input-label">직책</div>
								<div class="form-check" role="group">
									<span>
										<input type="radio" id="empJbpsCd1" name="empJbpsCd" class="form-check-input" value="부장" />
										<label for="empJbpsCd1">부장</label>
									</span>
									<span>
										<input type="radio" id="empJbpsCd2" name="empJbpsCd" class="form-check-input" value="사원" />
										<label for="empJbpsCd2">사원</label>
									</span>
								</div>
							</div>
						</div>
							<button type="submit" class="join-btn mar-b-8">
								회원가입 신청
							</button>
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
<script type="text/javascript">
$(function(){
	console.log("ㅎㅇ");
	
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
})

// 직무 따라서 직책 선택지 바꾸기 -> 테스트용임 수정필
$(function(){
    $('#empDeptCd').change(function(){
        var selectedValue = $(this).val();
        console.log(selectedValue);
        var labelElement = $('label[for="empJbpsCd1"]');
        var radioElement = $('#empJbpsCd1');
        var labelElement2 = $('label[for="empJbpsCd2"]');
        var radioElement2 = $('#empJbpsCd2');

        // 예시: JBCD1이면 의사, JBCD2이면 간호사로 변경
        if (selectedValue === 'JBCD1') {
            labelElement.text('일반의');
            radioElement.val('JBCD10');
            labelElement2.text('전문의');
            labelElement2.val('JBCD13');
        } else if (selectedValue === 'JBCD2') {
        	labelElement.text('일반간호사');
            radioElement.val('JBCD20');
            labelElement2.text('수간호사');
            labelElement2.val('JBCD21');
        }
    });
    
// 	$('#empDeptCd').on("change", function(){
// 		let empDeptCd = $(this).val();
// 		console.log(empDeptCd);
		
// 		$.ajax({
// 			url : "",
// 			contentType : "text/html; charset=UTF-8",
// 			data : empDeptCd,
// 			type : "post",
// 			dataType:"json",
// 			success : function(result){
// 				console.log(result); // 일반간호사,수간호사,간호과장,간호부장
// 			}
// 		})
// 	})
	
});
</script>