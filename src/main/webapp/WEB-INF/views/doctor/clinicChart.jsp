<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>

#complete1 {
	position: relative;
    left: -15px;
    top: -5px;
}

#complete2 {
    position: relative;
    left: -15px;
    top: -5px;
}

#complete3 {
    position: relative;
    left: -45px;
    top: -5px;
}

.aside-doc-diag{
	width: 196px;
	border-radius: 16px 0px 0px 16px;
	background: var(--bg-02, #DBF2F4);
	height: 56px;
	border-right: 4px solid var(--ci-01, #0ABAB5);
	margin-left: 4px;
	color: var(--ci-01, #0ABAB5);
}

input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}

/* Firefox */
input[type=number] {
  -moz-appearance: textfield;
}

/* reset */
ul {
	margin: 0;
	padding: 0;
}

/* design */
.selectbox {
	margin: 150px auto;
}

.pl {
	width: 80px;
	height: 35px;
	border: 1px solid #C4C4C4;
	box-sizing: border-box;
	padding: 12px 13px;
	font-style: normal;
	font-weight: 400;
	font-size: 14px;
	line-height: 16px;
	appearance: none;
	align-items: center;
    gap: 10px;
    border-radius: 7px;
    border: 2px solid var(--black-05, #DBF2F4);
    background: var(--black-05, #DBF2F4) !important;
    font-family: 'Pretendard5';
    color: var(--black-03, #0abab5);
}

.pl:focus {
	outline: 2px solid var(--ci-01, #0ABAB5);
}

.btn-save-listbox {
	width: 85px;
	list-style: none;
	background: #FFFFFF;
	border: 1px solid #C4C4C4;
	box-sizing: border-box;
	box-shadow: 4px 4px 14px rgba(0, 0, 0, 0.15);
	border-radius: 10px;
	margin-top: 9px;
	visibility: hidden; 
	position: absolute;
	margin: 45px 785px;
	z-index: 100;
}

.btn-save-listbox.active {
	visibility: visible;
}

.btn-save-list {
	border: none;
	background-color: #FFFFFF;
	font-family: 'Pretendard5';
	line-height: 16px;
	padding: 7px 10px;
	margin: 5px 7px;
	box-sizing: border-box;
}

.h1-default {
	text-align: center;
	width: 100%;
	margin-top: 300px;
	color: #8D9EA5 !important;
	font-size: 2.5em !important;
}

.chart1 {
	height: 100%;
	width: 20%;
}

.chart2 {
	height: 100%;
	width: 60%;
}

.chart3 {
	height: 48.5%;
	width: 100%;
}

.chart4 {
	margin-top: 6%;
	height: 48.5%;
	width: 100%;
}

.chart-wrap {
	height: 100%;
	width: 20%;
}

.div-info-top {
	margin-top: 10%;
	display: flex;
	justify-content: space-around;
	color: #F8F9FC;
}

.div-info {
	display: flex;
	justify-content: space-around;
}

.div-info:hover {
	background-color: #EDF8F9;
}

.div-info p {
	margin-top: 3%;
	margin-bottom: 3%;
}

.info1 {
	width: 40px;
}

.info2 {
	width: 120px;
}

.info3 {
	width: 100px;
}

.selected {
	background-color: #EDF8F9;
}

.myhr {
	width: 954px;
	height: 1px;
	flex-shrink: 0;
	background: #EBEFF0;
	margin-left: -24px;
}

.aside-ams-patient {
	width: 196px;
	border-radius: 16px 0px 0px 16px;
	background: var(- -bg-02, #DBF2F4);
	height: 56px;
	border-right: 4px solid var(- -ci-01, #0ABAB5);
	margin-left: 4px;
	color: var(- -ci-01, #0ABAB5);
}

.patient-detail {
	width: 1206px;
	height: 100%;
	flex-shrink: 0;
}

.patient-note {
	width: 360px;
}

.search {
	background-image: url(/resources/images/Search.png);
	background-repeat: no-repeat;
	background-position: 252px center;
	width: 292px;
	height: 48px;
}

.record-input {
	background-image: url(/resources/images/Arrowupward.png);
	background-repeat: no-repeat;
	background-position: 272px center;
	width: 312px;
	height: 48px;
}

.dduk-vertical-line {
	height: 642px;
	margin-top: -18px;
	margin-left: 272px;
}

hr {
	margin: -8px 0 16px -16px;
	background: var(- -border, #EBEFF0);
	height: 1px;
}

.record-content-fr {
	height: 343px;
}

.notice-text {
	height: 100%;
	text-align: center;
	display: flex;
	flex-direction: column;
	justify-content: space-around;
	font-size: 1.7em;
}

.gap-ver-16 {
	height: 94.5%;
}

.record-content-fr {
	height: 100%;
	width: 284px;
}

.btn-state {
	font-size: 10.9px;
	padding: 4px 8px;
	width: 100%;
}

.dduck-input {
	position: relative;
	z-index: 99;
}

.reason-box {
	width: 90%;
	height: 100px;
	resize: none;
}

.opinion-box {
	width: 90%;
	height: 150px;
	resize: none;
}

.injury-name-box {
	width: 90%;
	height: 50px;
	resize: none;
}

.d-flex {
	position: relative;
}

.tr-column {
	background: #F8F9FC;
}

.clinic-table {
	text-align: center;
	width: 100%;
}

.injury-list-table {
	text-align: center;
}

.td-padding-data {
	pading: 0px;
}

.record-scroll {
	height: 680px;
	overflow-y: scroll;
	-ms-overflow-style: none; /* IE and Edge */
	scrollbar-width: none;
}

.record-scroll::-webkit-scrollbar {
	display: none;
}

.patient-record {
	width: 914px;
}

.clinic-opinion-flex {
	display: flex;
	justify-content: space-around;
}

#keyword {
	width: 60%;
	margin-left: 20%;
	margin-bottom: 4%;
}

.orderset-head {
	height: 10%;
}

.orderset-body {
	height: 402.5px;
	overflow-y: scroll;
	border-radius: 24px;
	border: 1px solid var(- -border, #E0E8E6);
	padding: 16px;
	background: var(- -white, #FFF);
}

svg {
	cursor: pointer;
}

#ordersetType {
	margin-top: 20px;
}

#ordersetName {
	width: 215px;
}

#searchOrderset {
	width: 520px;
}

.order-select {
	width: 220px;
	height: 30px;
}

.jstree-search {
	font-style: normal !important;
	font-weight: bold;
	color: #0abab5 !important;
	background-color: #fff;
}

/* 오더세트 검색 후 결과에 css주기 */
.searchResultList>div.active {
	background: #333;
	color: #eee;
}

/* 쓰레기통 아이콘 */
.trashbin {
	width: 16px;
	height: 16px;
	margin-top: 1%;
	cursor: pointer;
}

.trashbin.active {
	visibility: visible !important;
}

#trashbinInjury, #trashbinTest, #trashbinMedicine, #trashbinTreatment {
	margin-top: 0.5%;
	visibility: hidden;
}

/* 검색 스타일 시작 */
.arrow {
	position: absolute;
	margin: -4.5% 0% 0% 72%;
	width: 16px;
}

.input-search-value {
	width: 520px;
	height: 48px;
	flex-shrink: 0;
	border-radius: 12px;
	border: 1px solid var(- -border, #EBEFF0);
	background: var(- -bg-01, #F8F9FC);
	color: var(- -black-01, #333);
	font-family: 'Pretendard5';
	font-size: 14px;
	font-style: normal;
	line-height: 160%;
	padding-left: 16px;
	margin: 8px 0px 0px 0px;
}

.table-search {
	width: 520px;
	height: 48px;
	border: 1px solid var(- -border, #EBEFF0);
	background-color: #F8F9FC;
	color: var(- -black-01, #333);
	font-family: 'Pretendard5';
	font-size: 14px;
	font-style: normal;
	padding-left: 16px;
	border-collapse: collapse;
	visibility: hidden;
	position: absolute;
}

.tbody-search {
	position: relative;
}

.order-search {
	width: 590px;
	height: 48px;
	background-color: #F8F9FC;
	border: 1px solid var(- -border, #EBEFF0);
	color: var(- -black-01, #333);
	font-family: 'Pretendard5';
	font-size: 14px;
	font-style: normal;
	padding-left: 16px;
	border-collapse: collapse;
	visibility: hidden;
	position: absolute;
}

.order-body-search {
	position: relative;
}

.table-result {
	margin: 8px 0px 0px 0px;
	width: 520px;
	height: 48px;
	border-style: hidden;
	box-shadow: 0 0 0 1px #EBEFF0;
	border-radius: 12px;
	background: var(- -bg-01, #F8F9FC);
	color: var(- -black-01, #333);
	font-family: 'Pretendard5';
	font-size: 14px;
	font-style: normal;
	padding-left: 16px;
	border-collapse: collapse;
}

.table-order-result {
	margin: 8px 0px 0px 0px;
	width: 590px;
	height: 48px;
	border-style: hidden;
	box-shadow: 0 0 0 1px #EBEFF0;
	border-radius: 12px;
	background: var(- -bg-01, #F8F9FC);
	color: var(- -black-01, #333);
	font-family: 'Pretendard5';
	font-size: 14px;
	font-style: normal;
	padding-left: 16px;
	border-collapse: collapse;
}

.table-search tbody * {
	padding: 2%;
}

.order-search tr * {
	padding: 2%;
}

.table-search tr:hover {
	background: #DBF2F4;
}

.order-search tr:hover {
	background: #DBF2F4;
}

.table-search.active {
	visibility: visible;
}

.order-search.active {
	visibility: visible;
}

.table-search td {
	overflow: hidden;
	text-overflow: ellipsis;
}

.order-search td {
	overflow: hidden;
	text-overflow: ellipsis;
}

.dduk-login-d {
	margin-bottom: 24px;
	margin-left: 5%;
	width: 300px;
}
/* 검색 스타일 끝 */
.btn-body {
	width: 93.8%;
	margin-left: 6.9%;
	font-size: 1em !important;
}

.medicine-order-qt {
	width: 25px;
	height: 20px;
	margin-right: 5px;
}

.medicine-order-day, .medicine-order-per, .medicine-order-dose {
	width: 20px;
	height: 20px;
	margin-right: 5px;
}

#checkOrderSet {
	width: 16px;
	height: 16px;
	margin: 4px 0px 0px 5px;
	cursor: pointer;
}

.td-data {
	white-space: nowrap; /* 텍스트를 한 줄로 유지 */
	overflow: hidden; /* 넘치는 내용 숨김 */
	text-overflow: ellipsis; /* 넘치는 텍스트를 ...로 대체 */
}

#magnifyingGlass {
	width: 16px;
	height: 16px;
	margin-bottom: 1%;
}

.viewTestResult {
	cursor: pointer;
	margin-left: 40%;
	width: 20%;
}

/* 과거의 진료기록은 선택하면 빨간색깔로 표시 */
.past-record.selected {
	background-color: #FFECEC !important;
}

</style>
<c:import url="../common/modal.jsp"></c:import>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<div class="dduk-body-border patient-list">
		<div>
			<div class="dduk-title-area">
				<h2>대기환자 목록</h2>
			</div>
			<div class="dduk-x-pd8">
				<table class="patient-list-table" id="waitingQueue" style="text-align: center">
					<tr class="tr-padding">
						<th class="td-padding gray-text" style="width:20px;">No</th>
						<th class="td-padding gray-text paName" style="width:90px;">이름</th>
						<th class="td-padding gray-text" style="width:110px">생년월일</th>
						<th class="td-padding gray-text" style="text-align:center">상태</th>
					</tr>
				</table>
			</div>	
		</div>
	</div>
	
	<div class="dduk-body-border patient-detail"  style="position: relative;">
		<div class="dduk-title-area spa-betw">
			<div class="d-flex align-items-center">
				<h2 id="paInfoName">--</h2>
				<span id="paInfo" class="gray-text mar-b-8 mar-l-8"></span>
			</div>
				<div class="d-flex">
					<div class="d-flex patient-info" style="margin-left:-5%; margin-right:5%">
						<div class="d-flex">
							<span class="gray-text">신장&nbsp;&nbsp;</span><div id="paInfoHeight">--</div>
						</div>
						<div class="d-flex">
							<span class="gray-text">체중&nbsp;&nbsp;</span><div id="paInfoWeight">--</div>
						</div>
						<div class="d-flex">
							<span class="gray-text">혈액형&nbsp;&nbsp;</span><div id="paInfoBldType">--</div>
						</div>
					</div>
					<button class="dduk-btn-normal">상세보기</button>
				</div>
		</div>
		<hr style="width: 1206px;">
		<div class="d-flex clinic-chart-cont">
			<h1 class="h1-default">환자를 선택해주세요</h1>
		</div>
	</div>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<script>
$(function(){
	$('.aside-doc-diag').find('svg').find('path').attr('fill', '#0ABAB5');
	$('.aside-doc-diag').find('.dduk-nav-menu').css('color', '#0ABAB5');
	// 최초 1번 대기목록 갱신
	// 굳이 Ajax를 이용해 동적으로 추가하는 이유는 Websocket을 이용해 실시간으로 대기 환자 갱신을 위해
	loadReceptionList();
	
	// 최근 선택한 접수번호
	let currentHsrpNo = '';
	// 최근 선택한 환자번호
	let currentPaNo = '';
	
	// 대기환자 목록에서 특정 환자 누를 때
	$(document).on("click", ".tr-paInfo", function() {
		
		let paNo = $(this).data('pano');
		let hsrpReason = $(this).data('hsrpreason');
		let hsrpNo = $(this).data('hsrpno');
		
		currentHsrpNo = hsrpNo;
		currentPaNo = paNo;
		
		let title = '';
		// 만약 환자가 대기중인 환자였다면 true를 반환
		// 진료중, 검사중, 검사완료인 환자를 대상으론 false를 반환
		let isWaitingClinic = ($(this).find('button').text() === '대기중');
		
		if(isWaitingClinic){
			title = '진료를 시작하시겠습니까???'
		} else {
			title = '진료를 이어서 진행하시겠습니까???'
		}
		
		// 환자의 진료를 시작할건지 물어본다
		Swal.fire({
			title: title,
			icon: 'question',
			showCancelButton: true,
			confirmButtonColor: '#0ABAB5',
			cancelButtonColor: '#8D9EA5',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			// 확인버튼 클릭시
			if (result.isConfirmed) {
				
				// 진료차트 페이지 갱신
				updateClinicChart();
				
            	// 이전에 선택된 요소의 클래스 초기화
                $(".tr-paInfo").removeClass("selected");
                // 현재 클릭한 요소에 select클래스 추가
                $(this).addClass("selected");
                // 클릭한 환자의 진료목록 갱신
                simpleClinicChartList(paNo);
                // 내원사유 갱신
                $('.reason-box').html(hsrpReason);
                // 오더세트 트리뷰 갱신
                renderTree();
                
                // 만약 환자가 대기중일 때 진료를 시작
                if(isWaitingClinic){
                	// DB에서 접수를 대기에서 호출완료로 변경 및 진료차트 테이블에 데이터 생성
                	startClinicChart(paNo, hsrpNo);
                // 만약 환자가 대기중이 아닐 때 (진료중, 검사중, 검사완료) 해당 진료정보를 불러옴
                } else {
                	// 접수번호(고유키)를 토대로 진행중이던 진료정보를 불러오고 페이지에 동적으로 쏴줌
                	continueClinicChart(hsrpNo);
                }
			}
		})
    });
	
	
	// DB에서 접수를 대기에서 호출완료로 변경 및 진료차트 테이블에 데이터 생성
	function startClinicChart(paNo, hsrpNo){
		
		let data = {
			'paNo' : paNo,
			'hsrpNo' : hsrpNo
		}
		
		$.ajax({
			url: '/clinic/startClinicChart',
			data: JSON.stringify(data),
			contentType:"application/json;charset=utf-8",
			dataType: 'json',
			type: 'post',
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: function(rst){
				if(rst.result == 2){
					console.log('진료차트 성공적으로 생성, 진료번호 : ', rst.clinicNo);
					// 환자 대기목록 갱신
					loadReceptionList();
				}
			},
			error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
			}
		});
	}
	
	
	// 방금 누른 접수번호를 바탕으로 진행중이던 진료의 정보를 그대로 가져오고 동적으로 쏴줌
	function continueClinicChart(hsrpNo) {

		let data = {
			'hsrpNo' : hsrpNo	
		};
		
		$.ajax({
			url: '/clinic/continueClinicChart',
			data: data,
			dataType: 'json',
			type: 'post',
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: function(rst){
				console.log('접수번호를 바탕으로 가져온 진료의VO : ', rst);
				
				// 진단명 설정
				$('#clinicInjnm').val(rst.clinicInjnm);
				
				// 소견 설정
				$('#clinicOpinion').val(rst.clinicOpinion);
				
				// 상병 진단 설정
				$.each(rst.injuryDiagnosisVOList, function(index, vo){
					
					let cont = `
						<tr class="tr-padding tr-data past-record ">
							<td class="td-padding-data gray-text" style="padding: 1%">\${vo.ijCd}</td>
							<td class="td-padding-data gray-text">`;
					
					if(vo.indiType === 'IDTY01') cont += `주 상병`;
						
					if(vo.indiType === 'IDTY02') cont += `부 상병`;			
						
					if(vo.indiType === 'IDTY03') cont += `배제 상병`;	
								
						cont += `
							</td>
							<td class="td-padding-data gray-text">\${vo.injuryVO.ijNm}</td>
							<td class="td-padding-data gray-text">\${vo.injuryVO.ijEnm}</td>
							<td class="td-padding-data gray-text">\${vo.indiDt}</td>
							<td class="td-padding-data gray-text">\${vo.injuryBodyCdNm}</td>
						</tr>`;
						
					// 만약 기본 메세지가 남아있다면
					if($('#defaultInjury').length){
						$('#defaultInjury').remove();
					}
					
					$('.injury-list-table').append(cont);
				});
				
				// 검사 오더 설정
				$.each(rst.testOrderVOList, function(index, vo){
					
					// 사진 정보들을 넣어줄 jsonData 선언
					let jsonData = '';
					
					// 만약 사진결과가 있다면
					if(vo.atchFileVO != null){
					
						jsonData = '{\"atchFileDetailVOList\": [';
						
							$.each(vo.atchFileVO.atchFileDetailVOList, function(i, detailVO){
								jsonData += '{"atchFileDetailOrlng": "'+detailVO.atchFileDetailOrlng+'", "atchFileDetailSavenm": "'+detailVO.atchFileDetailSavenm+'"}';						

								if(vo.atchFileVO.atchFileDetailVOList.length != (i+1)){
									jsonData += ',';
								}
							})
							
							jsonData += ']}';
					}
						
					// 테이블로 뿌려주기 위한 백틱을 이용해 html정보를 담은 변수
					let cont = `
						<tr class="tr-padding tr-data past-record">
							<td class="td-padding-data gray-text" style="padding: 1%">\${vo.testVO.testCd}</td>
							<td class="td-padding-data gray-text">\${vo.testVO.testNm}</td>`;
					
					if(vo.testOrderEmpName == null){
						cont +=	`<td class="td-padding-data gray-text">검사 미진행</td>`;
					} else {
						cont +=	`<td class="td-padding-data gray-text">\${vo.testOrderEmpName}</td>`;
					}
							
					if(vo.atchFileCd != null){
						cont += `<td class="td-padding-data gray-text">
									<div class="viewTestResult" data-resultJson='\${jsonData}' data-bs-toggle="modal" data-bs-target="#viewTestOrderResult">
										결과보기
										<img id="magnifyingGlass" src="/resources/images/icons/magnifying-glass.png" alt="magnifyingGlass.png" />
									</div>	
								</td>`;
					} else if(vo.teodRst != null) {
						cont += `<td class="td-padding-data gray-text">\${vo.teodRst}</td>`;
					} else {
						cont += `<td class="td-padding-data gray-text">-</td>`
					}
						
					if(vo.testOrderBodyCdNm != null){
						cont += `<td class="td-padding-data gray-text">\${vo.testOrderBodyCdNm}</td>`;
					} else {
						cont += `<td class="td-padding-data gray-text">-</td>`;
					}	
					 
						cont += `</tr>`;
						
					// 만약 기본 메세지가 남아있다면
					if($('#defaultTest').length){
						$('#defaultTest').remove();
					}
					
					$('.test-list-table').append(cont);
					
				});
				
				// 처방 오더 설정
				$.each(rst.medicineOrderVOList, function(index, vo){
					
					let cont = `
						<tr class="tr-padding tr-data past-record">
							<td class="td-padding-data gray-text" style="padding: 1%">\${vo.medicineVO.mediCd}</td>
							<td class="td-padding-data gray-text">\${vo.medicineVO.mediNm}</td>
							<td class="td-padding-data gray-text">\${vo.medicineVO.mediDetail}</td>`;
						
					let medicineDetail = vo.medicineVO.mediDetail;
							
						// 1. 약품상세에 '연고' 라는 이름이 들어갈 때 -> 용법(투여주기 일 투여횟수 회) 처방량(-일분)
						if(medicineDetail.indexOf('연고') !== -1){
							cont += `	
								<td class="td-padding-data gray-text">
									\${vo.mdodDay}일 \${vo.mdodPer}회	
								</td>
								<td class="td-padding-data gray-text">
									\${vo.mdodQt}개
								</td>
							</tr>`;
						// 2. 약품상세가 주사일 때, 기타 처방 일 때 -> 용법(-) 처방량(-)
						} else if(medicineDetail === '주사' || medicineDetail === '기타 처방'){
							cont += `	
								<td class="td-padding-data gray-text">-</td>
								<td class="td-padding-data gray-text">-</td>
							</tr>`;
						// 3. 패치형 진통제인 경우 -> 용법(-) 처방량(-개)
						} else if(medicineDetail === '패치형 진통제'){
							cont += `	
								<td class="td-padding-data gray-text">-</td>
								<td class="td-padding-data gray-text">
									\${vo.mdodQt}개
								</td>
							</tr>`;
						// 4. 기본 -> 용법(투여주기 일 투여횟수 회 투여량 알) 처방량(-일분)
						} else {
							cont += `	
								<td class="td-padding-data gray-text">
									\${vo.mdodDay}일 \${vo.mdodPer}회	\${vo.mdodDose}정
								</td>
								<td class="td-padding-data gray-text">
									\${vo.mdodQt}일분
								</td>
							</tr>`;
						}
						
						
					// 만약 기본 메세지가 남아있다면 삭제
					if($('#defaultMedicine').length){
						$('#defaultMedicine').remove();
					}
					
					$('.medicine-list-table').append(cont);
					
				});
				
				// 치료 오더 설정
				$.each(rst.treatmentOrderVOList, function(index, vo){
					
					let cont = `
						<tr class="tr-padding tr-data past-record">
							<td class="td-padding-data gray-text" style="padding: 1%">\${vo.treatmentVO.tmCd}</td>
							<td class="td-padding-data gray-text">\${vo.treatmentVO.tmNm}</td>
							<td class="td-padding-data gray-text">\${vo.treatmentOrderBodyCdNm}</td>
						</tr>`;
						
					// 만약 기본 메세지가 남아있다면
					if($('#defaultTreatment').length){
						$('#defaultTreatment').remove();
					}
					
					$('.treatment-list-table').append(cont);
					
				});
			},
			error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
			}
		});
	}
	
	
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

	
	// 환자의 진료정보를 클릭할 시 이벤트(진료상세 출력)
	$(document).on("click", ".dduk-history-list", function(){
		
		let clinicNo = $(this).data("clinicno");
		
		// 이전에 선택된 요소의 클래스 초기화
        $(".dduk-history-list").removeClass("selected");
        // 현재 클릭한 요소에 select클래스 추가
        $(this).addClass("selected");
        // 클릭한 진료의 상세내역 가져오기
        clinicChartDetail(clinicNo);
	});
	
	
	// 환자 대기목록 갱신
	function loadReceptionList(){
		$.ajax({
			url: '/ams/getReceptionList',
			dataType: 'json',
			type: 'post',
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: function(rst){
				
				console.log("환자 대기목록VO List", rst);
				
				let paInfo = "";
				paInfo += '<tr class="tr-padding">';
				paInfo += '<th class="td-padding gray-text" style="width:20px;">No</th>';
				paInfo += '<th class="td-padding gray-text paName" style="width:90px;">이름</th>';
				paInfo += '<th class="td-padding gray-text" style="width:110px">생년월일</th>';
				paInfo += '<th class="td-padding gray-text" style="text-align:center">상태</th>';
				paInfo += '</tr>';
				
				$.each(rst, function(index){
					paInfo += '<tr class="tr-padding tr-paInfo" data-paNo="'+rst[index].paNo+'" data-hsrpNo="'+rst[index].hsrpNo+'" data-hsrpReason="'+rst[index].hsrpReason+'">';
					paInfo += '<td class="td-padding">'+(index + 1)+'</td>';
					paInfo += '<td height="48px" class="td-padding">'+truncateText(rst[index].paName, 4)+'</td>';
					paInfo += '<td class="td-padding">'+ formatResidentNumber(rst[index].paReg) +'</td>';
					paInfo += '<td class="td-padding">';
					
					// 진료상태코드 가져오기
					let clinicState = rst[index].clinicState;
					
					if(clinicState == null){
						paInfo += '<button class="dduk-btn-disabled btn-state">대기중</button>'; 
					}
					if(clinicState == 'CRST01'){
						paInfo += '<button class="dduk-btn-info btn-state">진료중</button>';
					}
					if(clinicState == 'CRST02' || clinicState == 'CRST05'){
						paInfo += '<button class="dduk-btn-normal btn-state">검사중</button>';
					}
					if(clinicState == 'CRST03'){
						paInfo += '<button class="dduk-btn-active btn-state">검사완료</button>';
					}
					
					paInfo += '</td>';
					paInfo += '</tr>';
				});
				
				$('#waitingQueue tbody').html(paInfo);
			},
			error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
			}
		});
	}
	
	
	// 환자의 진료목록 갱신
	function simpleClinicChartList(paNo){
		$.ajax({
			url: '/clinic/simpleClinicChartList',
			dataType: 'json',
			type: 'post',
			data: {"paNo": paNo},
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: function(rst){
				
				console.log("특정 환자의 진료VO 리스트 : ", rst);
				
				// 환자 정보 출력
				let paBirthDay = formatResidentNumber(rst.paReg);
				let paAge = getAge(paBirthDay);
				$('#paInfoName').text(rst.paName);
				$('#paInfo').html(rst.paSex + ", "+paAge+"세("+paBirthDay+")");
				$('#paInfoHeight').html(rst.paHeight + "cm");
				$('#paInfoWeight').html(rst.paWeight + "kg");
				$('#paInfoBldType').html(rst.paBldType + "형");
				
				// 진료 이력 초기화
				$('.history-scroll').html("");
				
				// 진료 이력이 없을시 없다는 메시지 출력
				if(rst.clinicChartVOList[0].clinicNo == null){
					$('.history-scroll').append('<div class="notice-text">진료 이력이 없습니다</div>');
				} else {
					
					// 진료 이력이 있을시 화면에 출력
					$.each(rst.clinicChartVOList, function(index){
						
						// admiCd가 null일때만 실행(회진이 아닐때만 실행) + 진료 날짜가 오늘이 아닐때만 실행
						let clinicDt = new Date(rst.clinicChartVOList[index].clinicDt);
						let today = new Date()
						clinicDt.setHours(0, 0, 0, 0);
						today.setHours(0, 0, 0, 0);
						console.log(clinicDt);
						console.log(today);
						if(rst.clinicChartVOList[index].admiCd === null && clinicDt.getTime() !== today.getTime()) {
							
							// 진료일자
							let clinicDate = formatDateString(rst.clinicChartVOList[index].clinicDt);
						
							let paClinicList = "";
						
							paClinicList += '<div class="dduk-history-list" data-clin   icNo='+rst.clinicChartVOList[index].clinicNo+'>';
							paClinicList += '<div class="history-array">';
							paClinicList += '<div>';
							paClinicList += '<div class="history-title">내원·'+clinicDate+'</div>';
							paClinicList += '<div>담당의 '+ rst.clinicChartVOList[index].empName+'</div>';
							paClinicList += '</div>';
							paClinicList += '</div>';
							paClinicList += '<div class="d-flex history-btn-list">';
							paClinicList += '<span class="history-btn">진료</span>';
							// 검사오더 VOList가 있을 떄(검사를 받았을 때)				
							if(rst.clinicChartVOList[index].testOrderVOList.length != 0){
								paClinicList += '<span class="history-btn">검사</span>';
							}
							// 치료오더 VOList가 있을 떄(치료를 받았을 때)				
							if(rst.clinicChartVOList[index].treatmentOrderVOList.length != 0){
								paClinicList += '<span class="history-btn">치료</span>';
							}
							// 처방오더 VOList가 있을 떄(처방을 받았을 때)						
							if(rst.clinicChartVOList[index].medicineOrderVOList.length != 0){
								paClinicList += '<span class="history-btn">처방</span>';
							}
							paClinicList += '</div>';
							paClinicList += '</div>';
						
							$('.history-scroll').append(paClinicList);
							
						}
					});
				}
			},
			error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
			}
		});
	}
	
	
	// 진료의 상세내역 불러오기
	function clinicChartDetail(clinicNo){
		$.ajax({
			url: '/clinic/clinicChartDetail',
			dataType: 'json',
			type: 'post',
			data: {"clinicNo": clinicNo},
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: function(rst){
				console.log("특정 진료의 상세내역VO", rst);
				
				$.each(rst, function(index, clinicChartVO){
					
				});
			},
			error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
			}
		})
	}
	
	
	// 오더, 진단 추가 스크립트 시작
	// 상병, 검사, 처방, 치료 4개의 추가버튼을 누를 때 그에 따른 전체 검색풀을 불러와서 searchPool에 할당
	var searchPool = [];
	// 검색결과 테이블 크기 조절을 위한 변수
	var width = [];
	
	
	$(document).on('click', '.btn-order-modal', function(){

		// 검색 풀이 계속 쌓이는걸 방지하기 위해 초기화
		searchPool = [];
		let type = $(this).data('type');
		let searchUrl = '';
		
		// 선택한 추가 종류에 따라 모달의 제목 및 버튼의 id를 변경, url을 설정
		switch (type) {
 		case 'injury':
 			$('.order-title').html('상병진단 추가');
 			$('.btn-save-create-order').attr('id', 'btnSaveInjuryOrder');
 			searchUrl = '/orderSet/getInjuryVOList';
 			width = ['20px', '70px', '130px'];
 			break;
        case 'test':
        	$('.order-title').html('검사오더 추가');
        	$('.btn-save-create-order').attr('id', 'btnSaveTestOrder');
        	searchUrl = '/orderSet/getTestVOList';
        	width = [];
            break;
        case 'medicine':
        	$('.order-title').html('처방오더 추가');
        	$('.btn-save-create-order').attr('id', 'btnSaveMedicineOrder');
        	searchUrl = '/orderSet/getMedicineVOList';
        	width = [];
            break;
        case 'treatment':
        	$('.order-title').html('치료오더 추가');
        	$('.btn-save-create-order').attr('id', 'btnSaveTreatmentOrder');
        	searchUrl = '/orderSet/getTreatmentVOList';
        	width = [];
            break;
   		}
		
		// 선택한 카테고리에 따라 검색목록을 갱신
		$.ajax({
			url: searchUrl,
			dataType: 'json',
			type: 'post',
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success: function(rst){
				console.log('진단, 오더추가 에서 오더카테고리에 따른 검색 풀 : ' , rst);
				
				// vo만큼 순회
				$.each(rst, function(index, vo){
					// 한 vo안의 모든 정보들을 담기위한 변수 
					let str = "";
					// vo안의 데이터 만큼 순회
					$.each(vo, function(index, column){
						// 검사일 때 가격은 안담아야됨
						// 처방일 때 약분류, 재고, 제조사, 보험적용여부, 총함량은 안가져와도 됨
						// 치료일 때 가격이랑 보험적용여부는 필요 없음
						if(index != 'testPrice' &&
							index != 'mediType' && index != 'mediStock' && index != 'mediMaker' && index != 'insuYn' && index != 'mediCont' && index != 'mediPrice' &&
							index != 'tmPrice' && index != 'insuYn'){
								str += (column + ',');
						}
					});
					
					searchPool.push(str);
				});
				
				console.log("갱신된 검색 풀", searchPool);
				
				updateSearchTable(searchPool, width);
			},
			error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
			}
		});
	});
	
	
	// 검색 결과인 searchPool을 테이블로 업데이트 시켜주는 함수
 	// data에는 검색결과의 배열이 들어오고
 	// width에는 내가 주고 싶은 각각의 td값의 width를 넣으면 된다
 	function updateSearchTable(data, width){
 		$('.order-search').html('');
 		let cont = "<tr>";
 		
 		// 우선 배열의 길이만큼 실행
 		$.each(data, function(index, str){
 			// ,를 정규식으로 만들어줌
 			let regex = new RegExp(',', 'g');
 			// 배열의 한 요소에서 , 의 개수를 파악 후 그 개수만큼 반복
 			let matches = str.match(regex);
 			let repeat = matches.length;
 			
 			// 배열 안의 구문자(,)의 개수만큼 실행 = td(컬럼)의 개수
 			for(let i = 0; i < repeat; i++){
 				let value = str.split(',')[i];
 				cont += "<td class='order-search-result' style='width:"+width[i]+"'>"+value+"</td>"
 			}
 			
 			cont += "</tr>"
 		})
 		
 		$('.order-search').append(cont);
 	}
	
	
 	// 검색결과 테이블 선택 시 검색결과 숨기기/보이기 및 선택한 결과를 반영
	$(document).on('click', '.order-search-result', function(){
		toggleSearchTable();
		
		// 더이상 카테고리를 바꾸면 안됨
		$("#ordersetCategory").prop("disabled", true);

		// 선택한 검색 결과를 input에 뒤집어씌움
		let clone = $(this).closest('tr').html();
		let cont = '<table class="table-order-result"><tr>' + clone + '<tr></table>';
		$('#orderSearch').html(cont);
		
		// 그다음 table-order-result 클래스를 제거시킴
		let tds = $('.table-order-result tr td');
		
		$.each(tds, function(index){
			tds.eq(index).attr('class', 'order-search-result-fixed');
		});
	});
	// 화살표 선택 시 검색결과 숨기기/보이기
	$(document).on('click', '.order-arrow', toggleSearchTable);


	// css를 이용해 검색창 숨기기/보이기
	function toggleSearchTable(){
		let $orderSearch = $('.order-search');
	    $orderSearch.toggleClass('active');
	}
	
	
	// 진단, 오더 추가 모달에서 검색 기능, 검색창에서 단어를 입력할 때 마다 실행
	$(document).on('keyup', '#searchOrder', function() {
		let value = $('#searchOrder').val().trim();
		let matchDataList = searchPool.filter((label) => label.includes(value));
		updateSearchTable(matchDataList, width);
	});
	
	
	// 진단, 오더 추가 모달에서 취소버튼을 누를 때
	$(document).on('click', '#btnCancelCreateOrder', resetOrderModal);
	// 상병추가 모달에서 저장 버튼을 누를 때
	$(document).on('click', '#btnSaveInjuryOrder', function(){
		if(!checkSelected()) return;
		addInjury();
		resetOrderModal();
	});
	// 검사오더추가 모달에서 저장 버튼을 누를 때
	$(document).on('click', '#btnSaveTestOrder', function(){
		if(!checkSelected()) return;
		addTest();
		resetOrderModal();
	});
	// 처방오더추가 모달에서 저장 버튼을 누를 때
	$(document).on('click', '#btnSaveMedicineOrder', function(){
		if(!checkSelected()) return;
		addMedicine();
		resetOrderModal();
	});
	// 치료오더추가 모달에서 저장 버튼을 누를 때
	$(document).on('click', '#btnSaveTreatmentOrder', function(){
		if(!checkSelected()) return;
		addTreatment();
		resetOrderModal();
	});
 	
	
	// 진단,오더 추가 모달에서 진단,오더를 골랐는지 확인하는 함수
	function checkSelected(){
		if($('#searchOrder').length){
			
			Swal.fire({
				title: '추가할 항목을 선택해주세요',
				icon: 'warning',
				confirmButtonColor: '#0ABAB5',
				confirmButtonText: '확인',
			})
			return false;
		}
		return true;
	}
	
	
	// 진단,오더 추가 모달의 내용을 초기화하는 함수
	function resetOrderModal(){
		
		// 카테고리 선택 다시 활성화
		$("#ordersetCategory").prop("disabled", false);
		
		let cont = '';
		cont += '<input type="text" id="searchOrder" class="input-search-value" autocomplet="off" />';
		cont +=	'<img src="/resources/images/icons/arrow.png" class="order-arrow"/>';
		$('#orderSearch').html(cont);
		
		// 모달 종료
		$("#createOrderModal").modal("hide");
		$(".fade").attr('style', 'display: none');
	}
	
	
	// 상병진단추가 모달에서 저장 버튼 누를 시
	function addInjury(){
		
		// 몇번째 병 진단인지 체크(radio속성을 위해)
		let allInjuryType = $('[name*="injuryType"]');
		let index = 1;
		
		while(true){
			// injuryType + index가 존재하면
			if($('[name="injuryType'+index+'"]').length){
				// 인덱스를 1 늘리고 다시 탐색
				index += 1;
			// injuryType + index가 존재하지 않으면 탈출(인덱스를 그대로 사용)
			} else {
				break;
			}
		}
		
		let injuryCd = $('.table-order-result td').eq(0).text();
		let injuryNm = $('.table-order-result td').eq(1).text();
		let injuryEnm = $('.table-order-result td').eq(2).text();
		
		let cont = `
			<tr class="tr-padding tr-data">
				<td class="td-padding-data gray-text">\${injuryCd}</td>
				<td class="td-padding-data gray-text" style="padding-top:1%">
					<label for="major">주</label>
					<input type="radio" name="injuryType\${index}" class="major" value="IDTY01" />
					<label for="minor">부</label>
					<input type="radio" name="injuryType\${index}" class="minor" value="IDTY02" />
					<label for="excluded">배제</label>
					<input type="radio" name="injuryType\${index}" class="excluded" value="IDTY03" />
				</td>
				<td class="td-padding-data gray-text">\${injuryNm}</td>
				<td class="td-padding-data gray-text">\${injuryEnm}</td>
				<td class="td-padding-data gray-text"><input type="date"></td>
				<td class="td-padding-data gray-text">
					<button class="dduk-btn-disabled btn-state btn-body" data-bs-toggle="modal" data-bs-target="#bodyCdModal">환부선택</button>
				</td>
			</tr>`;
			
		// 만약 기본 메세지가 남아있다면
		if($('#defaultInjury').length){
			$('#defaultInjury').remove();
		}
		$('.injury-list-table').append(cont);
		
		Swal.fire({
			title: '상병진단이 추가되었습니다',
			icon: 'success',
			confirmButtonColor: '#0ABAB5',
			confirmButtonText: '확인',
		})
	};
	
	
	// 검사오더추가 모달에서 저장 버튼 누를 시
	function addTest(){
		
		let testCd = $('.table-order-result td').eq(0).text();
		let testNm = $('.table-order-result td').eq(1).text();
		
		let cont = `
			<tr class="tr-padding tr-data">
				<td class="td-padding-data gray-text" style="padding: 1%">\${testCd}</td>
				<td class="td-padding-data gray-text">\${testNm}</td>
				<td class="td-padding-data gray-text">검사 미진행</td>
				<td class="td-padding-data gray-text"></td>`
			
			// 피검사나 소변검사는 환부 코드가 필요하지 않음
			if(!(testNm === '피검사') && !(testNm === '소변검사')){
				cont += `
					<td class="td-padding-data gray-text">
						<button class="dduk-btn-disabled btn-state btn-body" data-bs-toggle="modal" data-bs-target="#bodyCdModal">환부선택</button>
					</td>`
			} else {
				cont += `<td></td>`;
			}
				
			cont += `</tr>`;
			
		// 만약 기본 메세지가 남아있다면
		if($('#defaultTest').length){
			$('#defaultTest').remove();
		}
		$('.test-list-table').append(cont);
		
		Swal.fire({
			title: '검사오더가 추가되었습니다',
			icon: 'success',
			confirmButtonColor: '#0ABAB5',
			confirmButtonText: '확인',
		})
	}
	
	
	// 처방오더추가 모달에서 저장 버튼 누를 시
	function addMedicine(){
		
		let medicineCd = $('.table-order-result td').eq(0).text();
		let medicineNm = $('.table-order-result td').eq(1).text();
		let medicineDetail = $('.table-order-result td').eq(2).text();
		
		let cont = `
			<tr class="tr-padding tr-data">
				<td class="td-padding-data gray-text" style="padding: 1%">\${medicineCd}</td>
				<td class="td-padding-data gray-text">\${medicineNm}</td>
				<td class="td-padding-data gray-text">\${medicineDetail}</td>`;
			
			// 1. 약품상세에 '연고' 라는 이름이 들어갈 때 -> 용법(투여주기 일 투여횟수 회) 처방량(-일분)
			if(medicineDetail.indexOf('연고') !== -1){
				cont += `	
					<td class="td-padding-data gray-text">
						<input type="number" class="medicine-order-day" />일
						<input type="number" class="medicine-order-per" />회	
					</td>
					<td class="td-padding-data gray-text">
						<input type="number" class="medicine-order-qt" />개
					</td>
				</tr>`;
			// 2. 약품상세가 주사일 때, 기타 처방 일 때 -> 용법(-) 처방량(-)
			} else if(medicineDetail === '주사' || medicineDetail === '기타 처방'){
				cont += `	
					<td class="td-padding-data gray-text">-</td>
					<td class="td-padding-data gray-text">-</td>
				</tr>`;
			// 3. 패치형 진통제인 경우 -> 용법(-) 처방량(-개)
			} else if(medicineDetail === '패치형 진통제'){
				cont += `	
					<td class="td-padding-data gray-text">-</td>
					<td class="td-padding-data gray-text">
						<input type="number" class="medicine-order-qt" />개
					</td>
				</tr>`;
			// 4. 기본 -> 용법(투여주기 일 투여횟수 회 투여량 알) 처방량(-일분)
			} else {
				cont += `	
					<td class="td-padding-data gray-text">
						<input type="number" class="medicine-order-day" />일
						<input type="number" class="medicine-order-per" />회
						<input type="number" class="medicine-order-dose" />정
					</td>
					<td class="td-padding-data gray-text">
						<input type="number" class="medicine-order-qt" />일분
					</td>
				</tr>`;
			}
			
			
		// 만약 기본 메세지가 남아있다면
		if($('#defaultMedicine').length){
			$('#defaultMedicine').remove();
		}
		$('.medicine-list-table').append(cont);
		
		Swal.fire({
			title: '처방오더가 추가되었습니다',
			icon: 'success',
			confirmButtonColor: '#0ABAB5',
			confirmButtonText: '확인',
		})
	}
	
	
	// 치료오더추가 모달에서 저장 버튼 누를 시
	function addTreatment(){
		
		let tmCd = $('.table-order-result td').eq(0).text();
		let tmNm = $('.table-order-result td').eq(1).text();
		
		let cont = `
			<tr class="tr-padding tr-data">
				<td class="td-padding-data gray-text" style="padding: 1%">\${tmCd}</td>
				<td class="td-padding-data gray-text">\${tmNm}</td>
				<td class="td-padding-data gray-text">
					<button class="dduk-btn-disabled btn-state btn-body" data-bs-toggle="modal" data-bs-target="#bodyCdModal">환부선택</button>
				</td>
			</tr>`;
			
		// 만약 기본 메세지가 남아있다면
		if($('#defaultTreatment').length){
			$('#defaultTreatment').remove();
		}
		$('.treatment-list-table').append(cont);
		
		Swal.fire({
			title: '치료오더가 추가되었습니다',
			icon: 'success',
			confirmButtonColor: '#0ABAB5',
			confirmButtonText: '확인',
		})
	}
	// 오더, 진단 추가 스크립트 끝
	
	
	// 오더, 진단 삭제 스크립트 시작
	// 클릭시 선택효과 적용
	$(document).on('click', '.tr-data', function(){
		// 환부코드를 선택하는 경우엔 활성화 x, input태그를 누르는 경우에도 활성화 x, 돋보기 누르는 경우에도 활성화 x
		if (!$(event.target).hasClass('btn-body') && !$(event.target).is('input') && !$(event.target).hasClass('viewTestResult')) {
	        $(this).toggleClass('selected');
	        checkTrashbinVisibility();
	    }
	});
	
	
	// 쓰레기통이 나올 조건이 되면 보이게 하는 함수
	function checkTrashbinVisibility(){
		// 만약 각 오더 테이블에 선택된 테이블이 있다면 쓰레기통을 나오게함
		// 없다면 쓰레기통을 부숨
		if($('.injury-list-table').children('.selected').length){
			$('#trashbinInjury').addClass('active');
		} else {
			$('#trashbinInjury').removeClass('active');
		}
		if($('.test-list-table').children('.selected').length){
			$('#trashbinTest').addClass('active');
		} else {
			$('#trashbinTest').removeClass('active');
		}
		if($('.medicine-list-table').children('.selected').length){
			$('#trashbinMedicine').addClass('active');
		} else {
			$('#trashbinMedicine').removeClass('active');                
		}
		if($('.treatment-list-table').children('.selected').length){
			$('#trashbinTreatment').addClass('active');
		} else {
			$('#trashbinTreatment').removeClass('active');
		}
	}
	
	
	// 상병진단 삭제처리
	$(document).on('click', '#trashbinInjury', function(){
		
		// 과거 내역이 선택됐으면
		if($('.injury-list-table').children('.selected.past-record').length) {
			
			Swal.fire({
				title: '과거의 진료내역은 삭제하실 수 없습니다',
				icon: 'error',
				confirmButtonColor: '#0ABAB5',
				confirmButtonText: '확인',
			})
			
			return;
		}
		
		Swal.fire({
			title: '선택된 상병진단을 삭제하시겠습니까???',
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#0ABAB5',
			cancelButtonColor: '#8D9EA5',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			// 확인버튼 누를 시
			if (result.isConfirmed) {
				// 선택된 상병진단들을 가져옴
				let selected = $('.injury-list-table').children('.selected');
				// 가져온 상병진단들을 삭제
				$.each(selected, function(index, tr){
					tr.remove();
				});
				// 만약 상병테이블에 데이터가 없으면 기본 메시지 출력
				if(!$('.injury-list-table').children('.tr-data').length){
					let cont = '<tr><td id="defaultInjury" colspan="6">상병진단을 추가해주세요</td></tr>';
					$('.injury-list-table').append(cont);
				}
				// 삭제 후에 쓰레기통을 숨겨야함
				checkTrashbinVisibility();
				// 삭제완료 메시지
				Swal.fire({
					title: '선택된 상병진단이 삭제되었습니다',
					icon: 'success',
					confirmButtonColor: '#0ABAB5',
					confirmButtonText: '확인',
				})
			}
		});
	});
	
	
	// 검사오더 삭제처리
	$(document).on('click', '#trashbinTest', function(){
		
		// 과거 내역이 선택됐으면
		if($('.test-list-table').children('.selected.past-record').length) {
			
			Swal.fire({
				title: '과거의 진료내역은 삭제하실 수 없습니다',
				icon: 'error',
				confirmButtonColor: '#0ABAB5',
				confirmButtonText: '확인',
			})
			
			return;
		}
		
		Swal.fire({
			title: '선택된 검사오더를 삭제하시겠습니까???',
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#0ABAB5',
			cancelButtonColor: '#8D9EA5',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			// 확인버튼 누를 시
			if (result.isConfirmed) {
				// 선택된 검사오더들을 가져옴
				let selected = $('.test-list-table').children('.selected');
				// 가져온 검사오더들을 삭제
				$.each(selected, function(index, tr){
					tr.remove();
				});
				// 만약 검사오더 테이블에 데이터가 없으면 기본 메시지 출력
				if(!$('.test-list-table').children('.tr-data').length){
					let cont = '<tr><td id="defaultTest" colspan="5">검사오더를 추가해주세요</td></tr>';
					$('.test-list-table').append(cont);
				}
				// 삭제 후에 쓰레기통을 숨겨야함
				checkTrashbinVisibility();
				// 삭제완료 메시지
				Swal.fire({
					title: '선택된 검사오더가 삭제되었습니다',
					icon: 'success',
					confirmButtonColor: '#0ABAB5',
					confirmButtonText: '확인',
				})
			}
		});
	});
	
	
	// 처방오더 삭제처리
	$(document).on('click', '#trashbinMedicine', function(){
		
		// 과거 내역이 선택됐으면
		if($('.medicine-list-table').children('.selected.past-record').length) {
			
			Swal.fire({
				title: '과거의 진료내역은 삭제하실 수 없습니다',
				icon: 'error',
				confirmButtonColor: '#0ABAB5',
				confirmButtonText: '확인',
			})
			
			return;
		}
		
		Swal.fire({
			title: '선택된 처방오더를 삭제하시겠습니까???',
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#0ABAB5',
			cancelButtonColor: '#8D9EA5',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			// 확인버튼 누를 시
			if (result.isConfirmed) {
				// 선택된 처방오더들을 가져옴
				let selected = $('.medicine-list-table').children('.selected');
				// 가져온 처방오더들을 삭제
				$.each(selected, function(index, tr){
					tr.remove();
				});
				// 만약 처방오더 테이블에 데이터가 없으면 기본 메시지 출력
				if(!$('.medicine-list-table').children('.tr-data').length){
					let cont = '<tr><td id="defaultMedicine" colspan="5">처방오더를 추가해주세요</td></tr>';
					$('.medicine-list-table').append(cont);
				}
				// 삭제 후에 쓰레기통을 숨겨야함
				checkTrashbinVisibility();
				// 삭제완료 메시지
				Swal.fire({
					title: '선택된 처방오더가 삭제되었습니다',
					icon: 'success',
					confirmButtonColor: '#0ABAB5',
					confirmButtonText: '확인',
				})
			}
		});
	});
	
	
	// 치료오더 삭제처리
	$(document).on('click', '#trashbinTreatment', function(){
		
		// 과거 내역이 선택됐으면
		if($('.treatment-list-table').children('.selected.past-record').length) {
			
			Swal.fire({
				title: '과거의 진료내역은 삭제하실 수 없습니다',
				icon: 'error',
				confirmButtonColor: '#0ABAB5',
				confirmButtonText: '확인',
			})
			
			return;
		}
		
		Swal.fire({
			title: '선택된 치료오더를 삭제하시겠습니까???',
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#0ABAB5',
			cancelButtonColor: '#8D9EA5',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			// 확인버튼 누를 시
			if (result.isConfirmed) {
				// 선택된 치료오더들을 가져옴
				let selected = $('.treatment-list-table').children('.selected');
				// 가져온 치료오더들을 삭제
				$.each(selected, function(index, tr){
					tr.remove();
				});
				// 만약 치료오더 테이블에 데이터가 없으면 기본 메시지 출력
				if(!$('.treatment-list-table').children('.tr-data').length){
					let cont = '<tr><td id="defaultTreatment" colspan="5">치료오더를 추가해주세요</td></tr>';
					$('.treatment-list-table').append(cont);
				}
				// 삭제 후에 쓰레기통을 숨겨야함
				checkTrashbinVisibility();
				// 삭제완료 메시지
				Swal.fire({
					title: '선택된 치료오더가 삭제되었습니다',
					icon: 'success',
					confirmButtonColor: '#0ABAB5',
					confirmButtonText: '확인',
				})
			}
		});
	});
	// 오더, 진단 삭제 스크립트 끝
	
	
	// 환부코드 스크립트 시작
	
	// 일단 환부코드는 모달을 1개로 모든 환부코드에 대해 처리하기 때문에
	// 최근 누른 버튼의 정보를 담는 변수 선언
	// 환부코드 선택 후 저장시 최근 선택한 버튼에 정보를 넣어줌
	let currentBodyCdBtn = '';
	
	// 환부선택 버튼 누를 시 최근 누른 버튼 정보에 해당 버튼의 정보를 담아둠	
	$(document).on('click', '.btn-body', function(){
		currentBodyCdBtn = $(this);
	});
	
	// 환부선택 모달에서 저장버튼 누르면
	$(document).on('click', '#btnSaveBodyCd', function(){
		
		// 만약 환부를 선택하지 않으면
		if($('input[name="BodyCodeRadio"]:checked').val() == null){
			Swal.fire({
				title: '환부를 선택해주세요',
				icon: 'warning',
				confirmButtonColor: '#0ABAB5',
				confirmButtonText: '확인'
			})
			
			return
		}
		
		// 최근 선택한 버튼에 환부 코드를 숨겨두고, 이름을 환부 이름으로 바꿔줌
		let bodyCd = $('input[name="BodyCodeRadio"]:checked').data('bodycode');
		let bodyNm = $('input[name="BodyCodeRadio"]:checked').data('bodyname');
		currentBodyCdBtn.text(bodyNm);
		currentBodyCdBtn.attr('data-bodycd', bodyCd);
		
		// 선택이 완료된 버튼 색깔 이쁘게 조정해줌
		currentBodyCdBtn.attr('style', 'background: #DBF2F4 !important; color: #0abab5; font-size: 1em;');
		
		// 버튼 추가 모달 초기화
		resetBodyCodeModal();
		
		// 모달 종료
		$("#bodyCdModal").modal("hide");
		$(".fade").attr('style', 'display: none');
		
		// 환부코드 저장 알림 띄우기
		Swal.fire({
			title: '환부가 선택되었습니다',
			icon: 'success',
			confirmButtonColor: '#0ABAB5',
			confirmButtonText: '확인'
		})
	});
	
	// 환부선택 모달에서 저장 혹은 취소 누를 때 체크해놓은거 초기화
	$(document).on('click', '#btnCancelBodyCd', resetBodyCodeModal);
	
	function resetBodyCodeModal(){
		$('input[name="BodyCodeRadio"]:checked').prop('checked', false);
	}
	// 환부코드 스크립트 끝
	
	
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
	
	
	// 생일로 만나이 계산
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
	
	
	// 이름 등이 글자를 제어하고 싶을 때 maxLength까지만 표시
	function truncateText(text, maxLength) {
		if (text.length > maxLength) {
			return text.slice(0, maxLength) + '...';
		} else {
		    return text;
		}
	}
	
	
	// 날짜형식 데이터를 넣으면 yyyy-MM-dd 로 변환해주는 함수
	function formatDateString(dateString) {

		const dateData = new Date(dateString);
		let year = dateData.getFullYear();
		let month = dateData.getMonth() + 1; 
		let date = dateData.getDate();
		
		// 한 자리 숫자에 0을 붙이는 처리
    	month = month < 10 ? '0' + month : month;
    	date = date < 10 ? '0' + date : date;
		
		let dateStr = `\${year}-\${month}-\${date}`;
		
		return dateStr;
	}
	
	
	// 대기목록에서 환자 선택 시 업데이트
	function updateClinicChart(){
		
		let cont = `
			<div class="dduk-history">
			<div style="height: 98%">
				<div class="subTitle-margin">
					<h2>진료 이력</h2>
				</div>
				<div class="history-scroll" style="height:100%">
					<!-- 환자 진료내역 들어오는곳 -->
					<div class="notice-text">환자를 선택해주세요</div>
				</div>
			</div>
		</div>
		<!-- 진료진행 -->
		<div class="patient-record" id="currentRecord">
			<div class="subTitle-margin">
				<div class="dduk-row" style="display:flex;justify-content: space-between;">
					<h2>진료 기록</h2>
				
					<button id="btnSaveClinic" class="pl gray-text">진료저장</button>
			    	<ul class="btn-save-listbox" id="listbox">
			       		<li><button class="btn-save-list gray-text">검사필요</button></li>
			        	<li><button class="btn-save-list gray-text">진료완료</button></li>
			        	<li><button class="btn-save-list gray-text">입원필요</button></li>
			    	</ul>
			</div>
			</div>
			<div class="gap-ver-16">
				<div class="dduk-inner-border record-content-fr record-scroll w-100">
					<div class="clinic-opinion-flex w-100">				
					<div class="textarea-wrap w-100">
						<h3>내원사유</h3>
						<textarea id="hsrpReason" class="dduck-input reason-box" readonly="readonly"></textarea>
						<br><br>
						<div class="dduk-row">
							<h3>진단명</h3>
							<button id="complete1" type="button" class="auto-complete-btn">
				               <svg width="24" height="" viewBox="0 0 600 600" fill="none" xmlns="http://www.w3.org/2000/svg">
				                  <path class="auto-complete-btn-path" d="m495.6 49.23-32.82-32.82C451.8 5.471 437.5 0 423.1 0c-14.33 0-28.66 5.469-39.6 16.41l-216 216.09c-8.4 7.5-12.7 17-15.1 27.3l-24.1 107.4c-1.8 8.9 5.1 16.8 12.8 16.8.916 0 1.852-.092 2.797-.281 0 0 74.03-15.71 107.4-23.56 10.1-2.377 19.13-7.46 26.46-14.79l217-217C517.5 106.5 517.4 71.1 495.6 49.23zM461.7 94.4l-217 217c-1.1 1.1-2.2 1.7-3.5 2-13.7 3.227-34.65 7.857-54.3 12.14l12.41-55.2c.29-1.44.99-2.84 2.09-3.84L417.5 50.4c1.9-1.99 4.1-2.4 5.6-2.4s3.715.406 5.65 2.342l32.82 32.83c3.23 3.168 3.23 8.098.13 11.228zM424 288c-13.25 0-24 10.75-24 24v128c0 13.23-10.78 24-24 24H72c-13.22 0-24-10.77-24-24V136c0-13.23 10.78-24 24-24h144c13.25 0 24-10.75 24-24s-10.7-24-24-24l-144.9-.01C32.31 63.99 0 96.29 0 135.1v304C0 479.7 32.31 512 71.1 512h303.1c39.69 0 71.1-32.3 71.1-72l2.7-128c0-13.2-10.7-24-24-24z" fill="#8d9ea5">
				                  </path>
				               </svg>
				            </button>
				        </div>
						<textarea id="clinicInjnm" class="dduck-input injury-name-box"></textarea>
						<br><br>
						<div class="dduk-row">
							<h3>소견</h3>
							<button id="complete2" type="button" class="auto-complete-btn">
				               <svg width="24" height="" viewBox="0 0 600 600" fill="none" xmlns="http://www.w3.org/2000/svg">
				                  <path class="auto-complete-btn-path" d="m495.6 49.23-32.82-32.82C451.8 5.471 437.5 0 423.1 0c-14.33 0-28.66 5.469-39.6 16.41l-216 216.09c-8.4 7.5-12.7 17-15.1 27.3l-24.1 107.4c-1.8 8.9 5.1 16.8 12.8 16.8.916 0 1.852-.092 2.797-.281 0 0 74.03-15.71 107.4-23.56 10.1-2.377 19.13-7.46 26.46-14.79l217-217C517.5 106.5 517.4 71.1 495.6 49.23zM461.7 94.4l-217 217c-1.1 1.1-2.2 1.7-3.5 2-13.7 3.227-34.65 7.857-54.3 12.14l12.41-55.2c.29-1.44.99-2.84 2.09-3.84L417.5 50.4c1.9-1.99 4.1-2.4 5.6-2.4s3.715.406 5.65 2.342l32.82 32.83c3.23 3.168 3.23 8.098.13 11.228zM424 288c-13.25 0-24 10.75-24 24v128c0 13.23-10.78 24-24 24H72c-13.22 0-24-10.77-24-24V136c0-13.23 10.78-24 24-24h144c13.25 0 24-10.75 24-24s-10.7-24-24-24l-144.9-.01C32.31 63.99 0 96.29 0 135.1v304C0 479.7 32.31 512 71.1 512h303.1c39.69 0 71.1-32.3 71.1-72l2.7-128c0-13.2-10.7-24-24-24z" fill="#8d9ea5">
				                  </path>
				               </svg>
				            </button>
				            <button id="complete3" type="button" class="auto-complete-btn">
				               <svg width="24" height="" viewBox="0 0 600 600" fill="none" xmlns="http://www.w3.org/2000/svg">
				                  <path class="auto-complete-btn-path" d="m495.6 49.23-32.82-32.82C451.8 5.471 437.5 0 423.1 0c-14.33 0-28.66 5.469-39.6 16.41l-216 216.09c-8.4 7.5-12.7 17-15.1 27.3l-24.1 107.4c-1.8 8.9 5.1 16.8 12.8 16.8.916 0 1.852-.092 2.797-.281 0 0 74.03-15.71 107.4-23.56 10.1-2.377 19.13-7.46 26.46-14.79l217-217C517.5 106.5 517.4 71.1 495.6 49.23zM461.7 94.4l-217 217c-1.1 1.1-2.2 1.7-3.5 2-13.7 3.227-34.65 7.857-54.3 12.14l12.41-55.2c.29-1.44.99-2.84 2.09-3.84L417.5 50.4c1.9-1.99 4.1-2.4 5.6-2.4s3.715.406 5.65 2.342l32.82 32.83c3.23 3.168 3.23 8.098.13 11.228zM424 288c-13.25 0-24 10.75-24 24v128c0 13.23-10.78 24-24 24H72c-13.22 0-24-10.77-24-24V136c0-13.23 10.78-24 24-24h144c13.25 0 24-10.75 24-24s-10.7-24-24-24l-144.9-.01C32.31 63.99 0 96.29 0 135.1v304C0 479.7 32.31 512 71.1 512h303.1c39.69 0 71.1-32.3 71.1-72l2.7-128c0-13.2-10.7-24-24-24z" fill="#8d9ea5">
				                  </path>
				               </svg>
				            </button>
						</div>
						<textarea id="clinicOpinion" class="dduck-input opinion-box"></textarea>
					</div>
					<div class="w-100 orderset-wrap">
						<div class="orderset-head d-flex">
							<h3 style="width:70px">오더세트</h3>
							<svg id="createOrderset" type="button" data-bs-toggle="modal" data-bs-target="#createOrdersetModal" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
								<g clip-path="url(#clip0_142_1638)">
								<path d="M18 13H13V18C13 18.55 12.55 19 12 19C11.45 19 11 18.55 11 18V13H6C5.45 13 5 12.55 5 12C5 11.45 5.45 11 6 11H11V6C11 5.45 11.45 5 12 5C12.55 5 13 5.45 13 6V11H18C18.55 11 19 11.45 19 12C19 12.55 18.55 13 18 13Z" fill="#8D9EA5"></path>
								</g>
								<defs>
								<clipPath id="clip0_142_1638">
								<rect width="24" height="24" fill="white"></rect>
								</clipPath>
								</defs>
							</svg>
							<img id="trashbin" class="trashbin" src="/resources/images/icons/trashbin.png">
							<img id="checkOrderSet" src="/resources/images/icons/check.png">
							<input type="text" class="dduck-input" id="keyword" placeholder="검색">
						</div>
						<div class="orderset-body dduk-inner-border">
						
						</div>
					</div>
				</div>
					
					<br><br>
					<!-- 상병진단부분 -->
					<div class="d-flex">
						<h3>상병진단</h3>
						<svg class="btn-order-modal" data-type="injury" type="button" data-bs-toggle="modal" data-bs-target="#createOrderModal"  xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
							<g clip-path="url(#clip0_142_1638)">
								<path d="M18 13H13V18C13 18.55 12.55 19 12 19C11.45 19 11 18.55 11 18V13H6C5.45 13 5 12.55 5 12C5 11.45 5.45 11 6 11H11V6C11 5.45 11.45 5 12 5C12.55 5 13 5.45 13 6V11H18C18.55 11 19 11.45 19 12C19 12.55 18.55 13 18 13Z" fill="#8D9EA5"/>
							</g>
							<defs>
								<clipPath id="clip0_142_1638">
									<rect width="24" height="24" fill="white"/>
								</clipPath>
							</defs>
						</svg>
						<img id="trashbinInjury" class="trashbin" src="/resources/images/icons/trashbin.png">
					</div>
					<table class="clinic-table injury-list-table">
						<tr class="tr-padding tr-column">
							<th class="td-padding gray-text" style="width:60px">코드</th>
							<th class="td-padding gray-text" style="width:100px">구분</th>
							<th class="td-padding gray-text" style="width:125px">한글명</th>
							<th class="td-padding gray-text" style="width:235px">영문명</th>
							<th class="td-padding gray-text" style="width:80px">발병일</th>
							<th class="td-padding gray-text" style="width:65px">환부</th>
						</tr>
						<tr>
							<td id="defaultInjury" colspan="6">상병진단을 추가해주세요</td>
						</tr>
					</table>
					<br>
					<!-- 검사오더부분 -->
					<div class="d-flex">
						<h3>검사오더</h3>
						<svg class="btn-order-modal" data-type="test" type="button" data-bs-toggle="modal" data-bs-target="#createOrderModal" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
							<g clip-path="url(#clip0_142_1638)">
							<path d="M18 13H13V18C13 18.55 12.55 19 12 19C11.45 19 11 18.55 11 18V13H6C5.45 13 5 12.55 5 12C5 11.45 5.45 11 6 11H11V6C11 5.45 11.45 5 12 5C12.55 5 13 5.45 13 6V11H18C18.55 11 19 11.45 19 12C19 12.55 18.55 13 18 13Z" fill="#8D9EA5"></path>
							</g>
							<defs>
							<clipPath id="clip0_142_1638">
							<rect width="24" height="24" fill="white"></rect>
							</clipPath>
							</defs>
						</svg>
						<img id="trashbinTest" class="trashbin" src="/resources/images/icons/trashbin.png">
					</div>
					<table class="clinic-table test-list-table">
						<tr class="tr-padding tr-column">
							<th class="td-padding gray-text" style="width:60px">코드</th>
							<th class="td-padding gray-text" style="width:175px">검사이름</th>
							<th class="td-padding gray-text" style="width:90px">검사자</th>
							<th class="td-padding gray-text" style="width:270px">검사결과</th>
							<th class="td-padding gray-text" style="width:65px">환부</th>
						</tr>
						<tr>
							<td id="defaultTest" colspan="5">검사오더을 추가해주세요</td>
						</tr>
					</table>
					<br>
					<!-- 처방오더부분 -->
					<div class="d-flex">
						<h3>처방오더</h3>
						<svg class="btn-order-modal" data-type="medicine" type="button" data-bs-toggle="modal" data-bs-target="#createOrderModal" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
							<g clip-path="url(#clip0_142_1638)">
							<path d="M18 13H13V18C13 18.55 12.55 19 12 19C11.45 19 11 18.55 11 18V13H6C5.45 13 5 12.55 5 12C5 11.45 5.45 11 6 11H11V6C11 5.45 11.45 5 12 5C12.55 5 13 5.45 13 6V11H18C18.55 11 19 11.45 19 12C19 12.55 18.55 13 18 13Z" fill="#8D9EA5"></path>
							</g>
							<defs>
							<clipPath id="clip0_142_1638">
							<rect width="24" height="24" fill="white"></rect>
							</clipPath>
							</defs>
						</svg>
						<img id="trashbinMedicine" class="trashbin" src="/resources/images/icons/trashbin.png">
					</div>
					<table class="clinic-table medicine-list-table">
						<tr class="tr-padding tr-column">
							<th class="td-padding gray-text" style="width:60px">코드</th>
							<th class="td-padding gray-text" style="width:90px">이름</th>
							<th class="td-padding gray-text" style="width:175px">약품상세</th>
							<th class="td-padding gray-text" style="width:205px">용법</th>
							<th class="td-padding gray-text" style="width:65px">처방량</th>
						</tr>
						<tr>
							<td id="defaultMedicine" colspan="5">처방오더을 추가해주세요</td>
						</tr>
					</table>
					<br>
					<!-- 치료오더부분 -->
					<div class="d-flex">
						<h3>치료오더</h3>
						<svg class="btn-order-modal" data-type="treatment" type="button" data-bs-toggle="modal" data-bs-target="#createOrderModal" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
							<g clip-path="url(#clip0_142_1638)">
							<path d="M18 13H13V18C13 18.55 12.55 19 12 19C11.45 19 11 18.55 11 18V13H6C5.45 13 5 12.55 5 12C5 11.45 5.45 11 6 11H11V6C11 5.45 11.45 5 12 5C12.55 5 13 5.45 13 6V11H18C18.55 11 19 11.45 19 12C19 12.55 18.55 13 18 13Z" fill="#8D9EA5"></path>
							</g>
							<defs>
							<clipPath id="clip0_142_1638">
							<rect width="24" height="24" fill="white"></rect>
							</clipPath>
							</defs>
						</svg>
						<img id="trashbinTreatment" class="trashbin" src="/resources/images/icons/trashbin.png">
					</div>
					<table class="clinic-table treatment-list-table">
						<tr class="tr-padding tr-column">
							<th class="td-padding gray-text" style="width:60px">코드</th>
							<th class="td-padding gray-text" style="width:535px">이름</th>
							<th class="td-padding gray-text" style="width:65px">환부</th>
						</tr>
						<tr>
							<td id="defaultTreatment" colspan="3">치료오더을 추가해주세요</td>
						</tr>
					</table>
				</div>
			</div>
		</div>`;
		
		$('.clinic-chart-cont').html(cont);
	}
	
	

	// 진료 저장 스크립트 시작
	// 입원 시작 스크립트를 분리시키기 위한 변수
	let clinicChartData = '';
	
	// 진료 버튼 누르면 리스트 보이기/감추기
	$(document).on('click', '#btnSaveClinic', function(){
		$('.btn-save-listbox').toggleClass('active');
	});
	
	// 리스트를 클릭할 때 버튼의 텍스트를 바꾸고, sweetalert로 진료를 저장할건지 물어본다
	$(document).on('click', '.btn-save-list', function(){
		
		// 기존의 text를 버튼의 text로 변경
		let newText = $(this).text();
		$('#btnSaveClinic').text(newText);
		$('.btn-save-listbox').toggleClass('active');
		
		Swal.fire({
			title: '진료상태를 변경 하시겠습니까???',
			icon: 'question',
			showCancelButton: true,
			confirmButtonColor: '#0ABAB5',
			cancelButtonColor: '#8D9EA5',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			// 확인버튼 클릭시
			if(result.isConfirmed) {
				
				// 유효성 체크
				if(!validationSaveClinic()) return;
				
				// db에 넣기위한 데이터들 처리
				// 진료번호, 진단명, 소견, 진료상태 가져오기
				let hsrpNo = currentHsrpNo;
				let clinicInjnm = $('#clinicInjnm').val();
				let clinicOpinion = $('#clinicOpinion').val();
				let clinicState = '';
				
				// 상병진단 추가 부분
				// clinicVO에 추가될 상병진단vo의 리스트
				let injuryDiagnosisVOList = [];
				// 상병진단 테이블의 tr중 과거 기록이 아닌 tr들을 가져옴
				let injuryTr = $('.injury-list-table tr.tr-data:not(.past-record)');
				
				// 가져온 상병진단 테이블의 tr들을 object로 만들어서 list에 넣어줌
				$.each(injuryTr, function(index, tr){
					
					let tds = $(tr).find('td');
					
					let injuryDiagnosisVO = {
						'ijCd' : tds.eq(0).text(),
						'indiType' : tds.eq(1).find('input[type="radio"]:checked').val(),
						'indiDt' : tds.eq(4).find('input[type="date"]').val(),
						'injuryBodyCd' : tds.eq(5).find('.btn-body').data('bodycd')
					};
					
					injuryDiagnosisVOList.push(injuryDiagnosisVO);
				});
				
				// 검사오더 추가 부분
				// clinicVO에 추가될 검사오더vo의 리스트
				let testOrderVOList = [];
				// 검사오더 테이블의 tr중 과거 기록이 아닌 tr들을 가져옴
				let testTr = $('.test-list-table tr.tr-data:not(.past-record)');
				
				// 가져온 검사오더 테이블의 tr들을 object로 만들어서 list에 넣어줌
				$.each(testTr, function(index, tr){
					
					let tds = $(tr).find('td');
					
					let testOrderVO = {
						'testCd' : tds.eq(0).text(),
						'testOrderBodyCd' : tds.eq(4).find('.btn-body').data('bodycd')
					};
					
					testOrderVOList.push(testOrderVO);
				});
				
				// 처방오더 추가 부분
				// clinicVO에 추가될 처방오더vo의 리스트
				let medicineOrderVOList = [];
				// 처방오더 테이블의 tr중 과거 기록이 아닌 tr들을 가져옴
				let medicineTr = $('.medicine-list-table tr.tr-data:not(.past-record)');
				
				// 가져온 처방오더 테이블의 tr들을 object로 만들어서 list에 넣어줌
				$.each(medicineTr, function(index, tr){
					
					let tds = $(tr).find('td');
					
					let medicineOrderVO = {
						'mediCd' : tds.eq(0).text(),
						'mdodDay' : tds.eq(3).find('.medicine-order-day').val(),
						'mdodPer' : tds.eq(3).find('.medicine-order-per').val(),
						'mdodDose' : tds.eq(3).find('.medicine-order-dose').val(),
						'mdodQt' : tds.eq(4).find('.medicine-order-qt').val()
					};
					
					medicineOrderVOList.push(medicineOrderVO);
				});
				
				// 치료오더 추가 부분
				// clinicVO에 추가될 치료오더vo의 리스트
				let treatmentOrderVOList = [];
				// 치료오더 테이블의 tr중 과거 기록이 아닌 tr들을 가져옴
				let treatmentTr = $('.treatment-list-table tr.tr-data:not(.past-record)');
				
				// 가져온 치료오더 테이블의 tr들을 object로 만들어서 list에 넣어줌
				$.each(treatmentTr, function(index, tr){
					
					let tds = $(tr).find('td');
					
					let treatmentOrderVO = {
						'tmCd' : tds.eq(0).text(),
						'bodyCd' : tds.eq(2).find('.btn-body').data('bodycd')
					};
					
					treatmentOrderVOList.push(treatmentOrderVO);
				});
				
				
				let clinicVO = {
						'paNo' : currentPaNo,
						'hsrpNo' : hsrpNo,
						'clinicInjnm' : clinicInjnm,
						'clinicOpinion' : clinicOpinion,
						'clinicState' : clinicState,
						'injuryDiagnosisVOList' : injuryDiagnosisVOList,
						'testOrderVOList' : testOrderVOList,
						'medicineOrderVOList' : medicineOrderVOList,
						'treatmentOrderVOList' : treatmentOrderVOList
				}
				
				console.log("controller로 보낼 clinicVO : ", clinicVO);
				
				// 입원필요 버튼을 눌렀을 때
				if(newText === '입원필요') {
					
					// 진료상태를 진료완료로 변경
					clinicVO.clinicState = 'CRST04';
					
					// 입원 정보를 입력받는 모달을 띄운다
					clinicChartData = '';
					clinicChartData = clinicVO;
					$('#createAdmissionChart').modal('show');				
					
				// 진료완료 또는 검사필요를 눌렀을 때
				} else {
					if(newText === '진료완료') {
						
						// 처방 내역중 과거의 내역이 아닌것들을 고름
						let isMedicineOrder = false;
						$('.medicine-list-table .tr-data').not('.past-record').each(function(index, tr) {
							// 만약 이번에 처방받은게 주사나 기타 처방이면
							if ($(tr).find('td').eq(2).text() === '주사' || $(tr).find('td').eq(2).text() === '기타 처방') {
								// 처방필요를 true로 바꿈
								isMedicineOrder = true;
							}
						});
						
						// 만약 진료완료를 눌렀는데 주사, 기타처방중 과거의 내역이 없을 때
						if(isMedicineOrder){
							// 진료상태를 처치대기로 변경
							clinicVO.clinicState = 'CRST06';
						// 그 외엔 그냥 진료완료로 변경(처치 할 필요가 없을 때)
						} else {
							// 진료상태를 그냥 진료완료로 변경
							clinicVO.clinicState = 'CRST04';
						}
						
						
					} else if(newText === '검사필요') {
						clinicVO.clinicState = 'CRST05';
					}
					
					// 진료차트를 갱신한다
					$.ajax({
						url: '/clinic/updateClinicChart',
						type: "post",
						data: JSON.stringify(clinicVO),
						contentType: "application/json; UTF-8",
						dataType: 'json',
						beforeSend:function(xhr){
	    					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	    				},
	    				success: function(rst){
	    					console.log('진료차트 갱신 결과 : ', rst);
	    					
	    					Swal.fire({
	    						title: '진료차트가 저장되었습니다',
	    						icon: 'success',
	    						confirmButtonColor: '#0ABAB5',
	    						confirmButtonText: '확인',
	    					})
	    					
	    					resetClinicChart();
	    				},
	    				error: function(xhr, status, error){
	    					console.log('Error:', xhr, status, error);
	    				}
					});
				}
            };
		});
	});
	
	
	// 입원 차트 생성 모달에서 저장버튼 누를 시
	$(document).on('click', '#btnSaveCreateAdmissionChart', function(event){
		
		// 입원 사유 가져옴
		let admiReason = $('#admissionReason').val();
		
		$('.daterangepicker').css('display', 'none');
		
		// 입원 사유가 입력이 안됐으면 오류
		if(admiReason === ''){
			
			Swal.fire({
    			title: '입원사유가 입력되지 않았습니다',
    			icon: 'warning',
    			confirmButtonColor: '#0ABAB5',
    			confirmButtonText: '확인',
    			didOpen: () => {
    				$('.daterangepicker').css('display', 'none');
    			}
    		}).then((result) => {
    		    if (result.isConfirmed) {
    		        $('.daterangepicker').css('display', 'none');
    		    }
    		});
			return;
		}
		
		$('.daterangepicker').css('display', 'none');
		
		// 입원시작일, 퇴원예상일 가져옴
		var picker = $('#expectAdmissionDateInput').data('daterangepicker');
		var startDate = picker.startDate.format('YYYY-MM-DD');
		var endDate = picker.endDate.format('YYYY-MM-DD');
		
		// 사유와 날짜, 환자번호를 객체에 넣어준다
		let admissionChartVO = {
			'admiIndt' : startDate,
			'admiExpOutdt' : endDate,
			'admiReason' : admiReason,
			'paNo' : currentPaNo
		}

		// 위에서 임시로 저장해둔 진료차트 데이터를 가져온다
		let data = {
			'clinicChartVO' : clinicChartData,
			'admissionChartVO' : admissionChartVO
		}
		
		console.log('입원 시작할때 넣어줄 진료 및 입원vo 정보 : ', data);
		
		// 진료차트 갱신 및 입원차트 생성
		$.ajax({
			url: '/ams/admissionInsert',
			type: "post",
			data: JSON.stringify(data),
			contentType:"application/json;charset=utf-8",
			dataType: 'json',
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			success: function(rst){
				
				console.log("입원차트 생성 및 진료차트 갱신 결과 : ", rst);
				
				Swal.fire({
					title: '진료차트가 갱신되었습니다',
					icon: 'success',
					confirmButtonColor: '#0ABAB5',
					confirmButtonText: '확인',
					didOpen: () => {
	    				$('.daterangepicker').css('display', 'none');
	    			}
				}).then((result) => {
	    		    if (result.isConfirmed) {
	    		        $('.daterangepicker').css('display', 'none');
	    		    }
	    		});
				
				// 모달 종료 및 모달 초기화
				$("#createAdmissionChart").modal("hide");
				$(".fade").attr('style', 'display: none');
				resetCreateAdmissionChart();
				
				// 환자페이지 초기화
				resetClinicChart();
			},
			error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
			}
		});
	});
	
	// 입원 차트 생성 모달에서 취소버튼 누르면 모달 초기화
	$(document).on('click', '#btnCancelCreateAdmissionChart', resetCreateAdmissionChart);
	
	// 입원 차트 생성 모달 초기화
	function resetCreateAdmissionChart(){
		$('#admissionReason').val('');
	}
	
	// 입원 차트 생성 모달 날짜선택
	$('#expectAdmissionDateInput').daterangepicker({
    	"showDropdowns": true,
    	"autoApply": true,
    	"locale": {
            "format": "YYYY-MM-DD",
            "separator": " ~ ",
            "applyLabel": "확인",
            "cancelLabel": "취소",
            "fromLabel": "From",
            "toLabel": "To",
            "customRangeLabel": "Custom",
            "weekLabel": "W",
            "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
            "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
        },
        "parentEl": "expectAdmissionDateDiv",
   		"startDate": moment(),
    	"endDate": moment().add(6, 'days'),
    	"opens": "right",
    	"buttonClasses": "btn-admission-range",
    	"applyButtonClasses": "btn-save-admission-range",
    	"cancelClass": "btn-cancel-admission-range"
	});
	
	
	// 진료 저장시 유효성 검사
	function validationSaveClinic(){
		
		let isValidated = true;
		
		// 1.상병진단리스트의 자식중 선택이 안된 radio가 있으면 경고
		let injuryTr = $('.injury-list-table tr.tr-data:not(.past-record)');
		$.each(injuryTr, function(index, tr){
			let isChecked = $(tr).find('input[type="radio"]:checked').val();
			if(!isChecked){
				Swal.fire({
	    			title: '선택되지 않은 상병분류가 있습니다',
	    			icon: 'warning',
	    			confirmButtonColor: '#0ABAB5',
	    			confirmButtonText: '확인',
	    		})
	    		isValidated = false;
			}
		});
		
		// 2.상병진단리스트의 자식중 선택이 안된 발병일이 있으면 경고
		$.each(injuryTr, function(index, tr){
			let isSelectDate = $(tr).find('input[type="date"]').val();
			if(!isSelectDate){
				Swal.fire({
	    			title: '선택되지 않은 발병일이 있습니다',
	    			icon: 'warning',
	    			confirmButtonColor: '#0ABAB5',
	    			confirmButtonText: '확인',
	    		})
	    		isValidated = false;
			}
		})
		
		// 3.처방오더의 자식중 입력이 안된 input요소가 있으면 용법/처방량을 입력해주세요
		let medicineInput = $('.medicine-list-table tr.tr-data:not(.past-record)').find('input[type="number"]');
		$.each(medicineInput, function(index, input){
			let isInput = $(input).val();
			if(!isInput){
				Swal.fire({
	    			title: '입력되지 않은 처방 정보가 있습니다',
	    			icon: 'warning',
	    			confirmButtonColor: '#0ABAB5',
	    			confirmButtonText: '확인',
	    		})
	    		isValidated = false;
			}
		});
		
		// 4.선택되지않은 환부코드가 존재하면 경고
		let btnBodyList = $('.btn-body');
		$.each(btnBodyList, function(index, btn){
			if($(btn).text() === '환부선택') {
				Swal.fire({
	    			title: '선택되지 않은 환부가 존재합니다',
	    			icon: 'warning',
	    			confirmButtonColor: '#0ABAB5',
	    			confirmButtonText: '확인',
	    		})
				isValidated = false;
			}
		});
		
		return isValidated;
	}
	
	
	// 진료 완료시 다시 초기페이지로 만들기
	function resetClinicChart(){

		cont = '<h1 class="h1-default">환자를 선택해주세요</h3>';
		$('.clinic-chart-cont').html(cont);
		
		$('#paInfoHeight').text('--');
		$('#paInfoWeight').text('--');
		$('#paInfoBldType').text('--');
		$('#paInfoName').text('--');
		$('#paInfo').text('');
		
		// 이전에 선택된 요소의 클래스 초기화
        $(".tr-paInfo").removeClass("selected");
		
		// 환자 대기화면 갱신
        loadReceptionList();
	}
	
	
	// 진료 저장 스크립트 끝

	
<!-- 오더세트(트리뷰) 함수 시작 -->
	//노드정보를 저장하기 위한 변수
	var data = [];
	
 	// 트리구조를 비동기통신 방식으로 서버에서 받아온 후 설정해주는 함수
	function renderTree() {
 		
 		data = [];
 		
        $.ajax({
            url: "/orderSet/getOrderSetList",
            dataType: "json",
            type: "post",
            beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
            success: function(rst) {
            	
            	console.log("불러온 오더세트VO 리스트 : ", rst);
            	
                $.each(rst, function (idx, chart) {
                	
                	// 트리뷰 한 줄에대한 정보를 tempObj에 저장
                    let tempObj = {
                        id: chart.orderSetCd,
                        parent: chart.orderSetParcd,
                        text: chart.orderSetNm,
                        osty: chart.orderSetType,
                        orderCode: chart.orderSetOrdcd,
                        type: "file"
                    };
                	
                    if (tempObj.orderCode == null){
                    	tempObj.orderCode = "";
                    }
                    
                    // 오더세트 타입이 오더세트 오더파일이면
                    if (tempObj.osty == "OSTY01") {
                        tempObj.type = "folder";
                    }
                    // 오더세트 타입이 상병진단이면
                    if (tempObj.osty == "OSTY02") {
                        tempObj.type = "injury";
                    }
                    // 오더세트 타입이 약처방이면
                    if (tempObj.osty == "OSTY03") {
                        tempObj.type = "medicine";
                    }
                    // 오더세트 타입이 주사면
                    if (tempObj.osty == "OSTY04") {
                        tempObj.type = "injection";
                    }
                    // 오더세트 타입이 검사면
                    if (tempObj.osty == "OSTY05") {
                        tempObj.type = "test";
                    }
                    // 오더세트 타입이 치료면
                    if (tempObj.osty == "OSTY06") {
                        tempObj.type = "treatment";
                    }
                    
                   	// 이렇게 설정된 노드1개의 정보를 위에서 선언한 data배열에 추가
                    data.push(tempObj);
                });
                
                // js트리를 한번 부순 후 생성
                $(".orderset-body").jstree('destroy');
                
                // 위에서 설정된 data를 이용해 트리구조 생성
                $(".orderset-body").jstree({
                    core: {
                        data: data,
                        check_callback: true
                    },
                    plugins : ["search", "types", "checkbox"],
                    types : {
                        'folder' : {
                        	"checkbox" : false,
                            "icon" : "/resources/images/icons/icon-folder.png"
                        },
                        'file' : {
                            "icon" : "/resources/images/icons/icon-file.png",
                        },
                        'injury' : {
                            "icon" : "/resources/images/icons/icon-injury.png",
                        },
                        'medicine' : {
                            "icon" : "/resources/images/icons/icon-medicine.png",
                        },
                        'treatment' : {
                            "icon" : "/resources/images/icons/icon-treatment.png",
                        },
                        'test' : {
                            "icon" : "/resources/images/icons/icon-test.png",
                        },
                        'injection' : {
                        	"icon" : "/resources/images/icons/icon-injection.png",
                        },
                        default: {
                            "icon": "/resources/images/icons/icon-file.png"
                        }
                    }
                });
            },
            error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
			}
        });
    }
 	
 	
 	// 오더세트 추가 버튼 누를 시 모달창 띄우기
 	$(document).on('click', '#createOrderset', function(){
        $('#createOrdersetModal').modal('show');
        // 오더세트를 연속으로 추가할 때 이전에 남아있던 배열이 있을 수 있어서 한번 초기화
        data = [];
    });

 	
	// 모달 저장버튼 누를시 
	$(document).on('click', '#btnAddOrderset', function(){
		
		// 만약 오더세트 이름이 입력이 안됐으면 alert를 띄운다
		if($('#ordersetName').val() == ""){
			Swal.fire({
				title: '오더세트 이름을 입력해주세요',
				icon: 'warning',
				confirmButtonColor: '#0ABAB5',
				confirmButtonText: '확인',
			})
		}
		
		// 지금 선택된 값이 오더인지 오더세트인지 확인
		// 오더세트면 부모노트를 #로, 오더세트타입을 오더세트묶음으로
		if($('#ordersetType').val() === '오더세트'){
			
			data = {
				'orderSetParcd' : '#',
				'orderSetType' : 'OSTY01',
				'orderSetNm' : $('#ordersetName').val()
			}
		// 오더면 부모노드를 선택된 부모 노드코드로, 오더세트타입을 선택된 값으로
		} else if($('#ordersetType').val() === '오더'){
			
			// 만약 상위오더세트가 없을 때
			if($('#ordersetPar option:selected').data('ordersetcd') == null){
				Swal.fire({
					title: '상위 오더세트가 존재하지 않습니다',
					icon: 'warning',
					confirmButtonColor: '#0ABAB5',
					confirmButtonText: '확인',
				})
			}
			
			// 만약 오더를 안골랐으면
			if(!$('.table-result').length){
				Swal.fire({
					title: '추가할 오더를 선택해주세요',
					icon: 'warning',
					confirmButtonColor: '#0ABAB5',
					confirmButtonText: '확인',
				})
			}
			
			// 오더세트 카테고리, 만약 주사를 선택시 카테고리가 주사로 들어감
			orderSetType = $('#ordersetCategory option:selected').data('type');
			if($('.table-result td').eq(2).text() == '주사'){
				orderSetType = 'OSTY04';
			}
			
			data = {
				// 부모의 orderSetCd값 가져오기
				'orderSetParcd' : $('#ordersetPar option:selected').data('ordersetcd'),
				// 오더분류값(처방인지 뭔지,.)
				'orderSetType' : orderSetType,
				// 설정할 이름
				'orderSetNm' : $('#ordersetName').val(),
				// 오더코드값
				'orderSetOrdcd' : $('.table-result td').eq(0).text()
			}
			
			console.log(data);
		}
		
		$.ajax({
			url: '/orderSet/createOrderSet',
			data: JSON.stringify(data),
			contentType:"application/json;charset=utf-8",
			dataType: 'json',
			type: 'post',
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: function(rst){
				console.log("오더세트 create의 rst : ", rst);
				
				// 모달 내용 초기화
				resetOrdersetModal();
				
				// 모달 숨기기
				$("#createOrdersetModal").modal("hide");
				$(".fade").attr('style', 'display: none');
				
				// 오더세트 내용 갱신
				renderTree();
				
				// sweetalert2 띄우기
				Swal.fire({
					title: '오더세트 추가가 완료되었습니다',
					icon: 'success',
					confirmButtonColor: '#0ABAB5',
					confirmButtonText: '확인',
				})
			},
			error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
			}
		});
	});
	// 모달 종료시 모달 내용 초기화
	$(document).on('click', '#btnCancelOrderset', resetOrdersetModal);
 	
	function resetOrdersetModal(){
		
		// 카테고리 선택 다시 활성화
		$("#ordersetCategory").prop("disabled", false);
		
		$('#ordersetType').val('오더세트');
		$('.addOrderset-body').html('');
		$('#ordersetName').val('');
	}
	
 	// 오더세트 추가 모달에서 오더세트 유형 변경 시 실행되는 함수(오더세튼지 오더인지에 따라 받는값이 다름)
	$(document).on('change', '#ordersetType', function(){
    	
		// 오더세트 클릭시
		if($("#ordersetType option:selected").data("type") == 'orderset'){
			$('.addOrderset-body').html("");
		}
		
		// 오더 클릭시
		if($("#ordersetType option:selected").data("type") == 'order'){
			
			// 오더세트묶음 목록을 불러온다음 최상위 노드만 골라서 상위오더세트 목록에 출력
			$.ajax({
				url: '/orderSet/getOrderSetList',
				dataType: 'json',
				type: 'post',
				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
				},
				success: function(rst){
					console.log("불러온 오더세트VO 리스트 : ", rst);
					
					let cont = '';
					cont += '<div class="dduk-row">';
					cont += '<div class="dduk-login-d">';
					cont += '<div class="login-input-label">오더분류</div>';
					cont += '<div role="group">';
					cont += '<span>';
					cont += '<select class="order-select" id="ordersetCategory" name="ordersetCategory">';
					cont += '<option>오더세트 카테고리 선택</option>';
					cont += '<option data-type="OSTY02">상병</option>';
					cont += '<option data-type="OSTY05">검사</option>';
					cont += '<option data-type="OSTY03">처방</option>';
					cont += '<option data-type="OSTY06">치료</option>';
					cont += '</select>';
					cont += '</span>';
					cont += '</div>';
					cont += '</div>';
					cont += '<div class="dduk-login-d">';
					cont += '<div class="login-input-label">상위오더세트</div>';
					cont += '<div role="group">';
					cont += '<span>';
					cont += '<select class="order-select" id="ordersetPar" name="ordersetPar">';
					
					$.each(rst, function(index, orderSetVO){
						// 만약 최상위 노드(오더세트 묶음) 이면
						if(orderSetVO.orderSetParcd == '#'){
							// 트리구조에 오더세트 묶음 이름 추가 및 오더세트코드를 숨겨둠
							cont += '<option data-orderSetCd='+orderSetVO.orderSetCd+'>'+orderSetVO.orderSetNm+'</option>';
						}
					})
					
					cont += '</select>';
					cont += '</span>';
					cont += '</div>';
					cont += '</div>';
					cont += '</div>';
					cont += '<div class="dduk-row">';
					cont += '<div class="dduk-login-d">';
					cont += '<div class="login-input-label">오더검색</div>';
					
					// 검색창 시작
					cont += '<div class="input-search-wrap">';
					cont += '<div id="orderSetSearch" class="input-search">';
					cont += '<input type="text" id="searchOrderset" class="input-search-value" autocomplet="off" />';
					cont += '<img src="/resources/images/icons/arrow.png" class="arrow"/>';
					cont += '</div>';
					cont += '<table class="table-search" border="1">';
					cont += '<tbody class="tbody-search">';
					cont += '</tbody>';
					cont += '</table>';
					cont += '</div>';
					// 검색창 끝
					
					cont += '</div>';
					cont += '</div>';
					
					$('.addOrderset-body').html(cont);
				},
				error: function(xhr, status, error){
					console.log('Error:', xhr, status, error);
				}
			});
		}
    });
 	
 	
 	// 오더세트 추가 검색기능 시작
 	// 검색시 검색 목록을 넣어주기 위한 배열
	var dataList = [];
 	
 	
 	// 오더세트의 오더 카테고리를 변경하면 selectedIndex를 변경
 	$(document).on('change', '#ordersetCategory', function(){
 		
 		let selected = $("#ordersetCategory option:selected").val();
 		let categoryUrl = "";
 		
 		switch (selected) {
 		case '오더세트 카테고리 선택':
 			categoryUrl = '';
 			width = [];
 			break;
        case '상병':
        	categoryUrl = '/orderSet/getInjuryVOList';
        	width = ['20px', '70px', '130px'];
            break;
        case '검사':
        	categoryUrl = '/orderSet/getTestVOList';
        	width = [];
            break;
        case '처방':
        	categoryUrl = '/orderSet/getMedicineVOList';
        	width = [];
            break;
        case '치료':
        	categoryUrl = '/orderSet/getTreatmentVOList';
        	width = [];
            break;
   		}
 		
 		// 만약 카테고리를 선택하지 않았으면
 		if(categoryUrl == '') {
 			dataList = ['검색어를 선택해주세요'];
 		// 카테고리 선택시
 		} else {
 			// 우선 배열을 초기화
 			dataList = [];
 			// 선택한 카테고리에 따라 검색목록을 갱신
 			$.ajax({
 				url: categoryUrl,
 				dataType: 'json',
 				type: 'post',
 				beforeSend:function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success: function(rst){
					console.log('오더세트 추가 에서 오더카테고리에 따른 검색 풀 : ' , rst);
					
					// vo만큼 순회
					$.each(rst, function(index, vo){
						// 한 vo안의 모든 정보들을 담기위한 변수 
						let str = "";
						// vo안의 데이터 만큼 순회
						$.each(vo, function(index, column){
							// 검사일 때 가격은 안담아야됨
							// 처방일 때 약분류, 재고, 제조사, 보험적용여부, 총함량은 안가져와도 됨
							// 치료일 때 가격이랑 보험적용여부는 필요 없음
							if(index != 'testPrice' &&
							   index != 'mediType' && index != 'mediStock' && index != 'mediMaker' && index != 'insuYn' && index != 'mediCont' && index != 'mediPrice' &&
							   index != 'tmPrice' && index != 'insuYn'){
								str += (column + ',');
							}
						});
						
						dataList.push(str);
					});
					
					console.log("갱신된 검색 풀", dataList);
					
					updateResultTable(dataList, width);
				},
				error: function(xhr, status, error){
					console.log('Error:', xhr, status, error);
				}
 			});
 		}
 	});
 	
 	
 	// 오더세트 추가 모달에서 오더세트 검사 함수
 	// 검색창에서 단어를 입력할 때 마다 실행
	$(document).on('keyup', '#searchOrderset', function() {
		let value = $('#searchOrderset').val().trim();
		let matchDataList = dataList.filter((label) => label.includes(value));
		updateResultTable(matchDataList, width);
	});
 	
 	
 	// 검색결과의 배열인 data를 이용해서 테이블로 만들어주는 함수
 	// data에는 검색결과의 배열이 들어오고
 	// width에는 내가 주고       싶은 각각의 td값의 width를 넣으면 된다
 	function updateResultTable(data, width){
 		$('.tbody-search').html('');
 		let cont = "<tr>";
 		
 		// 우선 배열의 길이만큼 실행
 		$.each(data, function(index, str){
 			// ,를 정규식으로 만들어줌
 			let regex = new RegExp(',', 'g');
 			// 배열의 한 요소에서 , 의 개수를 파악 후 그 개수만큼 반복
 			let matches = str.match(regex);
 			let repeat = matches.length;
 			
 			// 배열 안의 구문자(,)의 개수만큼 실행 = td(컬럼)의 개수
 			for(let i = 0; i < repeat; i++){
 				let value = str.split(',')[i];
 				cont += "<td class='option' style='width:"+width[i]+"'>"+value+"</td>"
 			}
 			
 			cont += "</tr>"
 		})
 		
 		$('.tbody-search').append(cont);
 	}
 	
 	
	// 검색결과를 선택 시 검색결과 숨기기/보이기 및 선택한 결과를 반영
	$(document).on('click', '.option', function(){
		toggleTableSearch();
		getDataValue($(this));
	});
	// 화살표 선택 시 검색결과 숨기기/보이기
	$(document).on('click', '.arrow', toggleTableSearch);


	// css를 이용해 검색창 숨기기/보이기
	function toggleTableSearch(){
		
		// 만약 배열의 길이가 0이면(검색 결과가 없으면) 함수를 종료시켜서 미리보기가 안되도록 함
		if(dataList.length === 0){
			return;
		}
		
		let $tableSearch = $('.table-search');
	    $tableSearch.toggleClass('active');
	}


	// 오더 목록에서 검색결과를 input창에 대신 넣어버리기
	function getDataValue(clickedOption) {
		
		// 이제 더이상 카테고리를 바꾸면 안되므로 막아놓음
		$("#ordersetCategory").prop("disabled", true);
		
		let clone = clickedOption.closest('tr').html();
		let cont = '<table class="table-result"><tr>' + clone + '<tr></table>';
		$('#orderSetSearch').html(cont);
		
		let tds = $('.table-result tr td');
		$.each(tds, function(index){
			tds.eq(index).attr('class', 'orderset-search-result-fixed');
		});
		
		// 만약 이름을 아직 안지었다면 이름을 오더세트 이름쪽에 넣어주기
		if($('#ordersetName').val() == ''){
			$('#ordersetName').val($('.table-result tr td').eq(1).text());
		}
	}
 	// 오더세트 추가 검색기능 끝
 	
 	
 	// 선택한 노드를 삭제해주는 함수
 	$(document).on('click', '#trashbin', function(){
 		
 		Swal.fire({
			title: '선택된 오더세트들을 삭제하시겠습니까???',
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#0ABAB5',
			cancelButtonColor: '#8D9EA5',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			// 확인버튼 클릭시
			if (result.isConfirmed) {
				// 현재 선택한 모든 노드들을 가져옴
				const delArr = $(".orderset-body").jstree(true).get_selected(true);
				// 삭제할 노드들의 정보를 담을 배열
                const data = [];
             	// 선택된 각 노드에 대해 순회하며 처리
                delArr.forEach(delNode => {
                    data.push({
                        orderSetCd : delNode.id
                    });
                });
             	
             	console.log('data : ', data);
             	
             	// db에서 제거 후 제거 성공시 성공알림 띄우기 및 새로고침
                $.ajax({
                    url: "/orderSet/deleteOrderSet",
                    contentType: "application/json; UTF-8",
                    dataType: "json",
                    data: JSON.stringify(data),
                    type: "post",
                    beforeSend:function(xhr){
    					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
    				},
                    success: function(rst){
                    	
                    	console.log("오더세트 삭제 결과 : ", rst);
                    	
                    	// 삭제완료처리
                    	Swal.fire({
                			title: '오더세트가 성공적으로 삭제되었습니다',
                			icon: 'success',
                			confirmButtonColor: '#0ABAB5',
                			confirmButtonText: '확인',
                		})
                		
                		// 트리뷰 갱신
                		renderTree();
                    },
                    error: function(xhr, status, error){
    					console.log('Error:', xhr, status, error);
    				}
                });
            };
		});
 	});
 	
 	
 	// 오더세트 검색을 위한 함수
 	// 검색창의 값이 입력될 때 마다 검색
 	$(document).on('input', '#keyword', function(event){
    	// 입력된 값 가져오기
        let keyword = $(this).val();
		// jstree의 내장함수를 이용해 검색결과에 효과를 주는부분
        $(".orderset-body").jstree(true).search(keyword);
    });
 	
 	
 	// 오더세트를 선택 후 추가 버튼을 누르면 
 	$(document).on('click', '#checkOrderSet', function(){
 		
 		// 우선 선택한거 추가할건지 물어봄
 		Swal.fire({
			title: '선택된 오더세트들을 추가하시겠습니까???',
			icon: 'question',
			showCancelButton: true,
			confirmButtonColor: '#0ABAB5',
			cancelButtonColor: '#8D9EA5',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			// 확인버튼 클릭시
			if (result.isConfirmed) {
				// 현재 선택한 모든 노드들을 가져옴
				const selArr = $(".orderset-body").jstree(true).get_selected(true);
				// 삽입할 노드들의 정보를 담을 배열
                const dataList = [];
				
             	// 선택된 각 노드에 대해 순회하며 처리
                selArr.forEach(selNode => {
                	
                	dataList.push({
                    	// 해당 데이터의 p.k인 코드값과 어떤 데이턴지, 이 2개를 가져옴
                        orderCode : selNode.original.orderCode,
                        osty : selNode.original.osty
                    });
                });
             	
             	console.log('본문에 삽입될 노드 정보들 : ', dataList);
             	
             	// 삽입될 각 노드에 대해 반복
             	$.each(dataList, function(index, data){
             		
             		let orderSetDetailUrl = '';
             		
             		// 만약 폴더면? 본문에 삽입 X
             		if(data.osty === 'OSTY01'){
             			return;
             		// 만약 상병이면?
             		} else if(data.osty === 'OSTY02') {
             			orderSetDetailUrl = '/orderSet/getInjuryVODetail';
             		// 만약 약처방 또는 주사면?
             		} else if(data.osty === 'OSTY03' || data.osty === 'OSTY04') {
             			orderSetDetailUrl = '/orderSet/getMedicineVODetail';
             		// 만약 검사면?
             		} else if(data.osty === 'OSTY05') {
             			orderSetDetailUrl = '/orderSet/getTestVODetail';
             		// 만약 치료면?
             		} else if(data.osty === 'OSTY06') {
             			orderSetDetailUrl = '/orderSet/getTreatmentVODetail';
              		}
             		
             		// db에서 해당 정보에 대해 자세한 정보를 가져옴
                    $.ajax({
                        url: orderSetDetailUrl,
                        dataType: "json",
                        data: {'orderCode' : data.orderCode},
                        type: "post",
                        beforeSend:function(xhr){
        					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
        				},
                        success: function(rst){
                        	console.log("본문에 추가할 오더세트의 오더 정보 상세 : ", rst);
                        	
                        	// 이제 각 유형에 따라 아래에 적당한 테이블을 추가시켜주면 됨
                        	// 만약 상병이면?
                 			if(data.osty === 'OSTY02') {
                 			
                 				// 몇번째 병 진단인지 체크(radio속성을 위해)
                 				let allInjuryType = $('[name*="injuryType"]');
                 				let index = 1;
                 				
                 				while(true){
                 					// injuryType + index가 존재하면
                 					if($('[name="injuryType'+index+'"]').length){
                 						// 인덱스를 1 늘리고 다시 탐색
                 						index += 1;
                 					// injuryType + index가 존재하지 않으면 탈출(인덱스를 그대로 사용)
                 					} else {
                 						break;
                 					}
                 				}
	                 			
	                 			let injuryCd = $('.table-order-result td').eq(0).text();
                 				let injuryNm = $('.table-order-result td').eq(1).text();
                 				let injuryEnm = $('.table-order-result td').eq(2).text();
                 			
                 				let cont = `
                 					<tr class="tr-padding tr-data">
                 						<td class="td-padding-data gray-text">\${rst.ijCd}</td>
                 						<td class="td-padding-data gray-text" style="padding-top:1%">
                 							<label for="major">주</label>
                 							<input type="radio" name="injuryType\${index}" class="major" value="IDTY01" />
                 							<label for="minor">부</label>
                 							<input type="radio" name="injuryType\${index}" class="minor" value="IDTY02" />
                 							<label for="excluded">배제</label>
                 							<input type="radio" name="injuryType\${index}" class="excluded" value="IDTY03" />
                 						</td>
                 						<td class="td-padding-data gray-text">\${rst.ijNm}</td>
                 						<td class="td-padding-data gray-text">\${rst.ijEnm}</td>
                 						<td class="td-padding-data gray-text"><input type="date"></td>
                 						<td class="td-padding-data gray-text">
                 							<button class="dduk-btn-disabled btn-state btn-body" data-bs-toggle="modal" data-bs-target="#bodyCdModal">환부선택</button>
                 						</td>
                 					</tr>`;
                 				
                 				// 만약 기본 메세지가 남아있다면
                 				if($('#defaultInjury').length){
                 					$('#defaultInjury').remove();
                 				}
                 			
                 				$('.injury-list-table').append(cont);
                 			
                 			// 만약 약처방 또는 주사면?
                 			} else if(data.osty === 'OSTY03' || data.osty === 'OSTY04') {
                 			
                 				let cont = `
                 					<tr class="tr-padding tr-data">
                 						<td class="td-padding-data gray-text" style="padding: 1%">\${rst.mediCd}</td>
                 						<td class="td-padding-data gray-text">\${rst.mediNm}</td>
                 						<td class="td-padding-data gray-text">\${rst.mediDetail}</td>`;
                 					
                 					// 1. 약품상세에 '연고' 라는 이름이 들어갈 때 -> 용법(투여주기 일 투여횟수 회) 처방량(-일분)
                 					if(rst.mediDetail.indexOf('연고') !== -1){
                 						cont += `	
                 							<td class="td-padding-data gray-text">
                 								<input type="number" class="medicine-order-day" />일
                 								<input type="number" class="medicine-order-per" />회	
                 							</td>
                 							<td class="td-padding-data gray-text">
                 								<input type="number" class="medicine-order-qt" />개
                 							</td>
                 						</tr>`;
                 					// 2. 약품상세가 주사일 때, 기타 처방 일 때 -> 용법(-) 처방량(-)
                 					} else if(rst.mediDetail === '주사' || rst.mediDetail === '기타 처방'){
                 						cont += `	
                 							<td class="td-padding-data gray-text">-</td>
                 							<td class="td-padding-data gray-text">-</td>
                 						</tr>`;
                 					// 3. 패치형 진통제인 경우 -> 용법(-) 처방량(-개)
                 					} else if(rst.mediDetail === '패치형 진통제'){
                 						cont += `	
                 							<td class="td-padding-data gray-text">-</td>
                 							<td class="td-padding-data gray-text">
                 								<input type="number" class="medicine-order-qt" />개
                 							</td>
                 						</tr>`;
                 					// 4. 기본 -> 용법(투여주기 일 투여횟수 회 투여량 알) 처방량(-일분)
                 					} else {
                 						cont += `	
                 							<td class="td-padding-data gray-text">
                 								<input type="number" class="medicine-order-day" />일
                 								<input type="number" class="medicine-order-per" />회
                 								<input type="number" class="medicine-order-dose" />정
                 							</td>
                 							<td class="td-padding-data gray-text">
                 								<input type="number" class="medicine-order-qt" />일분
                 							</td>
                 						</tr>`;
                 					}
                 					
                 					
                 				// 만약 기본 메세지가 남아있다면
                 				if($('#defaultMedicine').length){
                 					$('#defaultMedicine').remove();
                 				}
                 				$('.medicine-list-table').append(cont);
                 			
                 			// 만약 검사면?
                 			} else if(data.osty === 'OSTY05') {
                 			
                 				let cont = `
                 					<tr class="tr-padding tr-data">
                 						<td class="td-padding-data gray-text" style="padding: 1%">\${rst.testCd}</td>
                 						<td class="td-padding-data gray-text">\${rst.testNm}</td>
                 						<td class="td-padding-data gray-text">검사 미진행</td>
                 						<td class="td-padding-data gray-text"></td>`;
                 					
                 				// 피검사나 소변검사는 환부 코드가 필요하지 않음
                 				if(!(rst.testNm === '피검사') && !(rst.testNm === '소변검사')){
                 					cont += `
                 						<td class="td-padding-data gray-text">
                 							<button class="dduk-btn-disabled btn-state btn-body" data-bs-toggle="modal" data-bs-target="#bodyCdModal">환부선택</button>
                 						</td>`
                 				} else {
                 					cont += `<td></td>`;
                 				}
                 						
                 					cont += `</tr>`;
                 				
                 				// 만약 기본 메세지가 남아있다면
                 				if($('#defaultTest').length){
                 					$('#defaultTest').remove();
                 				}
                 			
                 				$('.test-list-table').append(cont);
                 			
                 			// 만약 치료면?
                 			} else if(data.osty === 'OSTY06') {
                  			
                 				let cont = `
                 					<tr class="tr-padding tr-data">
                 						<td class="td-padding-data gray-text" style="padding: 1%">\${rst.tmCd}</td>
                 						<td class="td-padding-data gray-text">\${rst.tmNm}</td>
                 						<td class="td-padding-data gray-text">
                 							<button class="dduk-btn-disabled btn-state btn-body" data-bs-toggle="modal" data-bs-target="#bodyCdModal">환부선택</button>
                 						</td>
                 					</tr>`;
                 					
                 				// 만약 기본 메세지가 남아있다면
                 				if($('#defaultTreatment').length){
                 					$('#defaultTreatment').remove();
                 				}
                 				$('.treatment-list-table').append(cont);
                 				
                 			}
                        }
                    });
             	});
             	
            	// 성공적으로 잘 들어갔으면
            	Swal.fire({
        			title: '선택한 오더들이 성공적으로 반영되었습니다',
        			icon: 'success',
        			confirmButtonColor: '#0ABAB5',
        			confirmButtonText: '확인',
        		})
            };
		});
 	});
 	<!-- 오더세트 트리뷰 함수 끝 -->
 	
 	// 발표를 위한 스크립트들
 	$(document).on('click', '#complete1', function(){
 		$('#clinicInjnm').val('외부 충격에 의한 무릎부위 폐쇄성 분쇄 골절\nclosed comminuted fracture icd 10');
 	});
 	
 	$(document).on('click', '#complete2', function(){
 		$('#clinicOpinion').val('무릎 부위의 심한 통증으로 인한 환자의 X-RAY 요청');
 	});
 	
 	$(document).on('click', '#complete3', function(){
 		$('#clinicOpinion').val('검사결과 심각하진 않으나 당분간 경과 지켜보고 지속적인 고통 호소시 입원치료 권유');
 	});
 	
 	$(document).on('click', '#complete4', function(){
 		$('#admissionReason').val('환자 본인의 희망으로 지속적인 모니터링을 위해 입원');
 	});
 	
 	$(document).on('click', '.history-scroll .dduk-history-list', function(){
		$('#forPPT').modal('show');
 	});
});

</script>