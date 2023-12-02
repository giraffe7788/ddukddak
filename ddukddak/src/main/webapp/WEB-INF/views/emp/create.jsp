<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<!--  
		요청URI : /instrs/createPost
		요청파라미터 : {name속성=값...}
		요청방식 : post
	-->
<script type="text/javascript">
	// 전역변수 function 밖으로
	// 경력사항 카운터
	let cntCrerQlfc = 0;
	// 보유자격 카운터
	let cntCotnLic = 0;
	
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
					$("#fileCd").attr("src", e.target.result)
				}
				reader.readAsDataURL(f);
			});
		}
		// 이미지 미리보기 끝 
	});
</script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<form name="frm"
	action="/emp/createEmp?${_csrf.parameterName}=${_csrf.token}"
	method="post" enctype="multipart/form-data">
	<div class="row">
		<div class="col-md-3">

			<div class="card card-primary card-outline">
				<div class="card-body box-profile">
					<div class="text-center">
						<img class="profile-user-img img-fluid img-circle"
							src="/resources/images/bpfl.jpg"
							alt="User profile picture" id="fileCd">
						<div class="custom-file">
							<input type="file" class="custom-file-input" name="uploadFile"
								id="uploadFile" /> <label class="custom-file-label"
								for="uploadFile">프로필</label>
						</div>
					</div>
					<h3 class="profile-username text-center">
					</h3>
					<p class="text-muted text-center">
					
					</p>
					<ul class="list-group list-group-unbordered mb-3">
						<li class="list-group-item"><b>사원번호</b> <a
							class="float-right"> <input id="empNo" name="empNo"
								class="form-control form-control-sm" type="text" style="width: 100px;" />
						</a></li>
						<li class="list-group-item"><b>전화번호</b> <a
							class="float-right"> <input id="empPh" name="empPh"
								class="form-control form-control-sm" type="text" style="width: 100px;" />
						</a></li>
						<li class="list-group-item"><b>성명</b> <a
							class="float-right"> <input id="empName"
								name="empName" class="form-control form-control-sm"
								type="text" style="width: 60px;" />
						</a></li>
						<li class="list-group-item"><b>비밀번호</b> <a
							class="float-right"> <input id="empPw" name="empPw"
								class="form-control form-control-sm" type="text" style="width: 100px;" />
						</a></li>
						<li class="list-group-item"><b>계정상태</b> <a
							class="float-right"> <input id="empAcntState" name="empAcntState"
								class="form-control form-control-sm" type="text" style="width: 100px;" />
						</a></li>
						<li class="list-group-item"><b>입사일</b> <a
							class="float-right"> <input id="empIn" name="empIn"
								class="form-control form-control-sm" type="date" style="width: 100px;" />
						</a></li>
						<li class="list-group-item"><b>퇴사일</b> <a
							class="float-right"> <input id="empOut" name="empOut"
								class="form-control form-control-sm" type="date" style="width: 100px;" />
						</a></li>
						<li class="list-group-item"><b>이메일</b> <a
							class="float-right"> <input id="empMail" name="empMail"
								class="form-control form-control-sm" type="text" style="width: 100px;" />
						</a></li>
						<li class="list-group-item"><b>주민번호</b> <a
							class="float-right"> <input id="empReg" name="empReg"
								class="form-control form-control-sm" type="text" style="width: 100px;" />
						</a></li>
						<li class="list-group-item"><b>우편번호</b> <a
							class="float-right"> <input type="text" id="empZip" name="empZip"
								class="form-control form-control-sm" style="width: 80px; text-align:right"  />
								<button type="button" id="btnPost" style="width: 80px;" >검색</button>
						</a></li>
						<li class="list-group-item"><b>주소</b> <a
							class="float-right"> <input id="empAdd1" name="empAdd1"
								class="form-control form-control-sm" type="text" style="width: 180px; text-align:right" />
						</a></li>
						<li class="list-group-item"><b>상세주소</b> <a
							class="float-right"> <input id="empAdd2" name="empAdd2"
								class="form-control form-control-sm" type="text" style="width: 100px; text-align:right" />
						</a></li>
						<li class="list-group-item"><b>직무</b> <a
							class="float-right"> <select name="empDeptcd"
								id="empDeptcd" class="form-control form-control-sm">
									<option value="DTCD01">의사</option>
									<option value="DTCD02">간호사</option>
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
					</ul>
					<button type="submit" class="btn btn-primary btn-block">
						<b>강사 등록</b>
					</button>
				</div>
s			</div>
		</div>

	</div>
	<sec:csrfInput />
</form>
<script type="text/javascript">
$(function(){
	console.log("ㅎㅇ");
	
	// 다음 우편 번호 검색
	$("#btnPost").on("click", function(){
		console.log("우편번호 검색!");
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

        // 예시: DTCD01이면 의사, DTCD02이면 간호사로 변경
        if (selectedValue === 'DTCD01') {
            labelElement.text('일반의');
            radioElement.val('일반의');
            labelElement2.text('전문의');
            labelElement2.val('전문의');
        } else if (selectedValue === 'DTCD02') {
        	labelElement.text('일반간호사');
            radioElement.val('일반간호사');
            labelElement2.text('수간호사');
            labelElement2.val('수간호사');
        }
    });
});
</script>