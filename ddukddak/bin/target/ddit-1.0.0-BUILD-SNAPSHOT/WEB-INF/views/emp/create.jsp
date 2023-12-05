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

<div class="d-flex">
	<div class="login-left">
		<img class="login-img" src="/resources/images/login-img.png">
	</div>
	<div class="dduk-login-form" style="width: 824px; margin-left: 72px; padding: 80px;">
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
						<li class="list-group-item"><b>사원번호</b> 
							<input id="empNo" name="empNo" class="dduk-login-input" type="text" />
						</li>
						<li class="list-group-item"><b>전화번호</b> 
							<input id="empPh" name="empPh" class="dduk-login-input" type="text"/>
						</li>
						<li class="list-group-item"><b>성명</b>
							<input id="empName" name="empName" class="dduk-login-input" type="text"/>
						</li>
						<li class="list-group-item"><b>비밀번호</b>
							<input id="empPw" name="empPw" class="dduk-login-input" type="password"/>
						</li>
						<li class="list-group-item"><b>계정상태</b> 
							<input id="empAcntState" name="empAcntState" class="dduk-login-input" type="text"/>
						</li>
						<li class="list-group-item"><b>입사일</b> 
							<input id="empIn" name="empIn" class="dduk-login-input" type="date" style="width: 100px;" />
						</li>
						<li class="list-group-item"><b>퇴사일</b>
							<input id="empOut" name="empOut" class="dduk-login-input" type="date" style="width: 100px;" />
						</li>
						<li class="list-group-item"><b>이메일</b>
							<input id="empMail" name="empMail" class="dduk-login-input" type="text" style="width: 100px;" />
						</li>
						<li class="list-group-item"><b>주민번호</b>
							<input id="empReg" name="empReg" class="dduk-login-input" type="text" style="width: 100px;" />
						</li>
						<li class="list-group-item"><b>우편번호</b>
							<input type="number" id="empZip" name="empZip" class="dduk-login-input" style="text-align:right"  />
								<button type="button" id="btnPost" style="width: 80px;" >검색</button>
						</li>
						<li class="list-group-item"><b>주소</b>
							<input id="empAdd1" name="empAdd1" class="dduk-login-input" type="text" style="text-align:right" />
						</li>
						<li class="list-group-item"><b>상세주소</b>
							<input id="empAdd2" name="empAdd2" class="dduk-login-input" type="text" style="width: 100px; text-align:right" />
						</a></li>
						<li class="list-group-item"><b>직무</b> <a
							class="float-right"> <select name="empDeptcd"
								id="empDeptcd" class="form-control form-control-sm">
									<option value="">직무 선택</option>
									<option value="JBCD1">의사</option>
									<option value="JBCD2">간호사</option>
							</select>
						</a></li>
						<li class="list-group-item"><b>직책</b> <a
							class="float-right">
							<div class="form-group">
								<label for="empJbpscd1">부장</label>
								<input type="radio" id="empJbpscd1" name="empJbpscd" value="부장" />
								<label for="empJbpscd2">사원</label>
								<input type="radio" id="empJbpscd2" name="empJbpscd" value="사원" />
							</div>
						</a></li>
					<button type="submit" class="btn btn-primary btn-block">
						<b>사원 등록</b>
					</button>
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