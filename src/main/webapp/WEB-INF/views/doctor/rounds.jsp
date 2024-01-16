<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>

.inputSpan {
	color: #FF4040;
}

.outputSpan {
	color: #0ABAB5;
}

input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

#roundsComplete1 {
    position: relative;
    left: -15px;
    bottom: 5px;
}

#roundsComplete2 {
    position: relative;
    left: -15px;
    bottom: 5px;
}


.aside-doc-rounds{
	width: 196px;
	border-radius: 16px 0px 0px 16px;
	background: var(--bg-02, #DBF2F4);
	height: 56px;
	border-right: 4px solid var(--ci-01, #0ABAB5);
	margin-left: 4px;
	color: var(--ci-01, #0ABAB5);
}

.rounds-left {
	width: 30%;
	border: none;
	padding: 0px;
}

.rounds-right-wrap {
	display: flex;
}

.rounds-chart {
	width: 700px;
}

.rounds-chart-head {
	margin: -16px -16px 0px -16px;
    padding: 16px 24px 8px 24px;
    border-bottom: 1px solid #EBEFF0;
}

.rounds-chart-body-top {
	padding-top: 16px;
}

.rounds-chart-body-cont {

}

.rounds-chart-list {
	height: 693px;
    width: 155px;
    margin: 17px -16px -16px -16px;
    padding: 16px;
    border-right: 1px solid var(--border, #EBEFF0);
}

.rounds-chart-list-date {
	text-align: center;
	width: 120px;
	padding: 5px;
}

.rounds-chart-list-default {
	text-align: center;
	width: 130px;
	padding: 5px;
}

.rounds-chart-list-date:hover {
	background-color: #F8F9FC;
} 

.rounds-chart-detail {
    width: 543px;
    height: 693px;
    background: var(--bg-01, #F8F9FC);
    margin: 17px -17px -16px 16px;
    padding: 16px;
    border-radius: 0px 0px 24px 0px;
}

.btn-rounds-save {
	width: 65px;
    margin-left: 65%;
    height: 30px;
    padding: 0px;
}

.btn-rounds-complete {
	width: 65px;
    margin-left: 65%;
    height: 30px;
    padding: 0px;
}

.rounds-chart-detail-inner-border {
	height: 624px;
    border-radius: 24px;
    border: 1px solid var(--border, #E0E8E6);
    padding: 16px;
    background: var(--white, #FFF);
    overflow-y: scroll;
}

.rounds-bed-list {
	width: 1016px;
}

.bed-large {
	border-radius: 24px;
	background: var(--BG-01, #F8F9FC);
	width: 400px !important;
}

.bed-small {
	border-radius: 24px;
	background: var(--BG-01, #F8F9FC);
	width: 200px !important;
	height: 160px;
}

.bed-list-2 {
	margin-top: 5%;
}

.bed-list-4 {
	position: absolute;
    margin-top: 2%;
    margin-left: 1%;
}

.bed-list-6 {
	display: flex;
	justify-content: space-evenly;
	margin-top: 10%;
	margin-left: -2%;
}

.bed-list-6-list {
	margin-left: -21%;
}

.bed-list-6-right {
	margin-right: -2%;
    margin-left: 3%;
}

.bed-wrap-2 {
	display: flex;
    gap: 24px;
    justify-content: space-evenly;
}

.bed-wrap-4 {
	display: flex;
    gap: 24px;
    justify-content: flex-end;
    margin-left: 1.5%;
}

.bed-wrap-6 {
	display: flex;
    gap: 24px;
    justify-content: space-evenly;
    flex-direction: column;
}

.title-bed-2 {
	padding: 24px 0px 0px 36px;
}

.title-bed-4 {
	padding: 38px 0px 0px 36px;
}

.title-bed-6 {
	margin-left: 190px;
	margin-bottom: 30px;
}

.btn-room-change {
	width: 230px;
    height: 48px;
    position: absolute;
    margin: 24px 0px 0px 723px;
}

.room-tab {
	border-radius: 10px;
}

.hidden {
	display: none;
}

.nurse-wrap {
	margin-left: 16px;
}

.nurse-chart {
	width: 300px;
	height: 400px;
}

.nurse-chart-head {
	margin: -16px -16px 0px -16px;
    padding: 16px 24px 8px 24px;
    border-bottom: 1px solid #EBEFF0;
}

.nurse-chart-body {
	padding-top: 16px;
	display: flex;
}

.nurse-chart-detail {
	margin: 7px;
    width: 100%;
}

.nurse-chart-list {
	width: 100%;
	height: 300px;
	overflow-y: scroll;
	text-align: center;
}

.nurse-chart-list-date {
	font-size: 16px;
    padding: 3px;
}

.nurse-chart-list-date:hover {
	background-color: #F8F9FC;
} 

.nurse-chart-date-exist {
	background-color: #DBF2F4;
	color: #fff;
}

.nurse-chart-writer {
	margin-left: 12px;
}

.nurse-chart-cont {
	width: 100%;
	height: 264px;
	margin: 7px;
}

.nurse-record {
    height: 392px;
}

.nurse-record-tab {
	margin-top: 24px;
	display: flex;
	justify-content: space-evenly;
}

.nurse-record-element {
	border-top-right-radius: 18px;
    border-top-left-radius: 18px;
    border: 1px solid var(--border, #E0E8E6);
    border-bottom: none;
    padding: 16px;
    background: var(--white, #FFF);
    width: 25%;
    padding: 1px;
    text-align: center;
    cursor: pointer;
    color: #000;
}

.nurse-record-body {

}

.dduk-title-area {
	margin-bottom: 0px;
}

.in-h2 {
	font-size: 14px !important;
}

.rounds-patient-history {
	height: 572px;
}

.rounds-tab-wrap {
	display: flex;
    gap: 24px;
    justify-content: space-evenly;
}

.rounds-tab {
	margin-top: 32px;
    border-top-right-radius: 18px;
    border-top-left-radius: 18px;
    border: 1px solid var(--border, #E0E8E6);
    border-bottom: none;
    padding: 16px;
    background: var(--white, #FFF);
    width: 35%;
    padding: 4px;
    text-align: center;
    color: #000;
    cursor: pointer;
}

.tab-active {
	background-color: #F8F9FC;
	color: #8D9EA5;
	font-family: 'Pretendard5';
}

.clinic-history-list {
    display: flex;
    overflow-x: hidden;
	white-space: nowrap;
	padding-bottom: 16px;
}

.clinic-history-head {
	display: flex;
	border-radius: 10px;
    border: 1px solid var(--border, #E0E8E6);
    padding: 8px;
    width: 150px;
    height: 80px;
    flex-shrink: 0;
    flex-direction: column;
}

.admission-history-head {
	display: flex;
	border-radius: 10px;
    border: 1px solid var(--border, #E0E8E6);
    padding: 8px;
    width: 150px;
    height: 80px;
    flex-shrink: 0;
    flex-direction: column;
}

.calendar-wrap {
	display: flex;
    gap: 24px;
    justify-content: space-evenly;
}

::-webkit-scrollbar {
    height: 8px;
}

.history-btn {
	width: 12px;
}

.neon-text {
  color: #0ABAB5;
  text-shadow: 0 0 5px #DBF2F4,
}

.light-green-text {
	color: #00A9A4 !important;
}

.h1-default {
	text-align: center;
	width: 100%;
	margin-top: 150px;
	color: #8D9EA5 !important;
	font-size: 2em !important;
}
 
/* 커서 올리기, 클릭 시 색깔바꾸기 시작 */
.clinic-history-head:hover {
	background-color: #F8F9FC
} 

.admission-history-head:hover {
	background-color: #F8F9FC
}

.nurse-record-element:hover {
	background-color: #F8F9FC
}
 
.selected {
	background-color: #EDF8F9;
}

/* 과거의 진료기록은 선택하면 빨간색깔로 표시 */
.past-record.selected {
	background-color: #FFECEC !important;
}
/* 커서 올리기, 클릭 시 색깔바꾸기 끝 */

.clinic-history-body-scroll {
	height: 433px;
	overflow-x: hidden;
	overflow-y: scroll;
	padding: 16px;
}

.table-clinic-history {
	display: flex;
	padding: 12px 16px;
	flex-direction: column;
	justify-content: center;
	gap: 4px;
	border-radius: 12px;
	background: var(--bg-01, #F8F9FC);
	width: 380px;
	height: auto;
	margin-bottom: 16px;
}

.textarea-clinic-history-injnm {
	resize: none;
	width: 93%;
	height: 50px;
}

.textarea-clinic-history-opinion {
	resize: none;
	width: 93%;
	height: 150px;
}

.textarea-rounds-history-reason {
	resize: none;
	width: 93%;
	height: 120px;
}

.textarea-rounds-history-opinion {
	resize: none;
	width: 93%;
	height: 120px;
}

.date-wrap {
	display: flex;
	flex-direction: column;
	margin: 3px 0px 0px -10px;
}

textarea {
	resize: none;
}

#clinicOpinion {
	width: 475px;
    height: 150px;
}

.d-flex-column {
    display: flex!important;
    flex-direction: column;
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
    padding: 8px;
    width: 100px;
    height: 60px;
    flex-shrink: 0;
    flex-direction: column;
}

.rounds-opinion-list-head:hover {
	background-color: #F8F9FC;
}

#divTrodCont {
	font-size: 16px;
}

/* 오더추가 시작 */
.rounds-table{
	width: 100%;
}
.td-padding {
    padding: 10px 0px 10px 5px;
}
.td-padding-data {
	padding-left: 5px;
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
#defaultTest, #defaultMedicine, #defaultTreatment {
	text-align: center;
}
#searchOrderset {
	width: 520px;
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

.btn-body {
	width: 100.8%;
    font-size: 0.85em !important;
}
/* 오더추가 끝 */

/* 아이콘 모음 시작 */
.icon-calendar {
	width: 48px;
	height: 48px;
}
.icon-stethoscope {
	width: 42px;
	height: 42px;
}
.icon-undo {
	width: 24px;
	height: 24px;
    margin: 4px 0px 0px 559px;
    cursor: pointer;
}
#createRoundsChart {
	margin-left: 50px;
}
.icon-trashbin {
	width: 16px;
	height: 16px;
	margin-top: 4px;
	cursor: pointer;
}
.ui-datepicker-trigger {
    display: block;
    width: 24px; 
    height: 24px; 
    border: none; 
    cursor: pointer; 
    margin-top: -10px;
}
#magnifyingGlass {
	width: 16px;
	height: 16px;
	margin-bottom: 1%;
}
.viewTestResult {
	cursor: pointer;
	width: 35%;
}
.view-trod-cont {
	cursor: pointer;
}
.icon-trashbin {
	visibility: hidden;
}
.active {
	visibility: visible;
}
.testing {
	background-image: url(/resources/images/icons/reddot.png);
    background-repeat: no-repeat;
    background-position: 100px 4px;
    background-size: 6px 6px;
}
.testdone {
	background-image: url(/resources/images/icons/greendot.png);
    background-repeat: no-repeat;
    background-position: 100px 4px;
    background-size: 6px 6px;
}
.icon-dot {
	width: 8px;
	height: 8px;
}
/* 아이콘 모음 끝 */
</style>
<c:import url="../common/modal.jsp"></c:import>
<div class="dduk-body-border rounds-left">
	<div class="dduk-inner-border">
		<div class="dduk-title-area">
			<h2>환자 정보 조회</h2>
		</div>
		<div class="patient-info-div">
			<div class="dduk-row">
				<h2 class="in-h2" style="width:50%">이름 : </h2>
				<h2 class="in-h2" style="width:30%">성별 : </h2>
				<h2 class="in-h2" style="width:30%">나이 : </h2>
			</div>
			<div class="dduk-row">
				<h2 class="in-h2" style="width:35%">보호자 이름 : </h2>
				<h2 class="in-h2" style="width:65%">보호자 번호 : </h2>
			</div>
			<div class="dduk-row">
				<h2 class="in-h2" style="width:33%">혈액행 : </h2>
				<h2 class="in-h2" style="width:33%">키 : </h2>
				<h2 class="in-h2" style="width:33%">몸무게 : </h2>
			</div>
		</div>
	</div>
	<div class="dduk-row rounds-tab-wrap">
		<div class="rounds-tab" id="clinicHistory">진료내역</div>
		<div class="rounds-tab tab-active" id="admissionHistory">입원내역</div>
	</div>
	<div class="dduk-inner-border rounds-patient-history">
		<div class="dduk-row clinic-history-list">
			<!-- 심플 과거 진료내역 들어오는곳 -->
		</div>

		<div class="clinic-history-body-scroll">
			<h1 class="h1-default">병상을 선택해주세요</h1>
			<!-- 디테일 과거 진료내역 들어오는곳 -->			
		</div>
	</div>
</div>
<div class="rounds-right-wrap">

</div>

<script>
$(function() {
	$('.aside-doc-rounds').find('svg').find('path').attr('fill', '#0ABAB5');
	$('.aside-doc-rounds').find('.dduk-nav-menu').css('color', '#0ABAB5');
	
	// 가장 최근에 조회한 환자번호
	var currentPaNo = '';
	// 가장 최근에 조회한 입원의 정보
	var currentAdmiNo = '';
	
	
    // 페이지가 로딩될 때 병상 정보 갱신
    updateRoundsBed();
    getAmsPatientVOList();
    
    
    // DB에서 병상 정보들을 불러옴(환자번호, 입원번호, 담당의, 병상번호 등)
    function getAmsPatientVOList(){
    	$.ajax({
    		url: '/ams/getAmsPatientVOList',
    		dataType: 'json',
    		type: 'post',
    		beforeSend:function(xhr){
    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    		},
    		success: function(rst){
    			console.log('가져온 병상정보 : ', rst);
    			
    			// 가져온 VO만큼 반복
    			$.each(rst, function(index, patientVO){
    				// 침상정보가 담긴 div를 가져온다
    				let roomNo = $('#' + patientVO.admissionRoomVOList[0].adrmRoomno + "-" + patientVO.admissionRoomVOList[0].adrmBedno);
    				// 2인실인지 아닌지를 판단하는 변수
    				var is2room = patientVO.admissionRoomVOList[0].adrmRoomno.includes('30');
    				// svg 정보를 교체(회색 -> 연두)
    				let newSvg = '';
    				if(is2room){
    					newSvg += `<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto">`;
    				} else {
    					newSvg += `<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">`;
    				}
    				newSvg += `<g clip-path="url(#clip0_688_430)">
    					<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
    					</g>
    					<defs>
    					<clipPath id="clip0_688_430">
    					<rect width="80" height="80" fill="white"/>
    					</clipPath>
    					</defs>
    					</svg>`;
    				roomNo.find('svg').remove().end().append(newSvg);
    				// 배경색 변경
    				roomNo.css('background-color', '#DBF2F4');
    				// 이름 변경
    				roomNo.find('.d-flex-column').find('div.gray-text').text(patientVO.paName);
    				// 이름, 방번호에 css적용
    				roomNo.find('h2').addClass('light-green-text');
    				roomNo.find('.d-flex-column').find('div.gray-text').addClass('light-green-text');
    				roomNo.find('.d-flex-column').find('div.gray-text').removeClass('gray-text');
    				// 마우스 커서 올려둠
    				roomNo.css('cursor', 'pointer');
    				// 침대에 쓰고있다는 표시의 클래스를 넣어준다
    				roomNo.addClass('using');
    				// 병상 div에 환자번호, 입원번호를 숨겨둠
    				roomNo.attr('data-pano', patientVO.paNo);
    				roomNo.attr('data-admino', patientVO.admissionChartVOList[0].admiNo);
    			});
    		},
    		error: function(xhr, status, error){
    			console.log('Error:', xhr, status, error);
    		}
    	});
    }
    
    
    // 활성화된 병상 클릭시 이벤트, 회진차트를 불러옴
    $(document).on('click', '.using', function() {
    	
    	// 일단 화면에 회진차트 / 간호차트를 출력
    	updateRoundsChart();
    	updateNurseChart();
    	
    	// 환자번호가져오기 
    	let paNo = $(this).data('pano');
    	currentPaNo = paNo;
    	// 입원번호가져오기
    	let admiNo = $(this).data('admino');
    	currentAdmiNo = admiNo;
    	
    	// DB에서 데이터를 가져와 환자정보 갱신하기
    	updatePaInfo(paNo);
    	
    	// DB에서 데이터를 가져와 환자의 과거진료내역 갱신
    	updatePastClinicChart();
    	
    	// DB에서 데이터를 가져와 환자의 간단한 입원정보 및 현재 입원중에 받은 회진차트 리스트 갱신
    	updateRoundsChartList();
    });
    
    
    // 회진차트 뒤로가기, 병상정보를 불러옴
    $(document).on('click', '#undoRoundsChart', function(){
    	// 최근조회 환자번호, 입원번호 초기화
    	currentPaNo = '';
    	currentAdmiNo = '';
    	// 병상정보 불러오기
    	updateRoundsBed();
    	// DB에서 병상정보를 가져와서 페이지에 갱신
    	getAmsPatientVOList();
    	// 왼쪽창 초기화
    	resetLeftData();
    });
    
    
    // 진료내역/입원내역 탭 누를때 이벤트
    $(document).on('click', '.rounds-tab', function() {
    	
    	// 만약 아직 환자를 선택 안했으면 에러
    	if(currentPaNo === ''){
    		Swal.fire({
    			title: '병상을 선택해주세요',
    			icon: 'warning',
    			confirmButtonColor: '#0ABAB5',
    			confirmButtonText: '확인',
    		})
    		return;
    	}
    	
    	// 자신에겐 tab-active를 제거, 다른 하나의 탭엔 tab-active 적용
    	$(this).removeClass('tab-active');
    	$('.rounds-tab').not(this).addClass('tab-active');
    	
    	// 만약 진료내역이면
    	if($(this).text() === '진료내역'){
    		// 진료내역 갱신
    		updatePastClinicChart();
    	// 만약 입원내역이면
    	} else if($(this).text() === '입원내역'){
    		// 입원내역 갱신
    		updatePastAdmissionChart();
    	}
    });
    
    
    // 간호 기록 카테고리 탭 클릭 시 이벤트
    $(document).on('click', '.nurse-record-element', function(){
    	// 이전에 적용됐던 클릭시 효과를 지우고 방금 클릭한곳에 적용
    	$(this).removeClass('tab-active');
    	$('.nurse-record-element').not(this).addClass('tab-active');
    	
    	let cont = '';
    	
    	// 지금 누른거에 따라 다른 깡통 적용
    	if($(this).text() === '혈압'){
    		
    		cont += `
				<div style="overflow-y: scroll; height: 350px;">
					<table class="table-blood">
						<thead>
							<tr class="tr-padding tr-column">
								<th class="td-padding dark-gray-text" style="width:165px">측정일시</th>
								<th class="td-padding dark-gray-text" style="width:90px">최고/최저혈압</th>
							</tr>
						</thead>
						<tbody>
							
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%">2024-01-08 09:15</td>
								<td class="td-padding-data dark-gray-text">120/80</td>
							</tr>
				
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-08 17:29</td>
								<td class="td-padding-data dark-gray-text">128/78</td>
							</tr>
						
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-09 08:42</td>
								<td class="td-padding-data dark-gray-text">121/67</td>
							</tr>
							
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-09 18:02</td>
								<td class="td-padding-data dark-gray-text">124/82</td>
							</tr>
				
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-10 09:31</td>
								<td class="td-padding-data dark-gray-text">118/69</td>
							</tr>
						
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-10 18:57</td>
								<td class="td-padding-data dark-gray-text">126/85</td>
							</tr>
							
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-11 09:26</td>
								<td class="td-padding-data dark-gray-text">129/82</td>
							</tr>
				
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-11 18:21</td>
								<td class="td-padding-data dark-gray-text">120/80</td>
							</tr>
						
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-12 08:52</td>
								<td class="td-padding-data dark-gray-text">122/78</td>
							</tr>
							
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-12 17:21</td>
								<td class="td-padding-data dark-gray-text">116/75</td>
							</tr>
				
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-13 11:16</td>
								<td class="td-padding-data dark-gray-text">131/86</td>
							</tr>
						
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-13 17:09</td>
								<td class="td-padding-data dark-gray-text">128/76</td>
							</tr>
							
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-14 12:10</td>
								<td class="td-padding-data dark-gray-text">121/77</td>
							</tr>
				
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-14 19:15</td>
								<td class="td-padding-data dark-gray-text">116/72</td>
							</tr>
						
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-15 11:11</td>
								<td class="td-padding-data dark-gray-text">127/85</td>
							</tr>
							
						</tbody>
					</table>
				</div>
    		`;
    		
    	} else if($(this).text() === '체온'){
    		
    		cont += `
    			<div style="overflow-y: scroll; height: 350px;">
					<table class="table-blood">
						<thead>
							<tr class="tr-padding tr-column">
								<th class="td-padding dark-gray-text" style="width:165px">측정일시</th>
								<th class="td-padding dark-gray-text" style="width:90px">체온</th>
							</tr>
						</thead>
						<tbody>
							
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%">2024-01-08 09:15</td>
								<td class="td-padding-data dark-gray-text">36.5°C</td>
							</tr>
				
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-08 17:29</td>
								<td class="td-padding-data dark-gray-text">36.9°C</td>
							</tr>
						
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-09 08:42</td>
								<td class="td-padding-data dark-gray-text">36.8°C</td>
							</tr>
							
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-09 18:02</td>
								<td class="td-padding-data dark-gray-text">36.7°C</td>
							</tr>
				
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-10 09:31</td>
								<td class="td-padding-data dark-gray-text">36.7°C</td>
							</tr>
						
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-10 18:57</td>
								<td class="td-padding-data dark-gray-text">36.6°C</td>
							</tr>
							
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-11 09:26</td>
								<td class="td-padding-data dark-gray-text">36.7°C</td>
							</tr>
				
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-11 18:21</td>
								<td class="td-padding-data dark-gray-text">36.8°C</td>
							</tr>
						
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-12 08:52</td>
								<td class="td-padding-data dark-gray-text">36.8°C</td>
							</tr>
							
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-12 17:21</td>
								<td class="td-padding-data dark-gray-text">36.7°C</td>
							</tr>
				
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-13 11:16</td>
								<td class="td-padding-data dark-gray-text">36.9°C</td>
							</tr>
						
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-13 17:09</td>
								<td class="td-padding-data dark-gray-text">36.7°C</td>
							</tr>
							
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-14 12:10</td>
								<td class="td-padding-data dark-gray-text">36.9°C</td>
							</tr>
				
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-14 19:15</td>
								<td class="td-padding-data dark-gray-text">36.7°C</td>
							</tr>
						
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-15 11:11</td>
								<td class="td-padding-data dark-gray-text">36.5°C</td>
							</tr>
							
						</tbody>
					</table>
				</div>
    		`;
    		
    	} else {
    		
    		cont += `
				<div style="overflow-y: scroll; height: 350px;">
					<table class="table-blood">
						<thead>
							<tr class="tr-padding tr-column">
								<th class="td-padding dark-gray-text" style="width:165px">측정일시</th>
								<th class="td-padding dark-gray-text" style="width:90px"><span class="inputSpan">섭취량</span>/<span class="outputSpan">배설량</span></th>
							</tr>
						</thead>
						<tbody>
							
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%">2024-01-08 19:15</td>
								<td class="td-padding-data dark-gray-text"><span class="inputSpan">2294mL</span></td>
							</tr>
				
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-08 20:15</td>
								<td class="td-padding-data dark-gray-text"><span class="outputSpan">1623mL</span></td>
							</tr>
						
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-09 08:42</td>
								<td class="td-padding-data dark-gray-text"><span class="inputSpan">1854mL</span></td>
							</tr>
							
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-09 18:02</td>
								<td class="td-padding-data dark-gray-text"><span class="outputSpan">1798mL</span></td>
							</tr>
				
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-10 09:31</td>
								<td class="td-padding-data dark-gray-text"><span class="inputSpan">2068mL</span></td>
							</tr>
						
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-10 18:57</td>
								<td class="td-padding-data dark-gray-text"><span class="outputSpan">1560mL</span></td>
							</tr>
							
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-11 09:26</td>
								<td class="td-padding-data dark-gray-text"><span class="inputSpan">2497mL</span></td>
							</tr>
				
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-11 18:21</td>
								<td class="td-padding-data dark-gray-text"><span class="outputSpan">1613mL</span></td>
							</tr>
						
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-12 08:52</td>
								<td class="td-padding-data dark-gray-text"><span class="inputSpan">2061mL</span></td>
							</tr>
							
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-12 17:21</td>
								<td class="td-padding-data dark-gray-text"><span class="outputSpan">1293mL</span></td>
							</tr>
				
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-13 11:16</td>
								<td class="td-padding-data dark-gray-text"><span class="inputSpan">1890mL</span></td>
							</tr>
						
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-13 17:09</td>
								<td class="td-padding-data dark-gray-text"><span class="outputSpan">1720mL</span></td>
							</tr>
							
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-14 12:10</td>
								<td class="td-padding-data dark-gray-text"><span class="inputSpan">2294mL</span></td>
							</tr>
				
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-14 19:15</td>
								<td class="td-padding-data dark-gray-text"><span class="outputSpan">2023mL</span></td>
							</tr>
						
							<tr class="tr-padding tr-data">
								<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-15 11:11</td>
								<td class="td-padding-data dark-gray-text"><span class="inputSpan">2221mL</span></td>
							</tr>
							
						</tbody>
					</table>
				</div>
    		`;
    		
    	}
    	
		$('.nurse-record-body').html(cont);    	
    	
    });
    
    
    // n인실 클릭시 이벤트
    $(document).on('click', '.room-tab', function(){
    	// 이전에 적용됐던 클릭시 효과를 지우고 방금 클릭한곳에 적용
    	$(this).removeClass('tab-active');
    	$('.room-tab').not(this).addClass('tab-active');
    	
    	// 2인실 선택시 본인제외하고 모두 안보이게, 본인은 보이게
    	if($(this).text() == '2인실') {
    		$('.bed-list-2').removeClass('hidden');
    		$('.bed-list-4').addClass('hidden');
    		$('.bed-list-6').addClass('hidden');
    	} else if($(this).text() == '4인실') {
    		$('.bed-list-2').addClass('hidden');
    		$('.bed-list-4').removeClass('hidden');
    		$('.bed-list-6').addClass('hidden');
    	} else if($(this).text() == '6인실') {
    		$('.bed-list-2').addClass('hidden');
    		$('.bed-list-4').addClass('hidden');
    		$('.bed-list-6').removeClass('hidden');
    	}
    });
    
    
    // 회진 날짜 클릭시 이벤트
    $(document).on('click', '.rounds-chart-list-date', function() {
    	// 이전에 적용됐던 클릭시 효과를 지우고 방금 클릭한곳에 적용
    	$('.rounds-chart-list-date').removeClass('selected');
    	$(this).addClass('selected');
    });
    
    
    // 간호일자 날짜 클릭시 이벤트
    $(document).on('click', '.nurse-chart-list-date', function() {
    	// 이전에 적용됐던 클릭시 효과를 지우고 방금 클릭한곳에 적용
    	$('.nurse-chart-list-date').removeClass('selected');
    	$(this).addClass('selected');
    	
    	// 뒤로가기 버튼 나오기
    	$('#undoNurseChart').css('visibility', 'visible');
    	
    	// 깡통스타일 덮어쓰기
    	let cont = `
    		<div style="display:flex; flex-direction: column;">
	    		<div>2024-01-15 오후 06시 30분</div>
	    		<br>
	    		<div>작성자 : 김흥규</div>
	    		<br>
	    		<div>구분 : 인수인계</div>
	    		<br>
	    		<textarea style="width: 260px; height: 174px;" class="dduck-input" readonly>환자분 오후내내 춥다고 호소, 담요 제공\n\n점심 드신 후 약간의 복통 호소 하셨으나 저녁 식사 후 별 이상증후 없음\n\n오후 바이탈 체크 정상</textarea>
	    	</div>
    	`;
    	
    	$('.nurse-chart-body').html(cont);
    });
    
    
    // 간호일지 뒤로가기 클릭
    $(document).on('click', '#undoNurseChart', function(){
    	
    	let cont = `
			<div class="nurse-chart-list">
				<div class="nurse-chart-list-date">2024-01-08 오전 09시 21분</div>
				<div class="nurse-chart-list-date">2024-01-08 오전 11시 25분</div>
				<div class="nurse-chart-list-date">2024-01-08 오후 06시 15분</div>
				<div class="nurse-chart-list-date">2024-01-09 오전 08시 11분</div>
				<div class="nurse-chart-list-date">2024-01-09 오전 11시 52분</div>
				<div class="nurse-chart-list-date">2024-01-09 오후 05시 22분</div>
				<div class="nurse-chart-list-date">2021-01-10 오전 09시 09분</div>
				<div class="nurse-chart-list-date">2024-01-10 오후 12시 08분</div>
				<div class="nurse-chart-list-date">2024-01-10 오후 06시 18분</div>
				<div class="nurse-chart-list-date">2024-01-11 오전 08시 31분</div>
				<div class="nurse-chart-list-date">2024-01-11 오전 11시 46분</div>
				<div class="nurse-chart-list-date">2024-01-11 오후 05시 47분</div>
				<div class="nurse-chart-list-date">2024-01-12 오전 09시 11분</div>
				<div class="nurse-chart-list-date">2024-01-12 오전 11시 37분</div>
				<div class="nurse-chart-list-date">2024-01-12 오후 06시 26분</div>
				<div class="nurse-chart-list-date">2024-01-13 오전 08시 58분</div>
				<div class="nurse-chart-list-date">2024-01-13 오후 12시 21분</div>
				<div class="nurse-chart-list-date">2024-01-13 오후 06시 28분</div>
				<div class="nurse-chart-list-date">2024-01-14 오전 09시 21분</div>
				<div class="nurse-chart-list-date">2024-01-14 오후 12시 02분</div>
				<div class="nurse-chart-list-date">2024-01-14 오후 06시 01분</div>
				<div class="nurse-chart-list-date">2024-01-15 오전 08시 12분</div>
				<div class="nurse-chart-list-date">2024-01-15 오전 11시 11분</div>
				<div class="nurse-chart-list-date">2024-01-15 오후 06시 30분</div>
			</div>
    	`;
    	
    	$('.nurse-chart-body').html(cont);
    	
    	$('#undoNurseChart').css('visibility', 'hidden');
    	
    });
    
    
    // 진료내역 클릭시 이벤트
    $(document).on('click', '.clinic-history-head', function() {
    	
    	// 이전에 적용됐던 클릭시 효과를 지우고 방금 클릭한곳에 적용
    	$('.clinic-history-head').removeClass('selected');
    	$(this).addClass('selected');
    	
    	// 진료내역 디테일 갱신
    	let clinicNo = $(this).data('clinicno');
    	detailPastClinicChart(clinicNo);
    });
    
    
    // 입원내역 클릭시 이벤트
    $(document).on('click', '.admission-history-head', function(){
    	
    	// 이전에 적용됐던 클릭시 효과를 지우고 방금 클릭한곳에 적용
    	$('.admission-history-head').removeClass('selected');
    	$(this).addClass('selected');
    	
    	// 진료내역 디테일 갱신
    	let admiNo = $(this).data('admino');
    	detailPastAdmissionChart(admiNo);
    });
    
    
    // 환자 정보 갱신
    function updatePaInfo(paNo){
    	$.ajax({
    		url: '/clinic/simpleClinicChartList',
    		data: {'paNo' : paNo},
    		type: 'post',
    		dataType: 'json',
    		beforeSend: function(xhr){
    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    		},
    		success: function(rst){
    			console.log("환자 정보 가져오기 : ", rst);
    			
    			// 환자정보 갱신
    			let patientInfo = $('.patient-info-div');
    			patientInfo.find('h2').eq(0).text('이름 : ' + rst.paName);
    			patientInfo.find('h2').eq(1).text('성별 : ' + rst.paSex);
    			patientInfo.find('h2').eq(2).text('나이 : ' + getAge(formatResidentNumber(rst.paReg)));
    			patientInfo.find('h2').eq(3).text('보호자 이름 : ' + rst.paNoknm);
    			patientInfo.find('h2').eq(4).text('보호자 번호 : ' + rst.paNokph);
    			patientInfo.find('h2').eq(5).text('혈액형 : ' + rst.paBldType);
    			patientInfo.find('h2').eq(6).text('키 : ' + rst.paHeight + 'cm');
    			patientInfo.find('h2').eq(7).text('몸무게 : ' + rst.paWeight + 'kg');
    		},
    		error: function(xhr, status, error){
    			console.log('Error:', xhr, status, error);
    		}
    	});
    }
    
    
    // 과거 진료 내역 심플 리스트 갱신
    function updatePastClinicChart(){
    	$.ajax({
    		url: '/clinic/simpleClinicChartList',
    		data: {'paNo' : currentPaNo},
    		type: 'post',
    		dataType: 'json',
    		beforeSend: function(xhr){
    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    		},
    		success: function(rst){
    			console.log("환자의 과거 진료내역 가져오기 : ", rst);
    			
    			let firstClinicNo = '';
    			let cont = '';
    			
    			// 과거 진료내역 리스트 갱신
    			$.each(rst.clinicChartVOList, function(index, vo){
    				// 만약 맨 앞의 진료내역이면 선택효과 적용 및 첫번째 진료번호 받아놓기
    				if(index === 0){
    					firstClinicNo = vo.clinicNo;
    					cont += '<div class="clinic-history-head selected" data-clinicno='+vo.clinicNo+'>';
    				} else {
    					cont += '<div class="clinic-history-head" data-clinicno='+vo.clinicNo+'>';
    				}
    				cont += '<div class="dduk-row">'+vo.clinicDt+'</div>';
    				cont += '<div class="dduk-row">담당의 : '+empName+'</div>';
    				cont += '<div class="dduk-row">';
    				cont += '<span class="history-btn"><span class="neon-text">진료</span></span>';
    				
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
    			});
    			
    			$('.clinic-history-list').html(cont);
    			
    			// 첫번째 진료내역 디테일 출력
    			detailPastClinicChart(firstClinicNo);
    			
    			// 입원내역 탭에 선택효과가 적용돼있으면 없애고 진료내역에 적용
    			if($('#clinicHistory').hasClass('tab-active')){
    				$('#admissionHistory').addClass('tab-active');
    				$('#clinicHistory').removeClass('tab-active');
    			}
    		},
    		error: function(xhr, status, error){
    			console.log('Error:', xhr, status, error);
    		}
    	});
    }
    
    
    // 과거 진료 내역 클릭시 디테일 출력
    function detailPastClinicChart(clinicNo){
    	$.ajax({
    		url: '/clinic/lightWeightClinicChartDetail',
    		data: {'clinicNo' : clinicNo},
    		type: 'post',
    		dataType: 'json',
    		beforeSend: function(xhr){
    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    		},
    		success: function(rst){
    			
    			console.log('진료번호 ', clinicNo, '로 가져온 진료상세 : ', rst);
    			
    			let clinicInjnm = rst.clinicInjnm === null ? '병명이 없습니다' : rst.clinicInjnm;
    			let clinicOpinion = rst.clinicOpinion === null ? '소견이 없습니다' : rst.clinicOpinion;
    			
    			let cont = `
    				<h4>진단명</h4>
    				<textarea class="dduck-input textarea-clinic-history-injnm" readonly="readonly">`+clinicInjnm+`</textarea>
    				<br><br>
    				
    				<h4>소견</h4>
    				<textarea class="dduck-input textarea-clinic-history-opinion" readonly="readonly">`+clinicOpinion+`</textarea>
    				<br><br>
    			
    				<h4>진단</h4>
    				<div class="table-clinic-history">
    					<table>
    						<thead>
    							<tr>
    								<th class="gray-text" style="width: 15%">분류</th>
    								<th class="gray-text" style="width: 40%">상병명</th>
    								<th class="gray-text" style="width: 30%">발병일</th>
    								<th class="gray-text" style="width: 15%">환부</th>
    							</tr>
    						</thead>
    						<tbody>`;
    						
    						// 상병 진단 출력
    						$.each(rst.injuryDiagnosisVOList, function(index, vo){
    							cont += '<tr>';
    							if(vo.indiType === 'IDTY01'){
    								cont += '<td>주</td>';
    							} else if(vo.indiType === 'IDTY02'){
    								cont += '<td>부</td>';
    							} else if(vo.indiType === 'IDTY03'){
    								cont += '<td>배제</td>';
    							}
								cont += '<td>'+truncateText(vo.injuryVO.ijNm, 12)+'</td>';
								cont += '<td>'+vo.indiDt+'</td>';
								cont += '<td>'+vo.injuryBodyCdNm+'</td>';
								cont += '</tr>'
    						});
    							
    				cont += `
    						</tbody>
    					</table>
    				</div>
    				<br>`;
    				
    				// 검사 받은 내역이 없으면 출력 x
    				if(rst.testOrderVOList.length !== 0) {
    				cont += `
    				<h4>검사</h4>
    				<div class="table-clinic-history">
    					<table>
    						<thead>
    							<tr>
    								<th class="gray-text" style="width: 25%">검사명</th>
    								<th class="gray-text" style="width: 60%">검사결과</th>
    								<th class="gray-text" style="width: 15%">환부</th>
    							</tr>
    						</thead>
    						<tbody>`;

    						// 검사 오더 출력
    						$.each(rst.testOrderVOList, function(index, vo){
    							
    							// 만약 사진결과가 있으면 사진데이터 json으로 저장
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
    							
    							cont += '<tr>';
								cont += '<td>'+vo.testVO.testNm+'</td>';
								if(vo.teodRst != null){
								cont += '<td>'+vo.teodRst+'</td>';
								} else if(vo.atchFileVO != null){
									cont += `<td>
										<div class="viewTestResult" data-resultJson='\${jsonData}' data-bs-toggle="modal" data-bs-target="#viewTestOrderResult">
											결과보기
											<img id="magnifyingGlass" src="/resources/images/icons/magnifying-glass.png" alt="magnifyingGlass.png" />
										</div>	
									</td>`;
								} else {
									cont += `<td>검사 미진행</td>`;
								}
								
								if(vo.testOrderBodyCdNm !== null){
									cont += '<td>'+vo.testOrderBodyCdNm+'</td>';
								} else {
									cont += '<td>-</td>';
								}
								cont += '</tr>'
    						});
    						
    				cont +=	`</tbody>
    					</table>
    				</div>
    				<br>`;
    				}
    				
    				// 처방 받은 내역이 없으면 출력 x
    				if(rst.medicineOrderVOList.length !== 0) {
    				cont += `
    				<h4>처방</h4>
    				<div class="table-clinic-history">
    					<table>
    						<thead>
    							<tr>
    								<th class="gray-text w-25">이름</th>
    								<th class="gray-text w-60">약품상세</th>
    								<th class="gray-text w-15">처방량</th>
    							</tr>
    						</thead>
    						<tbody>`;
    							
    						// 처방 오더 출력
    						$.each(rst.medicineOrderVOList, function(index, vo){
    							cont += '<tr>';
								cont += '<td>'+truncateText(vo.medicineVO.mediNm, 6)+'</td>';
								cont += '<td>'+truncateText(vo.medicineVO.mediDetail, 16)+'</td>';
								if(vo.medicineVO.mediDetail === '주사' || vo.medicineVO.mediDetail === '기타 처방'){
									cont += '<td>-</td>';
								} else if(vo.medicineVO.mediDetail === '패치형 진통제' || vo.medicineVO.mediDetail === '연고'){
									cont += '<td>'+vo.mdodQt+'개</td>';
								} else{
									cont += '<td>'+vo.mdodQt+'일분</td>';
								}
								
								cont += '</tr>';
    						});
    						
    				cont += `</tbody>
    					</table>
    				</div>
    				<br>`;
    				}
    				
    				// 치료 받은 내역이 없으면 출력 x
        			if(rst.treatmentOrderVOList.length !== 0) {
        			cont += `
    				<h4>치료</h4>
    				<div class="table-clinic-history">
    					<table>
    						<thead>
    							<tr>
    								<th class="gray-text w-30">치료명</th>
    								<th class="gray-text w-60">치료기록</th>
    								<th class="gray-text w-10">환부</th>
    							</tr>
    						</thead>
    						<tbody>`;
    						
    						// 치료 오더 출력
    						$.each(rst.treatmentOrderVOList, function(index, vo){
    							cont += '<tr>';
								cont += '<td>'+truncateText(vo.treatmentVO.tmNm, 6)+'</td>';
								if(vo.trodCont == null){
								cont += '<td>-</td>';
								// 치료기록 글자수 14글자 넘어가면 돋보기 나와서 자세히보기 기능
								} else if(vo.trodCont.length > 14) {
									cont += '<td>'+truncateText(vo.trodCont, 14)+'<img class="view-trod-cont" data-trodcont="'+vo.trodCont+'" id="magnifyingGlass" src="/resources/images/icons/magnifying-glass.png" alt="magnifyingGlass.png"  data-bs-toggle="modal" data-bs-target="#trodContModal" /></td>';
								} else {
									cont += '<td>'+vo.trodCont+'</td>';
								}
								cont += '<td>'+vo.treatmentOrderBodyCdNm+'</td>';
								cont += '</tr>';
    						});
    							
    				cont += `</tbody>
    					</table>
    				</div>
    				<br>`;
        			}
    			
    			$('.clinic-history-body-scroll').html(cont);
    		},
    		error: function(xhr, status, error){
    			console.log('Error:', xhr, status, error);
    		}
    	})
    }
    
    
    // 과거 입원 내역 심플 리스트 갱신
    function updatePastAdmissionChart(){
    	$.ajax({
    		url: '/rounds/simpleAdmissionChartList',
    		data: {'paNo' : currentPaNo},
    		type: 'post',
    		dataType: 'json',
    		beforeSend: function(xhr){
    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    		},
    		success: function(rst){
    			console.log("환자의 과거 입원내역 가져오기 : ", rst);
    			
    			// 과거 입원내역이 없으면?
    			if(rst.length === 0){
    				
    				let cont = '<h1 class="h1-default">입원 내역이 없습니다</h1>';
    				$('.clinic-history-body-scroll').html(cont);
    				$('.clinic-history-list').html('');
    			
    			// 있으면 출력
    			} else {
    			
    				let firstAdmissionNo = '';
    				let cont = '';
    			
    				// 과거 입원내역 리스트 갱신
    				$.each(rst, function(index, vo){
    					// 만약 맨 앞의 입원내역이면 선택효과 적용 및 첫번째 입원번호 받아놓기
    					if(index === 0){
    						firstAdmissionNo = vo.admiNo;
    						cont += '<div class="admission-history-head selected" data-admino='+vo.admiNo+'>';
    					} else {
    						cont += '<div class="admission-history-head" data-admino='+vo.admiNo+'>';
    					}
    					cont += '<div class="dduk-row">입원일 :'+vo.admiIndt+'</div>';
    					cont += '<div class="dduk-row">퇴원일 :'+vo.admiOutdt+'</div>';
    					cont += '<div class="dduk-row">담당의 : '+vo.admiEmpName+'</div>';
    					cont += '<div class="dduk-row"></div>';
    					cont += '</div>';
    				});
    			
    				$('.clinic-history-list').html(cont);
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
    			
    			let cont = `
    				<h4>입원사유</h4>
    				<textarea class="dduck-input textarea-rounds-history-reason" readonly="readonly">\${rst.admiReason}</textarea>
    				<br><br>`;
    			
    			// 만약 회진 기록이 없으면 없다고 출력
    			if(rst.clinicChartVOList.length === 0){
    				cont += '<h1 class="h1-default" style="margin-top: 50px; font-size: 1.5em !important;">회진 기록이 없습니다</h1>';
    			} else {
    				
    				cont += `
   					<h4>회진기록</h4>
    				<div class="dduk-row rounds-opinion-list">`;
    					
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
    				});
    				cont +=`
        				</div>
        				<br>
        				<textarea class="dduck-input textarea-rounds-history-opinion" readonly="readonly"></textarea>
        				<br><br>
        				<div class="admission-history-rounds-detail"></div>`;
    			}
    			
    			$('.clinic-history-body-scroll').html(cont);
    			
    			// 해당 입원의 첫번째 진료차트 정보 뿌려주기
//     			if(firstClinicNo !== '') roundsChartDetail(firstClinicNo);
    		},
    		error: function(xhr, status, error){
    			console.log('Error:', xhr, status, error);
    		}
    	})
    }
    
    
    // 과거 회진기록 날짜 탭 누르면 효과적용 및 해당 회진 정보 뿌려주기
    $(document).on('click', '.rounds-opinion-list-head', function(){
    	$('.rounds-opinion-list-head').removeClass('selected');
    	$(this).addClass('selected');
    	
    	roundsChartDetail($(this).data('clinicno'));
    });
    
    
    // 과거 입원내역에서 입원목록 클릭 시 회진목록 에서 회진목록 클릭 시 해당 회진의 자세한 정보 뿌려주기
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
    			
    			// 일단 회진기록 넣어주기
    			$('.textarea-rounds-history-opinion').text(rst.clinicOpinion);
    			let cont = '';
    			
    			// 검사 받은 내역이 없으면 출력 x
				if(rst.testOrderVOList.length !== 0) {
				cont += `
				<h4>검사</h4>
				<div class="table-clinic-history">
					<table>
						<thead>
							<tr>
								<th class="gray-text" style="width: 25%">검사명</th>
								<th class="gray-text" style="width: 60%">검사결과</th>
								<th class="gray-text" style="width: 15%">환부</th>
							</tr>
						</thead>
						<tbody>`;

						// 검사 오더 출력
						$.each(rst.testOrderVOList, function(index, vo){
							
							// 만약 사진결과가 있으면 사진데이터 json으로 저장
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
							
							cont += '<tr>';
							cont += '<td>'+vo.testVO.testNm+'</td>';
							if(vo.teodRst != null){
							cont += '<td>'+vo.teodRst+'</td>';
							} else if(vo.atchFileVO != null){
								cont += `<td>
									<div class="viewTestResult" data-resultJson='\${jsonData}' data-bs-toggle="modal" data-bs-target="#viewTestOrderResult">
										결과보기
										<img id="magnifyingGlass" src="/resources/images/icons/magnifying-glass.png" alt="magnifyingGlass.png" />
									</div>	
								</td>`;
							} else {
								cont += `<td>검사 미진행</td>`;
							}
							cont += '<td>'+vo.testOrderBodyCdNm+'</td>';
							cont += '</tr>'
						});
						
				cont +=	`</tbody>
					</table>
				</div>
				<br>`;
				}
				
				// 처방 받은 내역이 없으면 출력 x
				if(rst.medicineOrderVOList.length !== 0) {
				cont += `
				<h4>처방</h4>
				<div class="table-clinic-history">
					<table>
						<thead>
							<tr>
								<th class="gray-text w-25">이름</th>
								<th class="gray-text w-60">약품상세</th>
								<th class="gray-text w-15">처방량</th>
							</tr>
						</thead>
						<tbody>`;
							
						// 처방 오더 출력
						$.each(rst.medicineOrderVOList, function(index, vo){
							cont += '<tr>';
							cont += '<td>'+truncateText(vo.medicineVO.mediNm, 6)+'</td>';
							cont += '<td>'+truncateText(vo.medicineVO.mediDetail, 16)+'</td>';
							if(vo.medicineVO.mediDetail === '주사' || vo.medicineVO.mediDetail === '기타 처방'){
								cont += '<td>-</td>';
							} else if(vo.medicineVO.mediDetail === '패치형 진통제' || vo.medicineVO.mediDetail === '연고'){
								cont += '<td>'+vo.mdodQt+'개</td>';
							} else{
								cont += '<td>'+vo.mdodQt+'일분</td>';
							}
							
							cont += '</tr>';
						});
						
				cont += `</tbody>
					</table>
				</div>
				<br>`;
				}
				
				// 치료 받은 내역이 없으면 출력 x
    			if(rst.treatmentOrderVOList.length !== 0) {
    			cont += `
				<h4>치료</h4>
				<div class="table-clinic-history">
					<table>
						<thead>
							<tr>
								<th class="gray-text w-30">치료명</th>
								<th class="gray-text w-60">치료기록</th>
								<th class="gray-text w-10">환부</th>
							</tr>
						</thead>
						<tbody>`;
						
						// 치료 오더 출력
						$.each(rst.treatmentOrderVOList, function(index, vo){
							cont += '<tr>';
							cont += '<td>'+truncateText(vo.treatmentVO.tmNm, 6)+'</td>';
							if(vo.trodCont == null){
							cont += '<td>-</td>';
							// 치료기록 글자수 14글자 넘어가면 돋보기 나와서 자세히보기 기능
							} else if(vo.trodCont.length > 14) {
								cont += '<td>'+truncateText(vo.trodCont, 14)+'<img class="view-trod-cont" data-trodcont="'+vo.trodCont+'" id="magnifyingGlass" src="/resources/images/icons/magnifying-glass.png" alt="magnifyingGlass.png"  data-bs-toggle="modal" data-bs-target="#trodContModal" /></td>';
							} else {
								cont += '<td>'+vo.trodCont+'</td>';
							}
							cont += '<td>'+vo.treatmentOrderBodyCdNm+'</td>';
							cont += '</tr>';
						});
							
				cont += `</tbody>
					</table>
				</div>
				<br>`;
    			}
    			
    			$('.admission-history-rounds-detail').html(cont);
    		},
    		error: function(xhr, status, error){
    			console.log('Error:', xhr, status, error);
    		}
    	})
    }
    
    
    // 병상 클릭 시 해당 입원의 간단한 정보 갱신 및 회진차트 심플 리스트 출력
    function updateRoundsChartList(){
    	$.ajax({
    		url: '/rounds/currentSimpleAdmissionChartList',
    		data: {'admiNo' : currentAdmiNo},
    		type: 'post',
    		dataType: 'json',
    		beforeSend: function(xhr){
    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    		},
    		success: function(rst){
    			console.log('입원번호 ', currentAdmiNo, '의 간단한 입원 정보 가져오기 : ', rst);
    			
    			// 담당의, 입원일, 퇴원예정일 갱신
    			$('.calendar-wrap').find('.empName').text(rst.empName);
    			$('.calendar-wrap').find('.inDt').text(rst.admiIndt);
    			$('.calendar-wrap').find('.expOutDt').text(rst.admiExpOutdt);
    			
    			// 해당 입원에서 받은 모든 회진 리스트 갱신
    			let cont = '';
    			
    			cont += '<div class="dduk-row" style="gap: 3px; padding-left: 5px; margin-bottom: 10px;">';
    			cont += '<img class="icon-dot" src="/resources/images/icons/reddot.png">';
				cont += '<div class="w-50">검사중</div>';
				cont += '<img class="icon-dot" src="/resources/images/icons/greendot.png">';
				cont += '<div class="w-60">검사완료</div>';
				cont += '</div>';
				
				if(rst.clinicChartVOList.length === 0) cont += '<div class="rounds-chart-list-default">회진 기록이 없습니다</div>';
    			
    			$.each(rst.clinicChartVOList, function(index, vo){
    				if(vo.clinicState === 'CRST02' || vo.clinicState === 'CRST05'){
    					cont += '<div class="rounds-chart-list-date testing" data-clinicno="'+vo.clinicNo+'">'+vo.clinicDt+'</div>';
    				} else if(vo.clinicState === 'CRST03') {
    					cont += '<div class="rounds-chart-list-date testdone" data-clinicno="'+vo.clinicNo+'">'+vo.clinicDt+'</div>';
    				} else {
    					cont += '<div class="rounds-chart-list-date" data-clinicno="'+vo.clinicNo+'">'+vo.clinicDt+'</div>';
    				}
    			});
    			cont += `
						<svg id="createRoundsChart" type="button" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
					<g clip-path="url(#clip0_142_1638)">
					<path d="M18 13H13V18C13 18.55 12.55 19 12 19C11.45 19 11 18.55 11 18V13H6C5.45 13 5 12.55 5 12C5 11.45 5.45 11 6 11H11V6C11 5.45 11.45 5 12 5C12.55 5 13 5.45 13 6V11H18C18.55 11 19 11.45 19 12C19 12.55 18.55 13 18 13Z" fill="#8D9EA5"></path>
					</g>
					<defs>
					<clipPath id="clip0_142_1638">
					<rect width="24" height="24" fill="white"></rect>
					</clipPath>
					</defs>
				</svg>
					`;
    			$('.rounds-chart-list').html(cont);
    		},
    		error: function(xhr, status, error){
    			console.log('Error:', xhr, status, error);
    		}
    	})
    }
    
    
    // 환자 정보 및 진료내역, 입원내역 초기화
    function resetLeftData(){
    	
    	// 환자정보 초기화
    	let patientInfo = $('.patient-info-div');
    	patientInfo.find('h2').eq(0).text('이름 : ');
		patientInfo.find('h2').eq(1).text('성별 : ');
		patientInfo.find('h2').eq(2).text('나이 : ');
		patientInfo.find('h2').eq(3).text('보호자 이름 : ');
		patientInfo.find('h2').eq(4).text('보호자 번호 : ');
		patientInfo.find('h2').eq(5).text('혈액형 : ');
		patientInfo.find('h2').eq(6).text('키 : ');
		patientInfo.find('h2').eq(7).text('몸무게 : ');
		
		// 심플 과거내역 초기화
		$('.clinic-history-list').html('');
		// 디테일 과거진료내역 초기화
		let h1Default = '<h1 class="h1-default">병상을 선택해주세요</h1>';
		$('.clinic-history-body-scroll').html(h1Default); 
		// 입원내역 탭에 선택효과가 적용돼있으면 없애고 진료내역에 적용
		if($('#clinicHistory').hasClass('tab-active')){
			$('#admissionHistory').addClass('tab-active');
			$('#clinicHistory').removeClass('tab-active');
		}
    }
    
    
    // 현재 입원중인 환자의 회진 리스트중 검사중, 검사중, 검사완료가 아닌 회진차트를 클릭할 때 이벤트
    $(document).on('click', '.rounds-chart-list-date:not(.testing):not(.testdone)', function(){
    	
    	// 진료번호를 가져온다음 그 진료번호로 해당 회진정보 가져온 후 화면에 뿌려주면 됨
    	
    	// 일단 진료번호 가져오기
    	let clinicNo = $(this).data('clinicno');
    	
    	// DB에서 해당 회진 정보 가져오기
    	$.ajax({
    		url: '/clinic/lightWeightClinicChartDetail',
    		data: {'clinicNo' : clinicNo},
    		dataType: 'json',
    		type: 'post',
    		beforeSend:function(xhr){
    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    		},
    		success: function(rst){
    			console.log('진료번호 ', clinicNo, '로 가져온 현재 진행중인 입원의 특정 회진 정보 가져오기 : ', rst)
    			
    			let cont = '';
    			
    			// 1.회진기록 갱신
    			let clinicOpinion = '';
    			if(rst.clinicOpinion !== null){
    				clinicOpinion = rst.clinicOpinion;
    			} else {
    				clinicOpinion = '회진 기록이 없습니다';
    			}
    			
    			cont += `
    				<div class="dduk-row">
    					<h2>회진차트 조회</h2>
    				</div>
    			
    				<div class="rounds-chart-detail-inner-border">
						<h3>회진기록</h3>
    					<textarea id="clinicOpinion" class="dduck-input" readonly="readonly">\${clinicOpinion}</textarea>
    			
    					<br><br><br>`;
    			
    			
    			
    			// 2.검사오더가 존재하면 갱신
    			if(rst.testOrderVOList.length !== 0){
    				
    				cont += `
    					<div class="d-flex">
    						<h3>검사오더 내역</h3>
    					</div>
    			
    					<table class="rounds-table test-order-table">
    						<thead>
    							<tr class="tr-padding tr-column">
    								<th class="td-padding gray-text" style="width: 25%">검사명</th>
    								<th class="td-padding gray-text" style="width: 60%">검사결과</th>
    								<th class="td-padding gray-text" style="width: 15%">환부</th>
    							</tr>
    						</thead>
    						<tbody>`;
    				
    				// 검사 오더내역 생성
    				$.each(rst.testOrderVOList, function(index, vo){
    					// 만약 사진결과가 있으면 사진데이터 json으로 저장
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
						
						cont += '<tr class="tr-padding">';
						cont += '<td class="td-padding-data gray-text">'+vo.testVO.testNm+'</td>';
						if(vo.teodRst != null){
						cont += '<td class="td-padding-data gray-text">'+vo.teodRst+'</td>';
						} else if(vo.atchFileVO != null){
							cont += `<td class="td-padding-data gray-text">
								<div class="viewTestResult" data-resultJson='\${jsonData}' data-bs-toggle="modal" data-bs-target="#viewTestOrderResult">
									결과보기
									<img id="magnifyingGlass" src="/resources/images/icons/magnifying-glass.png" alt="magnifyingGlass.png" />
								</div>	
							</td>`;
						} else {
							cont += `<td class="td-padding-data gray-text">검사 미진행</td>`;
						}
						
						if(vo.testOrderBodyCdNm !== null){
							cont += '<td class="td-padding-data gray-text">'+vo.testOrderBodyCdNm+'</td>';
						} else {
							cont += '<td class="td-padding-data gray-text">-</td>';
						}
						cont += '</tr>'
    				});
    				
    				cont += `
    						</tbody>
    					</table>
    					<br><br>`;
    			}
    			
    			// 3.처방오더가 존재하면 갱신
				if(rst.medicineOrderVOList.length !== 0){
    				
					cont += `
    					<div class="d-flex">
    						<h3>처방오더 내역</h3>
    					</div>
    			
    					<table class="rounds-table medicine-order-table">
    						<thead>
    							<tr class="tr-padding tr-column">
    								<th class="td-padding gray-text" style="width: 25%">약품명</th>
    								<th class="td-padding gray-text" style="width: 60%">약품상세</th>
    								<th class="td-padding gray-text" style="width: 15%">처방량</th>
    							</tr>
    						</thead>
    						<tbody>`;
    				
    				// 처방 오더내역 생성
    	    		$.each(rst.medicineOrderVOList, function(index, vo){
    	    			cont += '<tr class="tr-padding">';
						cont += '<td class="td-padding-data gray-text">'+truncateText(vo.medicineVO.mediNm, 6)+'</td>';
						cont += '<td class="td-padding-data gray-text">'+truncateText(vo.medicineVO.mediDetail, 16)+'</td>';
						if(vo.medicineVO.mediDetail === '주사' || vo.medicineVO.mediDetail === '기타 처방'){
							cont += '<td class="td-padding-data gray-text">-</td>';
						} else if(vo.medicineVO.mediDetail === '패치형 진통제' || vo.medicineVO.mediDetail === '연고'){
							cont += '<td class="td-padding-data gray-text">'+vo.mdodQt+'개</td>';
						} else{
							cont += '<td class="td-padding-data gray-text">'+vo.mdodQt+'일분</td>';
						}
						
						cont += '</tr>';
    	    		});
    						
					cont += `
							</tbody>
						</table>
						<br><br>`;
    			}
    			
    			// 4.치료오더가 존재하면 갱신
				if(rst.treatmentOrderVOList.length !== 0){
					cont += `
    					<div class="d-flex">
    						<h3>치료오더 내역</h3>
    					</div>
    			
    					<table class="rounds-table treatment-order-table">
    						<thead>
    							<tr class="tr-padding tr-column">
    								<th class="td-padding gray-text" style="width: 30%">치료명</th>
    								<th class="td-padding gray-text" style="width: 60%">치료기록</th>
    								<th class="td-padding gray-text" style="width: 10%">환부</th>
    							</tr>
    						</thead>
    						<tbody>`;
    						
    				// 치료 오더내역 생성
    	    	    $.each(rst.treatmentOrderVOList, function(index, vo){
    	    	    	cont += '<tr class="tr-padding">';
						cont += '<td class="td-padding-data gray-text">'+vo.treatmentVO.tmNm+'</td>';
						if(vo.trodCont == null){
						cont += '<td class="td-padding-data gray-text">-</td>';
						// 치료기록 글자수 14글자 넘어가면 돋보기 나와서 자세히보기 기능
						} else if(vo.trodCont.length > 14) {
							cont += '<td class="td-padding-data gray-text">'+truncateText(vo.trodCont, 20)+'<img class="view-trod-cont" data-trodcont="'+vo.trodCont+'" id="magnifyingGlass" src="/resources/images/icons/magnifying-glass.png" alt="magnifyingGlass.png"  data-bs-toggle="modal" data-bs-target="#trodContModal" /></td>';
						} else {
							cont += '<td class="td-padding-data gray-text">'+vo.trodCont+'</td>';
						}
						cont += '<td class="td-padding-data gray-text">'+vo.treatmentOrderBodyCdNm+'</td>';
						cont += '</tr>';
    	    	    });
    						
					cont += `
							</tbody>
						</table>
						<br><br>`;
    			}
    			
    			cont += '</div>';
    			
    			$('.rounds-chart-detail').html(cont);
    		},
    		error: function(xhr, status, error){
    			console.log('Error:', xhr, status, error);
    		}
    	})
    });
    
 	// 현재 입원중인 환자의 회진 리스트중 검사중, 검사완료 상태인 회진차트를 클릭할 때 이벤트
 	$(document).on('click', '.rounds-chart-list-date.testing, .rounds-chart-list-date.testdone', function(){
 		
 		let text = '';
 		if($(this).hasClass('testing')){
 			text = '검사가 아직 진행중입니다';
 		} else if($(this).hasClass('testdone')){
 			text = '검사가 모두 완료되었습니다';
 		}
 		
 		// 일단 회진 이어서 할건지 물어봄
 		// 확인 누르면 진료번호 가져오고 그 진료번호로 회진정보 가져와서 그대로 뿌려줌
 		Swal.fire({
			title: '회진을 이어서 진행하시겠습니까?',
			text: text,
			icon: 'question',
			showCancelButton: true,
			confirmButtonColor: '#0ABAB5',
			cancelButtonColor: '#8D9EA5',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			// 확인버튼 클릭시
			if (result.isConfirmed) {
				
				// 일단 진료번호 가져오기
		    	let clinicNo = $(this).data('clinicno');
				
		    	// DB에서 해당 회진 정보 가져오기
		    	$.ajax({
		    		url: '/clinic/lightWeightClinicChartDetail',
		    		data: {'clinicNo' : clinicNo},
		    		dataType: 'json',
		    		type: 'post',
		    		beforeSend:function(xhr){
		    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		    		},
		    		success: function(rst){
		    			console.log('진료번호 ', clinicNo, '로 가져온 현재 진행중인 입원의 검사진행중인 회진 정보 가져오기 : ', rst)
		    			
		    			let cont = '';
		    			
		    			// 1.회진기록 갱신
		    			cont += `
		    				<div class="dduk-row">
		    					<h2>검사결과 조회</h2>
		    					<button class="dduk-btn-info btn-rounds-complete">진료완료</button>
		    				</div>
		    			
		    				<div class="rounds-chart-detail-inner-border">
		    					<div class="dduk-row">
			    					<h3>회진기록</h3>
						            <button id="roundsComplete2" type="button" class="auto-complete-btn">
						               <svg width="24" height="" viewBox="0 0 600 600" fill="none" xmlns="http://www.w3.org/2000/svg">
						                  <path class="auto-complete-btn-path" d="m495.6 49.23-32.82-32.82C451.8 5.471 437.5 0 423.1 0c-14.33 0-28.66 5.469-39.6 16.41l-216 216.09c-8.4 7.5-12.7 17-15.1 27.3l-24.1 107.4c-1.8 8.9 5.1 16.8 12.8 16.8.916 0 1.852-.092 2.797-.281 0 0 74.03-15.71 107.4-23.56 10.1-2.377 19.13-7.46 26.46-14.79l217-217C517.5 106.5 517.4 71.1 495.6 49.23zM461.7 94.4l-217 217c-1.1 1.1-2.2 1.7-3.5 2-13.7 3.227-34.65 7.857-54.3 12.14l12.41-55.2c.29-1.44.99-2.84 2.09-3.84L417.5 50.4c1.9-1.99 4.1-2.4 5.6-2.4s3.715.406 5.65 2.342l32.82 32.83c3.23 3.168 3.23 8.098.13 11.228zM424 288c-13.25 0-24 10.75-24 24v128c0 13.23-10.78 24-24 24H72c-13.22 0-24-10.77-24-24V136c0-13.23 10.78-24 24-24h144c13.25 0 24-10.75 24-24s-10.7-24-24-24l-144.9-.01C32.31 63.99 0 96.29 0 135.1v304C0 479.7 32.31 512 71.1 512h303.1c39.69 0 71.1-32.3 71.1-72l2.7-128c0-13.2-10.7-24-24-24z" fill="#8d9ea5">
						                  </path>
						               </svg>
						            </button>
						        </div>
		    					<textarea id="clinicOpinion" class="dduck-input">\${rst.clinicOpinion}</textarea>
		    			
		    					<br><br><br>`;
		    			
		    			// 검사, 처방, 치료오더를 갱신, 테이블은 기본적으로 모두 존재해야 하며 기존의 오더내역은 삭제불가 및 새로운 오더 추가가 가능해야함
		    			// 2.검사오더 갱신
		    			cont += `
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
		    					<img id="trashbinTest" class="icon-trashbin" src="/resources/images/icons/trashbin.png">
		    				</div>
		    				<table class="rounds-table test-order-table">
		    					<thead>
		    						<tr class="tr-padding tr-column">
		    							<th class="td-padding gray-text" style="width: 25%">검사명</th>
		    							<th class="td-padding gray-text" style="width: 60%">검사결과</th>
		    							<th class="td-padding gray-text" style="width: 15%">환부</th>
		    						</tr>
		    					</thead>
		    					<tbody>`;
		    			
		    			// 만약 검사 결과보기 에서 검사 오더가 없으면 기본 메시지 출력
		    			if(rst.testOrderVOList.length === 0){
		    				cont += `
		    						<tr>
		    							<td id="defaultTest" colspan="3">검사오더을 추가해주세요</td>
		    						</tr>`;
		    			} else {
		    				// foreach문, 기존의 검사 오더내역 생성
		    				$.each(rst.testOrderVOList, function(index, vo){
		    					
		    					// 만약 사진결과가 있으면 사진데이터 json으로 저장
		    					let jsonData = '';
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
		    					
		    					cont += '<tr class="tr-padding tr-data past-record">';
		    					cont += '<td class="td-padding-data gray-text" style="padding: 1%">'+vo.testVO.testNm+'</td>';
		    					
		    					// 사진결과가 아닌 수치, 텍스트 검사결과가 있을 시
		    					if(vo.teodRst != null){
		    						cont += '<td class="td-padding-data gray-text">'+vo.teodRst+'</td>';
		    					// 사진결과가 있는 검사일때
		    					} else if(vo.atchFileVO != null){
		    						cont += `<td class="td-padding-data gray-text">
		    							<div class="viewTestResult" data-resultJson='\${jsonData}' data-bs-toggle="modal" data-bs-target="#viewTestOrderResult">
		    								결과보기
		    								<img id="magnifyingGlass" src="/resources/images/icons/magnifying-glass.png" alt="magnifyingGlass.png" />
		    							</div>	
		    						</td>`;
		    					// 둘다 없을 때
		    					} else {
		    						cont += `<td class="td-padding-data gray-text">검사 미진행</td>`;
		    					}
		    					
		    					// 환부가 있는 검사일 때
		    					if(vo.testOrderBodyCdNm !== null){
									cont += '<td class="td-padding-data gray-text">'+vo.testOrderBodyCdNm+'</td>';
								// 없는 검사일 때(소변, 피 등)
		    					} else {
									cont += '<td class="td-padding-data gray-text">-</td>';
								}
		    					cont += '</tr>';
		    				});
		    			}
		    						
		    			cont += `
		    					</tbody>
		    				</table>
		    				<br><br>`;
		    			
		    			// 3.처방오더 갱신
		    			cont += `
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
		    					<img id="trashbinMedicine" class="icon-trashbin" src="/resources/images/icons/trashbin.png">
		    				</div>
		    				<table class="rounds-table medicine-order-table">
		    					<thead>
		    						<tr class="tr-padding tr-column">
		    							<th class="td-padding gray-text" style="width: 25%">약품명</th>
		    							<th class="td-padding gray-text" style="width: 30%">약품상세</th>
		    							<th class="td-padding gray-text" style="width: 30%">용법</th>
		    							<th class="td-padding gray-text" style="width: 15%">처방량</th>
		    						</tr>
		    					</thead>
		    					<tbody>`;
		    			
		    			// 만약 검사 결과보기 에서 처방 오더가 없으면 기본 메시지 출력
		    			if(rst.medicineOrderVOList.length === 0) {
		    				cont +=	`<tr>
		    							<td id="defaultMedicine" colspan="4">처방오더을 추가해주세요</td>
		    						</tr>`;
		    			} else {
		    				// foreach문, 기존의 처방 오더내역 생성
							$.each(rst.medicineOrderVOList, function(index, vo){
								cont += '<tr class="tr-padding tr-data past-record">';
								cont += '<td class="td-padding-data gray-text" style="padding: 1%">'+vo.medicineVO.mediNm+'</td>';
								cont += '<td class="td-padding-data gray-text">'+truncateText(vo.medicineVO.mediDetail, 10)+'</td>';
								
								// 용법, 처방량 설정
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
		    				});
		    			}
		    						
		    			cont += `
		    					</tbody>
		    				</table>
		    				<br><br>`;
		    			
		    			// 4.치료오더 갱신
		    			cont += `
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
		    					<img id="trashbinTreatment" class="icon-trashbin" src="/resources/images/icons/trashbin.png">
		    				</div>
		    				<table class="rounds-table treatment-order-table">
		    					<thead>
		    						<tr class="tr-padding tr-column">
		    							<th class="td-padding gray-text" style="width: 85%">치료명</th>
		    							<th class="td-padding gray-text" style="width: 15%">환부</th>
		    						</tr>
		    					</thead>
		    					<tbody>`;
		    					
		    			// 만약 검사 결과보기 에서 치료 오더가 없으면 기본 메시지 출력
		    			if(rst.treatmentOrderVOList.length === 0){
		    				cont += `
		    						<tr>
    									<td id="defaultTreatment" colspan="2">치료오더을 추가해주세요</td>
    								</tr>`;
		    			} else {
		    				// foreach문, 기존의 치료 오더내역 생성
		    				$.each(rst.treatmentOrderVOList, function(index, vo){
		    					cont += `
		    						<tr class="tr-padding tr-data past-record">
	    								<td class="td-padding-data gray-text" style="padding: 1%">\${vo.treatmentVO.tmNm}</td>
	    								<td class="td-padding-data gray-text">\${vo.treatmentOrderBodyCdNm}</td>
	    							</tr>`;
		    				});
		    			}
		    						
		    			cont += `
		    					</tbody>
		    				</table>
		    			</div>`;
		    			
		    			$('.rounds-chart-detail').html(cont);
		    		},
		    		error: function(xhr, status, error){
		    			console.log('Error:', xhr, status, error);
		    		}
		    	})
			}
		})
 	});
    
    
    // 현재 입원중인 환자의 회진 차트에서 + 버튼 누를 때 이벤트
    $(document).on('click', '#createRoundsChart', function(){
    	Swal.fire({
			title: '회진 차트를 추가하시겠습니까?',
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
				updateCreateRoundsChart();
				
            	// 이전에 선택된 날짜의 selected 클래스 제거
                $(".rounds-chart-list-date").removeClass("selected");
			}
		})
    });
    
    
    // 회진차트 안에 내용 초기화
    function resetRoundsChart(){
    	let cont = '';
    	cont += '<h1 class="h1-default">날짜 또는 회진추가를 선택해주세요</h1>';
    	
    	$('.rounds-chart-detail').html(cont);
    }
    
    
    // 회진 차트 저장 스크립트 시작
	$(document).on('click', '.btn-rounds-save', function(){
		Swal.fire({
			title: '회진 내용을 저장하시겠습니까?',
			icon: 'question',
			showCancelButton: true,
			confirmButtonColor: '#0ABAB5',
			cancelButtonColor: '#8D9EA5',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			// 확인버튼 클릭시
			if (result.isConfirmed) {
				
				// 유효성 체크
				if(!validationSaveClinic()) return;
				
				// db에 넣기위한 데이터들 처리 시작
				// 회진기록(소견), 진료상태 가져오기
				let clinicOpinion = $('#clinicOpinion').val();
				let clinicState = '';
				
				// 만약 검사테이블에 검사 오더가 존재하면
				if($('.test-order-table').find('.tr-data').length){
					// 진료상태를 검사대기중으로 바꿈
					clinicState = 'CRST05';
				// 아니면 진료상태를 진료완료로 바꿈
				} else {
					clinicState = 'CRST04';
				}
				
				// 검사오더 추가 부분
				// clinicVO에 추가될 검사오더vo의 리스트
				let testOrderVOList = [];
				// 검사오더 테이블의  tr들을 가져옴
				let testTr = $('.test-order-table .tr-data');
				
				// 가져온 검사오더 테이블의 tr들을 object로 만들어서 list에 넣어줌
				$.each(testTr, function(index, tr){
					
					let tds = $(tr).find('td');
					
					let testOrderVO = {
						'testCd' : $(tr).data('testcd'),
						'testOrderBodyCd' : tds.eq(2).find('.btn-body').data('bodycd')
					};
					
					testOrderVOList.push(testOrderVO);
				});
				
				// 처방오더 추가 부분
				// clinicVO에 추가될 처방오더vo의 리스트
				let medicineOrderVOList = [];
				// 처방오더 테이블의 tr들을 가져옴
				let medicineTr = $('.medicine-order-table .tr-data');
				
				// 가져온 처방오더 테이블의 tr들을 object로 만들어서 list에 넣어줌
				$.each(medicineTr, function(index, tr){
					
					let tds = $(tr).find('td');
					
					let medicineOrderVO = {
						'mediCd' : $(tr).data('medicinecd'),
						'mdodDay' : tds.eq(2).find('.medicine-order-day').val(),
						'mdodPer' : tds.eq(2).find('.medicine-order-per').val(),
						'mdodDose' : tds.eq(2).find('.medicine-order-dose').val(),
						'mdodQt' : tds.eq(3).find('.medicine-order-qt').val()
					};
					
					medicineOrderVOList.push(medicineOrderVO);
				});
				
				// 치료오더 추가 부분
				// clinicVO에 추가될 치료오더vo의 리스트
				let treatmentOrderVOList = [];
				// 치료오더 테이블의 tr중 과거 기록이 아닌 tr들을 가져옴
				let treatmentTr = $('.treatment-order-table .tr-data');
				
				// 가져온 치료오더 테이블의 tr들을 object로 만들어서 list에 넣어줌
				$.each(treatmentTr, function(index, tr){
					
					let tds = $(tr).find('td');
					
					let treatmentOrderVO = {
						'tmCd' : $(tr).data('tmcd'),
						'bodyCd' : tds.eq(1).find('.btn-body').data('bodycd')
					};
					
					treatmentOrderVOList.push(treatmentOrderVO);
				});
				
				let clinicVO = {
						'paNo' : currentPaNo,
						'admiCd' : currentAdmiNo,
						'clinicOpinion' : clinicOpinion,
						'clinicState' : clinicState,
						'testOrderVOList' : testOrderVOList,
						'medicineOrderVOList' : medicineOrderVOList,
						'treatmentOrderVOList' : treatmentOrderVOList
				}
				
				console.log("회진차트 생성을 위해 controller로 보낼 clinicVO : ", clinicVO);
				// db에 넣기위한 데이터들 처리 끝
				
				// 회진차트를 생성한다
				$.ajax({
					url: '/rounds/createRoundsChart',
					type: "post",
					data: JSON.stringify(clinicVO),
					contentType: "application/json; UTF-8",
					dataType: 'json',
					beforeSend:function(xhr){
    					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
    				},
    				success: function(rst){
    					console.log('회진차트 생성 결과 : ', rst);
    					
    					Swal.fire({
    						title: '회진차트가 저장되었습니다',
    						icon: 'success',
    						confirmButtonColor: '#0ABAB5',
    						confirmButtonText: '확인',
    					})
    					
    					// 회진차트 작성부분 초기화
    					resetRoundsChart();
    					
    					// 회진차트 리스트 갱신
    					updateRoundsChartList();
    				},
    				error: function(xhr, status, error){
    					console.log('Error:', xhr, status, error);
    				}
				});
			}
		})
	});
    
    
    // 검사중, 검사완료인 회진 차트 업데이트
    $(document).on('click', '.btn-rounds-complete', function(){
    	Swal.fire({
			title: '회진 내용을 저장하시겠습니까?',
			icon: 'question',
			showCancelButton: true,
			confirmButtonColor: '#0ABAB5',
			cancelButtonColor: '#8D9EA5',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			// 확인버튼 클릭시
			if (result.isConfirmed) {
				
				// 유효성 체크
				if(!validationSaveClinic()) return;
				
				// 미완료된 검사가 있는지 체크
				if(!validationTestCheck()) return;
				
				// db에 넣기위한 데이터들 처리 시작
				// 현재 보고있는 진료번호, 회진기록(소견), 진료상태 가져오기
				let clinicNo = $('.rounds-chart-list-date.selected').data('clinicno');
				let clinicOpinion = $('#clinicOpinion').val();
				let clinicState = '';
				
				// 만약 또 검사테이블에 새로 추가된 검사 오더가 존재하면
				if($('.test-order-table tr.tr-data:not(.past-record)').length){
					// 진료상태를 검사대기중으로 바꿈
					clinicState = 'CRST05';
				// 아니면 진료상태를 진료완료로 바꿈
				} else {
					clinicState = 'CRST04';
				}
				
				// 검사오더 추가 부분
				// clinicVO에 추가될 검사오더vo의 리스트
				let testOrderVOList = [];
				// 검사오더 테이블의 tr중 과거 기록이 아닌 tr들을 가져옴
				let testTr = $('.test-order-table tr.tr-data:not(.past-record)');
				
				// 가져온 검사오더 테이블의 tr들을 object로 만들어서 list에 넣어줌
				$.each(testTr, function(index, tr){
					
					let tds = $(tr).find('td');
					
					let testOrderVO = {
						'testCd' : $(tr).data('testcd'),
						'testOrderBodyCd' : tds.eq(2).find('.btn-body').data('bodycd')
					};
					
					testOrderVOList.push(testOrderVO);
				});
				
				// 처방오더 추가 부분
				// clinicVO에 추가될 처방오더vo의 리스트
				let medicineOrderVOList = [];
				// 처방오더 테이블의 tr중 과거 기록이 아닌 tr들을 가져옴
				let medicineTr = $('.medicine-order-table tr.tr-data:not(.past-record)');
				
				// 가져온 처방오더 테이블의 tr들을 object로 만들어서 list에 넣어줌
				$.each(medicineTr, function(index, tr){
					
					let tds = $(tr).find('td');
					
					let medicineOrderVO = {
						'mediCd' : $(tr).data('medicinecd'),
						'mdodDay' : tds.eq(2).find('.medicine-order-day').val(),
						'mdodPer' : tds.eq(2).find('.medicine-order-per').val(),
						'mdodDose' : tds.eq(2).find('.medicine-order-dose').val(),
						'mdodQt' : tds.eq(3).find('.medicine-order-qt').val()
					};
					
					medicineOrderVOList.push(medicineOrderVO);
				});
				
				// 치료오더 추가 부분
				// clinicVO에 추가될 치료오더vo의 리스트
				let treatmentOrderVOList = [];
				// 치료오더 테이블의 tr중 과거 기록이 아닌 tr들을 가져옴
				let treatmentTr = $('.treatment-order-table tr.tr-data:not(.past-record)');
				
				// 가져온 치료오더 테이블의 tr들을 object로 만들어서 list에 넣어줌
				$.each(treatmentTr, function(index, tr){
					
					let tds = $(tr).find('td');
					
					let treatmentOrderVO = {
						'tmCd' : $(tr).data('tmcd'),
						'bodyCd' : tds.eq(1).find('.btn-body').data('bodycd')
					};
					
					treatmentOrderVOList.push(treatmentOrderVO);
				});
				
				let clinicVO = {
					'clinicNo' : clinicNo,
					'clinicOpinion' : clinicOpinion,
					'clinicState' : clinicState,
					'testOrderVOList' : testOrderVOList,
					'medicineOrderVOList' : medicineOrderVOList,
					'treatmentOrderVOList' : treatmentOrderVOList
				}
				
				console.log("회진차트 업데이트를 위해 controller로 보낼 clinicVO : ", clinicVO);
				// db에 넣기위한 데이터들 처리 끝
				
				// 회진차트를 갱신한다
				$.ajax({
					url: '/rounds/updateRoundsChart',
					type: "post",
					data: JSON.stringify(clinicVO),
					contentType: "application/json; UTF-8",
					dataType: 'json',
					beforeSend:function(xhr){
    					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
    				},
    				success: function(rst){
    					console.log('회진차트 갱신 결과 : ', rst);
    					
    					Swal.fire({
    						title: '회진차트가 저장되었습니다',
    						icon: 'success',
    						confirmButtonColor: '#0ABAB5',
    						confirmButtonText: '확인',
    					})
    					
    					// 회진차트 작성부분 초기화
    					resetRoundsChart();
    					
    					// 회진차트 리스트 갱신
    					updateRoundsChartList();
    				},
    				error: function(xhr, status, error){
    					console.log('Error:', xhr, status, error);
    				}
				});
			}
		})
    });
    
    
	// 회진 저장시 유효성 검사
	function validationSaveClinic(){
		
		let isValidated = true;
	
		// 1.회진기록이 입력 안되면 오류
		let clinicOpinion = $('#clinicOpinion').val();
		if(clinicOpinion === ''){
			Swal.fire({
    			title: '회진기록을 입력 해주세요',
    			icon: 'warning',
    			confirmButtonColor: '#0ABAB5',
    			confirmButtonText: '확인',
    		})
    		isValidated = false;
		}
		
		// 2.처방오더의 자식중 입력이 안된 input요소가 있으면 용법/처방량을 입력해주세요
		let medicineInput = $('.medicine-order-table tr.tr-data:not(.past-record)').find('input[type="number"]');
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
		
		// 3.선택되지않은 환부코드가 존재하면 경고
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
	
	
	// 미완료된 검사가 있는데 회진을 완료하려 하는걸 막기위한 쳌
	function validationTestCheck(){
		
		let isValidated = true;
		
		// 1.검사 미진행을 기준으로 판단(폐기처분)
// 		let pastTest = $('.test-order-table').find('.past-record');
// 		$.each(pastTest, function(index, tr){
// 			if($(tr).find('td').eq(1).text() === '검사 미진행'){
// 				Swal.fire({
// 					title: '아직 완료가 되지 않은 검사가 있습니다',
// 					icon: 'warning',
// 					confirmButtonColor: '#0ABAB5',
// 					confirmButtonText: '확인',
// 				})
// 				isValidated = false;
// 			}
// 		});
		
		// 2.현재 선택된 회진날짜에 testing 클래스가 있으면 검사 미진행으로 판단
		if($('.rounds-chart-list-date.selected').hasClass('testing')){
			Swal.fire({
				title: '아직 완료가 되지 않은 검사가 있습니다',
				icon: 'warning',
				confirmButtonColor: '#0ABAB5',
				confirmButtonText: '확인',
			})
			isValidated = false;
		}
		
		return isValidated;
	}
    // 회진 차트 저장 스크립트 끝
    
    
    // 오더 추가 스크립트 시작
    
    // 상병, 검사, 처방, 치료 4개의 추가버튼을 누를 때 그에 따른 전체 검색풀을 불러와서 searchPool에 할당
	var searchPool = [];
    
	// 검색결과 테이블 크기 조절을 위한 변수
	var width = [];
	
    // 오더추가 버튼 누를 때 이벤트
	$(document).on('click', '.btn-order-modal', function(){

		// 검색 풀이 계속 쌓이는걸 방지하기 위해 초기화
		searchPool = [];
		let type = $(this).data('type');
		let searchUrl = '';
		
		// 선택한 추가 종류에 따라 모달의 제목 및 버튼의 id를 변경, url을 설정
		switch (type) {
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
	
	// 검사오더추가 모달에서 저장 버튼 누를 시
	function addTest(){
		
		let testCd = $('.table-order-result td').eq(0).text();
		let testNm = $('.table-order-result td').eq(1).text();
		
		let cont = `
			<tr class="tr-padding tr-data" data-testcd="\${testCd}">
				<td class="td-padding-data gray-text">\${testNm}</td>
				<td class="td-padding-data gray-text">검사 미진행</td>`
			
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
		$('.test-order-table tbody').append(cont);
		
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
		let medicineDetail = truncateText($('.table-order-result td').eq(2).text(), 10);
		
		let cont = `
			<tr class="tr-padding tr-data" data-medicinecd="\${medicineCd}">
				<td class="td-padding-data gray-text" style="padding: 1%">\${medicineNm}</td>
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
		$('.medicine-order-table').append(cont);
		
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
			<tr class="tr-padding tr-data" data-tmcd="\${tmCd}">
				<td class="td-padding-data gray-text">\${tmNm}</td>
				<td class="td-padding-data gray-text">
					<button class="dduk-btn-disabled btn-state btn-body" data-bs-toggle="modal" data-bs-target="#bodyCdModal">환부선택</button>
				</td>
			</tr>`;
			
		// 만약 기본 메세지가 남아있다면
		if($('#defaultTreatment').length){
			$('#defaultTreatment').remove();
		}
		$('.treatment-order-table').append(cont);
		
		Swal.fire({
			title: '치료오더가 추가되었습니다',
			icon: 'success',
			confirmButtonColor: '#0ABAB5',
			confirmButtonText: '확인',
		})
	}
    // 오더 추가 스크립트 끝
    
    
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
		if($('.test-order-table').find('.selected').length){
			$('#trashbinTest').addClass('active');
		} else {
			$('#trashbinTest').removeClass('active');
		}
		if($('.medicine-order-table').find('.selected').length){
			$('#trashbinMedicine').addClass('active');
		} else {
			$('#trashbinMedicine').removeClass('active');                
		}
		if($('.treatment-order-table').find('.selected').length){
			$('#trashbinTreatment').addClass('active');
		} else {
			$('#trashbinTreatment').removeClass('active');
		}
	}
	
	
	// 검사오더 삭제처리
	$(document).on('click', '#trashbinTest', function(){
		
		// 과거 내역이 선택됐으면
		if($('.test-order-table').find('.selected.past-record').length) {
			
			Swal.fire({
				title: '과거의 회진내역은 삭제하실 수 없습니다',
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
				let selected = $('.test-order-table').find('.selected');
				// 가져온 검사오더들을 삭제
				$.each(selected, function(index, tr){
					tr.remove();
				});
				// 만약 검사오더 테이블에 데이터가 없으면 기본 메시지 출력
				if(!$('.test-order-table').find('.tr-data').length){
					let cont = '<tr><td id="defaultTest" colspan="5">검사오더를 추가해주세요</td></tr>';
					$('.test-order-table').append(cont);
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
		if($('.medicine-order-table').find('.selected.past-record').length) {
			
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
				let selected = $('.medicine-order-table').find('.selected');
				// 가져온 처방오더들을 삭제
				$.each(selected, function(index, tr){
					tr.remove();
				});
				// 만약 처방오더 테이블에 데이터가 없으면 기본 메시지 출력
				if(!$('.medicine-order-table').find('.tr-data').length){
					let cont = '<tr><td id="defaultMedicine" colspan="5">처방오더를 추가해주세요</td></tr>';
					$('.medicine-order-table').append(cont);
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
		if($('.treatment-order-table').find('.selected.past-record').length) {
			
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
				let selected = $('.treatment-order-table').find('.selected');
				// 가져온 치료오더들을 삭제
				$.each(selected, function(index, tr){
					tr.remove();
				});
				// 만약 치료오더 테이블에 데이터가 없으면 기본 메시지 출력
				if(!$('.treatment-order-table').find('.tr-data').length){
					let cont = '<tr><td id="defaultTreatment" colspan="5">치료오더를 추가해주세요</td></tr>';
					$('.treatment-order-table').append(cont);
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
    
    
    // 이름 등이 글자를 제어하고 싶을 때 maxLength까지만 표시
    function truncateText(text, maxLength) {
    	if (text.length > maxLength) {
    		return text.slice(0, maxLength) + '...';
    	} else {
    		return text;
    	}
    }
	
    
    // 진료 기록 조회시 스크롤로 이동 기능 시작
    var clinicHistoryList = $('.clinic-history-list');

	let isDown = false;
    let startX;
    let scrollLeft;

    clinicHistoryList.on('mousedown', function(e) {
        isDown = true;
        clinicHistoryList.css('cursor', 'grabbing');
        startX = e.pageX - $(this).offset().left;
        scrollLeft = $(this).scrollLeft();
    });

    clinicHistoryList.on('mouseleave', function() {
        isDown = false;
        clinicHistoryList.css('cursor', 'grab');
    });

    clinicHistoryList.on('mouseup', function() {
        isDown = false;
        clinicHistoryList.css('cursor', 'grab');
    });

    clinicHistoryList.on('mousemove', function(e) {
        if (!isDown) return;
        e.preventDefault();
        const x = e.pageX - $(this).offset().left;
        const walk = (x - startX) * 1; // 스크롤 속도 조절
        $(this).scrollLeft(scrollLeft - walk);
    });
 	// 진료 기록 조회시 스크롤로 이동 기능 끝
 	
 	
 	// 회진 기록 조회시 스크롤로 이동 기능 시작
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
 	
 	
 	// 생년월일로 만나이 계산
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
	
	
	// 환자의 과거 진료내역중 치료내역이 너무 길 때 모달로 띄우는 스크립트
	$(document).on('click', '.view-trod-cont', function(){
		let cont = $(this).data('trodcont');
		$('#divTrodCont').text(cont);
	})
 	
	
	// 회진차트 불러오기
	function updateRoundsChart() {
		let cont = `
			<div class="dduk-body-border rounds-chart">
			<div class="dduk-title-area rounds-chart-head">
				<div class="d-flex">
					<h2>회진 차트</h2>
					<img id="undoRoundsChart" class="icon-undo" src="/resources/images/icons/undo.png">
				</div>
			</div>
			<div class="rounds-chart-body-top">
				<div class="calendar-wrap">
					
					<div class="dduk-row">
						<img class="icon-stethoscope" src="/resources/images/icons/stethoscope.png">
						<div class="date-wrap">
							<div>담당의사</div>
							<div class="empName">김영남</div>
						</div>
					</div>
				
					<div class="dduk-row">
						<img class="icon-calendar" src="/resources/images/icons/calendar.png">
						<div class="date-wrap">
							<div>입원일</div>
							<div class="inDt">2023-11-10</div>
						</div>
					</div>
					
					<div class="dduk-row">
						<img class="icon-calendar" src="/resources/images/icons/calendar.png">
						<div class="date-wrap">
							<div>퇴원예정일</div>
							<div class="expOutDt">2023-11-11</div>
						</div>
					</div>
					
				</div>
			</div>
			<div class="d-flex rounds-chart-body-cont">
				<div class="rounds-chart-list">
					<svg id="createRoundsChart" type="button" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none">
						<g clip-path="url(#clip0_142_1638)">
						<path d="M18 13H13V18C13 18.55 12.55 19 12 19C11.45 19 11 18.55 11 18V13H6C5.45 13 5 12.55 5 12C5 11.45 5.45 11 6 11H11V6C11 5.45 11.45 5 12 5C12.55 5 13 5.45 13 6V11H18C18.55 11 19 11.45 19 12C19 12.55 18.55 13 18 13Z" fill="#8D9EA5"></path>
						</g>
						<defs>
						<clipPath id="clip0_142_1638">
						<rect width="24" height="24" fill="white"></rect>
						</clipPath>
						</defs>
					</svg>
				</div>
				
				<div class="rounds-chart-detail">
					<h1 class="h1-default">날짜 또는 회진추가를 선택해주세요</h1>
				</div>
			</div>
		</div>`;
		
		$('.rounds-right-wrap').html(cont);
	}
	
	
	// 회진차트작성 불러오기
	function updateCreateRoundsChart(){
		let cont = `
		<div class="dduk-row">
		<h2>회진차트 작성</h2>
		<button class="dduk-btn-info btn-rounds-save">진료저장</button>
	</div>
	<div class="rounds-chart-detail-inner-border">
		<div class="dduk-row">
			<h3>회진기록</h3>
	        <button id="roundsComplete1" type="button" class="auto-complete-btn">
		        <svg width="24" height="" viewBox="0 0 600 600" fill="none" xmlns="http://www.w3.org/2000/svg">
		           <path class="auto-complete-btn-path" d="m495.6 49.23-32.82-32.82C451.8 5.471 437.5 0 423.1 0c-14.33 0-28.66 5.469-39.6 16.41l-216 216.09c-8.4 7.5-12.7 17-15.1 27.3l-24.1 107.4c-1.8 8.9 5.1 16.8 12.8 16.8.916 0 1.852-.092 2.797-.281 0 0 74.03-15.71 107.4-23.56 10.1-2.377 19.13-7.46 26.46-14.79l217-217C517.5 106.5 517.4 71.1 495.6 49.23zM461.7 94.4l-217 217c-1.1 1.1-2.2 1.7-3.5 2-13.7 3.227-34.65 7.857-54.3 12.14l12.41-55.2c.29-1.44.99-2.84 2.09-3.84L417.5 50.4c1.9-1.99 4.1-2.4 5.6-2.4s3.715.406 5.65 2.342l32.82 32.83c3.23 3.168 3.23 8.098.13 11.228zM424 288c-13.25 0-24 10.75-24 24v128c0 13.23-10.78 24-24 24H72c-13.22 0-24-10.77-24-24V136c0-13.23 10.78-24 24-24h144c13.25 0 24-10.75 24-24s-10.7-24-24-24l-144.9-.01C32.31 63.99 0 96.29 0 135.1v304C0 479.7 32.31 512 71.1 512h303.1c39.69 0 71.1-32.3 71.1-72l2.7-128c0-13.2-10.7-24-24-24z" fill="#8d9ea5">
		           </path>
		        </svg>
	    	</button>
	    </div>
		<textarea id="clinicOpinion" class="dduck-input"></textarea>
		
		<br><br><br>
		
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
			<img id="trashbinTest" class="icon-trashbin" src="/resources/images/icons/trashbin.png">
		</div>
		<table class="rounds-table test-order-table">
			<thead>
				<tr class="tr-padding tr-column">
					<th class="td-padding gray-text" style="width: 25%">검사명</th>
					<th class="td-padding gray-text" style="width: 60%">검사결과</th>
					<th class="td-padding gray-text" style="width: 15%">환부</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td id="defaultTest" colspan="3">검사오더을 추가해주세요</td>
				</tr>
			</tbody>
		</table>
		
		<br><br>
		
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
			<img id="trashbinMedicine" class="icon-trashbin" src="/resources/images/icons/trashbin.png">
		</div>
		<table class="rounds-table medicine-order-table">
			<thead>
				<tr class="tr-padding tr-column">
					<th class="td-padding gray-text" style="width: 25%">약품명</th>
					<th class="td-padding gray-text" style="width: 30%">약품상세</th>
					<th class="td-padding gray-text" style="width: 30%">용법</th>
					<th class="td-padding gray-text" style="width: 15%">처방량</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td id="defaultMedicine" colspan="4">처방오더을 추가해주세요</td>
				</tr>
			</tbody>
		</table>
		
		<br><br>
		
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
			<img id="trashbinTreatment" class="icon-trashbin" src="/resources/images/icons/trashbin.png">
		</div>
		<table class="rounds-table treatment-order-table">
			<thead>
				<tr class="tr-padding tr-column">
					<th class="td-padding gray-text" style="width: 85%">치료명</th>
					<th class="td-padding gray-text" style="width: 15%">환부</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td id="defaultTreatment" colspan="2">치료오더을 추가해주세요</td>
				</tr>
			</tbody>
		</table>
		
	</div>`;
	
		$('.rounds-chart-detail').html(cont);
	}
	
	
	// 간호사쪽 정보 불러오기
	function updateNurseChart() {
		
		let cont = `
			<div class="nurse-wrap">
			
				<div class="dduk-body-border nurse-chart">
					<div class="dduk-title-area nurse-chart-head">
							<h2>간호 차트</h2>
							<img id="undoNurseChart" class="icon-undo" src="/resources/images/icons/undo.png" style="position: absolute; left: 1150px; bottom: 912px; visibility:hidden">
						<input type="text" name="datepicker-nurse-chart" id="datepickerNurseChart" style="display: none">
					</div>
					<div class="nurse-chart-body">
						<div class="nurse-chart-list">
							<div class="nurse-chart-list-date">2024-01-08 오전 09시 21분</div>
							<div class="nurse-chart-list-date">2024-01-08 오전 11시 25분</div>
							<div class="nurse-chart-list-date">2024-01-08 오후 06시 15분</div>
							<div class="nurse-chart-list-date">2024-01-09 오전 08시 11분</div>
							<div class="nurse-chart-list-date">2024-01-09 오전 11시 52분</div>
							<div class="nurse-chart-list-date">2024-01-09 오후 05시 22분</div>
							<div class="nurse-chart-list-date">2021-01-10 오전 09시 09분</div>
							<div class="nurse-chart-list-date">2024-01-10 오후 12시 08분</div>
							<div class="nurse-chart-list-date">2024-01-10 오후 06시 18분</div>
							<div class="nurse-chart-list-date">2024-01-11 오전 08시 31분</div>
							<div class="nurse-chart-list-date">2024-01-11 오전 11시 46분</div>
							<div class="nurse-chart-list-date">2024-01-11 오후 05시 47분</div>
							<div class="nurse-chart-list-date">2024-01-12 오전 09시 11분</div>
							<div class="nurse-chart-list-date">2024-01-12 오전 11시 37분</div>
							<div class="nurse-chart-list-date">2024-01-12 오후 06시 26분</div>
							<div class="nurse-chart-list-date">2024-01-13 오전 08시 58분</div>
							<div class="nurse-chart-list-date">2024-01-13 오후 12시 21분</div>
							<div class="nurse-chart-list-date">2024-01-13 오후 06시 28분</div>
							<div class="nurse-chart-list-date">2024-01-14 오전 09시 21분</div>
							<div class="nurse-chart-list-date">2024-01-14 오후 12시 02분</div>
							<div class="nurse-chart-list-date">2024-01-14 오후 06시 01분</div>
							<div class="nurse-chart-list-date">2024-01-15 오전 08시 12분</div>
							<div class="nurse-chart-list-date">2024-01-15 오전 11시 11분</div>
							<div class="nurse-chart-list-date">2024-01-15 오후 06시 30분</div>
						</div>
		<!-- 				<div class="nurse-chart-detail"> -->
		<!-- 					<div class="nurse-chart-writer">작성자 : 김영남</div> -->
		<!-- 					<textarea class="dduck-input nurse-chart-cont" readonly="readonly" ></textarea> -->
		<!-- 				</div> -->
					</div>
				</div>
				
				<div class="nurse-record-tab">
					<div class="nurse-record-element">혈압</div> 
					<div class="nurse-record-element tab-active">체온</div>
					<div class="nurse-record-element tab-active">IO</div>
				</div>
				<div class="dduk-body-border nurse-record">
					<div class="nurse-record-body">
						<div style="overflow-y: scroll; height: 350px;">
							<table class="table-blood">
								<thead>
									<tr class="tr-padding tr-column">
										<th class="td-padding dark-gray-text" style="width:165px">측정일시</th>
										<th class="td-padding dark-gray-text" style="width:90px">최고/최저혈압</th>
									</tr>
								</thead>
								<tbody>
									
									<tr class="tr-padding tr-data">
										<td class="td-padding-data dark-gray-text" style="padding: 1%">2024-01-08 09:15</td>
										<td class="td-padding-data dark-gray-text">120/80</td>
									</tr>
						
									<tr class="tr-padding tr-data">
										<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-08 17:29</td>
										<td class="td-padding-data dark-gray-text">128/78</td>
									</tr>
								
									<tr class="tr-padding tr-data">
										<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-09 08:42</td>
										<td class="td-padding-data dark-gray-text">121/67</td>
									</tr>
									
									<tr class="tr-padding tr-data">
										<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-09 18:02</td>
										<td class="td-padding-data dark-gray-text">124/82</td>
									</tr>
						
									<tr class="tr-padding tr-data">
										<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-10 09:31</td>
										<td class="td-padding-data dark-gray-text">118/69</td>
									</tr>
								
									<tr class="tr-padding tr-data">
										<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-10 18:57</td>
										<td class="td-padding-data dark-gray-text">126/85</td>
									</tr>
									
									<tr class="tr-padding tr-data">
										<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-11 09:26</td>
										<td class="td-padding-data dark-gray-text">129/82</td>
									</tr>
						
									<tr class="tr-padding tr-data">
										<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-11 18:21</td>
										<td class="td-padding-data dark-gray-text">120/80</td>
									</tr>
								
									<tr class="tr-padding tr-data">
										<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-12 08:52</td>
										<td class="td-padding-data dark-gray-text">122/78</td>
									</tr>
									
									<tr class="tr-padding tr-data">
										<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-12 17:21</td>
										<td class="td-padding-data dark-gray-text">116/75</td>
									</tr>
						
									<tr class="tr-padding tr-data">
										<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-13 11:16</td>
										<td class="td-padding-data dark-gray-text">131/86</td>
									</tr>
								
									<tr class="tr-padding tr-data">
										<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-13 17:09</td>
										<td class="td-padding-data dark-gray-text">128/76</td>
									</tr>
									
									<tr class="tr-padding tr-data">
										<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-14 12:10</td>
										<td class="td-padding-data dark-gray-text">121/77</td>
									</tr>
						
									<tr class="tr-padding tr-data">
										<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-14 19:15</td>
										<td class="td-padding-data dark-gray-text">116/72</td>
									</tr>
								
									<tr class="tr-padding tr-data">
										<td class="td-padding-data dark-gray-text" style="padding: 1%;">2024-01-15 11:11</td>
										<td class="td-padding-data dark-gray-text">127/85</td>
									</tr>
									
								</tbody>
							</table>
						</div>
					</div>
				</div>
				
			</div>
			`;
		
		$('.rounds-right-wrap').append(cont);
	}
	
	
	// 병상정보 불러오기
	function updateRoundsBed() {
		let cont = `
			<div class="d-flex">
	         <div class="d-flex patient-info btn-room-change">
	            <div class="d-flex">
	               <button class="room-tab" id="twinRoom">2인실</button>
	            </div>
	            <div class="d-flex">
	               <button class="room-tab tab-active" id="familyRoom">4인실</button>
	            </div>
	            <div class="d-flex">
	               <button class="room-tab tab-active" id="s
	               uiteRoom">6인실</button>
	            </div>
	         </div>
	      </div>

		<div class="dduk-body-border rounds-bed-list">
		
			<div class="bed-list-2">
				<h2 class="title-bed-2">304호 </h2>
						
						<div class="bed-wrap-2">
				        	<div class="d-flex" style="margin: 0;">
								<div id="304-1" class="d-flex bed-large" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
								<div class="d-flex-column"><h2>304-1</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
				                		<g clip-path=".url(#clip0_464_1878)">
				                    		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
				                    	</g>
				                    	<defs>
				                    		<clipPath id="clip0_464_1878">
				                        		<rect width="80" height="80" fill="white"/>
				                        	</clipPath>
				                    	</defs>
									</svg>
				            	</div>
				        	</div>
				        
				        	<div class="d-flex" style="margin: 0;">
								<div id="304-2" class="d-flex bed-large" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
								<div class="d-flex-column"><h2>304-2</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
				                		<g clip-path=".url(#clip0_464_1878)">
				                    		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
				                    	</g>
				                    	<defs>
				                    		<clipPath id="clip0_464_1878">
				                        		<rect width="80" height="80" fill="white"/>
				                        	</clipPath>
				                    	</defs>
									</svg>
				            	</div>
				        	</div>
				        </div>
				        
				        <h2 class="title-bed-2">305호 </h2>
						
						<div class="bed-wrap-2">
				        	<div class="d-flex" style="margin: 0;">
								<div id="305-1" class="d-flex bed-large" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				        		<div class="d-flex-column"><h2>305-1</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
				                		<g clip-path=".url(#clip0_464_1878)">
				                    		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
				                    	</g>
				                    	<defs>
				                    		<clipPath id="clip0_464_1878">
				                        		<rect width="80" height="80" fill="white"/>
				                        	</clipPath>
				                    	</defs>
									</svg>
				            	</div>
				        	</div>
				        
				        	<div class="d-flex" style="margin: 0;">
				            	<div id="305-2" class="d-flex bed-large" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				            	<div class="d-flex-column"><h2>305-2</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
				                		<g clip-path=".url(#clip0_464_1878)">
				                    		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
				                    	</g>
				                    	<defs>
				                    		<clipPath id="clip0_464_1878">
				                        		<rect width="80" height="80" fill="white"/>
				                        	</clipPath>
				                    	</defs>
									</svg>
				            	</div>
				        	</div>
				        </div>
				        
				        <h2 class="title-bed-2">306호 </h2>
						
						<div class="bed-wrap-2">
				        	<div class="d-flex" style="margin: 0;">
								<div id="306-1" class="d-flex bed-large" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				        		<div class="d-flex-column"><h2>306-1</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
				                		<g clip-path=".url(#clip0_464_1878)">
				                    		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
				                    	</g>
				                    	<defs>
				                    		<clipPath id="clip0_464_1878">
				                        		<rect width="80" height="80" fill="white"/>
				                        	</clipPath>
				                    	</defs>
									</svg>
				            	</div>
				        	</div>
				        
				        	<div class="d-flex" style="margin: 0;">
				            	<div id="306-2" class="d-flex bed-large" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				            	<div class="d-flex-column"><h2>306-2</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
				                		<g clip-path=".url(#clip0_464_1878)">
				                    		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
				                    	</g>
				                    	<defs>
				                    		<clipPath id="clip0_464_1878">
				                        		<rect width="80" height="80" fill="white"/>
				                        	</clipPath>
				                    	</defs>
									</svg>
				            	</div>
				        	</div>
				        </div>
				        
				        <h2 class="title-bed-2">307호 </h2>
						
						<div class="bed-wrap-2">
				        	<div class="d-flex" style="margin: 0;">
								<div id="307-1" class="d-flex bed-large" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				        		<div class="d-flex-column"><h2>307-1</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
				                		<g clip-path=".url(#clip0_464_1878)">
				                    		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
				                    	</g>
				                    	<defs>
				                    		<clipPath id="clip0_464_1878">
				                        		<rect width="80" height="80" fill="white"/>
				                        	</clipPath>
				                    	</defs>
									</svg>
				            	</div>
				        	</div>
				        
				        	<div class="d-flex" style="margin: 0;">
				            	<div id="307-2" class="d-flex bed-large" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				            	<div class="d-flex-column"><h2>307-2</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
				                		<g clip-path=".url(#clip0_464_1878)">
				                    		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
				                    	</g>
				                    	<defs>
				                    		<clipPath id="clip0_464_1878">
				                        		<rect width="80" height="80" fill="white"/>
				                        	</clipPath>
				                    	</defs>
									</svg>
				            	</div>
				        	</div>
				        </div>
					</div>
					
					<div class="bed-list-4 hidden"> 
						<h2 class="title-bed-4">404호 </h2>
				
						<div class="bed-wrap-4">
				        	<div class="d-flex" style="margin: 0;">
								<div id="404-1" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				        		<div class="d-flex-column"><h2>404-1</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
				                		<g clip-path=".url(#clip0_464_1878)">
				                    		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
				                    	</g>
				                    	<defs>
				                    		<clipPath id="clip0_464_1878">
				                        		<rect width="80" height="80" fill="white"/>
				                        	</clipPath>
				                    	</defs>
									</svg>
				            	</div>
				        	</div>
				        
				        	<div class="d-flex" style="margin: 0;">
				            	<div id="404-2" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				            	<div class="d-flex-column"><h2>404-2</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
				                		<g clip-path=".url(#clip0_464_1878)">
				                    		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
				                    	</g>
				                    	<defs>
				                    		<clipPath id="clip0_464_1878">
				                        		<rect width="80" height="80" fill="white"/>
				                        	</clipPath>
				                    	</defs>
									</svg>
				            	</div>
				        	</div>
				        	
				        	<div class="d-flex" style="margin: 0;">
								<div id="404-3" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				        		<div class="d-flex-column"><h2>404-3</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
				                		<g clip-path=".url(#clip0_464_1878)">
				                    		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
				                    	</g>
				                    	<defs>
				                    		<clipPath id="clip0_464_1878">
				                        		<rect width="80" height="80" fill="white"/>
				                        	</clipPath>
				                    	</defs>
									</svg>
				            	</div>
				        	</div>
				        	
				        	<div class="d-flex" style="margin: 0;">
								<div id="404-4" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				        		<div class="d-flex-column"><h2>404-4</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
				                		<g clip-path=".url(#clip0_464_1878)">
				                    		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
				                    	</g>
				                    	<defs>
				                    		<clipPath id="clip0_464_1878">
				                        		<rect width="80" height="80" fill="white"/>
				                        	</clipPath>
				                    	</defs>
									</svg>
				            	</div>
				        	</div>
				        </div>
				        
				        <h2 class="title-bed-4">405호 </h2>
						
						<div class="bed-wrap-4">
				        	<div class="d-flex" style="margin: 0;">
								<div id="405-1" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				        		<div class="d-flex-column"><h2>405-1</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
				                		<g clip-path=".url(#clip0_464_1878)">
				                    		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
				                    	</g>
				                    	<defs>
				                    		<clipPath id="clip0_464_1878">
				                        		<rect width="80" height="80" fill="white"/>
				                        	</clipPath>
				                    	</defs>
									</svg>
				            	</div>
				        	</div>
				        
				        	<div class="d-flex" style="margin: 0;">
				            	<div id="405-2" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				            	<div class="d-flex-column"><h2>405-2</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
				                		<g clip-path=".url(#clip0_464_1878)">
				                    		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
				                    	</g>
				                    	<defs>
				                    		<clipPath id="clip0_464_1878">
				                        		<rect width="80" height="80" fill="white"/>
				                        	</clipPath>
				                    	</defs>
									</svg>
				            	</div>
				        	</div>
				        	
				        	<div class="d-flex" style="margin: 0;">
								<div id="405-3" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				        		<div class="d-flex-column"><h2>405-3</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
				                		<g clip-path=".url(#clip0_464_1878)">
				                    		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
				                    	</g>
				                    	<defs>
				                    		<clipPath id="clip0_464_1878">
				                        		<rect width="80" height="80" fill="white"/>
				                        	</clipPath>
				                    	</defs>
									</svg>
				            	</div>
				        	</div>
				        	
				        	<div class="d-flex" style="margin: 0;">
								<div id="405-4" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				        		<div class="d-flex-column"><h2>405-4</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
				                		<g clip-path=".url(#clip0_464_1878)">
				                    		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
				                    	</g>
				                    	<defs>
				                    		<clipPath id="clip0_464_1878">
				                        		<rect width="80" height="80" fill="white"/>
				                        	</clipPath>
				                    	</defs>
									</svg>
				            	</div>
				        	</div>
				        </div>
				        
				        <h2 class="title-bed-4">406호 </h2>
						
						<div class="bed-wrap-4">
				        	<div class="d-flex" style="margin: 0;">
								<div id="406-1" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				        		<div class="d-flex-column"><h2>406-1</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
				                		<g clip-path=".url(#clip0_464_1878)">
				                    		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
				                    	</g>
				                    	<defs>
				                    		<clipPath id="clip0_464_1878">
				                        		<rect width="80" height="80" fill="white"/>
				                        	</clipPath>
				                    	</defs>
									</svg>
				            	</div>
				        	</div>
				        
				        	<div class="d-flex" style="margin: 0;">
				            	<div id="406-2" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				            	<div class="d-flex-column"><h2>406-2</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
				                		<g clip-path=".url(#clip0_464_1878)">
				                    		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
				                    	</g>
				                    	<defs>
				                    		<clipPath id="clip0_464_1878">
				                        		<rect width="80" height="80" fill="white"/>
				                        	</clipPath>
				                    	</defs>
									</svg>
				            	</div>
				        	</div>
				        	
				        	<div class="d-flex" style="margin: 0;">
								<div id="406-3" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				        		<div class="d-flex-column"><h2>406-3</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
				                		<g clip-path=".url(#clip0_464_1878)">
				                    		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
				                    	</g>
				                    	<defs>
				                    		<clipPath id="clip0_464_1878">
				                        		<rect width="80" height="80" fill="white"/>
				                        	</clipPath>
				                    	</defs>
									</svg>
				            	</div>
				        	</div>
				        	
				        	<div class="d-flex" style="margin: 0;">
								<div id="406-4" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				        		<div class="d-flex-column"><h2>406-4</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
				                		<g clip-path=".url(#clip0_464_1878)">
				                    		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
				                    	</g>
				                    	<defs>
				                    		<clipPath id="clip0_464_1878">
				                        		<rect width="80" height="80" fill="white"/>
				                        	</clipPath>
				                    	</defs>
									</svg>
				            	</div>
				        	</div>
				        </div>
				    </div>
				    
				    
				    <div class="bed-list-6 hidden"> 
				    	<div class="dduk-inner-border bed-list-6-left">
				    		<h2 class="title-bed-6">504호 </h2>
				    		<div class="bed-wrap-6">
				    			<div class="dduk-row">
				    				<div class="d-flex" style="margin: 0;">
										<div id="504-1" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%;">
				        					<div class="d-flex-column"><h2>504-1</h2><div class="gray-text">빈 침상</div></div>
				            					<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
				                				<g clip-path=".url(#clip0_464_1878)">
				                    			<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
				                    			</g>
				                    			<defs>
				                    			<clipPath id="clip0_464_1878">
				                        		<rect width="80" height="80" fill="white"/>
				                        		</clipPath>
				                    			</defs>
												</svg>
				            			</div>
				        			</div>
				        			<div class="d-flex" style="margin: 0;">
										<div id="504-2" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%;">
				        					<div class="d-flex-column"><h2>504-2</h2><div class="gray-text">빈 침상</div></div>
				            					<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
				                				<g clip-path=".url(#clip0_464_1878)">
				                    			<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
				                    			</g>
				                    			<defs>
				                    			<clipPath id="clip0_464_1878">
				                        		<rect width="80" height="80" fill="white"/>
				                        		</clipPath>
				                    			</defs>
												</svg>
				            			</div>
				        			</div>
				    			</div>
				    			<div class="dduk-row">
				    				<div class="d-flex" style="margin: 0;">
										<div id="504-3" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%;">
				        					<div class="d-flex-column"><h2>504-3</h2><div class="gray-text">빈 침상</div></div>
				            					<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
				                				<g clip-path=".url(#clip0_464_1878)">
				                    			<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
				                    			</g>
				                    			<defs>
				                    			<clipPath id="clip0_464_1878">
				                        		<rect width="80" height="80" fill="white"/>
				                        		</clipPath>
				                    			</defs>
												</svg>
				            			</div>
				        			</div>
				        			<div class="d-flex" style="margin: 0;">
										<div id="504-4" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%;">
				        					<div class="d-flex-column"><h2>504-4</h2><div class="gray-text">빈 침상</div></div>
				            					<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
				                				<g clip-path=".url(#clip0_464_1878)">
				                    			<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
				                    			</g>
				                    			<defs>
				                    			<clipPath id="clip0_464_1878">
				                        		<rect width="80" height="80" fill="white"/>
				                        		</clipPath>
				                    			</defs>
												</svg>
				            			</div>
				        			</div>
				    			</div>
				    			<div class="dduk-row">
				    				<div class="d-flex" style="margin: 0;">
										<div id="504-5" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%;">
				        					<div class="d-flex-column"><h2>504-5</h2><div class="gray-text">빈 침상</div></div>
				            					<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
				                				<g clip-path=".url(#clip0_464_1878)">
				                    			<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
				                    			</g>
				                    			<defs>
				                    			<clipPath id="clip0_464_1878">
				                        		<rect width="80" height="80" fill="white"/>
				                        		</clipPath>
				                    			</defs>
												</svg>
				            			</div>
				        			</div>
				        			<div class="d-flex" style="margin: 0;">
										<div id="504-6" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%;">
				        					<div class="d-flex-column"><h2>504-6</h2><div class="gray-text">빈 침상</div></div>
				            					<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
				                				<g clip-path=".url(#clip0_464_1878)">
				                    			<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
				                    			</g>
				                    			<defs>
				                    			<clipPath id="clip0_464_1878">
				                        		<rect width="80" height="80" fill="white"/>
				                        		</clipPath>
				                    			</defs>
												</svg>
				            			</div>
				        			</div>
				    			</div>
				    		</div>
				    	</div>
						<div class="dduk-inner-border bed-list-6-right">
				    		<h2 class="title-bed-6">505호 </h2>
				    		<div class="bed-wrap-6">
				    			<div class="dduk-row">
				    				<div class="d-flex" style="margin: 0;">
										<div id="505-1" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%;">
				        					<div class="d-flex-column"><h2>505-1</h2><div class="gray-text">빈 침상</div></div>
				            					<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
				                				<g clip-path=".url(#clip0_464_1878)">
				                    			<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
				                    			</g>
				                    			<defs>
				                    			<clipPath id="clip0_464_1878">
				                        		<rect width="80" height="80" fill="white"/>
				                        		</clipPath>
				                    			</defs>
												</svg>
				            			</div>
				        			</div>
				        			<div class="d-flex" style="margin: 0;">
										<div id="505-2" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%;">
				        					<div class="d-flex-column"><h2>505-2</h2><div class="gray-text">빈 침상</div></div>
				            					<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
				                				<g clip-path=".url(#clip0_464_1878)">
				                    			<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
				                    			</g>
				                    			<defs>
				                    			<clipPath id="clip0_464_1878">
				                        		<rect width="80" height="80" fill="white"/>
				                        		</clipPath>
				                    			</defs>
												</svg>
				            			</div>
				        			</div>
				    			</div>
				    			<div class="dduk-row">
				    				<div class="d-flex" style="margin: 0;">
										<div id="505-3" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%;">
				        					<div class="d-flex-column"><h2>505-3</h2><div class="gray-text">빈 침상</div></div>
				            					<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
				                				<g clip-path=".url(#clip0_464_1878)">
				                    			<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
				                    			</g>
				                    			<defs>
				                    			<clipPath id="clip0_464_1878">
				                        		<rect width="80" height="80" fill="white"/>
				                        		</clipPath>
				                    			</defs>
												</svg>
				            			</div>
				        			</div>
				        			<div class="d-flex" style="margin: 0;">
										<div id="505-4" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%;">
				        					<div class="d-flex-column"><h2>505-4</h2><div class="gray-text">빈 침상</div></div>
				            					<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
				                				<g clip-path=".url(#clip0_464_1878)">
				                    			<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
				                    			</g>
				                    			<defs>
				                    			<clipPath id="clip0_464_1878">
				                        		<rect width="80" height="80" fill="white"/>
				                        		</clipPath>
				                    			</defs>
												</svg>
				            			</div>
				        			</div>
				    			</div>
				    			<div class="dduk-row">
				    				<div class="d-flex" style="margin: 0;">
										<div id="505-5" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%;">
				        					<div class="d-flex-column"><h2>505-5</h2><div class="gray-text">빈 침상</div></div>
				            					<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
				                				<g clip-path=".url(#clip0_464_1878)">
				                    			<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
				                    			</g>
				                    			<defs>
				                    			<clipPath id="clip0_464_1878">
				                        		<rect width="80" height="80" fill="white"/>
				                        		</clipPath>
				                    			</defs>
												</svg>
				            			</div>
				        			</div>
				        			<div class="d-flex" style="margin: 0;">
										<div id="505-6" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%;">
				        					<div class="d-flex-column"><h2>505-6</h2><div class="gray-text">빈 침상</div></div>
				            					<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
				                				<g clip-path=".url(#clip0_464_1878)">
				                    			<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
				                    			</g>
				                    			<defs>
				                    			<clipPath id="clip0_464_1878">
				                        		<rect width="80" height="80" fill="white"/>
				                        		</clipPath>
				                    			</defs>
												</svg>
				            			</div>
				        			</div>
				    			</div>
				    		</div>
				    	</div>
				    </div>
	        
		</div>
		`
		
		$('.rounds-right-wrap').html(cont);
	}
	
	// 발표 스크립트
	$(document).on('click', '#roundsComplete1', function(){
		$('#clinicOpinion').val('환자 경과를 보기위한 검사 시행');
	})
	
	$(document).on('click', '#roundsComplete2', function(){
		$('#clinicOpinion').val('환자의 통증이 심해짐에 따라 추가적인 검사 진행\n결과 확인 후 별 이상 없음, 진통제 처방');
	})
	
})
</script>