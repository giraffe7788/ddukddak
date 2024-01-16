<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
/* 돋보기 아이콘 */
.aside-nur-test{
	width: 196px;
	border-radius: 16px 0px 0px 16px;
	background: var(--bg-02, #DBF2F4);
	height: 56px;
	border-right: 4px solid var(--ci-01, #0ABAB5);
	margin-left: 4px;
	color: var(--ci-01, #0ABAB5);
}

#magnifyingGlass {
	width: 16px;
	height: 16px;
	margin-bottom: 1%;
}

.dduk-title-area {
	margin-top: -10px;
	margin-bottom: 0px;
}

.h1-default {
	display: hidden;
	text-align: center;
	width: 100%;
	margin-top: 300px;
	color: #8D9EA5 !important;
	font-size: 2.5em !important;
}

.info-input {
	height: 32px;
	margin-bottom: 45px;
	width: 105px;
}

.patient-info-div {
	gap: 18px;
	margin: 0px 10px 0px 10px;
	display: flex;
	flex-wrap: wrap;
}

.patient-info-left {
	text-align: right;
	width: 80px;
}

.patient-info-right {
	text-align: left;
	width: 180px;
}

.reception-center-div {
	height: 416px;
	width: 666px;
	margin-top: 30px;
}

/* 검색창 */
.search {
	width: 292px;
	height: 48px;
}

.search-btn {
	margin-left: 8px;
	padding: 4px 14px;
	border-radius: 12px;
	height: 38px;
}

.search-btn:hover {
	background: var(- -ci-01, #0ABAB5);
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

.autocomplete>div.active {
	background: #e0e5f6;
	color: #000;
}

.autocomplete>div {
	background: #f1f3f499;
	padding: .2rem .6rem;
}

/* 오더추가 시작 */
.rounds-table {
	width: 100%;
}

.td-padding {
	padding: 10px 0px 10px 5px;
}

.tr-column {
	background: #F8F9FC;
}

.medicine-order-day, .medicine-order-per, .medicine-order-dose {
	width: 20px;
	height: 20px;
	margin-right: 5px;
}

.medicine-order-qt {
	width: 25px;
	height: 20px;
	margin-right: 5px;
}

input[type=number] {
	-moz-appearance: textfield;
}
/* 오더추가 끝 */

/* 진단명 */
.clinic-history {
	resize: none;
	width: 50%;
	height: 50px;
}

.textarea-clinic-history-opinion {
	resize: none;
	width: 90%;
	height: 150px;
}

/* QR버튼 */
.qr-btn-container {
	display: flex;
	align-items: center;
}

.selected {
	background-color: #EDF8F9;
}

/* 대기 상태 버튼 */
.tIngBtn {
	width: 86px;
    margin-left: 10px;
}

.fmrBtn {
	margin-left: 9px;
	font-size: 13px;
}
</style>
<div class="dduk-body-border patient-list">
	<div>
		<div class="dduk-title-area">
			<h2>검사 대기환자 목록</h2>
		</div>
		<div class="dduk-x-pd8">
			<table class="patient-list-table" id="waitingQueue"
				style="text-align: center">
				<tr class="tr-padding">
					<th class="td-padding gray-text" style="width: 20px;">No</th>
					<th class="td-padding gray-text paName" style="width: 90px;">이름</th>
					<th class="td-padding gray-text" style="width: 110px;">생년월일</th>
					<th class="td-padding gray-text" style="text-align: center">상태</th>
				</tr>
				<tbody id="patientTbody">
				</tbody>
			</table>
		</div>
	</div>
</div>

<div class="dduk-body-border patient-detail"
	style="width: 700px; position: relative;">
	<div class="dduk-title-area" style="margin-bottom: -20px;">
		<div class="d-flex align-items-center">
			<h2 id="in-h2">차트</h2>
			<span id="paInfo" class="gray-text mar-b-8 mar-l-8"></span>
		</div>
	</div>
	<hr style="width: 670px;">
	<div>
		<div>
			<div class="dduk-title-area">
				<h2>환자 정보</h2>
			</div>
			<div class="dduk-inner-border record-content-fr record-scroll">
				<div class="patient-info-div">
					<div class="dduk-row"
						style="width: 600px; justify-content: space-between;">
						<h3 class="in-h2" id="paInfoNo">환자번호 :</h3>
						<h3 class="in-h2" id="paInfoName">이름 :</h3>
						<h3 class="in-h2" id="paInfoSex">성별 :</h3>
						<h3 class="in-h2" id="paAge">나이 :</h3>
					</div>
					<div class="dduk-row"
						style="width: 600px; justify-content: space-between;">
						<h3 class="in-h2" id="paInfoBldType">혈액형 :</h3>
						<h3 class="in-h2" id="paInfoHeight">키 :</h3>
						<h3 class="in-h2" id="paInfoWeight">몸무게 :</h3>
						<h3 class="in-h2" id="paInfoInsrYn">보험여부 :</h3>
					</div>
				</div>
			</div>
		</div>
		<div class="reception-center-div">
			<div class="dduk-title-area">
				<h2>진단 내역</h2>
			</div>
			<div class="dduk-inner-border"
				style="height: 520px; overflow-y: scroll;">
				<h3 class="subTitle-margin">의사소견</h3>
				<input type="text" class="dduck-input clinic-history clinicOpinion"
					style="height: 120px; width: 100%;" readonly="readonly" /> <br>
				<br>
				<!-- 상병부분 -->
				<div class="d-flex">
					<h3>검사오더</h3>
				</div>
				<table class="clinic-table test-list-table">
					<thead>
						<tr class="tr-padding tr-column">
							<th class="td-padding gray-text" style="width: 150px">검사이름</th>
							<th class="td-padding gray-text" style="width: 150px">검사자</th>
							<th class="td-padding gray-text" style="width: 200px">검사결과</th>
							<th class="td-padding gray-text" style="width: 65px">환부</th>
							<th class="td-padding gray-text" style="width: 100px">검사여부</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
				<br> <br>
				<br>


			</div>
		</div>

	</div>

</div>

<div class="gap-ver-16">
	<div class="dduk-body-border patient-note"
		style="width: 550px; height: 50%; position: relative;">
		<div class="dduk-title-area" style="margin-bottom: -20px;">
			<div class="d-flex align-items-center">
				<h2 id="in-h2">처치 오더</h2>
				<span id="paInfo" class="gray-text mar-b-8 mar-l-8"></span>
			</div>
		</div>
		<hr style="width: 500px;">
		<div class="d-flex"></div>
		<div class="table-medicine-order">
			<table class="medicine-table" style="width: 516px;">
				<thead>
					<tr class="tr-padding tr-column">
						<th class="td-padding gray-text w-25">분류</th>
						<th class="td-padding gray-text w-40">이름</th>
						<th class="td-padding gray-text w-15">함량</th>
						<th class="td-padding gray-text w-20">처치여부</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
		<br>
	</div>
	<div class="dduk-inner-border patient-note"
		style="width: 550px; height: 50%; position: relative;">
		<div class="dduk-title-area" style="margin-bottom: -20px;">
			<div class="d-flex align-items-center">
				<h2 id="in-h2">QR코드</h2>
				<span id="paInfo" class="gray-text mar-b-8 mar-l-8"></span>
			</div>
		</div>
		<hr style="width: 500px;">
		<div class="dduk-row">
			<div id="qrDiv" class="dduk-inner-border" style="width: 300px; height: 300px;">
				<img id="qrCodeImage" src="" style="margin: 25px 30px;" />
			</div>
			<div class="qr-btn-container">
				<button class="dduk-btn-normal" id="submitBtn"
					style="margin-right: 10px;">생성</button>
				<button class="dduk-btn-normal" id="printBtn">출력</button>
			</div>
		</div>

	</div>
</div>

<!--  모달	 -->
<c:import url="../common/modal.jsp"></c:import>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<script>
$(document).ready(function() {
	$('.aside-nur-test').find('svg').find('path').attr('fill', '#0ABAB5');
	$('.aside-nur-test').find('.dduk-nav-menu').css('color', '#0ABAB5');
});

$(function(){
	testPatList();
	
	//이름 등이 글자를 제어하고 싶을 때 maxLength까지만 표시
	function truncateText(text, maxLength) {
		if (text.length > maxLength) {
			return text.slice(0, maxLength) + '...';
		} else {
		    return text;
		}
	}

	//주민번호를 생년월일로 변환
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

	//생일로 만나이 계산
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

	//날짜형식 데이터를 넣으면 yyyy-MM-dd(요일) 로 변환해주는 함수
	function formatDateString(dateString) {
		// 요일먼저 얻기
		const week = ['일', '월', '화', '수', '목', '금', '토'];
		const dayOfWeek = week[new Date(dateString).getDay()];
		
		const dateData = new Date(dateString);
		let year = dateData.getFullYear();
		let month = dateData.getMonth() + 1; 
		let date = dateData.getDate()
		
		let dateStr = `\${year}-\${month}-\${date}(\${dayOfWeek})`;
		
		return dateStr;
	}

	// 검사 대기 환자 조회
	function testPatList(){
		$.ajax({
			url: '/nurse/getTestPatList',
			type: 'post',
			dataType: 'json',
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: function(rst){
				console.log("rst : ", rst);
				let paInfo = '';
				
				$.each(rst, function(index, vo){
					
					paInfo += `
					<tr class="tr-padding tr-paInfo" data-pano="\${vo.paNo}" data-clinicNo=\${vo.clinicChartVOList[0].clinicNo} >
						<td class="td-padding">\${index + 1}</td>
						<td height="48px" class="td-padding">\${truncateText(vo.paName, 4)}</td>
						<td class="td-padding">\${formatResidentNumber(vo.paReg)}</td>
					    <td class="td-padding" style="width:100px; height:10px;"">
					`;				
					
					// 진료상태코드 가져오기
					let clinicState = vo.clinicChartVOList[0].clinicState;
					
					if(clinicState === 'CRST02'){
						 paInfo += '<button class="dduk-btn-info btn-state sttBtn" style="margin-left: 20px;" value="' + clinicState + '" >검사중</button>';
					} else if(clinicState === 'CRST05'){
						paInfo += '<button class="dduk-btn-disabled btn-medicine-order-state tIngBtn sttBtn" id="wtBtn" value="' + clinicState + '">검사대기중</button>';
					} else if(clinicState === 'CRST06'){
						paInfo += '<button type="button" class="dduk-btn-danger fmrBtn sttBtn" style="width: 86px;" value="' + clinicState + '">처치대기중</button>';
					} else if(clinicState === 'CRST07'){
						paInfo += '<button type="button" class="dduk-btn-info btn-state sttBtn" style="margin-left: 12px;" value="' + clinicState + '">처치중</button>';
					}
					
					paInfo += '</td>';
					paInfo += '</tr>';
				});
				
				$('#patientTbody').html(paInfo);
			},
			error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
			}
		});
	}

	// 검사오더 내 검사대기 버튼 누를 때 이벤트
	$(document).on('click', '.test-f-btn', function(e){
		Swal.fire({
			title: '검사 결과를 저장하시겠습니까?',
			icon: 'question',
			showCancelButton: true,
			confirmButtonColor: '#0ABAB5',
			cancelButtonColor: '#8D9EA5',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			// 확인버튼 누를 시
			if (result.isConfirmed) {
				// 클릭한 버튼 행 선택
				let thisRow = $(this).closest('tr').find('td:eq(2)').find(".test-input"); 
				
				// 해당 검사에 값이 들어와있는지 검증, 없으면 return 
				if($(thisRow).val() === null || $(thisRow).val() === ''){
					Swal.fire({
						title: '검사 결과를 입력해주세요',
						icon: 'warning',
						confirmButtonColor: '#0ABAB5',
						confirmButtonText: '확인',
					})
					return;
				}
				
				// DB에 넣을 데이터처리
				let formData = new FormData();
				let testCd = $(this).closest('tr').data('testcd');
				let clinicNo = $('.tr-paInfo.selected').data('clinicno');
				formData.append('testCd', testCd);
				formData.append('clinicNo', clinicNo);
				
				// 만약 지금 하는 검사가 소변/피 검사면
				if($(this).closest('tr').data('testcd') === 'TEST001' || $(this).closest('tr').data('testcd') === 'TEST003'){
					let teodRst = $(thisRow).val();
					formData.append('teodRst', teodRst);
				// 지금 하는 검사가 그 외의 검사면(파일)
				} else {
					let fileInput = $(this).closest('tr').find('td:eq(2)').find("input[type='file']").get(0).files;
					console.log(fileInput);

					if (fileInput && fileInput.length > 0) {
					    $.each(fileInput, function(index, file){
					        formData.append('uploadFile', file);
					    })
					} else {
					    console.error('No files selected or file input not found.');
					}
				}
				
				let thisBtn = $(this);
				
				$.ajax({
			        url: '/nurse/updateTestOrder',
			        data: formData,
			        type: 'post',
			        processData: false,
		    		contentType: false,
		    		enctype: 'multipart/form-data',
			        beforeSend:function(xhr){
						xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
					},
			        success: function(rst) {
			        	console.log(formData, '로 검사결과 등록한 결과: ', rst);
			        	// 검사완료로 버튼 변경
						$(thisBtn).replaceWith('<button class="dduk-btn-info btn-medicine-order-state" disabled>검사완료</button>');
						
						// 해당 행 input 입력 막기
						thisRow.attr("disabled", true);
			 			let testRst = thisRow.val();
			 			console.log(testRst);
			 			console.log(thisRow.data());
			 			
			 			// Swal띄우기
						Swal.fire({
							title: '검사가 완료되었습니다!',
							icon: 'success',
							confirmButtonColor: '#0ABAB5',
							confirmButtonText: '확인',
						})
			        },
			        error: function (error) {
			            console.log(error);
			        }
			    });
			}
		});
	});

	//처치 오더 내 처치 대기 버튼 누를 때 이벤트
	$(document).on('click', '.dduk-btn-disabled.btn-mini', function(){
		Swal.fire({
			title: '처치 상태를 변경하시겠습니까?',
			icon: 'question',
			showCancelButton: true,
			confirmButtonColor: '#0ABAB5',
			cancelButtonColor: '#8D9EA5',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			// 확인버튼 누를 시
			if (result.isConfirmed) {
				
				// 이름 및 클래스 변경
				$(this).removeClass('dduk-btn-disabled');
				$(this).addClass('dduk-btn-info');
				$(this).text('처치완료');
				
				// DB에 반영
				let clinicNo = $('.tr-paInfo.selected').data('clinicno');
				let mediCd = $(this).data('medicd');
				let data = {
					'clinicNo' : clinicNo,
					'mediCd' : mediCd
				};
				
				$.ajax({
		    		url: '/nurse/updateMedicineOrderState',
		    		data: JSON.stringify(data),
		    		contentType: "application/json; UTF-8",
		    		dataType: 'json',
		    		type: 'post',
		    		beforeSend:function(xhr){
		    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		    		},
		    		success: function(rst){
		    			//console.log(data, '를 기준으로 바꾼 처방오더상태 업데이트 결과 : ', rst);
		    			
		    			Swal.fire({
		    				title: '상태가 변경되었습니다!',
		    				icon: 'success',
		    				confirmButtonColor: '#0ABAB5',
		    				confirmButtonText: '확인',
		    			})
		    		},
		    		error: function(xhr, status, error){
		    			console.log('Error:', xhr, status, error);
		    		}
				})
			}
		});
	});

	// 지금 조회중인 진료번호
	let currentClinicNo = '';

	// 목록에서 환자 클릭하면 정보 출력
	$(document).on("click", ".tr-paInfo", function() {
		
		// 만약 지금 누른 게 버튼이면 실행 x
		if($(event.target).hasClass('sttBtn')){
			return;
		}
		
		// 진료 상태를 가져옴
		let clinicState = $(this).find('button').text();
		let title = '';
		
		// 만약 진료 상태가 검사 대기이면
		if(clinicState === '검사대기중'){
			title = '검사를 진행하시겠습니까?';
		// 만약 진료 상태가 검사 중이면
		} else if(clinicState === '검사중'){
			title = '검사를 이어서 진행하시겠습니까?';
		} else if(clinicState === '처치대기중'){
			title = '처치를 진행하시겠습니까?';
		} else if(clinicState === '처치중'){
			title = '처치를 이어서 진행하시겠습니까?';
		}
		
		Swal.fire({
			title: title,
			icon: 'question',
			showCancelButton: true,
			confirmButtonColor: '#0ABAB5',
			cancelButtonColor: '#8D9EA5',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			// 확인 버튼 클릭시
			if (result.isConfirmed) { 
				
				// 최근 조회한 진료번호를 갱신
				currentClinicNo = $(this).data('clinicno');
				
				// 만약 진료 상태가 검사 대기이면 DB를 바꿔주는 작업 추가로 진행
				if(clinicState === '검사대기중'){
					
					console.log("이러면 검사 시작");
					$(this).find('td').eq(3).html('<button class="dduk-btn-info btn-state sttBtn" style="margin-left: 20px;" value="CRST02" >검사중</button>');
					$(".test-input").prop("disabled", false);
					$(".test-f-btn").prop("disabled", false);
					
					// DB에도 수정
					let data = {
						'clinicNo' : currentClinicNo,
						'clinicState' : 'CRST02'
					}
					
					$.ajax({
				        url: '/clinic/updateClinicState',
				        data: JSON.stringify(data),
				        contentType: "application/json; UTF-8",
				        type: 'post',
				        beforeSend:function(xhr){
							xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
						},
				        success: function (rst) {
				        	console.log(data, '로 검사중으로 DB수정한 결과 : ', rst);
				        },
				        error: function (error) {
				            console.log(error);
				        }
				    });
					
				// 만약 진료 상태가 처치대기면 DB를 처치중으로 바꿔주는 작업 추가로 진행
				} else if(clinicState === '처치대기중') {
					
					console.log("이러면 처치 시작");
					$(this).find('button').replaceWith('<button class="dduk-btn-info btn-state sttBtn" style="margin-left: 20px;" value="CRST07" >처치중</button>');
					$(".test-input").prop("disabled", false);
				
					// DB에도 처치중으로 수정
					let data = {
						'clinicNo' : currentClinicNo,
						'clinicState' : 'CRST07'
					}
					
					$.ajax({
				        url: '/clinic/updateClinicState',
				        data: JSON.stringify(data),
				        contentType: "application/json; UTF-8",
				        type: 'post',
				        beforeSend:function(xhr){
							xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
						},
				        success: function (rst) {
				        	console.log(data, '로 처치중으로 DB수정한 결과 : ', rst);
				        },
				        error: function (error) {
				            console.log(error);
				        }
					});
					
				}
				
				// 방금 클릭한거에 selected 클래스 추가 및 다른 환자리스트엔 selected클래스 제거
				$('.tr-paInfo').removeClass('selected');
				$(this).addClass('selected');
				
				// 클릭한 환자의 검사진행중/검사대기중 인 진료번호를 가져옴
				let clinicNo = $(this).data('clinicno');
				
				// 검사 종류에 맞게 입력 / 파일 첨부
				let testType = '';
				// 클릭한 환자 번호로 DB 조회용 변수 생성
				let paNo = $(this).data('pano');
				let paData = {"paNo" : paNo};
				
				// 다른 환자 클릭 시 QR코드 칸 초기화
				$('#qrCodeImage').attr('src', '');
				
				// 클릭한 환자 정보 진단내역 출력
				$.ajax({
					url: '/nurse/getTestPatDetail',
					data: {'clinicNo' : clinicNo},
					dataType: 'json',
					type: 'post',
					beforeSend:function(xhr){
						xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
					},
					success: function(rst){
						
						$(".in-h2").empty();
						console.log('진료번호 ', clinicNo, "로 가져온 환자정보 및 진료VO : ", rst);
						
						// 환자 정보 출력
						let paBirthDay = formatResidentNumber(rst.paReg);
						let paAge = getAge(paBirthDay);
						
						$('#paInfoNo').html("환자번호 : " + rst.paNo);
						$('#paInfoName').html("이름 : " + rst.paName);
						$('#paInfoSex').html("성별 : " + rst.paSex);
						$('#paAge').html("나이 : " + paAge+"세("+paBirthDay+")");
						$('#paInfoBldType').html("혈액형:" + rst.paBldType + "형");
						$('#paInfoHeight').html("키 : " + rst.paHeight + "cm");
						$('#paInfoWeight').html("몸무게 : " + rst.paWeight + "kg");
						if(rst.paInsrYn == 'ISYN01'){
							$('#paInfoInsrYn').html("보험여부 : 보유");
						} else {
							$('#paInfoInsrYn').html("보험여부 : 미보유");
						}
						
						// 진단명, 소견 출력
						$(".clinicOpinion").val(rst.clinicChartVOList[0].clinicOpinion);
						
						// 검사 출력 부분
						// 만약 검사목록이 없으면
						if(rst.clinicChartVOList[0].testOrderVOList.length === 0){
							let cont = '<tr><td colspan="5" style="text-align:center; font-size: 15px;">검사 오더가 없습니다</td><tr>';
							$('.test-list-table tbody').html(cont);
						} else {
							let cont = '';
							$.each(rst.clinicChartVOList[0].testOrderVOList, function(index, testOrderVO){
								//console.log(rst);
								// 검사자 없으면 -로 나오게
								let testOrderEmpName = testOrderVO.testOrderEmpName;
								if(testOrderEmpName === null){
									testOrderEmpName = '-';
								}
								
								// 검사결과 미리 저장해놓기
								let teodRst = '';
								// 검사 결과가 없을 때
								if(testOrderVO.teodRst === null && testOrderVO.atchFileCd === null){
									//console.log(testOrderVO.testCd);
									teodRst = '';
									if(testOrderVO.testCd === 'TEST001'){
										teodRst = `
											<div class="dduk-row test-order-info" data-test-cd="TEST001">
												<input type="number" class="dduck-input info-input test-input" style="margin-bottom: -55px;" id="TEST001" /> (10³/μL) 
											</div>
										`;
									} else if(testOrderVO.testCd === 'TEST003') {
										teodRst = `
											<div class="custom-file test-order-info" data-test-cd="TEST003">
												<input type="number" class="dduck-input info-input test-input" id="TEST003" /> mg/dL 미만 
											</div>
										`;
									} else {
										teodRst = `
											<div class="custom-file">
												<input type="file" class="dduck-input info-input test-input" name="uploadFile" id="uploadFile" style="width: 180px;background: #eeeeee21;border: 0;" multiple /> 
											</div>
										`;
									}
								// 글, 수치로된 검사 결과가 있을 때
								} else if (testOrderVO.teodRst !== null){
									teodRst = testOrderVO.teodRst;
								// 사진으로된 검사 결과가 있을 때
								} else {
									// 사진들 json형식으로 저장해놓기
									let jsonData = '';
									jsonData = '{\"atchFileDetailVOList\": [';
									
										$.each(testOrderVO.atchFileVO.atchFileDetailVOList, function(i, detailVO){
											jsonData += '{"atchFileDetailOrlng": "'+detailVO.atchFileDetailOrlng+'", "atchFileDetailSavenm": "'+detailVO.atchFileDetailSavenm+'"}';
				
											if(testOrderVO.atchFileVO.atchFileDetailVOList.length != (i+1)){
												jsonData += ',';
											}
										})
										
									jsonData += ']}';
									
									teodRst = `
										<div class="viewTestResult" data-resultJson='\${jsonData}' data-bs-toggle="modal" data-bs-target="#viewTestOrderResult">
											결과보기
											<img id="magnifyingGlass" src="/resources/images/icons/magnifying-glass.png" alt="magnifyingGlass.png" />
										</div>	
									`;
								}
								
								// 검사여부 판단 하기
								let isDone = false;
								// 검사자가 있으면서 검사결과가 있으면 검사가 끝난거
								if(testOrderEmpName !== '-' && teodRst !== '-'){
									isDone = '<button class="dduk-btn-info btn-test-order-state" disabled>검사완료</button>';
								} else {
									isDone = '<button class="dduk-btn-disabled btn-test-order-state test-f-btn">검사대기</button>';
								}
								
								cont += `
									<tr data-testcd="\${testOrderVO.testCd}" class="tr-padding">
										<td class="td-padding gray-text">\${testOrderVO.testVO.testNm}</td>
										<td class="td-padding gray-text">\${testOrderEmpName}</td>
										<td class="td-padding gray-text">\${teodRst}</td>
										<td class="td-padding gray-text">\${testOrderVO.testOrderBodyCdNm}</td>
										<td class="td-padding gray-text">\${isDone}</td>
									</tr>
								`;
								
								$('.test-list-table tbody').html(cont);
							});
						}
						
						// 처치 오더 생성부분
						$('.table-medicine-order tbody').html('');
						
						// 만약 처치 오더 없으면 기본메시지
						if(rst.clinicChartVOList[0].medicineOrderVOList.length === 0){
							let cont = '<tr><td colspan="5" style="text-align:center; font-size: 15px;">처치 오더가 없습니다</td></tr>';
							$('.table-medicine-order tbody').html(cont);
						} else {
							let tbodyTr = '';
							$.each(rst.clinicChartVOList[0].medicineOrderVOList, function(index, medicineOrderVO){
								
								if(medicineOrderVO.medicineVO.mediDetail === '기타 처방' || medicineOrderVO.medicineVO.mediDetail === '주사') {
									
									// 만약 주사면 함량이 나와야되고 기타처방이면 안나와야함
									let mediCont = medicineOrderVO.medicineVO.mediCont;
									if(mediCont === 0){
										mediCont = '-';
									} else {
										mediCont = medicineOrderVO.medicineVO.mediCont + 'ml';
									}
									
									// 처치대기, 처치완료 버튼 미리 생성해놓기
									let mediOrderState = '';
									if(medicineOrderVO.mdodPfyn == 'MPYN01'){
										mediOrderState = `
											<button data-medicd="\${medicineOrderVO.mediCd}" class="dduk-btn-disabled btn-mini medi-state test-input">
											처치대기
											</button>
										`
									} else {
										mediOrderState = `
											<button class="dduk-btn-info btn-mini medi-state">
											처치완료
											</button>
										`
									}
									
									tbodyTr += `
										<tr class="tr-padding">
											<td class="td-padding gray-text">\${medicineOrderVO.medicineVO.mediDetail}</td>
											<td class="td-padding gray-text">\${medicineOrderVO.medicineVO.mediNm}</td>
											<td class="td-padding gray-text">\${mediCont}</td>
											<td class="td-padding gray-text">\${mediOrderState}</td>
										</tr>
									`;
								}
							});
							
							$('.table-medicine-order tbody').html(tbodyTr);
						}
					},
					error: function(xhr, status, error){
						console.log('Error:', xhr, status, error);
					}
				});
			}
		});
	});	
	
	// QR코드 '생성' 버튼 클릭 시 선택된 환자 번호 토대로 QR코드 생성
	$(document).on('click', '#submitBtn', function(){
		let paNo = $('.tr-paInfo.selected').data('pano');
		console.log(paNo);
			
		$.ajax({
	        url: '/nurse/getQRcode',
	        data: {'paNo' : paNo},
	        type: 'post',
	        beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
	        success: function (data) {
	        	console.log('성공');
	        	console.log(data.base64Encoded);
	        	
	        	$('#qrCodeImage').attr('src', 'data:image/png;base64,' + data.base64Encoded);
	        	
	        },
	        error: function (error) {
	            console.error('실패');
	            Swal.fire({
					title: '환자를 선택해주세요',
					icon: 'warning',
					confirmButtonColor: '#0ABAB5',
					confirmButtonText: '확인',
				})
				return;
	        }
	    });
	});
	
	// QR코드 출력 버튼 클릭 이벤트
	$(document).on('click', '#printBtn', function(){
		// QR코드 validation
		var paNo2 = $('.tr-paInfo.selected').data('pano');
		if(paNo2 === undefined){
			Swal.fire({
				title: '환자를 선택해주세요',
				icon: 'warning',
				confirmButtonColor: '#0ABAB5',
				confirmButtonText: '확인',
			})
			return;
		}
		
		const img = $('#qrCodeImage');
		const src = $(img).attr('src');
		console.log(src);
		if( src === "" || src === null){
			Swal.fire({
				title: 'QR코드를 먼저 생성해주세요',
				icon: 'warning',
				confirmButtonColor: '#0ABAB5',
				confirmButtonText: '확인',
			})
			return;
		}

		// QR코드 프린트 팝업창 띄우기
		var sw = screen.width;
		var sh = screen.height;
		var w = 500; // 팝업창 가로길이
		var h = 500; // 세로길이
		var xpos = (sw - w) / 2; // 화면에 띄울 위치
		var ypos = (sh - h) / 2; // 중앙에 띄웁니다.
		var title = "Your QRcode"; // 여기에 제목을 지정하세요.
		var pHeader = "<html><head><link rel='stylesheet' type='text/css' href='/Exp_admin/css/print.css'><title>" + title + "</title></head><body>";
		var pgetContent = document.getElementById("qrDiv").innerHTML + "<br>";
		var pFooter = "</body></html>";
		var pContent = pHeader + pgetContent + pFooter;

		var pWin = window.open("", "print", "width=" + w + ",height=" + h + ",top=" + ypos + ",left=" + xpos + ",status=yes,scrollbars=yes"); // 동적인 새창을 띄웁니다.
		pWin.document.open(); // 팝업창 오픈
		pWin.document.write(pContent); // 새롭게 만든 HTML 소스를 씁니다.
		pWin.document.close(); // 클로즈
		pWin.print(); // 윈도우 인쇄 창 띄우고
		pWin.onafterprint = function() {
		    pWin.close(); // 프린트가 되거나 취소되면 팝업창을 닫습니다.
		};

	});
	
	// 환자의 과거 진료내역중 검사결과의 사진결과 처리 스크립트
	// 사진결과를 누를 때 해당 사진 결과들을 모달창에 집어넣음
	$(document).on('click', '.viewTestResult', function(){
		
		let resultJson = $(this).data('resultjson');
		let cont = '';
		console.log('사진 결과들의 json데이터 : ', resultJson);
		
		// 만약 사진이 1개밖에 없으면 버튼이 안보이게
		if(resultJson.atchFileDetailVOList.length == 1){
			$('#testOrderResultPrev').css('visibility', 'hidden');
			$('#testOrderResultNext').css('visibility', 'hidden');
		// 1개 이상이면 다시 보이게
		} else {
			$('#testOrderResultPrev').css('visibility', 'visible');
			$('#testOrderResultNext').css('visibility', 'visible');
		}
		
		// 사진 개수만큼 반복
		$.each(resultJson.atchFileDetailVOList, function(index, vo){
			// 변수에 해당 정보들을 집어넣는다
			cont += `<div class="carousel-item `;
			
			// 첫번째 캐러셀을 섬네일?로
			if(index == 0){
				cont += `active`;
			}
			
			cont +=	`">
					<img src="/resources/upload/testOrderResult/\${vo.atchFileDetailSavenm}" class="d-block w-100" alt="\${vo.atchFileDetailOrlng}">
				</div>`;
		})
		
		// 캐러셀 모달에 해당 정보들을 넣음
		$('#testOrderResultSlide').html(cont);
	});
	
	// 목록에서 환자 선택 후 상태 버튼 클릭 이벤트
	$(document).on('click', '.sttBtn', function(){
		btnVal = $(this).val();
		console.log(btnVal);
		
		// 검사중 버튼 누르면 검사입력창 막히고 완료 바뀌고 DB 내용 바꿈  
		if(btnVal === 'CRST02') {
			
			// 지금 누른 검사중 버튼의 tr의 진료번호 === 지금 보고있는 진료번호 면 (지금 조회중인 진료가 방금 누른 버튼의 진료면)
			// 검사 완료를 하실건지 묻기
			if($(this).closest('tr').data('clinicno') === currentClinicNo){
				
				Swal.fire({
					title: '검사를 완료하시겠습니까?',
					icon: 'question',
					showCancelButton: true,
					confirmButtonColor: '#0ABAB5',
					cancelButtonColor: '#8D9EA5',
					confirmButtonText: '확인',
					cancelButtonText: '취소'
				}).then((result) => {
					// 확인 버튼 클릭시
					if (result.isConfirmed) { 
						
						// 모든 검사가 끝났는지 검증
						let buttons = $('.test-list-table .btn-test-order-state');
						let isDone = true;
						// 모든 검사오더 검사여부를 가져옴
						$.each(buttons, function(index, button){
							// 만약 하나라도 검사대기인 친구가 있다면
							if($(button).text() === '검사대기'){
								// 검사는 아직 안끝난것
								isDone = false;
							}
						});
						
						// 검사가 안끝난게 있으면 return
						if(!isDone){
							Swal.fire({
								title: '아직 검사가 진행중입니다',
								icon: 'warning',
								confirmButtonColor: '#0ABAB5',
								confirmButtonText: '확인',
							})
							return;
						}
						
						// DB에도 검사완료로 수정
						let data = {
							'clinicNo' : $('.tr-paInfo.selected').data('clinicno'),
							'clinicState' : 'CRST03'
						}
						
						$.ajax({
					        url: '/clinic/updateClinicState',
					        data: JSON.stringify(data),
					        contentType: "application/json; UTF-8",
					        type: 'post',
					        beforeSend:function(xhr){
								xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
							},
					        success: function (rst) {
					        	console.log(data, '로 검사완료로 DB수정한 결과 : ', rst);
					        	
					        	// Swal띄우기
								Swal.fire({
									title: '검사가 모두 완료되었습니다!',
									icon: 'success',
									confirmButtonColor: '#0ABAB5',
									confirmButtonText: '확인',
								}).then((result) => {
									location.reload();
								});
					        },
					        error: function (error) {
					            console.log(error);
					        }
						});
					
					//취소
					} else if (result.isDismissed) { 
					    	return false;
					}
				});
			}
			
		// 처치중 버튼 누르면 처치여부 버튼 막히고 처치완료 바뀌고 DB 내용 바꿈  
		} else if(btnVal === 'CRST07'){
			
			// 지금 누른 검사중 버튼의 tr의 진료번호 === 지금 보고있는 진료번호 면 (지금 조회중인 진료가 방금 누른 버튼의 진료면)
			// 검사 완료를 하실건지 묻기
			if($(this).closest('tr').data('clinicno') === currentClinicNo){
				Swal.fire({
					title: '처치를 완료하시겠습니까?',
					icon: 'question',
					showCancelButton: true,
					confirmButtonColor: '#0ABAB5',
					cancelButtonColor: '#8D9EA5',
					confirmButtonText: '확인',
					cancelButtonText: '취소'
				}).then((result) => {
					// 확인 버튼 클릭시
					if (result.isConfirmed) { 
						
						// 모든 처치가 끝났는지 검증
						let buttons = $('.medicine-table .medi-state');
						let isValidated = true;
						// 모든 처치 오더 처치여부를 가져옴
						$.each(buttons, function(index, button){
							// 만약 하나라도 처치대기인 친구가 있다면
							if($(button).text().trim() === '처치대기'){
								// 검증실패
								isValidated = false;
							}
						})
						
						if(!isValidated){
							Swal.fire({
								title: '아직 처치가 진행중입니다',
								icon: 'warning',
								confirmButtonColor: '#0ABAB5',
								confirmButtonText: '확인',
							})
							return;
						}
						
						// DB에도 처치완료로 수정
						let data = {
							'clinicNo' : $('.tr-paInfo.selected').data('clinicno'),
							'clinicState' : 'CRST08'
						}
						
						$.ajax({
					        url: '/clinic/updateClinicState',
					        data: JSON.stringify(data),
					        contentType: "application/json; UTF-8",
					        type: 'post',
					        beforeSend:function(xhr){
								xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
							},
					        success: function (rst) {
					        	console.log(data, '로 처치완료로 DB수정한 결과 : ', rst);
					        	
					        	// Swal띄우기
								Swal.fire({
									title: '처치가 모두 완료되었습니다!',
									icon: 'success',
									confirmButtonColor: '#0ABAB5',
									confirmButtonText: '확인',
								}).then((result) => {
									location.reload();
								})
					        },
					        error: function (error) {
					            console.log(error);
					        }
						});
					//취소
				    } else if (result.isDismissed) { 
				    	return false;
				    }
				});
			}
		}
	});
});
</script>
