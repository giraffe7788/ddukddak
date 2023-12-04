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
	height: 48px;
	flex-shrink: 0;
}

.dduk-login-d{
	gap: 24px;
}

.dduk-row {
	display: flex;
    gap: 24px;
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
				<div class="card-body box-profile">
					<div class="text-center">
						<img class="profile-user-img img-fluid img-circle"
							src="/resources/images/bpfl.jpg"
							alt="User profile picture" id="atchFileCd">
						<div class="custom-file">
							<input type="file" class="custom-file-input" name="uploadFile"
								id="uploadFile" /> <label class="custom-file-label"
								for="uploadFile">프로필</label>
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
								<input id="empPw" name="empPw" class="dduk-login-input" type="text"/>
							</div>
							<div class="dduk-login-d">
								<div class="login-input-label">비밀번호 확인</div>
								<input id="empPw" name="empPw" class="dduk-login-input" type="text"/>
							</div>
						</div>
						
						<div style="margin: 12px 0px;">
							<div class="dduk-row">
							<div class="dduk-login-d"  style="margin-bottom: 0px;">
								<div class="login-input-label">주소</div>
								<input type="text" id="empZip" name="empZip" class="dduk-login-input" />
								<button type="button" class="dduk-btn-nomal" id="btnPost" style="margin-left: 8px; padding: 9px 16px; border-radius: 12px;" >우편번호 찾기</button>
								
							</div>
						</div>
						<div class="dduk-row" style="gap: 8px;">
							<div class="dduk-login-d">
								<input id="empAdd1" name="empAdd1" class="dduk-login-input" type="text" style="width:328px;"/>
							</div>
							<div class="dduk-login-d">
								<input id="empAdd2" name="empAdd2" class="dduk-login-input" type="text" style="width:328px;" placeholder="상세주소"/>
							</div>
						</div>
						</div>
						
						
						<div class="dduk-row">
							<div class="dduk-login-d">
								<div class="login-input-label">전화번호</div> 
								<input id="empPh" name="empPh" class="dduk-login-input" type="text"/>
							</div>
							<div class="dduk-login-d">
								<div class="login-input-label">이메일</div> 
								<input id="empMail" name="empMail" class="dduk-login-input" type="text"/>
							</div>
						</div>
						<div class="dduk-login-d">
							<div class="login-input-label">주민번호</div> 
							<input id="empReg" name="empReg" class="form-control form-control-sm" type="text" style="width: 100px;" />
							
						</div>
						
						
						<div class="dduk-row">
							<div class="dduk-login-d">
								<div class="login-input-label">직무</div>
								<select name="empDeptcd" id="empDeptcd" class="form-control form-control-sm">
										<option value="">직무 선택</option>
										<option value="JBCD1">의사</option>
										<option value="JBCD2">간호사</option>
								</select>
							</div>
							<div class="dduk-login-d">
								<div class="login-input-label">직책</div>
								<div class="form-group">
									<label for="empJbpscd1">부장</label>
									<input type="radio" id="empJbpscd1" name="empJbpscd" value="부장" />
									<label for="empJbpscd2">사원</label>
									<input type="radio" id="empJbpscd2" name="empJbpscd" value="사원" />
								</div>
							</div>
						</div>
					<button type="submit" class="btn btn-primary btn-block">
						<div class="login-input-label">사원 등록</div>
					</button>
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
    $('#empDeptcd').change(function(){
        var selectedValue = $(this).val();
        console.log(selectedValue);
        var labelElement = $('label[for="empJbpscd1"]');
        var radioElement = $('#empJbpscd1');
        var labelElement2 = $('label[for="empJbpscd2"]');
        var radioElement2 = $('#empJbpscd2');

        // 예시: JBCD1이면 의사, JBCD2이면 간호사로 변경
        if (selectedValue === 'JBCD1') {
            labelElement.text('일반의');
            radioElement.val('일반의');
            labelElement2.text('전문의');
            labelElement2.val('전문의');
        } else if (selectedValue === 'JBCD2') {
        	labelElement.text('일반간호사');
            radioElement.val('일반간호사');
            labelElement2.text('수간호사');
            labelElement2.val('수간호사');
        }
    });
    
// 	$('#empDeptcd').on("change", function(){
// 		let empDeptcd = $(this).val();
// 		console.log(empDeptcd);
		
// 		$.ajax({
// 			url : "",
// 			contentType : "text/html; charset=UTF-8",
// 			data : empDeptcd,
// 			type : "post",
// 			dataType:"json",
// 			success : function(result){
// 				console.log(result); // 일반간호사,수간호사,간호과장,간호부장
// 			}
// 		})
// 	})
	
});
</script>