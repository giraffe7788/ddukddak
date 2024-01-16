<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
$(function() {
		// 모달 - 이미지 미리보기 시작
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
		                $("#atchFileCd").attr("src", e.target.result);
		                $("#atchFileCdE").attr("src", e.target.result);
		                e.target.result = '';
		            }
		            reader.readAsDataURL(f);
		        }
		    });
		}
		// 모달 - 이미지 미리보기 끝 
		
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

.dduk-login-d {
	gap: 16px;
}

.dduk-row {
	display: flex;
	gap: 24px;
}

.join-btn {
	display: flex;
	width: 100px;
	padding: 8px 16px;
	justify-content: center;
	align-items: center;
	gap: 4px;
	border-radius: 12px;
	background: var(- -black-02, #64767C);
}

.join-btn:hover {
	background: var(- -black-01, #323537);
}

.edit-btn {
	display: flex;
	padding: 7px 16px;
	justify-content: center;
	align-items: center;
	gap: 10px;
	border-radius: 12px;
	background: var(- -black-02, #64767C);
}

.toMain {
	width: 100%;
	background: var(- -ci-01, #0ABAB5);
}

#spn2 {
	margin: 30px 50px;
}

.search-btn {
	margin-left: 8px;
	padding: 4px 14px;
	border-radius: 12px;
	height: 38px;
}

.btn-group {
	width: 100%;
	gap: 8px;
}

.btn-outline {
	border: 1px soild var(- -black-01, #333);
}

input[type=file]::file-selector-button {
	display: flex;
	padding: 5px 10px;
	align-items: center;
	gap: 10px;
	border-radius: 8px;
	border: 1px solid var(- -ci-01, #0ABAB5);
	background: var(- -ci-01, #0ABAB5);
	color: var(- -white, #FFF);
	font-family: 'Pretendard5';
	font-style: normal;
	line-height: 160%; /* 22.4px */
	border: 0px;
	justify-content: center !important;
}

input[type=file]::file-selector-button:hover {
	background: #0ABAB5;
}

.form-check {
	display: flex;
	gap: 40px;
	padding: 8px 16px;
	margin-top: 8px;
	margin-left: 16px;
}

.per-body-border {
	width: 800px;
	height: 840px;
	flex-shrink: 0;
	background: var(--white, #FFF);
}

.img-circle {
	width: 160px;
	height: 160px;
	border-radius: 100px;
	background: url(<path-to-image>), lightgray 0px -2.743px / 100% 125.326% no-repeat;
	margin: 16px;
	object-fit: cover;
}

#camIcon {
	position: absolute;
	margin-left: -175px;
	width: 30px;
	height: 30px;
}

.form-check-input:checked {
	background-color: var(- -ci-01, #0ABAB5);
	border-color: var(- -ci-01, #0ABAB5);
}

h1 {
	margin-top: 20px;
}

.button-margin {
	margin-left: 8px;
}

.pflPic {
	margin-top : 30px;
	margin-left: 80px;
	margin-right : 48px; 
	float: left;
}

.per {
	display: inline-flex;
	margin-top : 30px;
	flex-direction: column;
	align-items: flex-start;
	gap: 24px;
}

.part-info {
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	gap: 16px;
}

.part-info-det {
	display: flex;
	width: 120px;
	flex-direction: column;
	align-items: flex-start;
}


.info-cont {
	color: var(--black-01, #323537);
	/* Title/Large */
	font-style: normal;
	font-weight: 600;
	line-height: 40px; /* 166.667% */
}

.info-title {
	color: var(--black-02, #64767C);
	font-size: 16px;
	font-style: normal;
	font-weight: 500;
	line-height: 160%; /* 25.6px */
}

.per-info1 {
	display: inline-flex;
	margin-left : 24px;
	flex-direction: column;
	align-items: flex-start;
	gap: 24px;
}

.per-info2 {
	display: inline-flex;
	height: 484px;
	padding: 24px;
	flex-direction: column;
	justify-content: space-between;
	align-items: flex-start;
	flex-shrink: 0;
	border-radius: 24px;
	background: var(--bg-01, #F8F9FC);
}

.per-info-det {
	display: flex;
	width: 296px;
	flex-direction: column;
	align-items: flex-start;
	gap: 4px;
}
</style>

<div class="dduk-body-border per-body-border" >
	<div class="pflPic">
		<div class="dduk-row">
			<div>
				<div class="img-flex" style="align-items: center;">
					<img class="img-circle"
						src="/resources/upload/empProfile/${employeeVO.atchFileVO.atchFileDetailVOList[0].atchFileDetailSavenm}"
						alt="User profile picture" id="atchFileCdE">
				</div>
			</div>
		</div>
	</div>
	<div class="per">
		<div class="per-info1">
			<div class="login-input-label info-cont" style="font-size: 24px;">${employeeVO.empName}</div>
		
			<div class="part-info">
				<div class="part-info-det" style="width: 160px;">
					<div>사번</div>
					<div class="login-input-label info-cont">${employeeVO.empNo}</div>
				</div>
				<div style="display: inline-flex;">
					<div class="part-info-det">
						<div class="login-form-content info-title" > 소속</div>
						<div id="empDeptCd" class="info-cont" name="empDeptCd" type="text" style="display: inline-block;"></div>
					</div>
					<div class="part-info-det">
						<div class="login-form-content info-title" > 직책</div>
						<div id="empJbpsCd" class="info-cont" name="empJbpsCd" type="text" style="display: inline-block;"></div>
					</div>
				</div>
			</div>
		</div>
		<div class="per-info2">
			<div class="per-info-det">
				<div class="login-form-content info-title" > 주민번호</div>
				<div class="login-input-label info-cont">${employeeVO.empReg}</div>
			</div>
			<div class="per-info-det">
				<div class="login-form-content info-title" >주소</div>
				<div class="login-input-label info-cont">${employeeVO.empZip}</div>
				<div class="login-input-label info-cont">${employeeVO.empAdd1} ${employeeVO.empAdd2}</div>
			</div>
			<div class="per-info-det">
				<div class="login-form-content info-title" > 연락처</div>
				<div class="login-input-label info-cont">${employeeVO.empPh}</div>
			</div>
			<div class="per-info-det">
				<div class="login-form-content info-title" > 이메일</div>
				<div class="login-input-label info-cont">${employeeVO.empMail}</div>
			</div>
			<!-- '정보 수정'버튼 ===> 회원 정보 수정 모달 -->
			<div class="dduk-row" style="justify-content: flex-end;">
				<button type="button" data-bs-toggle="modal"
					data-bs-target="#detailEmpModal" id="edit" class="edit-btn">정보
					수정</button>
			</div>
		</div>
	</div>

</div>
<sec:csrfInput />
<!-- 모달    -->
<c:import url="../common/modal.jsp"></c:import>
<script type="text/javascript">
$(function(){
	
	// 직무 코드 확인해서 이름으로 출력
	const empDeptCd = "${employeeVO.empDeptCd}";
	console.log("????");
	let deptTemp = $("#empDeptCd");
	
	if(empDeptCd == 'DTCD01'){
		var temp_html ='<div>의사</div>';
		deptTemp.append(temp_html);
	} else if (empDeptCd == 'DTCD02'){
		var temp_html ='<div>간호사</div>';
		deptTemp.append(temp_html);
	} else if (empDeptCd == 'DTCD03'){
		var temp_html ='<div>치료사</div>';
		deptTemp.append(temp_html);
	} else if (empDeptCd == 'DTCD04'){
		var temp_html ='<div>원무과</div>';
		deptTemp.append(temp_html);
	} else {
		var temp_html ='<div>인사과</div>';
		deptTemp.append(temp_html);
	}
	
	// 직책 코드 확인해서 이름으로 가져오기
    const empJbpsCd = "${employeeVO.empJbpsCd}";
    console.log("empJbpsCd : ",empJbpsCd);
    let temp = $("#empJbpsCd");
    
    let data = {
    		"empJbpsCd" : empJbpsCd
    };
    
    $.ajax({
    	url:"/comcode/detailCodeAjax",
    	contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data),
		type:"post",
		dataType:"json",
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
		success:function(result){
			console.log("result",result[0]);
			
			let temp_html = '';
            temp_html +='<div>'+result[0].comDetCodeNm+'</div>';
            temp.append(temp_html);
		}
    });
	
    // 여기부터 모달 
	// 다음 우편 번호 검색 후 클릭하면 주소칸에 자동입력
	$("#empPostBtn").on("click", function(){
		new daum.Postcode({
		//다음 창에서 검색이 완료되면 콜백함수에 의해 결과 데이터가 data 객체로 들어옴
			oncomplete:function(data){
				$("#empZip").val(data.zonecode);
				$("#empAdd1").val(data.address);
				$("#empAdd2").val(data.buildingName);
			}
		}).open();
	});
    
	// 비밀번호 변경 버튼 누를 떄
	$(document).on('click', '#btnUpdatePw2', function(){
		$('#empPw').removeAttr('readonly');
		$('#empPw').css('background-color', '#F8F9FC');
		$('#pwConfirm').removeAttr('readonly');
		$('#pwConfirm').css('background-color', '#F8F9FC');
	})
    
	// 비밀번호 확인
    let pw = $("#empPw");
	let pwCf = $("#empPwChk");
    
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
			pw.val("");
	        pwCf.val("");
			
	        return false;
	    } 
	})
	
})

</script>