<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style>
.dduk-login-input {
	width: 320px;
	height: 40px;
	flex-shrink: 0;
}

.dduk-login-d{
	gap: 16px;
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
	margin-left: 20px;
	margin-top: 80px;
}

.search-btn {
	margin-left:8px; 
	padding: 4px 14px; 
	border-radius: 12px; 
	height: 38px;
}

.btn-group {
	width: 100%;
	gap: 8px;
}

.btn-outline{
	border: 1px soild var(--black-01, #333);
}

input[type=file]::file-selector-button {
  display: flex;
	padding: 5px 10px;
	align-items: center;
	gap: 10px;
	border-radius: 8px;
	border: 1px solid var(--ci-01, #0ABAB5);
	background: var(--ci-01, #0ABAB5);
	color: var(--white, #FFF);
	font-family: 'Pretendard5';
	font-style: normal;
	line-height: 160%; /* 22.4px */
	border: 0px;
	justify-content: center !important;
}

 input[type=file]::file-selector-button:hover {
    background: #0ABAB5;
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
	width: 300px;
	height: 300px;
	border-radius: 64px;
	margin: 16px;
	position: relative;
}

#camIcon {
	position: absolute;
	margin-left:-175px;
	width : 300px;
	height : 300px;
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
.per-info {
	display:inline-block;
	width: 300px;
	height: 50px;
	text-align: center;
}
</style>
<div class="dduk-body-border" style="width:120vh; height: 100%; ">
	<form name="frm" class="d-flex"
			action="/emp/update?${_csrf.parameterName}=${_csrf.token}"
			method="post" enctype="multipart/form-data">
				<div class="d-flex mar-b-16" style=" justify-content:space-between; gap: 24px;">
<!-- 					<div> -->
<!-- 						<svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"> -->
<!-- 							<g clip-path="url(#clip0_82_1936)"> -->
<!-- 							<path d="M19 11H7.82998L12.71 6.11997C13.1 5.72997 13.1 5.08997 12.71 4.69997C12.32 4.30997 11.69 4.30997 11.3 4.69997L4.70998 11.29C4.31998 11.68 4.31998 12.31 4.70998 12.7L11.3 19.29C11.69 19.68 12.32 19.68 12.71 19.29C13.1 18.9 13.1 18.27 12.71 17.88L7.82998 13H19C19.55 13 20 12.55 20 12C20 11.45 19.55 11 19 11Z" fill="#333333"/> -->
<!-- 							</g> -->
<!-- 							<defs> -->
<%-- 							<clipPath id="clip0_82_1936"> --%>
<!-- 							<rect width="24" height="24" fill="white"/> -->
<%-- 							</clipPath> --%>
<!-- 							</defs> -->
<!-- 						</svg> -->
<!-- 					</div> -->
				</div>
				<div style="margin-left: 100px; float:left;">
					<div class="dduk-row">
						<div style="width: 48%;">
							<div class="d-flex" style="align-items: center;">
								<img class="img-circle"
									src="/resources/upload/${employeeVO.atchFileVO.atchFileDetailVOList[0].atchFileDetailSavenm}"
									alt="User profile picture" id="atchFileCd">
								<div class="custom-file">
									<label for="uploadFile">
										<svg id="camIcon" xmlns="http://www.w3.org/2000/svg"><path d="M0 6c0-1.1.9-2 2-2h3l2-2h6l2 2h3a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V6zm10 10a5 5 0 1 0 0-10 5 5 0 0 0 0 10zm0-2a3 3 0 1 1 0-6 3 3 0 0 1 0 6z" fill="#8d9ea5" class="fill-000000"></path></svg>
									</label>
									<input type="file" class="dduk-login-input" name="uploadFile" id="uploadFile" /> 
								</div>
							</div>
						</div>
					</div>
					<div class="per-info">
							<div class="dduk-login-d">
								<div class="login-input-label">${employeeVO.empName}</div>
							</div>
							<div class="dduk-login-d">
								<div class="login-input-label">${employeeVO.empNo}</div> 
							</div>
							<div class="dduk-row" style="margin-left: 30%;">
								<div class="dduk-login-d">
									<p id="empDeptCd" name="empDeptCd" class="" type="text"  >
									${employeeVO.empDeptCd}</p>
								</div>
								/
								<div class="dduk-login-d">
									<p id="empJbpsCd" name="empJbpsCd" class="" type="text">
									${employeeVO.empJbpsCd}</p>
								</div>
							</div>
					</div>
					<button type="submit" class="join-btn">
							저장
					</button>
				</div>

				<div class="dduk-row" style=" margin-left: 100px; float:left;">
					<div class="login-form-content">
						<div class="dduk-login-d">
							<div class="login-input-label">비밀번호</div>
							<input id="empPw" name="empPw" class="dduk-login-input" type="password"
							value="********" />
						</div>
						<div class="dduk-login-d">
							<div class="login-input-label">비밀번호 확인</div>
							<input id="empPwCheck" name="empPwCheck" class="dduk-login-input" type="password" placeholder="비밀번호 확인"/>
						</div>
								
						<div class="dduk-login" style="margin: 12px 0px;">
							<div class="dduk-login-d" style="margin-bottom: 0px;">
								<div class="login-input-label">주소</div>
								<div class="d-flex" style="align-items: baseline">
									<input type="text" id="empZip" name="empZip" class="dduk-login-input" style="width: 203px;"
								value="${employeeVO.empZip}"  />
									<button type="button" class="dduk-btn-nomal search-btn" id="btnPost" >우편번호 찾기</button>
								</div>
									
							</div>
							<div class="dduk-login-d" style="margin-bottom: 0px;">
								<input id="empAdd1" name="empAdd1" value="${employeeVO.empAdd1}" class="dduk-login-input" type="text" />
							</div>
							<div class="dduk-login-d">
								<input id="empAdd2" name="empAdd2" value="${employeeVO.empAdd2}" class="dduk-login-input" type="text" />
							</div>
						</div>
						
						<div class="dduk-login-d">
							<div class="login-input-label">연락처</div> 
							<input id="empPh" name="empPh" class="dduk-login-input" type="text"
							value="${employeeVO.empPh}" />
						</div>
						<div class="dduk-login-d">
							<div class="login-input-label">이메일</div> 
							<input id="empMail" name="empMail" class="dduk-login-input" type="text"
							value="${employeeVO.empMail}" />
						</div>
						
						<div class="dduk-login-d">
							<div class="login-input-label">주민번호</div> 
							<input id="empReg" name="empReg" class="dduk-login-input" type="text"
								value="${employeeVO.empReg}" />
						</div>
								
						
					</div>
				</div>
			
			<sec:csrfInput />
		</form>
</div>
<script type="text/javascript">
$(function(){
	console.log();
	
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
        var selectedValue = $(this).val();
        console.log(selectedValue);
        var labelElement = $('label[for="empJbpsCd1"]');
        var radioElement = $('#empJbpsCd1');
        var labelElement2 = $('label[for="empJbpsCd2"]');
        var radioElement2 = $('#empJbpsCd2');

        // 예시: JBCD1이면 의사, JBCD2이면 간호사로 변경
        if ($('#empDeptCd').val() == 'JBCD1') {
        	labelElement.text('일반의');
            radioElement.val('JBCD10');
            labelElement2.text('전문의');
            labelElement2.val('JBCD13');
        } else if ($('#empDeptCd').val() == 'JBCD2') {
        	labelElement.text('일반간호사');
            radioElement.val('JBCD20');
            labelElement2.text('수간호사');
            labelElement2.val('JBCD21');
        }
});

</script>