<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js" integrity="sha512-BNaRQnYJYiPSqHHDb58B0yaPfCu+Wgds8Gp/gU33kqBtgNS4tSPHuGibyoeqMV/TJlSKda6FXzoEyYGjTe+vXA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<style>
tr {
	padding: 4px !important;
}

.aside-ams-patient, .aside-trea-paitent, .aside-nur-patient, .aside-doc-patient{
	width: 196px;
	border-radius: 16px 0px 0px 16px;
	background: var(--bg-02, #DBF2F4);
	height: 56px;
	border-right: 4px solid var(--ci-01, #0ABAB5);
	margin-left: 4px;
	color: var(--ci-01, #0ABAB5);
}

.patient-detail {
	width: 892px;
	height: 100%;
	flex-shrink: 0;
}	
.patient-note {
	width: 360px;
}

.search{
	width: 292px;
	height: 48px;
}

.record-input{
	margin-bottom: -4px;
	width: 312px;
	height: 48px;
}

.dduk-vertical-line {
	height: 642px;
	margin-top: -18px;
	margin-left: 272px;
}

hr{
	margin: -8px 0 16px -16px;
	background: var(--border, #EBEFF0);
	height: 1px;
}

.record-content-fr {
	height: 343px;
}

.dduk-login-input {
	width: 288px;
	height: 40px;
	flex-shrink: 0;
}

.modal-content{
	width: 680px;
}

.modal-body {
	padding: 48px; 
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

.form-check {
	display: flex;
    gap: 40px;
    padding: 8px 16px;
    margin-top: 8px;
    margin-left: 16px;
}

.dduk-row {
	gap: 16px;
}

.selected {
    background-color: #EDF8F9 !important;
}

#injuryTbody {
	font-size: 12px;
}

#createPatientRecordBtn {
	background-color:transparent;
	position: absolute;
	top: 904px;
    left: 1780px;
}

#patientRecordBoard {
	height: 700px;
    overflow-y: scroll;
}

#searchPatientBtn {
	background-color: transparent;
    position: absolute;
    top: 906px;
    left: 510px;
}

.autocomplete {
	position: absolute;
}

.autocomplete > div.active {
  background: #e0e5f6;
  color: #000;
}

.autocomplete > div {
  background: #f1f3f499;
  padding: .2rem .6rem;
}

.order-scroll {
	height: 240px;
	overflow-y: scroll;
	padding: 16px;
}

.order-detail {
	display: flex;
	padding: 12px 16px;
	flex-direction: column;
	justify-content: center;
	align-items: flex-start;
	gap: 4px;
	border-radius: 12px;
	background: var(--bg-01, #F8F9FC);
	width: 497px;
	height: auto;
	margin-bottom: 16px;
}

.testCd {
	min-width: 140px;
	padding: 4px;
	color: var(--black-01, #323537);
	font-family: 'Pretendard5';
	font-size: 14px;
	line-height: 160%; 
}

.teodRst {
	padding: 4px;
	color: var(--black-01, #323537);
	font-family: 'Pretendard5';
	font-size: 14px;
	line-height: 160%; 
}

.testPrice {
	padding: 4px;
	color: var(--black-01, #323537);
	font-family: 'Pretendard5';
	font-size: 14px;
	line-height: 160%; 
}

.mediCd {
	min-width: 80px;
	padding: 4px;
	color: var(--black-01, #323537);
	font-family: 'Pretendard5';
	font-size: 14px;
	line-height: 160%; 	
}

.mediNm {
	min-width: 120px;
	padding: 4px;
	color: var(--black-01, #323537);
	font-family: 'Pretendard5';
	font-size: 14px;
	line-height: 160%; 
}

.mediMaker {
	min-width: 90px;
	padding: 4px;
	color: var(--black-01, #323537);
	font-family: 'Pretendard5';
	font-size: 14px;
	line-height: 160%; 
}

.mdodDose {
	min-width: 60px;
	padding: 4px;
	color: var(--black-01, #323537);
	font-family: 'Pretendard5';
	font-size: 14px;
	line-height: 160%; 
}

.mdodPer {
	min-width: 60px;
	padding: 4px;
	color: var(--black-01, #323537);
	font-family: 'Pretendard5';
	font-size: 14px;
	line-height: 160%; 
}

.mdodDay {
	min-width: 60px;
	padding: 4px;
	color: var(--black-01, #323537);
	font-family: 'Pretendard5';
	font-size: 14px;
	line-height: 160%; 
}

.tmCd {
	min-width: 140px;
	padding: 4px;
	color: var(--black-01, #323537);
	font-family: 'Pretendard5';
	font-size: 14px;
	line-height: 160%; 
}

.tmNm {
	min-width: 200px;
	padding: 4px;
	color: var(--black-01, #323537);
	font-family: 'Pretendard5';
	font-size: 14px;
	line-height: 160%; 
}

.insuYn {
	color: var(--black-01, #323537);
	font-family: 'Pretendard5';
	font-size: 14px;
	line-height: 160%; 
}

.modal-dialog {
    max-width: 1000px !important;
    margin: auto;
}

.rounds-opinion-list {
	display: flex;
    overflow-x: hidden;
    overflow-y: hidden;
    white-space: nowrap;
    padding-bottom: 16px;
    height: 60px;
}

.rounds-opinion-list-head {
    display: flex;
    border-radius: 10px;
    border: 1px solid var(--border, #E0E8E6);
    background-color: #ffffff;
    padding: 8px;
    width: 124px;
    height: 60px;
    flex-shrink: 0;
    flex-direction: column;
}

.rounds-opinion-list-head:hover {
	background-color: #F8F9FC;
}

.neon-text {
  	color: #0ABAB5;
  	text-shadow: 0 0 5px #DBF2F4,
}

#patientAdmiOpinion {
	padding: 16px;
}

.record-img-scroll {
	display: flex;
    gap: 8px;
    flex-direction: column;
}
</style>

<!-- sweetalert -->
<script src="/resources/fullcalendar-6.1.10/sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- 다음지도 -->
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
window.jsPDF = window.jspdf.jsPDF;

window.onload=function(){    
	let mySpace = document.getElementById("patientRecordBoard");    
	mySpace.scrollTop = mySpace.scrollHeight;
	};

$(document).ready(function() {
	$('.aside-ams-patient').find('svg').find('path').attr('fill', '#0ABAB5');
	$('.aside-ams-patient').find('.dduk-nav-menu').css('color', '#0ABAB5');
	
	$('.aside-trea-paitent').find('svg').find('path').attr('fill', '#0ABAB5');
	$('.aside-trea-paitent').find('.dduk-nav-menu').css('color', '#0ABAB5');
	
	$('.aside-nur-patient').find('svg').find('path').attr('fill', '#0ABAB5');
	$('.aside-nur-patient').find('.dduk-nav-menu').css('color', '#0ABAB5');
	
	$('.aside-doc-patient').find('svg').find('path').attr('fill', '#0ABAB5');
	$('.aside-doc-patient').find('.dduk-nav-menu').css('color', '#0ABAB5');
	
	var strPaName=( $('.paName').val()).substring(0,8);
	 
	// 다음 우편 번호 검색
	$("#btnPostForPatient").on("click", function(){
		new daum.Postcode({
		//다음 창에서 검색이 완료되면 콜백함수에 의해 결과 데이터가 data 객체로 들어옴
			oncomplete:function(data){
				$("#pzZip").val(data.zonecode);	
				$("#paAdd1").val(data.address);
				$("#paAdd2").val(data.buildingName);
			}
		}).open();
	});
	 
	 //진료 이력 탭 클릭 이벤트
	 $('#inner-tab1').click(function(){
		$('#clinic-chart-record').attr('style', 'display: block');
		$('#rounds-chart-record').attr('style', 'display: none');
		$('#diag-scroll').attr('style', 'display: block' );
		$('#Adm-scroll').attr('style', 'display: none');
		$('#inner-tab1').attr('style', 'border-bottom: 3px solid var(--ci-01, #0ABAB5)' );
		$('#inner-tab2').attr('style', 'border-bottom: 0px solid var(--ci-01, #0ABAB5)' );
	 });
	 
	 //입원 이력 탭 클릭 이벤트
	 $('#inner-tab2').click(function(){
		$('#clinic-chart-record').attr('style', 'display: none');
		$('#rounds-chart-record').attr('style', 'display: block');
		$('#diag-scroll').attr('style', 'display: none' );
		$('#Adm-scroll').attr('style', 'display: block');
		$('#inner-tab1').attr('style', 'border-bottom: 0px solid var(--ci-01, #0ABAB5)' );
		$('#inner-tab2').attr('style', 'border-bottom: 3px solid var(--ci-01, #0ABAB5)' );
	 });
	 
	 
	 var today = new Date();

	 var year = today.getFullYear();
	 var month = ('0' + (today.getMonth() + 1)).slice(-2);
	 var day = ('0' + today.getDate()).slice(-2);
	 var year2 = String(year).substring(2,4);	
	 console.log(year2);
	 
	 
	 var dateString = year + '-' + month  + '-' + day;
	 
	 var hours = ('0' + today.getHours()).slice(-2); 
	 var minutes = ('0' + today.getMinutes()).slice(-2);
	 var seconds = ('0' + today.getSeconds()).slice(-2); 

	 var timeString = hours + ':' + minutes;
	 
	 let empName = $('#empName').data('empname');
	 let empDeptNm = $('#empDeptNm').data('empdeptnm');
	 let empJbpsNm = $('#empJbpsNm').data('empjbpsnm');
	 let profileNm = $('#profileNm').data('profilenm');
	 
	 $('#certDate').append(dateString);
	 
	// 회진 기록 조회시 스크롤로 이동 기능 시작
		let isDown = false;
	    let startX;
	    let scrollLeft;
	    
		$(document).on('mousedown', '.rounds-opinion-list', function(e) {
	  		isDown = true;
	   		$(this).css('cursor', 'grabbing');
	   		startX = e.pageX - $(this).offset().left;
	   		scrollLeft = $(this).scrollLeft();
		});

		$(document).on('mouseleave', '.rounds-opinion-list', function() {
	    	isDown = false;
	    	$(this).css('cursor', 'grab');
		});

		$(document).on('mouseup', '.rounds-opinion-list', function() {
	    	isDown = false;
	    	$(this).css('cursor', 'grab');
		});

		$(document).on('mousemove', '.rounds-opinion-list', function(e) {
	    	if (!isDown) return;
	    	e.preventDefault();
	    	const x = e.pageX - $(this).offset().left;
	    	const walk = (x - startX) * 1; // 스크롤 속도 조절
	    	$(this).scrollLeft(scrollLeft - walk);
		});
	 // 회진 기록 조회시 스크롤로 이동 기능 끝
	 
	 //신규 환자 입력
	 $(document).on("click", "#btnAddPatient",function(){
		 
		 $("#createPatient").find(":input[required]").each(function () {

		        if ($(this).val() === "") {
		            $(this).css("border", "2px solid red");
		            return
		        } else {
		            $(this).css("border", "");
		        }

		    });
		 
		 
		 let createPatientFrm = $('#createPatient')[0];
		 
		 let formData= new FormData(createPatientFrm);
		 
		 
		 let data = {};
		 formData.forEach((value, key) => data[key] = value);
		

		$.ajax({
			url: "/common/patientCreatePost",
			type:"post",
			data: JSON.stringify(data),
			dataType:"json",
			contentType:"application/json;charset:UTF-8",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}",
						"${_csrf.token}");
			}
		}).done((rst) => {
			$(".modal-backdrop.show").attr('style', 'opacity: 0');
			$("#createPatientModal").modal("hide");
			
			let count = $("#patient-list-table tr").length;
			
			let paInfo = "";
					paInfo += '<tr class="tr-padding" data-paNo='+rst.paNo+'>';
					paInfo += '<td class="td-padding">'+(count)+'</td>';
					paInfo += '<td height="48px" class="td-padding">'+rst.paName+'</td>';
					paInfo += '<td class="td-padding">'+ formatResidentNumber(rst.paReg) +'</td>';
					paInfo += '</tr>';
			
			$("#patientTbody").append(paInfo);
			
			 Swal.fire({
				   	title: '성공',
				   	text: '정상적으로 추가되었습니다.',
				   	icon: 'success',
				   	confirmButtonColor: '#0ABAB5',
				   	confirmButtonText: '확인',
				})
			
				$(".modal-backdrop").css('display','none');
			 
			 $('#paNameC').val("");
			 $('#paReg').val("");
			 $('#pzZip').val("");
			 $('#paAdd1').val("");
			 $('#paAdd2').val("");
			 $('#paHeightC').val("");
			 $('#paWeightC').val("");
			 $('#paPh').val("");
			 $('input[name="paSex"]').prop('checked', false);
			 $('input[name="paBldType"]').prop('checked', false);
			 $('input[name="paInsrYn"]').prop('checked', false);
			
		}).fail((xhr) => {
			console.log(xhr);
		})
		 
	 });
	 
	 
	 //진료기록 입력
	 $(document).on("click", "#createPatientRecordBtn", function() {
		 let paNo = $('#patientTbody').find('.selected').data('pano');
		 let empNo = $('#empNo').data('empno');
		 let pareCont = $('#pareCont').val();
		 
		 let data = {
			"paNo":paNo,
			"empNo":empNo,
			"pareCont":pareCont
		 };
		 
		 createPatientRecord(data)
	 });
	 
	 function createPatientRecord(data) {
		 $.ajax({
			 url: '/common/createPatientRecordPost',
				contentType:"application/json;charset:utf-8",
				data:JSON.stringify(data),
				type: 'post',
				dataType: 'json',
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success: function(rst){
					
					let str="";
					
					str += `
						<div>
							<div class="d-flex">
								<img class="record-profile-img" src="/resources/upload/empProfile/\${profileNm}"/>
								<div>
									<div>\${empDeptNm} \${empName}</div>
									<div class="gray-text">\${dateString} \${timeString}</div>
								</div>
							</div>
							<div class="d-flex justify-content-end">
								<div class="patient-record-chat mar-t-8">
									\${rst.pareCont}
								</div>
							</div>
						</div>
						`;
					
					$("#patientRecordBoard").append(str);
					$('#pareCont').val("");
					$('#patientRecordBoard').scrollTop($('#patientRecordBoard').prop("scrollHeight"));
						
				},
				error: function(xhr, status, error){
					console.log('Error:', xhr, status, error);
				}
			 
		 });
		 
	 };
	 
	 
	 
	 //진료 클릭 이벤트
	 $(document).on("click", ".dduk-history-list", function() {
		 let clinicNo = $(this).data('clinicno');
		 console.log(clinicNo);
		 clinicDetail(clinicNo);
		 $(".dduk-history-list").removeClass("selected");
         // 현재 클릭한 요소에 select클래스 추가
         $(this).addClass("selected");
         
         $('.injnm').html("");					
			$('.clinicDt').html("");
			$('.IDTY01').html("");
			$('.IDTY01cd').html("");
			$('.IDTY02').html("");
			$('.IDTY02cd').html("");
			$('.clinicDt').html("");
			$('.clinicDt').html("");
			$('#test-tbody').html("");
			$('#medicien-tbody').html("");
			$('#treatment-tbody').html("");
			$('#PRDC02').html("");
			$('#PRDC03').html("");
			$('#PRDC01').html("");
			$('.injnm').html("");					
			$('.clinicDt').html("");
			$('.IDTY01').html("");
			$('.IDTY01cd').html("");
			$('.clinicDt').html("");
			$('.clinicDt').html("");
			$('#medicien-tbody').html("");
	 });
	 
	 //입원 클릭 이벤트
	 $(document).on("click", ".dduk-admi-list", function(){
		let admiNo = $(this).data('admino');
		console.log(admiNo);
		$('.dduk-admi-list').removeClass('selected');
		// 현재 클릭한 요소에 select클래스 추가
        $(this).addClass("selected");
		
        detailPastAdmissionChart(admiNo);
	 });
	 
	 // 회진 날짜 클릭시 이벤트
	 $(document).on('click', '.rounds-opinion-list-head', function() {
	   // 이전에 적용됐던 클릭시 효과를 지우고 방금 클릭한곳에 적용
	   	$('.rounds-opinion-list-head').removeClass('selected');
	    $(this).addClass('selected');
	    let clinicNo = $(this).data('clinicno');
	    roundsChartDetail(clinicNo);
	 });
	 
	//진료 정보 가져오기
		function clinicDetail(clinicNo) {
			$('.injnm').html("");					
			$('.clinicDt').html("");
			$('.IDTY01').html("");
			$('.IDTY01cd').html("");
			$('.IDTY02').html("");
			$('.IDTY02cd').html("");
			$('.clinicDt').html("");
			$('.clinicDt').html("");
			$('#test-tbody').html("");
			$('#medicien-tbody').html("");
			$('#treatment-tbody').html("");
			$('#PRDC02').html("");
			$('#PRDC03').html("");
			$('#PRDC01').html("");
			$('.injnm').html("");					
			$('.clinicDt').html("");
			$('.IDTY01').html("");
			$('.IDTY01cd').html("");
			$('.clinicDt').html("");
			$('.clinicDt').html("");
			$('#medicien-tbody').html("");
			$('#clinicDetailImg').html("");
			
			$.ajax({
				url:'/clinic/clinicChartDetail',
				dataType: 'json',
				type: 'post',
				data: {"clinicNo": clinicNo},
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success: function(rst){
					console.log('clinicChartDetail',rst);
					
					$('.injnm').html(rst.clinicInjnm);					
					$('.clinicDt').html(rst.clinicDt);
					
					//진단서에 진료번호 넣어두기
					$('#certClinicNo').attr('data-clinicno', rst.clinicNo);
					
					//소견서에 진료번호 넣어두기
					$('#refClinicNo').attr('data-clinicno', rst.clinicNo);
					
					//상병 
					$.each(rst.injuryDiagnosisVOList, function(idx){
							console.log(rst.injuryDiagnosisVOList[idx].indiType);
						if(rst.injuryDiagnosisVOList[idx].indiType == 'IDTY01') {
							$('.IDTY01').html(rst.injuryDiagnosisVOList[idx].injuryVO.ijNm);
							$('.IDTY01cd').html(rst.injuryDiagnosisVOList[idx].injuryVO.ijCd);
						}else {
							$('.IDTY02').html(rst.injuryDiagnosisVOList[idx].injuryVO.ijNm);
							$('.IDTY02cd').html(rst.injuryDiagnosisVOList[idx].injuryVO.ijCd);
						}
						
					});
					
					//검사오더내역
					let str = "";
					$.each(rst.testOrderVOList, function(idx){
						str += `
							<tr>
								<td class="testCd">\${rst.testOrderVOList[idx].testVO.testCd}</td>
								<td class="teodRst">\${rst.testOrderVOList[idx].testVO.testNm}</td>
								<td class="testPrice">\${rst.testOrderVOList[idx].testVO.testPrice}</td>
							</tr>
						`
					});
					$('#test-tbody').append(str);
					
					//처방오더내역
					let strM = "";
					$.each(rst.medicineOrderVOList, function(idx){
						strM += `
							<tr>
								<td class="mediCd">\${rst.medicineOrderVOList[idx].medicineVO.mediCd}</td>
								<td class="mediNm">\${rst.medicineOrderVOList[idx].medicineVO.mediNm}</td>
								<td class="mediMaker">\${rst.medicineOrderVOList[idx].medicineVO.mediMaker}</td>
								<td class="mdodDose">\${rst.medicineOrderVOList[idx].mdodDose}</td>
								<td class="mdodPer">\${rst.medicineOrderVOList[idx].mdodPer}</td>
								<td class="mdodDay">\${rst.medicineOrderVOList[idx].mdodDay}</td>
							</tr>
						`
					});
					$('#medicien-tbody').append(strM);
					
					
					//치료오더내역
					let strT = "";
					$.each(rst.treatmentOrderVOList, function(idx){
						let insuYn = "";
						
						if(rst.treatmentOrderVOList[idx].treatmentVO.insuYn == 'INYN01') {
							insuYn = 'O';
						}else {
							insuYn = 'X';
						}
						
						strT += `
						<tr>
							<td class="tmCd">\${rst.treatmentOrderVOList[idx].treatmentVO.tmCd}</td>
							<td class="tmNm">\${rst.treatmentOrderVOList[idx].treatmentVO.tmNm}</td>
							<td class="insuYn">\${insuYn}</td>
						</tr>
						`
					});
					$('#treatment-tbody').append(strT);
					
					//검사이미지 출력
					let testImg = "";
					$.each(rst.testOrderVOList, function(index, item) {
					    console.log("이미지 출력하자", item.atchFileVO);

					    if (item.atchFileVO != null) {
					        $.each(item.atchFileVO.atchFileDetailVOList, function(idx, fileDetail) {
					            if (fileDetail && fileDetail.atchFileDetailSavenm) {
					                console.log(fileDetail.atchFileDetailSavenm);
					                testImg += `
					                    <img src="/resources/upload/testOrderResult/\${fileDetail.atchFileDetailSavenm}" style="width: 230px;">
					                `;
					            }
					        });
					    }
					});
					$('#clinicDetailImg').append(testImg);
					
					
					/////제증명 파트
					let btnRequestNone = `
						<button class='dduk-btn-disabled' disabled>
							신청보류
						</button>
							`;
					let btnRequest1 = `
						<button class='dduk-btn-normal addProofBtn' data-prdccd='PRDC01'>
							발급신청
						</button>
							`;
					let btnRequest2 = `
						<button class='dduk-btn-normal addProofBtn' data-prdccd='PRDC02'>
							발급신청
						</button>
							`;
					let btnRequest3 = `
						<button class='dduk-btn-normal addProofBtn' data-prdccd='PRDC03'>
							발급신청
						</button>
							`;
							
					let empDeptNm = $('#empDeptNm').data('empdeptnm');
					
					
					
					console.log(empDeptNm);
					
					if(empDeptNm == '의사') {
						$('#PRDC01').append(btnRequestNone);
						$('#PRDC02').append(btnRequestNone);
						$('#PRDC03').append(btnRequestNone);
					}else {
						$('#PRDC01').append(btnRequest1);
						$('#PRDC02').append(btnRequest2);
						$('#PRDC03').append(btnRequest3);
					}
					
					
					$.each(rst.proofApplicationVOList, function(idx){
						
						let btnWaiting = `
								<button class='dduk-btn-disabled' data-prdccd='\${rst.proofApplicationVOList[idx].prdcCd}' disabled>
									발급대기
								</button>
							`;
							
						let btnWrite = `
								<button class='dduk-btn-active doc-btn-proof' data-prdccd='\${rst.proofApplicationVOList[idx].prdcCd}'  data-prafno='\${rst.proofApplicationVOList[idx].PrafNo}' data-bs-toggle='modal' data-bs-target='#writeProof'>
									작성대기
								</button>
							`;
						let btnComplete = `
						<button class='dduk-btn-active' id="releaseProofBtn" data-prooffilecd='\${rst.proofApplicationVOList[idx].proofFileCd}' data-prapno='\${rst.proofApplicationVOList[idx].prapNo}' data-prdccd='\${rst.proofApplicationVOList[idx].prdcCd}' data-bs-toggle="modal" data-bs-target="#releaseProofApplicationModal">
							발급가능
						</button>
							`;
							
						let btnDone = `
						<button class='dduk-btn-danger' data-prdccd='\${rst.proofApplicationVOList[idx].prdcCd}'>
							작성완료
						</button>
							`;
						
						
						// 처방전이면
						if(rst.proofApplicationVOList[idx].prdcCd=='PRDC01') {
							// 신청 상태가 발급대기이면
							if(rst.proofApplicationVOList[idx].prapState=='PAST001'){
								$('#PRDC01').html("");
								
								if(empDeptNm == '의사') {
									$('#PRDC01').append(btnWrite);
								}else {
									$('#PRDC01').append(btnWaiting);
								}
							// 신청 상태가 발급완료이면
							}else if(rst.proofApplicationVOList[idx].prapState=='PAST002'){
								$('#PRDC01').html("");
								
								if(empDeptNm == '의사') {
									$('#PRDC01').append(btnDone);
								}else {
									$('#PRDC01').append(btnComplete);
								}
							}
						// 진단서면
						}else if(rst.proofApplicationVOList[idx].prdcCd=='PRDC02'){
							// 신청 상태가 발급대기이면
							if(rst.proofApplicationVOList[idx].prapState=='PAST001'){
								$('#PRDC02').html("");

								if(empDeptNm == '의사') {
									$('#PRDC02').append(btnWrite);
								}else {
									$('#PRDC02').append(btnWaiting);
								}
							// 신청 상태가 발급완료이면
							}else if(rst.proofApplicationVOList[idx].prapState=='PAST002'){
								$('#PRDC02').html("");
								
								if(empDeptNm == '의사') {
									$('#PRDC02').append(btnDone);
								}else {
									$('#PRDC02').append(btnComplete);
								}
							}
						// 소견서이면
						}else {
							// 신청 상태가 발급대기이면
							if(rst.proofApplicationVOList[idx].prapState=='PAST001'){
								$('#PRDC03').html("");

								if(empDeptNm == '의사') {
									$('#PRDC03').append(btnWrite);
								}else {
									$('#PRDC03').append(btnWaiting);
								}
							// 신청 상태가 발급완료이면
							}else if(rst.proofApplicationVOList[idx].prapState=='PAST002'){
								$('#PRDC03').html("");
								
								if(empDeptNm == '의사') {
									$('#PRDC03').append(btnDone);
								}else {
									$('#PRDC03').append(btnComplete);
								}
							}
						};
						
						
					})
					
					
					//제증명 처방전 데이터 넣기
					//제증명 처방전 데이터 넣기
					$('.presMedi').html("");
					$('.presMediInjection').html("");
					let presMedi ="";
					let presMediInjec ="";
					$.each(rst.medicineOrderVOList, function(idx){
						if(rst.medicineOrderVOList[idx].medicineVO.mediType == 'MDCD01'
								||rst.medicineOrderVOList[idx].medicineVO.mediCd == 'MDCD03'
								||rst.medicineOrderVOList[idx].medicineVO.mediCd == 'MDCD04'){
							presMedi += `
								<div class="d-flex">
									<div class="presMediNm">\${rst.medicineOrderVOList[idx].medicineVO.mediNm}</div>
									<div class="presMediDose">\${rst.medicineOrderVOList[idx].mdodDose}</div>
									<div class="presMediPer">\${rst.medicineOrderVOList[idx].mdodPer}</div>
									<div class="presMediDay">\${rst.medicineOrderVOList[idx].mdodDay}</div>
								</div>
								`;
						} else if(rst.medicineOrderVOList[idx].medicineVO.mediType == 'MDCD02'){
							presMediInjec += `
								<div class="d-flex">
									<div class="presMediNm">\${rst.medicineOrderVOList[idx].medicineVO.mediNm}</div>
									<div class="presMediDose">\${rst.medicineOrderVOList[idx].mdodDose}</div>
									<div class="presMediPer">\${rst.medicineOrderVOList[idx].mdodPer}</div>
									<div class="presMediDay">\${rst.medicineOrderVOList[idx].mdodDay}</div>
								</div>
								`;
						}
					});
					$('.presMedi').append(presMedi);
					$('.presMediInjection').append(presMediInjec);
					
					
					//제증명 진단서 데이터 넣기#clinicInjnm')
					$('#certClinicInjnm').html("");
					$('#certClinicDt').html("");
					$('#certIndiDt').html("");
					
					$('#certClinicInjnm').append(rst.clinicInjnm);
					$('#certClinicDt').append(rst.clinicDt);
					$('#certIndiDt').append(rst.injuryDiagnosisVOList[0].indiDt);		
					
					$.each(rst.proofApplicationVOList, function(idx){
						if(rst.proofApplicationVOList[idx].prdcCd=="PRDC01") {
							$('#presPrapNo').attr('data-prapno',rst.proofApplicationVOList[idx].prapNo);
							$('#presPrdcCd').attr('data-prdccd',rst.proofApplicationVOList[idx].prdcCd);
						} else if(rst.proofApplicationVOList[idx].prdcCd=="PRDC02") {
							$('#certPrapNo').attr('data-prapno',rst.proofApplicationVOList[idx].prapNo);
							$('#certPrdcCd').attr('data-prdccd',rst.proofApplicationVOList[idx].prdcCd);
						} else {
							$('#refPrapNo').attr('data-prapno',rst.proofApplicationVOList[idx].prapNo);
							$('#refPrdcCd').attr('data-prdccd',rst.proofApplicationVOList[idx].prdcCd);
						}
					});
					
					//제증명 소견서 데이터 넣기
					$('#refClinicOpinion').html("");
					$('#refClinicOpinion').append(rst.clinicOpinion);
					
				},
				error: function(xhr, status, error){
					console.log('Error:', xhr, status, error);
				}
			});
		};
		
		//발급 모달에 pdf뷰어 넣기
		//제증명 발급하기 버튼 눌렀을 때
		$(document).on("click", "#releaseProofBtn", function() {
			$('#releaseProofBody').html("");
			let atchFileCd = $(this).data('prooffilecd');
			console.log('피디에프~~',atchFileCd);
			
			let data = {
				"atchFileCd":atchFileCd
			}
			
			$.ajax({
				url: '/common/getFileDetail',
				contentType:"application/json;charset:utf-8",
				data:JSON.stringify(data),
				type: 'post',
				dataType: 'json',
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success: function(rst){
					console.log(rst.atchFileDetailSavenm);
					let proofDocument = "<iframe src='/resources/upload/proofDocument/"+rst.atchFileDetailSavenm+"' style='width:900px;height:900px;'></iframe>";
					
					$('#releaseProofBody').append(proofDocument);
				},
				error: function(xhr, status, error){
					console.log('Error:', xhr, status, error);
				}
			});
			
			
			
		});
		
		// 최근 누른 신청서 작성 대기 버튼의 p.k값(증명서 코드 시퀀스 값) 을 가져오기 위한 변수
		let currentPrafNo = '';
		
		
		
		// 의사가 보는 화면에서, 작성 대기 버튼을 누를 때
		$(document).on('click', '.doc-btn-proof', function(){
			
			$('.doc-btn-proof').removeClass('selectedProof');
			$(this).addClass('selectedProof');
			
			currentPrafNo = $(this).data('prafno');
			
			// 만약 처방전의 작성 대기 버튼을 누른거면
			if($(this).data('prdccd') === 'PRDC01'){
				$('.modal-title').text('처방전 작성');
				$('#prescription').removeClass('none');
				$('#certificate').addClass('none');
				$('#referral').addClass('none');
				
			// 만약 진단서의 작성 대기 버튼을 누른거면
			} else if($(this).data('prdccd') === 'PRDC02'){
				$('.modal-title').text('진단서 작성');
				$('#certificate').removeClass('none');
				$('#prescription').addClass('none');
				$('#referral').addClass('none');
			// 만약 소견서의 작성 대기 버튼을 누른거면				
			} else if($(this).data('prdccd') === 'PRDC03'){
				$('.modal-title').text('소견서 작성');
				$('#referral').removeClass('none');
				$('#certificate').addClass('none');
				$('#prescription').addClass('none');
			}
			
			let paNo = $(".selected").data('pano');
			
			let data = {
				"paNo": paNo
			};
			
			simpleClinicChartList(paNo);
		});
		
// 		$(신청버튼누를떄) {
// 			let data = {
// 			}
// 		}

		$(document).on('click', '.addProofBtn', function(){

			// 발급 신청 버튼을 눌렀으면
			if($(this).text().trim() === '발급신청'){
				Swal.fire({
					title: '제증명을 신청하시겠습니까?',
					icon: 'question',
					showCancelButton: true,
					confirmButtonColor: '#0ABAB5',
					cancelButtonColor: '#8D9EA5',
					confirmButtonText: '확인',
					cancelButtonText: '취소'
				}).then((result) => {
					// 확인버튼 클릭시
					if (result.isConfirmed) {
						let clinicNo = $('.dduk-history-list.selected').data('clinicno');
						let prdcCd = $(this).data('prdccd');
						
						
						console.log('clinicNo',clinicNo);
						console.log('prdcCd',prdcCd);
						
						let data = {
							"clinicNo":clinicNo,	
							"prdcCd":prdcCd
						}
									
						$.ajax({
							url: '/ams/createProofApplication',
							contentType:"application/json;charset:utf-8",
							data:JSON.stringify(data),
							type: 'post',
							dataType: 'json',
							beforeSend:function(xhr){
								xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
							},
							success: function(rst){
								console.log('createProofApplication', rst);
								$('#createProofApplicationModal').modal('hide');
								$('.modal-backdrop.fade').removeClass('show');
								$('.modal-backdrop.fade').css('display','none');
								
								let btnWaiting = `
									<button class='dduk-btn-disabled' disabled>
										발급대기
									</button>
								`;
								
								if(prdcCd=='PRDC01'){
									$('#PRDC01').html("");
									$('#PRDC01').append(btnWaiting);
								}else if(prdcCd=='PRDC02'){
									$('#PRDC02').html("");
									$('#PRDC02').append(btnWaiting);
								}else {
									$('#PRDC03').html("");
									$('#PRDC03').append(btnWaiting);
								}
								
							},
							error: function(xhr, status, error){
								console.log('Error:', xhr, status, error);
							}
						});
					}
				});
			}
		});

		// 제증명 신청 버튼 클릭
		$(document).on("click", "#createProofApplicationBtn", function() {
			
		});
		
		//제증명 작성 완료 버튼 클릭"
		$(document).on("click", "#btnUpdateProof", function() {
    		let clinicNo = $('.dduk-history-list.selected').data('clinicno');
    		let prdcCd = $('.selectedProof').data('prdccd');
    		console.log(prdcCd);
    		
    		let prapNo = "";
    		
    		if(prdcCd=="PRDC01") {
				prapNo += $('#presPrapNo').data('prapno');
			} else if(prdcCd=="PRDC02") {
				prapNo += $('#certPrapNo').data('prapno');
			} else {
				prapNo += $('#refPrapNo').data('prapno');
			}
    		
    		
    		
    		console.log(prapNo);

    		let proofFileName = prapNo + ".pdf";
    
    		// html2canvas로 HTML 요소를 이미지로 변환
    		html2canvas(document.querySelector("#proofContent")).then(function(canvas) {
        		// 캔버스를 이미지로 변환
        		var imgData = canvas.toDataURL('image/png');
        		
        		var imgWidth = 210; // 이미지 가로 길이(mm) A4 기준
                var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
                var imgHeight = canvas.height * imgWidth / canvas.width;
                var heightLeft = imgHeight;

        		// jsPDF 객체 생성
        		var pdf = new jsPDF('p', 'mm');
        		var position = 0;
        		// 이미지를 PDF에 추가
        		pdf.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);

        		// PDF 데이터를 Blob으로 변환
        		var blob = pdf.output('blob');
            		// Blob을 FormData에 추가
            		var formData = new FormData();
            		formData.append('uploadFile', blob, proofFileName);
            		formData.append("prapNo", prapNo);

            		// 서버로 전송
            		$.ajax({
                		type: 'POST',
                		url: '/ams/updateProofApplication',
                		data: formData,
                		processData: false,
                		contentType: false,
                		enctype: 'multipart/form-data',
                		beforeSend: function(xhr) {
                    		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                		},
                		success: function(rst) {
                    		console.log('updateProofApplication',rst);
                    		$(".modal-backdrop.show").attr('style', 'opacity: 0');
                			$("#createPatientModal").modal("hide");
                			
                			let btnDone = `
        						<button class='dduk-btn-danger'>
        							작성완료
        						</button>
        							`;
                			
                			if(prdcCd=='PRDC01'){
        						$('#PRDC01').html("");
        						$('#PRDC01').append(btnDone);
        					}else if(prdcCd=='PRDC02'){
        						$('#PRDC02').html("");
        						$('#PRDC02').append(btnDone);
        					}else {
        						$('#PRDC03').html("");
        						$('#PRDC03').append(btnDone);
        					}
                		},
                		error: function(error) {
                    		console.error('오류 발생:', error);
                		}
            		});
    		});
		});
		
		
		
		
	 
	// 환자 클릭시 이벤트
		$(document).on("click", ".tr-paInfo", function() {
			
			$('#clinic-chart-record').attr('style', 'display: block');
			$('#rounds-chart-record').attr('style', 'display: none');
			$('#diag-scroll').attr('style', 'display: block' );
			$('#Adm-scroll').attr('style', 'display: none');
			$('#inner-tab1').attr('style', 'border-bottom: 3px solid var(--ci-01, #0ABAB5)' );
			$('#inner-tab2').attr('style', 'border-bottom: 0px solid var(--ci-01, #0ABAB5)' );
			
			let paNo = $(this).data('pano');
			
			let data = {
				"paNo": paNo
			};
			
			simpleClinicChartList(paNo);
			patientRecordList(data);
			
			// 이전에 선택된 요소의 클래스 초기화
            $(".tr-paInfo").removeClass("selected");
            // 현재 클릭한 요소에 select클래스 추가
            $(this).addClass("selected");
            
            $('.clinicDt').html("");
			$('#test-tbody').html("");
			$('#medicien-tbody').html("");
			$('#treatment-tbody').html("");
			$('#PRDC02').html("");
			$('#PRDC03').html("");
			$('#PRDC01').html("");
			$('.injnm').html("");					
			$('.clinicDt').html("");
			$('.IDTY01').html("");
			$('.IDTY01cd').html("");
			$('.IDTY02').html("");
			$('.IDTY02cd').html("");
			$('.clinicDt').html("");
			$('.clinicDt').html("");
			$('#medicien-tbody').html("");

		});
	
		
		// 환자의 환자 기록 출력
		function patientRecordList(data) {
			$.ajax({
				url: '/common/patientRecordList',
				contentType:"application/json;charset:utf-8",
				data:JSON.stringify(data),
				type: 'post',
				dataType: 'json',
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success: function(rst){
					$("#patientRecordBoard").html("");
					
					let str="";
					
					$.each(rst, function(idx, patientRecordVO){
						str += `
							<div>
								<div class="d-flex">
									<img class="record-profile-img" src="/resources/upload/empProfile/\${patientRecordVO.employeeVO.profileNm}"/>
									<div>
										<div>\${patientRecordVO.employeeVO.empDeptNm} \${patientRecordVO.employeeVO.empName}</div>
										<div class="gray-text">\${patientRecordVO.pareEndt}</div>
									</div>
								</div>
								<div class="d-flex justify-content-end">
									<div class="patient-record-chat mar-t-8">
										\${patientRecordVO.pareCont}
									</div>
								</div>
							</div>
							`;
							
					});
					
					$("#patientRecordBoard").html(str);
					
					$('#patientRecordBoard').scrollTop($('#patientRecordBoard').prop("scrollHeight"));
				},
				error: function(xhr, status, error){
					console.log('Error:', xhr, status, error);
				}
			})
		}
		
		//환자 상세보기 
		$(document).on('click','#detailPatient', function(){
			let paNo = $('.selected').data('pano');
			
			console.log(paNo);
			if(paNo == "" || paNo==null) {
				 Swal.fire({
					   	title: '환자를 선택해주세요.',
					   	icon: 'error',
					   	confirmButtonColor: '#0ABAB5',
					   	confirmButtonText: '확인',
					})
				return;
			}
			
			let data = {
				"paNo": paNo
			};
				
			detailPatient(paNo);
			
			$('#detailPatientModal').modal('show');
		})
		
		
		
		function detailPatient(paNo){
			$.ajax({
				url: '/clinic/simpleClinicChartList',
				dataType: 'json',
				type: 'post',
				data: {"paNo": paNo},
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},success: function(rst) {
					console.log('simpleClinicChartList',rst);
					$('#paName2').val(rst.paName);
					
					if(rst.paSex == '남') {
						$('#paSex12').prop("checked", true); 
					}else {
						$('#paSex22').prop("checked", true); 
					}
					
					$('#paReg2').val(rst.paReg);
					
					$('#pzZip2').val(rst.pzZip);
					$('#paAdd12').val(rst.paAdd1);
					$('#paAdd22').val(rst.paAdd2);

					$('#paHeight2').val(rst.paHeight);
					$('#paWeight2').val(rst.paWeight);
					
					$('#paPh2').val(rst.paPh);
					
					if(rst.paBldType == 'A') {
						$('#paBldType12').prop("checked", true); 
					}else if (rst.paBldType == 'B'){
						$('#paBldType22').prop("checked", true); 
					}else if (rst.paBldType == 'AB'){
						$('#paBldType32').prop("checked", true); 
					}else{
						$('#paBldType42').prop("checked", true); 
					}
					
					if (rst.paInsrYn == 'ISYN01'){
						$('#paInsrYn12').prop("checked", true); 
					}else{
						$('#paInsrYn22').prop("checked", true); 
					}
					
				}
			});
		}
		
		
		////////////////////환자 정보 수정 시작
		$(document).on("click", "#btnUpdateStart", function() {
			
			$(".form-check-input").removeAttr("disabled");
			$(".dduk-login-input").removeAttr("disabled");
			$(".updateBtnSet2").attr('style', 'display: flex');
			$(".updateBtnSet1").attr('style', 'display: none');

		});
		
		$(document).on("click", ".updateCancle", function() {
			$(".form-check-input").prop('disabled', true);
			$(".dduk-login-input").prop('disabled', true);
			$(".updateBtnSet1").attr('style', 'display: flex');
			$(".updateBtnSet2").attr('style', 'display: none');			
		});
		
		$(document).on("click", "#btnUpdatePatient", function() {
			
			 $("#updatePatient").find(":input[required]").each(function () {

			        if ($(this).val() === "") {
			            $(this).css("border", "2px solid red");
			            return
			        } else {
			            $(this).css("border", "");
			        }

			    });
			
			let paNo = $('.selected').data('pano');
			
			let paReg = $('#paReg2').val();
			let paName = $('#paName2').val();
			let paSex = $('input[name=paSex]:checked').val();
			let pzZip = $('#pzZip2').val();
			let paAdd1 = $('#paAdd12').val();
			let paAdd2 = $('#paAdd22').val();
			let paHeight = $('#paHeight2').val();
			let paWeight = $('#paWeight2').val();
			let paPh = $('#paPh2').val();
			let paBldType = $('input[name=paBldType]:checked').val();
			let paInsrYn = $('input[name=paInsrYn]:checked').val();

			let data = {
				"paNo": paNo,
				"paReg": paReg,
				"paName":paName,
				"paSex":paSex,
				"paPh":paPh,
				"paAdd1":paAdd1,
				"paAdd2":paAdd2,
				"pzZip":pzZip,
				"paBldType":paBldType,
				"paInsrYn":paInsrYn,
				"paHeight":paHeight,
				"paWeight":paWeight
			};
			
			updatePatientPost(data);
		});
		
		function updatePatientPost(data) {
			$.ajax({
				url: '/common/updatePatientPost',
				type: 'post',
				data:JSON.stringify(data),
				dataType: 'json',
				contentType:"application/json;charset:utf-8",
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success: function(rst){
					console.log('update',rst);
					$(".updateBtnSet1").attr('style', 'display: flex');
					$(".updateBtnSet2").attr('style', 'display: none');	
					$(".form-check-input").prop('disabled', true);
					$(".dduk-login-input").prop('disabled', true);
					
					$('#paName2').val(rst.paName);
					
					if(rst.paSex == '남') {
						$('#paSex12').prop("checked", true); 
					}else {
						$('#paSex22').prop("checked", true); 
					}
					
					$('#paReg2').val(rst.paReg);
					
					$('#pzZip2').val(rst.pzZip);
					$('#paAdd12').val(rst.paAdd1);
					$('#paAdd22').val(rst.paAdd2);

					$('#paHeight2').val(rst.paHeight);
					$('#paWeight2').val(rst.paWeight);
					
					$('#paPh2').val(rst.paPh);
					
					if(rst.paBldType == 'A') {
						$('#paBldType12').prop("checked", true); 
					}else if (rst.paBldType == 'B'){
						$('#paBldType22').prop("checked", true); 
					}else if (rst.paBldType == 'AB'){
						$('#paBldType32').prop("checked", true); 
					}else{
						$('#paBldType42').prop("checked", true); 
					}
					
					if (rst.paInsrYn == 'ISYN01'){
						$('#paInsrYn12').prop("checked", true); 
					}else{
						$('#paInsrYn22').prop("checked", true); 
					}
				}
			});
		}
		////////////////////환자 정보 수정 끝
		
		// 환자의 진료목록 갱신
		function simpleClinicChartList(paNo){
			$('#certEmpNm').html("");
			$('.certPaReg').html("");
			$('#certPaName').html("");
			$('#certPaAddr').html("");
			
			$.ajax({
				url: '/clinic/simpleClinicChartList',
				dataType: 'json',
				type: 'post',
				data: {"paNo": paNo},
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success: function(rst){
					console.log('simpleClinicChartList',rst);
					// 환자 정보 출력
					let paBirthDay = formatResidentNumber(rst.paReg);
					let paAge = getAge(paBirthDay);
					$('#paName').html(rst.paName);
					$('#paInfo').html(rst.paSex + ", "+paAge+"세("+paBirthDay+")");
					$('#paHeight').html(rst.paHeight + "cm");
					$('#paWeight').html(rst.paWeight + "kg");
					$('#paBldType').html(rst.paBldType + "형");
					
					// 진료 이력 초기화
					$('.history-scroll').html("");
					
					
					
					// 진료 이력이 없을시 없다는 메시지 출력
					if(rst.clinicChartVOList[0].clinicNo == null){
						$('#diag-scroll').append('<div class="notice-text">진료 이력이 없습니다</div>');
					} else {
							
						//제증명 신청 처방전 정보 넣기
						$('#presPaName').html(rst.paName);
						$('#presPaReg').html(rst.paReg);
						
						//제증명 진단서 정보 넣기
						let certClinicNo = $('#certClinicNo').data('clinicno');
						$.each(rst.clinicChartVOList, function(index){
							if(certClinicNo == rst.clinicChartVOList[index].clinicNo){
								
								
								$('#certEmpNm').append(rst.clinicChartVOList[index].empName);
								$('.certPaReg').append(rst.paReg);
								$('#certPaName').append(rst.paName);
								$('#certPaAddr').append(rst.pzZip + "&nbsp;");
								$('#certPaAddr').append(rst.paAdd1 + "&nbsp;");
								$('#certPaAddr').append(rst.paAdd2);
							}
						});
						//제증명 진단서 정보 넣기 끝
						
						//제증명 소견서 정보 넣기
						let refClinicNo = $('#refClinicNo').data('clinicno');
						$.each(rst.clinicChartVOList, function(index){
							if(refClinicNo == rst.clinicChartVOList[index].clinicNo){
								let birth = formatResidentNumber(rst.paReg);
								let birthYear = rst.paReg.substring(0,2);
								let phone = rst.paPh.substring(4,12);
								let age = 100 + parseInt(year2) - parseInt(birthYear);
								
								$('#refEmpNm').html("");
								$('.refPaReg').html("");
								$('#refPaName').html("");
								$('#refPaAddr').html("");
								$('#refPaSex').html("");
								$('#refPaPh').html("");
								$('#refPaBirth').html("");
								$('#refPaAge').html("");
								$('#refYear').html("");
								$('#refMonth').html("");
								$('#refDay').html("");
								
								$('#refEmpNm').append(rst.clinicChartVOList[index].empName);
								$('.refPaReg').append(rst.paReg);
								$('#refPaName').append(rst.paName);
								$('#refPaAddr').append(rst.pzZip + "&nbsp;");
								$('#refPaAddr').append(rst.paAdd1 + "&nbsp;");
								$('#refPaAddr').append(rst.paAdd2);
								$('#refPaSex').append(rst.paSex);
								$('#refPaPh').append(phone);
								$('#refPaBirth').append(birth);
								$('#refPaAge').append("만 "+age+"세");
								$('#refYear').append(year);
								$('#refMonth').append(month);
								$('#refDay').append(day);
							}
						});
						//제증명 소견서 정보 넣기 끝
							
						// 진료 이력이 있을시 화면에 출력
						$.each(rst.clinicChartVOList, function(index){
							
							// 만약 입원번호가 존재하면(회진기록이면) 출력x
							if(rst.clinicChartVOList[index].admiCd === null){
								
								// 진료일자
								let clinicDate = formatDateString(rst.clinicChartVOList[index].clinicDt);
							
								let paClinicList = "";
							
								paClinicList += '<div class="dduk-history-list" data-clinicNo='+rst.clinicChartVOList[index].clinicNo+'>';
								paClinicList += '<div class="history-array">';
								paClinicList += '<div>';
								paClinicList += '<div class="history-title">내원·'+clinicDate+'</div>';
								paClinicList += '<div>담당의 '+ rst.clinicChartVOList[index].empName+'</div>';
								paClinicList += '</div>';
								paClinicList += '</div>';
								paClinicList += '<div class="d-flex history-btn-list">';
								paClinicList += '<span class="history-btn">진료</span>';
								
								// 진료정보의 첫번째 vo를 뒤져봤는데 의약품 정보가 없을 때(처방을 안받았을 때)
								console.log('testCd',index,rst.clinicChartVOList[index]);
								if(!rst.clinicChartVOList[index].testOrderVOList[0]){
									paClinicList += '<span class="history-btn">검사</span>';
								}
								// 진료정보의 첫번째 vo를 뒤져봤는데 의약품 정보가 없을 때(처방을 안받았을 때)					
								if(!rst.clinicChartVOList[index].treatmentOrderVOList[0]){
									paClinicList += '<span class="history-btn">치료</span>';
								}
								// 진료정보의 첫번째 vo를 뒤져봤는데 의약품 정보가 없을 때(처방을 안받았을 때)					
								if(!rst.clinicChartVOList[index].medicineOrderVOList[0]){
									paClinicList += '<span class="history-btn">처방</span>';
								}
								paClinicList += '</div>';
								paClinicList += '</div>';
							
								$('#diag-scroll').append(paClinicList);
								
							}
						});
					}
				},
				error: function(xhr, status, error){
					console.log('Error:', xhr, status, error);
				}
			});
		}
		
	//환자 리스트 검색 시작	
	$(document).on("click", "#searchPatientBtn", function() {
		let paName = $('#searchPatient').val();
		console.log(paName);
		
		let data = {
			"paName":paName	
		};
		
		searchPatient(data);
	});
	
	
	function searchPatient(data){
		$.ajax({
			url: '/common/searchPatient',
			contentType:"application/json;charset:utf-8",
			dataType: 'json',
			type: 'post',
			data: JSON.stringify(data),
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: function(rst){
				console.log(rst);
				
				let str ="";
				
				$.each(rst, function(idx){
					let paName = truncateText(rst[idx].paName, 7);
					
					let paReg = formatResidentNumber(rst[idx].paReg);
					
					console.log(paName, paReg);
					
					str += `
						<tr class="tr-padding tr-paInfo" data-paNo="\${rst[idx].paNo}">
						<td class="td-padding" style="width:40px;">
						&nbsp;&nbsp;\${idx+1}
						</td>
						<td style="height:48px; width:120px;" class="td-padding">
							\${paName}
						</td>
						<td class="td-padding">
							\${paReg}
						</td>
					</tr>
					`;
					
				});
				
				$('#patientTbody').html(str);
				
			}
		});
	}
	
	$(document).on('click', '#inner-tab2', function(){
		console.log('나오나?');
		let paNo = $('.selected').data('pano');
		updatePastAdmissionChart(paNo);
	});
	
		
});



// 과거 입원 내역 심플 리스트 갱신
function updatePastAdmissionChart(paNo){
	$.ajax({
		url: '/rounds/simpleAdmissionChartList',
		data: {'paNo' : paNo},
		type: 'post',
		dataType: 'json',
		beforeSend: function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
		success: function(rst){
			console.log("환자의 과거 입원내역 가져오기 : ", rst);
			$('#Adm-scroll').html("");
			let paAmdiList = "";
			let firstAdmissionNo = "";
			
			// 과거 입원내역이 없으면?
			if(rst.length === 0){
				
				$('#Adm-scroll').append('<div class="notice-text">진료 이력이 없습니다</div>');
			
			// 있으면 출력
			} else {
				
				// 진료 이력이 있을시 화면에 출력
				$.each(rst, function(index){
					if(index === 0){
						firstAdmissionNo = rst[index].admiNo;
						paAmdiList += '<div class="dduk-admi-list selected" data-admino='+rst[index].admiNo+'>';
					} else {
				
					paAmdiList += '<div class="dduk-admi-list" data-admino='+rst[index].admiNo+'>';
					
					}
					paAmdiList += '<div class="history-array">';
					paAmdiList += '<div>';
					paAmdiList += '<div class="history-title">입원·'+rst[index].admiIndt+'</div>';
					paAmdiList += '<div class="history-title">퇴원·'+rst[index].admiOutdt+'</div>';
					paAmdiList += '<div>담당의 '+ rst[index].admiEmpName+'</div>';
					paAmdiList += '</div>';
					paAmdiList += '</div>';
					paAmdiList += '</div>';
					paAmdiList += '</div>';
				
					
				});
					$('#Adm-scroll').append(paAmdiList);
					
					// 첫번째 입원내역 디테일 출력
	    			detailPastAdmissionChart(firstAdmissionNo);
 				
			}
		},
		error: function(xhr, status, error){
			console.log('Error:', xhr, status, error);
		}
	});
}

// 과거 입원 내역 클릭시 해당 입원 사유 및 심플 회진 날짜 리스트를 출력
function detailPastAdmissionChart(admiNo){
	
	$.ajax({
		url: '/rounds/simpleRoundsChartList',
		data: {'admiNo' : admiNo},
		type: 'post',
		dataType: 'json',
		beforeSend: function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
		success: function(rst){
			
			console.log('입원번호 ', admiNo, '로 가져온 심플 입원정보 : ', rst);
			
			
			// 첫번째 진료번호을 담기위한 변수
			let firstClinicNo = '';
			
			let cont = "";
			
			// 만약 회진 기록이 없으면 없다고 출력
			if(rst.clinicChartVOList.length === 0){
				cont += '<h1 class="h1-default" style="margin: 16px 0px 0px 32px; color: #999999 !important; font-size: 1.5em !important;">회진 기록이 없습니다</h1>';
			} else {
					
				// 회진기록 개수만큼 반복
				$.each(rst.clinicChartVOList, function(index,vo){
					// 첫번째 회진기록이면 선택해있기 및 첫번째 회진기록 변수에 담아두기
					if(index === 0) {
						firstClinicNo = vo.clinicNo;
						cont += '<div class="rounds-opinion-list-head selected" data-clinicno='+vo.clinicNo+'>';
					} else {
						cont += '<div class="rounds-opinion-list-head" data-clinicno='+vo.clinicNo+'>';	
					}
					cont += '<div class="dduk-row">'+vo.clinicDt+'</div>';
					cont += '<div class="dduk-row">';
					
					// 해당 진료에 검사,처방,치료가 있었는지를 확인하고 버튼 생성
					if(vo.testOrderVOList.length === 0){
    					cont += '<span class="history-btn">검사</span>';
    				} else {
    					cont += '<span class="history-btn"><span class="neon-text">검사</span></span>';
    				}
					
    				if(vo.medicineOrderVOList.length === 0){
    					cont += '<span class="history-btn">처방</span>';
    				} else {
    					cont += '<span class="history-btn"><span class="neon-text">처방</span></span>';
    				}
    				
    				if(vo.treatmentOrderVOList.length === 0){
    					cont += '<span class="history-btn">치료</span>';
    				} else {
    					cont += '<span class="history-btn"><span class="neon-text">치료</span></span>';
    				}
    				
    				cont += '</div>';
    				cont += '</div>';
    				
    				
    				
				}
				
				
				);
			}
			
			$('.rounds-opinion-list').html(cont);
			roundsChartDetail(firstClinicNo);
			
		},
		error: function(xhr, status, error){
			console.log('Error:', xhr, status, error);
		}
	})
}

// 이름 등이 글자를 제어하고 싶을 때 maxLength까지만 표시
function truncateText(text, maxLength) {
	if (text.length > maxLength) {
		return text.slice(0, maxLength) + '...';
	} else {
	    return text;
	}
}

//주민번호로 만나이 계산
function getAge(paBirthDay) {
	
	// 현재날짜, 생일로 날짜계산
    const currentDate = new Date();
    const birthdateDate = new Date(paBirthDay);
    let age = currentDate.getFullYear() - birthdateDate.getFullYear();

    // 현재와 생일의 월, 날짜 얻어주기
	const currentMonth = currentDate.getMonth();
	const birthdateMonth = birthdateDate.getMonth();
	const currentDay = currentDate.getDate();
	const birthdateDay = birthdateDate.getDate();

	// 현재 날짜가 생년월일보다 앞 날짜면 아직 생일이 오지 않은 상태임(한살빼기)
	if (currentMonth <= birthdateMonth && currentDay < birthdateDay) {
   		age--;
	}
    return age;
}

// 주민번호를 생년월일로 변환
function formatResidentNumber(residentNumber) {
	
	// 00~39년생은 20을 붙이고 그 외엔 19를 붙인다
    let year = "";
    if(Number(residentNumber.substr(0,1)) <= 3){
    	year += "20";
    } else {
    	year += "19";
    }
    year += residentNumber.substr(0,2);
    
    
    let month = residentNumber.substr(2,2);
    let day = residentNumber.substr(4,2);
    
    let birthDay = year + "-" + month + "-" + day;
    return birthDay;
}

// 날짜형식 데이터를 넣으면 yyyy-MM-dd 로 변환해주는 함수
function formatDateString(dateString) {
	
	const dateData = new Date(dateString);
	let year = dateData.getFullYear();
	let month = dateData.getMonth() + 1;  
	let date = dateData.getDate()	
	
	// 한 자리 숫자에 0을 붙이는 처리
	month = month < 10 ? '0' + month : month;
	date = date < 10 ? '0' + date : date;
	
	let dateStr = `\${year}-\${month}-\${date}`;
	
	return dateStr;
}


//제증명 pdf파일 만들기!!!!!!!!!!!!!!!!
function pdfPrint(proofFileName){
    // 현재 document.body의 html을 A4 크기에 맞춰 PDF로 변환
    html2canvas(document.getElementsByClassName("proofContent"), {
        onrendered: function (canvas) {

            // 캔버스를 이미지로 변환
            var imgData = canvas.toDataURL('image/png');

            var imgWidth = 210; // 이미지 가로 길이(mm) A4 기준
            var pageHeight = imgWidth * 1.414;  // 출력 페이지 세로 길이 계산 A4 기준
            var imgHeight = canvas.height * imgWidth / canvas.width;
            var heightLeft = imgHeight;

            var doc = new jsPDF('p', 'mm');
            var position = 0;

            // 첫 페이지 출력
            doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
            heightLeft -= pageHeight;

            // 한 페이지 이상일 경우 루프 돌면서 출력
            while (heightLeft >= 20) {
                position = heightLeft - imgHeight;
                doc.addPage();
                doc.addImage(imgData, 'PNG', 0, position, imgWidth, imgHeight);
                heightLeft -= pageHeight;
            }

            // 파일 저장
            doc.save('sample.pdf');
        }
        
    });
    
}

//입원 회진 상세 출력 함수
function roundsChartDetail(clinicNo){
	$.ajax({
		url: '/clinic/lightWeightClinicChartDetail',
		data: {'clinicNo' : clinicNo},
		type: 'post',
		dataType: 'json',
		beforeSend: function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
		success: function(rst){
			console.log('입원내역에서 진료내역의 상세에 출력해줄 vo : ', rst);
			
			$('#admiClinicDt').html("");
			$('#admiClinicInjnm').html("");
			$('#admiIDTY01').html("");
			$('#admiIDTY02').html("");
			$('#admiIDTY01cd').html("");
			$('#admiIDTY02cd').html("");
			$('#patientAdmiOpinion').html("");
			$('#admi-test-tbody').html("");
			$('#admi-medicien-tbody').html("");
			$('#admi-treatment-tbody').html("");
			
			$('#admiClinicDt').html(rst.clinicDt);
			$('#admiClinicInjnm').html(rst.clinicInjnm);
			$('#patientAdmiOpinion').html(rst.clinicOpinion);
			
			//상병 리스트 출력
			$.each(rst.injuryDiagnosisVOList, function(idx){
				if(rst.injuryDiagnosisVOList[idx].indiType == 'IDTY01'){
					$('#admiIDTY01').html(rst.injuryDiagnosisVOList[idx].injuryVO.ijNm);
					$('#admiIDTY01cd').html(rst.injuryDiagnosisVOList[idx].ijCd);
				} else if (rst.injuryDiagnosisVOList[idx].indiType == 'IDTY02') {
					$('#admiIDTY02').html(rst.injuryDiagnosisVOList[idx].injuryVO.ijNm);
					$('#admiIDTY02cd').html(rst.injuryDiagnosisVOList[idx].ijCd);
				}
				
			});
			
			//검사 리스트 출력
			let admiTestTable = "";
			$.each(rst.testOrderVOList, function(idx){
				admiTestTable += `
					<tr>
						<td class="gray-text w-20 testCd">\${rst.testOrderVOList[idx].testCd}</td>
						<td class="gray-text w-60">\${rst.testOrderVOList[idx].testVO.testNm}</td>
						<td class="gray-text w-20">\${rst.testOrderVOList[idx].testVO.testPrice}</td>
					</tr>
				`;
			});
			$('#admi-test-tbody').append(admiTestTable);
			
			//처방 리스트 출력
			let admiMediTable = "";
			$.each(rst.medicineOrderVOList, function(idx){
				admiMediTable += `
					<tr>
						<td class="gray-text mediCd">\${rst.medicineOrderVOList[idx].mediCd}</td>
						<td class="gray-text mediNm">\${rst.medicineOrderVOList[idx].medicineVO.mediNm}</td>
						<td class="gray-text mediMaker">\${rst.medicineOrderVOList[idx].medicineVO.mediMaker}</td>
						<td class="gray-text mdodDose">\${rst.medicineOrderVOList[idx].mdodDose}</td>
						<td class="gray-text mdodPer">\${rst.medicineOrderVOList[idx].mdodPer}</td>
						<td class="gray-text mdodDay">\${rst.medicineOrderVOList[idx].mdodDay}</td>
					</tr>
				`;
			});
			$('#admi-medicien-tbody').append(admiMediTable);
			
			
			//치료 리스트 출력
			let admiTreatTable = "";
			$.each(rst.treatmentOrderVOList, function(idx){
				let insuYn = "";
				
				if(rst.treatmentOrderVOList[idx].treatmentVO.insuYn == 'INYN01') {
					insuYn = 'O';
				}else {
					insuYn = 'X';
				}
				admiTreatTable += `
					<tr>
						<td class="gray-text tmCd">\${rst.treatmentOrderVOList[idx].tmCd}</td>
						<td class="gray-text tmNm">\${rst.treatmentOrderVOList[idx].treatmentVO.tmNm}</td>
						<td class="gray-text insuYn">\${insuYn}</td>
					</tr>
				`;
			});
			$('#admi-treatment-tbody').append(admiTreatTable);
			
			
		},
		error: function(xhr, status, error){
			console.log('Error:', xhr, status, error);
		}
	});
};

$(document).on('click', '#autoComplete-patientCreate', function(){
	 $('#paNameC').val("이수정");
	 $('#paReg').val("970828-2104931");
	 $('#pzZip').val("16316");
	 $('#paAdd1').val("경기 수원시 장안구 정자천로188번길 64");
	 $('#paAdd2').val("화서역 현대벽산");
	 $('#paHeightC').val("155");
	 $('#paWeightC').val("42");
	 $('#paPh').val("010-9739-9749");
	 $('#paSex2').prop('checked', true);
	 $('#paBldType1').prop('checked', true);
	 $('#paInsrYn1').prop('checked', true);
});

</script>
<html>
	<sec:authentication property="principal.employeeVO" var="empVO"/>
	<div id="empNo" style="display: none;" data-empno="${empVO.empNo}">
	</div>
	<div id="empName" style="display: none;" data-empname="${empVO.empName}">
	</div>
	<div id="empDeptNm" style="display: none;" data-empdeptnm="${empVO.empDeptNm}">
	</div>
	<div id="empJbpsNm" style="display: none;" data-empjbpsnm="${empVO.empJbpsNm}">
	</div>
	<div id="profileNm" style="display: none;" data-profilenm="${empVO.profileNm}">
	</div>
	
	<div class="dduk-body-border patient-list">
		<div>
			<div class="dduk-title-area">
				<h2>환자 목록</h2>
				<sec:authorize access="hasRole('ROLE_AMS')">
					<svg id="createPatientInput" type="button" data-bs-toggle="modal" data-bs-target="#createPatientModal"  xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
						<g clip-path="url(#clip0_142_1638)">
							<path d="M18 13H13V18C13 18.55 12.55 19 12 19C11.45 19 11 18.55 11 18V13H6C5.45 13 5 12.55 5 12C5 11.45 5.45 11 6 11H11V6C11 5.45 11.45 5 12 5C12.55 5 13 5.45 13 6V11H18C18.55 11 19 11.45 19 12C19 12.55 18.55 13 18 13Z" fill="#8D9EA5"/>
						</g>
						<defs>
						<clipPath id="clip0_142_1638">
							<rect width="24" height="24" fill="white"/>
						</clipPath>
						</defs>
					</svg>
				</sec:authorize>
			</div>
			<div class="dduk-x-pd8">
				<table class="patient-list-table" id="patient-list-table">
					<thead style="display: block;">
						<tr class="tr-padding">
							<th class="td-padding gray-text" style="width:40px;">No</th>
							<th class="td-padding gray-text paName" style="width:120px;">이름</th>
							<th class="td-padding gray-text">생년월일</th>
						</tr>
					</thead>
					
					<tbody id="patientTbody" class="patientTbody">
						<c:forEach var="patient" items="${patientVOList}" varStatus="status">
							<tr class="tr-padding tr-paInfo" data-paNo="${patient.paNo}">
								<td class="td-padding" style="width:40px;">
									&nbsp;&nbsp;${status.count}
								</td>
								<td style="height:48px; width:120px;" class="td-padding">
									<c:choose>
								        <c:when test="${fn:length(patient.paName) gt 9}">
								        <c:out value="${fn:substring(patient.paName, 0, 7)}">
								        </c:out>...</c:when>
								        <c:otherwise>
								        <c:out value="${patient.paName}">
								        </c:out></c:otherwise>
									</c:choose>
								</td>
								<td class="td-padding">
									<c:choose>
								        <c:when test="${fn:substring(patient.paReg, 0, 1) gt 0}">
								        19<c:out value="${fn:substring(patient.paReg, 0, 2)}">
								        </c:out></c:when>
								        <c:otherwise>
								        20<c:out value="${fn:substring(patient.paReg, 0, 2)}">
								        </c:out></c:otherwise>
									</c:choose>
									-${fn:substring(patient.paReg, 2, 4)}-${fn:substring(patient.paReg, 4, 6)}
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>	
		</div>
		<input id="searchPatient" class="search dduck-input" placeholder="환자 이름을 검색해주세요">
		<button id="searchPatientBtn"><img src="/resources/images/Search.png"></button>
		<div class="autocomplete"></div>
	</div>
	
	<div class="dduk-body-border patient-detail" style="position: relative;">
		<div class="dduk-title-area">
			<div class="d-flex align-items-center">
				<h2 id="paName">환자를 선택해주세요</h2>
				<span id="paInfo" class="gray-text mar-b-8 mar-l-8"></span>
			</div>
			<div class="d-flex">
				<div class="d-flex patient-info" style="margin-left:-5%; margin-right:5%">
					<div class="d-flex">
						<span class="gray-text">신장&nbsp;&nbsp;</span><div id="paHeight">--</div>
					</div>
					<div class="d-flex">
						<span class="gray-text">체중&nbsp;&nbsp;</span><div id="paWeight">--</div>
					</div>
					<div class="d-flex">
						<span class="gray-text">혈액형&nbsp;&nbsp;</span><div id="paBldType">--</div>
					</div>
				</div>
				<button class="dduk-btn-normal" id="detailPatient" data-bs-target="#detailPatientModal">상세보기</button>
			</div>
		</div>
		<hr style="width: 892px;">
		<div class="d-flex">
			<div class="dduk-history">
				<div style="height: 520px;">
					<div class="subTitle-margin">
						<div class="dduk-row spa-betw">
							<div class="inner-tab" id="inner-tab1" style="border-bottom: 3px solid var(--ci-01, #0ABAB5);">
								<h3>진료 이력</h3>
							</div>
							<div class="inner-tab" id="inner-tab2">
								<h3>입원 이력</h3>
							</div>
						</div>
					</div>
					
					<div class="history-scroll" id="diag-scroll">
					</div>
					
					<div class="history-scroll" id="Adm-scroll" style="display: none;">
					</div>
					
				</div>
				<hr style="width: 289px;">
				<sec:authorize access="hasAnyRole('ROLE_AMS','ROLE_DOC')">
					<div style="height: 239px;">
						<div class="spa-betw">
							<div class="subTitle-margin">
								<h3>문서 발급</h3>
							</div>
						</div>
						<div class="gap-ver-16 p-8">
						
							<div class="spa-betw" style="height: 33px;"><span class="text16">진단서</span>
								<div id="PRDC02">
								</div>
							</div>
							
							<div class="spa-betw" style="height: 33px;"><span class="text16">소견서</span>
								<div id="PRDC03">
								</div>
							</div>
							
							<div class="spa-betw" style="height: 33px;"><span class="text16">처방전</span>
								<div id="PRDC01">
								</div>
							</div>
							
						</div>
					</div>
				</sec:authorize>
			</div>
			<div class="patient-record" id="clinic-chart-record">
				<div class="subTitle-margin">
					<h3>진료 기록</h3>
				</div>
				<div class="gap-ver-16">
					<div class="gap-row-16 w-100">
						<div class="dduk-inner-border record-content-fr" style="width:284px;">
							<h3 class="m-8">진료 내용</h3>
							<div>
								<div class="spa-betw p-8" style="padding-bottom: 4px;"> 
									<div class="gray-text d-flex w-30">진단일</div> <div class="w-70 f-end clinicDt"></div>
								</div>
								<div class="spa-betw p-8" >
									<div class="gray-text d-flex w-30">진단내역</div> <div class="w-70 f-end injnm"></div>
								</div>
									<hr class="m-8"/>
								<div class="spa-betw p-8" style="padding-bottom: 4px;">
									<div class="gray-text d-flex w-30">주상병</div> <div class="w-70 f-end IDTY01"></div>
								</div>
								<div class="spa-betw p-8">
									<div class="gray-text d-flex w-30">주상병코드</div> <div class="w-70 f-end IDTY01cd"></div>
								</div>
									<hr class="m-8"/>
								<div class="spa-betw p-8" style="padding-bottom: 4px;">
									<div class="gray-text d-flex w-30">부상병</div> <div class="w-70 f-end IDTY02"></div>
								</div>
								<div class="spa-betw p-8">
									<div class="gray-text w-30">부상병코드</div> <div class="w-70 f-end IDTY02cd"></div>
								</div>
							</div>
						</div>
						<div class="dduk-inner-border record-content-fr" style="width:272px; z-index: auto;">
							<h3 class="m-8">이미지</h3>
							<div class="record-img-scroll" id="clinicDetailImg">
								
							</div>
						</div>
					</div>
					<div class="dduk-inner-border w-100" style="height: 320px;">
						<h3 class="subTitle-margin">오더 내역 </h3>
						<div class="order-scroll">
							<h4>검사</h4>
							<div class="order-detail">
								<table>
									<tr>
										<td class="gray-text w-20 testCd">코드</td>
										<td class="gray-text w-60">검사명</td>
										<td class="gray-text w-20">가격</td>
									</tr>
									<tbody id="test-tbody">
									</tbody>
								</table>
							</div>
							<h4>처방</h4>
							<div class="order-detail">
								<table>
									<tr>
										<td class="gray-text mediCd">코드</td>
										<td class="gray-text mediNm">약품명</td>
										<td class="gray-text mediMaker">업체명</td>
										<td class="gray-text mdodDose">투여랑</td>
										<td class="gray-text mdodPer">투여횟수</td>
										<td class="gray-text mdodDay">기간</td>
									</tr>
									<tbody id="medicien-tbody">
									</tbody>
								</table>
							</div>
							<h4>치료</h4>
							<div class="order-detail">
								<table>
									<tr>
										<td class="gray-text tmCd">코드</td>
										<td class="gray-text tmNm">치료명</td>
										<td class="gray-text insuYn">급여</td>
									</tr>
									<tbody id="treatment-tbody">
									
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div class="patient-record" id="rounds-chart-record" style="display: none;">
				<div class="subTitle-margin">
					<h3>회진 기록</h3>
				</div>
				<div class="gap-ver-16">
					<div class="dduk-row rounds-opinion-list" id="roundList">
							<!-- 심플 과거 진료내역 들어오는곳 -->
					</div>
					<div class="gap-row-16 w-100">
						<div class="dduk-inner-border record-content-fr" style="width:284px; height: 254px;">
							<h3 class="m-8">회진 내용</h3>
							<div  style="height: 170px; overflow-y: scroll;">
								<div class="spa-betw p-8" style="padding-bottom: 4px;"> 
									<div class="gray-text d-flex w-30">진단일</div> <div class="w-70 f-end clinicDt" id="admiClinicDt"></div>
								</div>
								<div class="spa-betw p-8" >
									<div class="gray-text d-flex w-30">진단내역</div> <div class="w-70 f-end injnm" id="admiClinicInjnm"></div>
								</div>
									<hr class="m-8"/>
								<div class="spa-betw p-8" style="padding-bottom: 4px;">
									<div class="gray-text d-flex w-30">주상병</div> <div class="w-70 f-end IDTY01" id="admiIDTY01"></div>
								</div>
								<div class="spa-betw p-8">
									<div class="gray-text d-flex w-30">주상병코드</div> <div class="w-70 f-end IDTY01cd" id="admiIDTY01cd"></div>
								</div>
									<hr class="m-8"/>
								<div class="spa-betw p-8" style="padding-bottom: 4px;">
									<div class="gray-text d-flex w-30">부상병</div> <div class="w-70 f-end IDTY02" id="admiIDTY02"></div>
								</div>
								<div class="spa-betw p-8">
									<div class="gray-text w-30">부상병코드</div> <div class="w-70 f-end IDTY02cd" id="admiIDTY02cd"></div>
								</div>
							</div>
						</div>
						<div class="dduk-inner-border record-content-fr" style="width:272px; height: 254px; z-index: auto;">
							<h3 class="m-8">담당의 소견</h3>
							<div class="record-img-scroll" id="patientAdmiOpinion" style="height: 170px;">
									
							</div>
						</div>
					</div>
					<div>
						
					</div>
					<div class="dduk-inner-border w-100" style="height: 300px;">
						<h3 class="subTitle-margin">오더 내역 </h3>
						<div class="order-scroll" style="height: 220px;">
							<h4>검사</h4>
							<div class="order-detail">
								<table>
									<tr>
										<td class="gray-text w-20 testCd">코드</td>
										<td class="gray-text w-60">검사명</td>
										<td class="gray-text w-20">가격</td>
									</tr>
									<tbody id="admi-test-tbody">
									
									</tbody>
								</table>
							</div>
							<h4>처방</h4>
							<div class="order-detail">
								<table>
									<tr>
										<td class="gray-text mediCd">코드</td>
										<td class="gray-text mediNm">약품명</td>
										<td class="gray-text mediMaker">업체명</td>
										<td class="gray-text mdodDose">투여랑</td>
										<td class="gray-text mdodPer">투여횟수</td>
										<td class="gray-text mdodDay">기간</td>
									</tr>
									<tbody id="admi-medicien-tbody">
									</tbody>
								</table>
							</div>
							<h4>치료</h4>
							<div class="order-detail">
								<table>
									<tr>
										<td class="gray-text tmCd">코드</td>
										<td class="gray-text tmNm">치료명</td>
										<td class="gray-text insuYn">급여</td>
									</tr>
									<tbody id="admi-treatment-tbody">
									
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	
	<div class="dduk-body-border patient-note">
		<div class="subTitle-margin mar-b-8">
			<h3>환자 기록</h3>
		</div>
		<div class="spa-betw flex-d-col" style="height: 760px;">
			<div class="gap-ver-32 w-100 p-8 patientRecordBoard" id="patientRecordBoard">
				<div class="light-gray-text absolute-center h-100 w-100">환자를 선택해주세요</div>
			</div>
				<input class="record-input dduck-input" id="pareCont" name="pareCont" placeholder="환자 기록을 추가해주세요">
				<button id="createPatientRecordBtn"><img src="/resources/images/Arrowupward.png"></button>
		</div>
	</div>
	
	<!-- 	환자 추가 모달	 -->
	<c:import url="../common/modal.jsp"></c:import>
</html>