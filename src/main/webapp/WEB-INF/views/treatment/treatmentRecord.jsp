<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="/resources/css/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="/resources/script/jquery.mtz.monthpicker.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>
.aside-trea-journal{
	width: 196px;
	border-radius: 16px 0px 0px 16px;
	background: var(--bg-02, #DBF2F4);
	height: 56px;
	border-right: 4px solid var(--ci-01, #0ABAB5);
	margin-left: 4px;
	color: var(--ci-01, #0ABAB5);
}

.h2-default {
	text-align: center;
    width: 100%;
    margin-top: 150px;
    color: #8D9EA5 !important;
    font-size: 1.8em !important;
} 
#treatmentMonthPicker {
    visibility: hidden;
    position: absolute;
    margin-left: 287px;
    width: 100px;
    margin-top: 23px;
}
.selected {
	height: 25px;
	background-color: #DBF2F4;
	border-radius: 10px;
	color: black !important;
}
.selected-patient {
   background-color: #DBF2F4;
   color: black !important;
}
.search{
	background-image: url(/resources/images/Search.png);
	background-repeat: no-repeat;
	background-position: calc(100% - 10px) center;
	width: 285px;
	height: 30px;
	margin-left: 0px;
}
.treatment-center-wrap{
	width: 892px;
	display: flex;
    gap: 16px;
}
.patient-detail {
	width: 300px;
	height: 350px;
	flex-shrink: 0;
	margin-bottom: 20px;
}
.in-h2 {
	font-size: 14px !important;
}
.w-30 {
    width: 35%;
}
.tr-column {
	background: #F8F9FC;
}
#treatmentTitleDate {
	color: var(--CI-01, #0ABAB5);
	cursor: pointer;
}
.treatment-tab-wrap {
	display: flex;
    gap: 24px;
    justify-content: space-evenly;
    margin-top: -32px;
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
.patient-chart{
	width: 580px;
	height: 320px;
	flex-shrink: 0;
	margin-bottom: 20px;
}
.patient-chart-list-date{
    width: 120px;
    margin: 0px 0px 16px 0px;
    text-align: center;
}
.treatment-chart-list-date{
	width: 120px;
	margin: 0px 0px 16px 0px;
	text-align: center;
}
.statistics{
	height: 470px;
}
.statistics-header {
	width: 110%;
    margin: -16px -16px 0px -16px;
    padding: 16px 24px 8px 24px;
    border-bottom: 1px solid #EBEFF0;
}
.treatment-chart {
    width: 360px;
    height: 400px;
}
.treatment-chart-list{
    height: 380px;
    width: 155px;
    margin: 0px -16px -16px -16px;
    padding: 8px 16px 16px 16px;
    border-right: 1px solid var(--border, #EBEFF0);
/*     overflow-y: scroll; */
/*     overflow-x: hidden; */
}
.treatment-chart-detail {
    width: 700px;
    height: 267px;
    margin: 8px -17px -16px 16px;
    padding: 0px 16px 16px 16px;
    border-radius: 0px 0px 24px 0px;
}
.treatment-chart-body-top {
	padding-top: 8px;
}
.treatment-chart-cont {
	display: flex;
	flex-direction: column;
	padding: 0px 16px;
}
.treatment-chart-body.special-condition {
    margin: 0px 250px 0px 250px;
    width: 200px;
}
.clinic-history-body{
	width: 400px;
	height: 300px;
	overflow-x: hidden;
	overflow-y: scroll;
	padding: 16px;
}
.h1-default {
	text-align: center;
	width: 100%;
	margin-top: 90px;
	color: #8D9EA5 !important;
	font-size: 2em !important;
}
.calendar-wrap {
	flex-direction: column;
    gap: 24px;
    justify-content: space-evenly;
}
.nurse-record-tab {
	margin-top: 24px;
	display: flex;
	justify-content: space-evenly;
}
.nurse-record {
    height: 392px;
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
.icon-calendar {
	width: 48px;
	height: 48px;
}
.icon-stethoscope {
	width: 42px;
	height: 42px;
}

.clinic-history-head {
	border-right: 1px solid var(--border, #EBEFF0);
	height: 300px;
    overflow-y: scroll;
    width: 135px;
}
.textarea-clinic-history-injnm {
    resize: none;
    width: 93%;
    height: 50px;
}
.textarea-clinic-history-opinion {
    resize: none;
    width: 93%;
    height: 80px;
}
.textarea-treatment-history-tmNm{
	resize: none;
    width: 93%;
    height: 50px;
	
}
.textarea-treatment-history-trodCont {
    resize: none;
    width: 93%;
    height: 80px;
}
.table-clinic-history {
	display: flex;
	padding: 12px 0px;
	flex-direction: column;
	justify-content: center;
	gap: 4px;
	border-radius: 12px;
	background: var(--bg-01, #F8F9FC);
	width: 380px;
	height: auto;
	margin-bottom: 16px;
}
.tab-active {
	background-color: #F8F9FC;
	color: #8D9EA5;
	font-family: 'Pretendard5';
}
.treatment-history-head{
	display: flex;
	border-radius: 10px;
    border: 1px solid var(--border, #E0E8E6);
    padding: 8px;
    width: 150px;
    height: 80px;
    flex-shrink: 0;
    flex-direction: column;
}
#treatmentCont{
	width: 250px;
    height: 360px;
    margin: 10px 0px 0px 7px ;
}
.treatment-chart-wirte{
	margin-left: 16px;
    width: 300px;
    height: 100%
}
#today-treatment{
	width: 250px;
    height: 230px;
    margin: 10px 0px 35px 7px ;
}
.treatment-chart-aside {
    height: 409px;
    width: 155px;
    margin: 0px -16px -16px -16px;
    padding: 8px 16px 16px 16px;
    border-right: 1px solid var(--border, #EBEFF0);
    overflow-y: scroll;
    overflow-x: hidden;
    display: flex;
    flex-direction: column;
    justify-content: space-around;
}
.treatment-chart-aside-tab {
    cursor: pointer;
    margin-left: 2.5%;
    width: 100%;
    text-align: center;
    background: var(--bg-01, #F8F9FC);
    border-radius: 10px;
}
.treatment-tab-selected {
    margin-left: 2.5%;
    width: 100%;
    text-align: center;
    background: var(--bg-01, #DBF2F4);
    border-radius: 10px;
    color: black !important;
}

.treatment-chart-table-wrap {
	width: 366px;
    height: 322px;
    overflow: scroll;
}

.table-treatment {
	width: 316px;
}

.td-padding-body{
	padding: 12px 31px 12px 0px;
}
.td-padding-body-data{
	padding: 0px 31px 5px 0px;
}
</style>
<script>
$(function(){
	$('.aside-trea-journal').find('svg').find('path').attr('fill', '#0ABAB5');
	$('.aside-trea-journal').find('.dduk-nav-menu').css('color', '#0ABAB5');
	
	var header = $("meta[name='_csrf_header']").attr("content");
	var token = $("meta[name='_csrf']").attr("content");
	
	// 차트 카테고리 탭에서 최근에 누른 탭이 어떤 탭인지 갱신하기 위해
	let currentIndex = 0;
	
	// DB에서 진료정보와 치료오더를 조인해서 완료된 치료가 있는 모든 치료와 진료정보를 가져옴
	let clinicChartData = {};
	
	// 차트를 담아두기 위한 변수, 이 변수에 지금 조회중인 차트 정보를 담고 나중에 파괴시킨다
	let chartData = '';
	
	//치료완료 환자리스트 출력
	treatmentPatientList();
	getClinicChartData();
	drawChart(0, true);
	
	function getClinicChartData(){
		clinicChartData = ${clinicChartVOList}
		console.log('서버에서 가져온 치료 통계 리스트 : ', clinicChartData);
	}
	
	function treatmentPatientList(){
		$.ajax({
			url: '/treatment/treatmentPatientList',
			dataType: 'json',
			type: 'post',
			beforeSend:function(xhr){
				xhr.setRequestHeader(header,token);
			},
			success: function(result){
				console.log("치완환자 출력!!", result);	
				
				$.each(result, function(i){
					var str = "";
					str += '<tr class="tr-padding tr-paInfo" data-paNo="'+ result[i].paNo +'">';
					str += '<td class="td-padding">'+(i + 1)+'</td>';
					str += '<td height="48px" class="td-padding">'+ truncateText(result[i].paName) +'</td>';
					str += '<td class="td-padding">'+ formatResidentNumber(result[i].paReg) +'</td>';
					str += '</tr>';
					
					$('#patient-list-table').append(str);
				});
				
			},
			error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
			}
		});
	}
	
	// 특정 환자 누를 때
	$(document).on("click", ".tr-paInfo", function() {
		console.log("환자를 클릭!!");
		
		//선택환자 표시
	    $(".tr-paInfo").removeClass("selected-patient");
	    $(this).addClass("selected-patient");
		
		//환자번호 가져오기
		var paNo = $(this).data('pano');
		currentPaNo = paNo;
		
		//환자정보갱신
		updatePaInfo(paNo);
		//환자의 과거진료내역
		updatePastClinicChart();
		//환자 진료내역 내용
		getTodayTreatmentInfo(currentPaNo);
	});
	
	// 환자 정보 갱신
    function updatePaInfo(paNo){
    	$.ajax({
    		url: '/treatment/selectTreatmentPatientInfo',
    		data: {'paNo' : paNo},
    		type: 'post',
    		dataType: 'json',
    		beforeSend: function(xhr){
    			xhr.setRequestHeader(header,token);
    		},
    		success: function(result){
    			console.log("클릭한 환자 정보 가져오기 : ", result);
    			var patientInfo = $('.patient-info-div');
    			patientInfo.find('h2').eq(0).text('이름 : ' + result.paName);
    			patientInfo.find('h2').eq(1).text('성별 : ' + result.paSex);
    			patientInfo.find('h2').eq(2).text('나이 : ' + getAge(formatResidentNumber(result.paReg)));
    			patientInfo.find('h2').eq(3).text('연락처 : ' + result.paPh);
    			patientInfo.find('h2').eq(4).text('주소 : ' + result.paAdd1 + ' ' + result.paAdd2);
    			patientInfo.find('h2').eq(5).text('혈액형 : ' + result.paBldType);
    			patientInfo.find('h2').eq(6).text('키 : ' + result.paHeight + 'cm');
    			patientInfo.find('h2').eq(7).text('몸무게 : ' + result.paWeight + 'kg');
    			
    			patientInfo.attr('data-tmcd', result.clinicChartVOList[0].treatmentOrderVOList[0].tmCd);
    			patientInfo.attr('data-clinicno', result.clinicChartVOList[0].clinicNo);
    		},
    		error: function(xhr, status, error){
    			console.log('Error:', xhr, status, error);
    		}
    	});
    }
	
 	// 진료내역/치료내역 탭 누를때 이벤트
    $(document).on('click', '.rounds-tab', function() {
    	
    	// 자신에겐 tab-active를 제거, 다른 하나의 탭엔 tab-active 적용
    	$(this).removeClass('tab-active');
    	$('.rounds-tab').not(this).addClass('tab-active');

    	var tmCd = $(this).data('tmcd');
		currentTmCd = tmCd;
		console.log("날짜 클릭 치료번호(currentTmCd) : ", currentTmCd);
		
		var clinicNo = $(this).data('clinicno');
		currentClinicNo = clinicNo;
		console.log("날짜 클릭 치료번호(currentClinicno) : ", currentClinicNo);
		
		// 날짜 클릭시 진료 내용 출력
		
		if(currentPaNo == null || currentPaNo == ''){
			$('.clinic-history-head').html("");
    		var str = '<h1 class="h1-default">환자를 선택해주세요</h1>';    				
			$('.clinic-history-body').html(str);
		}
		
    	// 만약 진료내역이면
    	if($(this).text() === '진료내역'){
    		
    		// 진료내역 갱신
    		updatePastClinicChart();
    		
    	// 만약 치료내역이면
    	} else if($(this).text() === '치료내역'){
    		
    		$('.clinic-history-head').html("");
    		var str = '<h1 class="h1-default">과거 치료내역이 없습니다</h1>';    				
			$('.clinic-history-body').html(str);
    		// 치료내역 갱신
    		getTreatmentInfo(tmCd, clinicNo);
    		
    	}
    });
	
 	// 과거 진료 내역 심플 리스트 갱신
    function updatePastClinicChart(){
    	$.ajax({
    		url: '/clinic/simpleClinicChartList',
    		data: {'paNo' : currentPaNo},
    		type: 'post',
    		dataType: 'json',
    		beforeSend: function(xhr){
    			xhr.setRequestHeader(header,token);
    		},
    		success: function(result){
    			console.log("클릭한 환자 과거진료내역!!!", result);
    			$('.clinic-history-head').html("");
    			$('.clinic-history-body').html("");
    			
    			var firstClinicNo = '';
    			var str ="";
    			
    			$.each(result.clinicChartVOList, function(i, vo){
    				if(i === 0){
	   					firstClinicNo = vo.clinicNo;
	   					str += '<div data-clinicno="'+ vo.clinicNo +'" class="patient-chart-list-date selected" style="font-size:17px">' + vo.clinicDt + '</div>';
    				}else{
    					str += '<div data-clinicno="'+vo.clinicNo+'" class="patient-chart-list-date" style="font-size:17px">' + vo.clinicDt + '</div>';
    				}
    			});
    			
				$('.clinic-history-head').append(str);
				
				if($('#clinicHistory').hasClass('tab-active')){
    				$('#treatmentHistory').addClass('tab-active');
    				$('#clinicHistory').removeClass('tab-active');
    			}
				
				// 첫번째 진료내역 디테일 출력
    			detailPastClinicChart(firstClinicNo);
    		}
    	});
 	}
 	
 	// 진료내역 날짜 클릭시 이벤트
	$(document).on('click', '.patient-chart-list-date', function(){
		
		$('.patient-chart-list-date.selected').removeClass('selected');
	    
	    // 클릭한 날짜에 'selected' 클래스 추가
	    $(this).addClass('selected');
		
		// 진료내역 번호 가져오기
		var clinicNo = $(this).data('clinicno');
		console.log("날짜 클릭 진료번호 : ", clinicNo);
		
		// 날짜 클릭시 진료 내용 출력
		detailPastClinicChart(clinicNo);
	});
 	
 	
	function detailPastClinicChart(clinicNo){
		$.ajax({
    		url: '/clinic/lightWeightClinicChartDetail',
    		data: {'clinicNo' : clinicNo},
    		type: 'post',
    		dataType: 'json',
    		beforeSend: function(xhr){
    			xhr.setRequestHeader(header, token);
    		},
    		success: function(rst){
    			console.log('진료번호 ', clinicNo, '로 가져온 진료상세 : ', rst);
    			
    			var clinicInjnm = rst.clinicInjnm === null ? '병명 없음' : rst.clinicInjnm;
    			var clinicOpinion = rst.clinicOpinion === null ? '소견 없음' : rst.clinicOpinion;
    			
    			var str = `
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
    							str += '<tr>';
    							if(vo.indiType === 'IDTY01'){
    								str += '<td>주</td>';
    							} else if(vo.indiType === 'IDTY02'){
    								str += '<td>부</td>';
    							} else if(vo.indiType === 'IDTY03'){
    								str += '<td>배제</td>';
    							}
								str += '<td>'+truncateText(vo.injuryVO.ijNm, 12)+'</td>';
								str += '<td>'+vo.indiDt+'</td>';
								str += '<td>'+vo.injuryBodyCdNm+'</td>';
								str += '</tr>'
    						});
    							
    				str += `
    						</tbody>
    					</table>
    				</div>
    				<br>`;
    				
    				// 검사 받은 내역이 없으면 출력 x
    				if(rst.testOrderVOList.length !== 0) {
    				str += `
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
    							
    							str += '<tr>';
								str += '<td>'+vo.testVO.testNm+'</td>';
								if(vo.teodRst != null){
								str += '<td>'+vo.teodRst+'</td>';
// 								} else if(vo.atchFileVO != null){
// 									str += `<td>
// 										<div class="viewTestResult" data-resultJson='\${jsonData}' data-bs-toggle="modal" data-bs-target="#viewTestOrderResult">
// 											결과보기
// 											<img id="magnifyingGlass" src="/resources/images/icons/magnifying-glass.png" alt="magnifyingGlass.png" />
// 										</div>	
// 									</td>`;
								} else {
									str += `<td>검사 미진행</td>`;
								}
								
								if(vo.testOrderBodyCdNm !== null){
									str += '<td>'+vo.testOrderBodyCdNm+'</td>';
								} else {
									str += '<td>-</td>';
								}
								str += '</tr>'
    						});
    						
    				str +=	`</tbody>
    					</table>
    				</div>
    				<br>`;
    				}
    				
    				// 처방 받은 내역이 없으면 출력 x
    				if(rst.medicineOrderVOList.length !== 0) {
    				str += `
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
    							str += '<tr>';
								str += '<td>'+truncateText(vo.medicineVO.mediNm, 6)+'</td>';
								str += '<td>'+truncateText(vo.medicineVO.mediDetail, 16)+'</td>';
								if(vo.medicineVO.mediDetail === '주사' || vo.medicineVO.mediDetail === '기타 처방'){
									str += '<td>-</td>';
								} else if(vo.medicineVO.mediDetail === '패치형 진통제' || vo.medicineVO.mediDetail === '연고'){
									str += '<td>'+vo.mdodQt+'개</td>';
								} else{
									str += '<td>'+vo.mdodQt+'일분</td>';
								}
								
								str += '</tr>';
    						});
    						
    				str += `</tbody>
    					</table>
    				</div>
    				<br>`;
    				}
    				
    			$('.clinic-history-body').html(str);
    		}
		});
	}
	
	// 치료내역 날짜 클릭시 이벤트
	$(document).on('click', '.treatment-chart-list-date', function(){
		
		$('.treatment-chart-list-date.selected').removeClass('selected');
	    
	    // 클릭한 날짜에 'selected' 클래스 추가
	    $(this).addClass('selected');
		
		// 진료내역 번호 가져오기
		var tmCd = $(this).data('tmcd');
		console.log("날짜 클릭 치료번호 : ", tmCd);
		
		var clinicNo = $(this).data('clinicno');
		console.log("날짜 클릭 진료번호 : ", clinicNo);
		
		// 날짜 클릭시 진료 내용 출력
		selectTreatmentInfo(tmCd, clinicNo);
		
	});
	
	//과거 치료내역
	function getTreatmentInfo(tmCd, clinicNo){
		console.log("치료내역 탭 출력!!");
		$.ajax({
    		url: '/treatment/getTreatmentInfo',
    		data: {'paNo' : currentPaNo},
    		type: 'post',
    		dataType: 'json',
    		beforeSend: function(xhr){
    			xhr.setRequestHeader(header,token);
    		},
    		success: function(result){
    			console.log("과거 치료내역 가져오기!! : ", result);
				
    				var firstTreatmentNo = '';
    				var str = '';
    				
    				$.each(result.clinicChartVOList, function(i, vo){
		    				console.log("치료기록 들어오나? 1 : ",vo.treatmentOrderVOList[0].trodCont);
		    				console.log(vo.treatmentOrderVOList[0].tmCd);
	    					
		    				//만약 맨 앞의 치료내역이면 선택효과 적용 및 첫번째 치료번호 받아놓기
	    					if(i === 0){
	    						firstTreatmentCD = vo.treatmentOrderVOList[0].tmCd;
	    						firstTreatmentNo = vo.clinicNo;
	    						console.log("첫번째 치료번호 : ",firstTreatmentNo);
	    						str += '<div data-tmcd="'+ vo.treatmentOrderVOList[0].tmCd +'" data-clinicno="'+ vo.clinicNo +'" class="treatment-chart-list-date selected" style="font-size:17px">' + vo.clinicDt + '</div>';
	    					} else {
	    						str += '<div data-tmcd="'+ vo.treatmentOrderVOList[0].tmCd +'" data-clinicno="'+ vo.clinicNo +'" class="treatment-chart-list-date" style="font-size:17px">' + vo.clinicDt + '</div>';
	    					}
    					
    				});
    			
                    $('.clinic-history-head').append(str);
    				
                    selectTreatmentInfo(tmCd, firstTreatmentNo);
    		}
		});
	}
	
	function selectTreatmentInfo(tmCd, clinicNo){
		$.ajax({
    		url: '/treatment/selectTreatmentInfo',
    		data: {
    			'clinicNo' : clinicNo
    		},
    		type: 'post',
    		dataType: 'json',
    		beforeSend: function(xhr){
    			xhr.setRequestHeader(header,token);
    		},
    		success: function(result){
    			console.log("치료 디테일 : ", result);
           	var cont = '';
						
                 	let tmNm = result.clinicChartVOList[0].treatmentOrderVOList[0].treatmentVO.tmNm === null ? '치료명 없음' : result.clinicChartVOList[0].treatmentOrderVOList[0].treatmentVO.tmNm;
                 	let trodCont = result.clinicChartVOList[0].treatmentOrderVOList[0].trodCont === null ? '치료기록이 없습니다' : result.clinicChartVOList[0].treatmentOrderVOList[0].trodCont;
                 	
	                   	cont += '<h4>치료명</h4>';
	                   	cont += '<textarea class="dduck-input textarea-treatment-history-tmNm" readonly="readonly">' + tmNm + '</textarea>';
	                   	cont += '<br><br>';
	                   	cont += '<h4>치료기록</h4>';
	                   	cont += '<textarea class="dduck-input textarea-treatment-history-trodCont" readonly="readonly">' + trodCont + '</textarea>';
	                    cont += '<br><br>';
            	$('.clinic-history-body').html(cont);
    		}
		});
	}
	
	//당일 치료내역의 진료번호
	var todayClinicNo;
	
	//당일 치료내역 가져오기
	function getTodayTreatmentInfo(currentPaNo){
			$.ajax({
	    		url: '/treatment/selectTodayTreatmentInfo',
	    		data: {
	    			'paNo' : currentPaNo
	    		},
	    		type: 'post',
	    		dataType: 'json',
	    		beforeSend: function(xhr){
	    			xhr.setRequestHeader(header,token);
	    		},
	    		success: function(result){
	    			console.log("당일 치료내역 정보!!!", result);
	    			
	    			todayClinicNo = result.clinicChartVOList[0].clinicNo;
	    			console.log("당일 치료내역의 진료번호!!!", result.clinicChartVOList[0].clinicNo);
	    			
	    			var treatmentOrderEmpName = result.clinicChartVOList[0].treatmentOrderVOList[0].treatmentOrderEmpName;
	    			var clinicDt = result.clinicChartVOList[0].clinicDt;
	    			var treatmentOrderBodyCdNm = result.clinicChartVOList[0].treatmentOrderVOList[0].bodyCd;
	    			var tmNm = result.clinicChartVOList[0].treatmentOrderVOList[0].treatmentVO.tmNm;
					console.log(treatmentOrderBodyCdNm);
	    			
	    			$('.record-content-fr').html("");
	    			
	    			var bodyCd = treatmentOrderBodyCdNm;
	    			var bodyPart = '';
	    			//환부
	    			if (bodyCd === 'AACD01') {
	    			    bodyPart = '머리';
	    			} else if (bodyCd === 'AACD02') {
	    			    bodyPart = '목';
	    			} else if (bodyCd === 'AACD03') {
	    			    bodyPart = '등';
	    			} else if (bodyCd === 'AACD04') {
	    			    bodyPart = '어깨';
	    			} else if (bodyCd === 'AACD05') {
	    			    bodyPart = '가슴';
	    			} else if (bodyCd === 'AACD06') {
	    			    bodyPart = '허리';
	    			} else if (bodyCd === 'AACD07') {
	    			    bodyPart = '골반';
	    			} else if (bodyCd === 'AACD08') {
	    			    bodyPart = '팔';
	    			} else if (bodyCd === 'AACD09') {
	    			    bodyPart = '손';
	    			} else if (bodyCd === 'AACD10') {
	    			    bodyPart = '엉덩이';
	    			} else if (bodyCd === 'AACD11') {
	    			    bodyPart = '무릎';
	    			} else if (bodyCd === 'AACD12') {
	    			    bodyPart = '다리';
	    			}
	    			
	    			var str = `
		               	<div class="spa-betw m-8">
		                   	<div id="todayTreatmentClinicNo" data-clinicno="'+ result.clinicChartVOList[0].clinicNo +'"></div>
		                </div>
		                <div>
		                   	<div class="spa-betw p-8" style="padding-bottom: 4px;"> 
		                       	<div class="gray-text d-flex w-30">담당치료사</div><div class="w-70 f-end EmpName">\${treatmentOrderEmpName}</div>
		                    </div>
		                    <div class="spa-betw p-8" >
		                        <div class="gray-text d-flex w-30">치료날짜</div><div class="w-70 f-end treatmentDt">\${formatDateString(clinicDt)}</div>
		                    </div>
		                    <hr class="m-8"/>
		                    <div class="spa-betw p-8" style="padding-bottom: 4px;">
	                            <div class="gray-text d-flex w-30">환부</div><div class="w-70 f-end bodyCD">\${bodyPart}</div>
	                        </div>
	                        <div class="spa-betw p-8">
	                            <div class="gray-text d-flex w-30">치료명</div><div class="w-70 f-end tmNm">\${tmNm}</div>
	                        </div>
	                    </div>
	                `;
	                $('#today-treatment').append(str);
	    		}
			});
	}
	
	//치료기록 저장 클릭시 
	$(document).on('click', '.btn-treatment-chart-save', function(){
		var clinicNo = $(this).data('clinicno');
		var treatmentCont = $("#treatmentCont").val();	//치료기록
		console.log("저장 클릭 시 수정할 치료기록 : ", treatmentCont);
		console.log("치료기록이 수정될 진료번호 : ", todayClinicNo);

		var data = {
				"clinicNo" : todayClinicNo,
				"trodCont" : treatmentCont
		}
		
		//차트를 작성하지 않으면
		if(treatmentCont === null || treatmentCont === ''){
			Swal.fire({
                title: '차트를 작성해주세요.',
                icon: 'error',
                confirmButtonColor: '#0ABAB5',
                confirmButtonText: '확인'
			});
		//환자선택 안하면
// 		}else if(!clinicNo){
// 			Swal.fire({
// 	            title: '환자를 선택해주세요.',
// 	            icon: 'error',
// 	            confirmButtonColor: '#0ABAB5',
// 	            confirmButtonText: '확인'
// 	        });
		//작성하면
		}else {
			let title = '';
	         
	         Swal.fire({
	            title: '치료기록을 저장하시겠습니까?',
	            icon: 'question',
	            showCancelButton: true,
	            confirmButtonColor: '#0ABAB5',
	            cancelButtonColor: '#8D9EA5',
	            confirmButtonText: '확인',
	            cancelButtonText: '취소'
	         }).then((result) => {
	        	//치료기록 저장
	        	//updatePastClinicChart(data)
	        	if (result.isConfirmed) {
		        	$.ajax({
			    		url: '/treatment/updateTrodCont',
			    		data: JSON.stringify(data),
			    		type: 'post',
			    		contentType:"application/json;charset=utf-8",
			    		beforeSend: function(xhr){
			    			xhr.setRequestHeader(header,token);
			    		},
			    		success: function(result){
			    			console.log("치료기록 저장!!!", result);
			    		},
			    		error: function(xhr, status, error){
		                    console.log('Error:', xhr, status, error);
	                  	}
					});
		        	
		        	Swal.fire({
						title: '치료차트가 저장되었습니다',
						icon: 'success',
						confirmButtonColor: '#0ABAB5',
						confirmButtonText: '확인',
					})
		        	
		        	window.location.href = "/treatment/treatmentRecord";
        	 	}
	         });
		}
	});
	
	// 이름 등이 글자를 제어하고 싶을 때 maxLength까지만 표시
	function truncateText(text, maxLength) {
		if (text.length > maxLength) {
			return text.slice(0, maxLength) + '...';
		} else {
		    return text;
		}
	}
	
	// 날짜형식 데이터를 넣으면 yyyy-MM-dd(요일) 로 변환해주는 함수
	function formatDateString(dateString) {
		// 요일먼저 얻기
		const week = ['일', '월', '화', '수', '목', '금', '토'];
		const dayOfWeek = week[new Date(dateString).getDay()];
		
		const dateData = new Date(dateString);
		let year = dateData.getFullYear();
		let month = dateData.getMonth()+1; 
		let date = dateData.getDate()
		
		let dateStr = `\${year}-\${month}-\${date}(\${dayOfWeek})`;
		
		return dateStr;
	}
	
	// 이상한 날짜형식을 넣어주면 yyyy-MM으로 바꿔주는 함수
	function formatDateYn(dateString){
		console.log(dateString);
		// Date 객체로 변환
		const parsedDate = dateString.replace(/(\d{4}) (\d{1,2}), (\d{4})/, '$1-$2-$3');
		const date = new Date(parsedDate);
		// 원하는 형식으로 포맷팅
		const year = date.getFullYear();
		const month = ('0' + (date.getMonth() + 1)).slice(-2); // 월은 0부터 시작하므로 1을 더하고 형식에 맞게 조정

		const formattedDate = `\${year}-\${month}`;
		return formattedDate;
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
	
	// 주민번호로 만나이 계산
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
	
	//통계 시작
	
	// 왼쪽 통계 카테고리 탭 클릭 이벤트
	$(document).on('click', '.treatment-chart-aside-tab', function(){
		// CSS 적용
		$('.treatment-chart-aside-tab').removeClass('treatment-tab-selected');
		$(this).addClass('treatment-tab-selected');
		
		// 지금 누른 버튼이 어떤 버튼인지 확인
		let btnText = $(this).text();
		
		if(btnText === '치료통계'){
			currentIndex = 0;
		} else if(btnText === '환부통계'){
			currentIndex = 1;
		} else if(btnText === '실적통계'){
			currentIndex = 2;
		}
		
		// 차트 그리기
		drawChart(0, true);
	})
	
	// 차트를 직접 그려주는 함수, 파라미터로 출력시킬 그래프의 년도-월이 들어옴
	function drawChart(month, isTotalView) {
		
		// 이미 그래프가 있으면 그래프를 삭제
		if(chartData){
			chartData.destroy();
		}
		//표 초기화
		$('.table-treatment tbody').html('');
		$('.table-treatment thead').html('');
		$('#treatmentTitle').html('');
		$('#treatmentTitleDate').html('');
		
		// 치료통계 그리기, 치료명에 따른 통계
		if(currentIndex === 0){
			
			// 우선 표, 그래프로 출력시킬 데이터 가공
			
			// 각 치료의 개수 계산
			let treatmentNameCounts = {};
			
			// model로 가져온 데이터 chartData는 clinicChartVO의 List이기 때문에 우선 clinicChartVOList에 대해 반복
			$.each(clinicChartData, function(index, clinicChartVO){
				// 일단 전체통계 보기인지 아닌지 확인
				// 전체통계가 아니면
				if(!isTotalView){
					// 날짜가 맞아야하므로 날짜 데이터 비교를 위해 진료 날짜를 가져옴
					let clinicDt = formatDateYn(clinicChartVO.clinicDt);
					
					$('#treatmentTitle').text("치료별 치료시행 횟수");
					$('#treatmentTitleDate').text('('+month+')');
					
					// 선택된 년도/달에 해당되는 차트만 고르기
					if(clinicDt === month){
						
						// foreach문으로 그래프에 출력시킬 데이터 넣음
						$.each(clinicChartVO.treatmentOrderVOList, function(i, treatmentOrderVO){
							
							if(treatmentNameCounts[treatmentOrderVO.treatmentVO.tmNm]){
								treatmentNameCounts[treatmentOrderVO.treatmentVO.tmNm].count += 1;
								treatmentNameCounts[treatmentOrderVO.treatmentVO.tmNm].totalPrice += treatmentOrderVO.treatmentVO.tmPrice;
							} else {
								treatmentNameCounts[treatmentOrderVO.treatmentVO.tmNm] = {
									count : 1,
									totalPrice : treatmentOrderVO.treatmentVO.tmPrice
								};
							}
						});
					} 
				
				// 전체 통계보기면 그냥 모두 다 그래프에 출력시킬 데이터 넣음
				} else {
					$('#treatmentTitle').text("치료별 치료시행 횟수");
					$('#treatmentTitleDate').text('(전체기간)');
					
					// foreach문으로 그래프에 출력시킬 데이터 넣음
					$.each(clinicChartVO.treatmentOrderVOList, function(i, treatmentOrderVO){

						if(treatmentNameCounts[treatmentOrderVO.treatmentVO.tmNm]){
							treatmentNameCounts[treatmentOrderVO.treatmentVO.tmNm].count += 1;
							treatmentNameCounts[treatmentOrderVO.treatmentVO.tmNm].totalPrice += treatmentOrderVO.treatmentVO.tmPrice;
						} else {
							treatmentNameCounts[treatmentOrderVO.treatmentVO.tmNm] = {
								count : 1,
								totalPrice : treatmentOrderVO.treatmentVO.tmPrice
							};
						}
					});
				}
			});
			
			
			console.log('치료통계에서 조건(날짜)에 맞게 정제한 데이터 : ', treatmentNameCounts);
			
			// 차트 데이터가 있어야만 출력
			if(Object.keys(treatmentNameCounts).length !== 0){

				//배열로 바꿈
	            const countArray = Object.entries(treatmentNameCounts);

	            // count를 기준으로 내림차순으로 정렬
	            countArray.sort((a, b) => b[1].count - a[1].count);

	            // 다시 객체로 변환
	            const sortedTreatmentNameCounts = {};
	            countArray.forEach(([key, value]) => {
	            	sortedTreatmentNameCounts[key] = value;
	            });
				
	            
				// 표 출력 부분
				let trData = '';
				let trHead = '';
				
				trHead +=`
					<tr class="tr-padding tr-column" style="text-align: center;">
						<th class="td-padding gray-text" style="width:145px">치료명</th>
						<th class="td-padding gray-text" style="width:80px">치료횟수(회)</th>
						<th class="td-padding gray-text" style="width:120px">총치료금액(원)</th>
					</tr>
				`
				
				// 위의 정제한 데이터 개수만큼 반복
				$.each(sortedTreatmentNameCounts, function(name, cont){ 
					
		            //금액 숫자표현 방식
					const formattedPrice = cont.totalPrice.toLocaleString();
					
					trData += `
						<tr class="tr-padding tr-data">
							<th class="td-padding-data gray-text" style="width:145px">\${name}</th>
							<th class="td-padding-data gray-text" style="width:80px">\${cont.count}회</th>
							<th class="td-padding-data gray-text" style="width:120px">\${formattedPrice}원</th>
						</tr>
					`
				});
				
				$('.table-treatment thead').html(trHead);
				$('.table-treatment tbody').html(trData);
				
				// 그래프 출력 부분
				const counts = Object.values(sortedTreatmentNameCounts).map(treatment => treatment.count);
				
				const data = {
					labels: Object.keys(sortedTreatmentNameCounts),
				    datasets: [{
				    	label: '치료별 시행 횟수',
				        data: counts,
				        backgroundColor: [
	                        'rgba(255, 99, 132, 1)',
	                        'rgba(54, 162, 235, 1)',
	                        'rgba(255, 206, 86, 1)',
	                        'rgba(75, 192, 192, 1)',
	                        'rgba(153, 102, 255, 1)',
	                        'rgba(255, 159, 64, 1)',
	                        'rgba(201, 203, 207, 1)'
				        ],
				        hoverOffset: 4
					}]
				};
				
				const config = {
					type: 'doughnut',
				    data: data,
				};

				const ctx = document.getElementById('myChart').getContext('2d');
				chartData = new Chart(ctx, config);
				
				$('.treatment-chart-graph-wrap').css('width', '322px');
				
			// 차트 데이터 없으면 기본 메시지 출력
			} else {
				let cont = '<h2 class="h2-default special-condition">데이터가 없습니다</h2>';
				$('.treatment-chart-body').html(cont).addClass('special-condition');
				
				// 날짜 선택시 이벤트
				$(document).on('change', '#treatmentMonthPicker', function(){
					// 선택된 날짜 가져오기
					let date = $('#treatmentMonthPicker').val();
					// 날짜를 기준으로 차트 그리기
					drawChart(date, false);
				});
			}
			
		// 환부통계 그리기, 치료받은 환부 통계
		} else if(currentIndex === 1){
			
			// 각 환부의 치료개수 계산
			let treatmentBodyNameCounts = {};
			
			$.each(clinicChartData, function(index, clinicChartVO){
				// 전체통계가 아니면
				if(!isTotalView){
					// 날짜가 맞아야하므로 날짜 데이터 비교를 위해 진료 날짜를 가져옴
					let clinicDt = formatDateYn(clinicChartVO.clinicDt);
					
					$('#treatmentTitle').text("환부별 치료시행 횟수");
					$('#treatmentTitleDate').text('('+month+')');
					
					// 선택된 년도/달에 해당되는 차트만 고르기
					if(clinicDt === month){
						// foreach문으로 그래프에 출력시킬 데이터 넣음
						$.each(clinicChartVO.treatmentOrderVOList, function(i, treatmentOrderVO){
							if(treatmentBodyNameCounts[treatmentOrderVO.treatmentOrderBodyCdNm]){
								treatmentBodyNameCounts[treatmentOrderVO.treatmentOrderBodyCdNm].count += 1;
							}else{
								treatmentBodyNameCounts[treatmentOrderVO.treatmentOrderBodyCdNm] = {
									count : 1
								};
							}
						});
					}
				//전체 통계보기면
				} else {
					$('#treatmentTitle').text("환부별 치료시행 횟수");
					$('#treatmentTitleDate').text('(전체기간)');
					
					// foreach문으로 그래프에 출력시킬 데이터 넣음
					$.each(clinicChartVO.treatmentOrderVOList, function(i, treatmentOrderVO){
						if(treatmentBodyNameCounts[treatmentOrderVO.treatmentOrderBodyCdNm]){
							treatmentBodyNameCounts[treatmentOrderVO.treatmentOrderBodyCdNm].count += 1;
						}else{
							treatmentBodyNameCounts[treatmentOrderVO.treatmentOrderBodyCdNm] = {
								count : 1
							};
						}
					});
				}
			});
			
			console.log('환부별 통계에서 조건(날짜)에 맞게 정제한 데이터 : ', treatmentBodyNameCounts);
			
			// 차트 데이터가 있어야만 출력
			if(Object.keys(treatmentBodyNameCounts).length !== 0){
				
				//배열로 바꿈
	            const countArray = Object.entries(treatmentBodyNameCounts);

	            // count를 기준으로 내림차순으로 정렬
	            countArray.sort((a, b) => b[1].count - a[1].count);

	            // 다시 객체로 변환
	            const sortedTreatmentBodyNameCounts = {};
	            countArray.forEach(([key, value]) => {
	                sortedTreatmentBodyNameCounts[key] = value;
	            });
				
				// 표 출력 부분
				let trData = '';
				let trHead = '';
				
				trHead +=`
					<tr class="tr-padding tr-column" style="text-align: center;">
						<th class="td-padding-body gray-text" style="width:145px">환부명</th>
						<th class="td-padding-body gray-text" style="width:80px">치료횟수(회)</th>
					</tr>
				`
				
				// 위의 정제한 데이터 개수만큼 반복
				$.each(sortedTreatmentBodyNameCounts, function(name, cont){
					trData += `
						<tr class="tr-padding tr-data">
							<th class="td-padding-body-data gray-text" style="width:145px;">\${name}</th>
							<th class="td-padding-body-data gray-text" style="width:80px">\${cont.count}회</th>
						</tr>
					`
				}); 
				
				$('.table-treatment thead').html(trHead);
				$('.table-treatment tbody').html(trData);
				
				// 그래프 출력 부분
				const counts = Object.values(sortedTreatmentBodyNameCounts).map(treatment => treatment.count);
				
				const data = {
					labels: Object.keys(sortedTreatmentBodyNameCounts),
				    datasets: [{
				    	label: '환부별 시행 횟수',
				        data: counts,
				        options: {
				        	plugins:{
				                legend: {
				                    display: false
				                },
				            }
				        },
				        backgroundColor: [
	                        'rgba(255, 99, 132, 1)',
	                        'rgba(54, 162, 235, 1)',
	                        'rgba(255, 206, 86, 1)',
	                        'rgba(75, 192, 192, 1)',
	                        'rgba(153, 102, 255, 1)',
	                        'rgba(255, 159, 64, 1)',
	                        'rgba(201, 203, 207, 1)',
	                        'rgba(123, 45, 67, 1)',
	                        'rgba(210, 180, 140, 1)',
	                        'rgba(0, 255, 0, 1)',
	                        'rgba(128, 0, 128, 1)',
	                        'rgba(255, 0, 255, 1)',
	                        'rgba(0, 128, 128, 1)'
				        ],
				        hoverOffset: 4
					}]
				};
				
				const config = {
					type: 'bar',
				    data: data,
				    options: {
	 			  		indexAxis: 'y',
	 			  		scales: {
	 			  		    x: {
	 			  		      ticks: {
	 			  		        stepSize: 1,
	 			  		        precision: 0
	 			  		      }
	 			  		    }
	 			  		},
						plugins:{
			 			  		legend: {
			 		                display: false
			 		            }
			 			  	}
						}
				};

				const ctx = document.getElementById('myChart').getContext('2d');
				chartData = new Chart(ctx, config);
				
				$('.treatment-chart-table-wrap').css('width', '322px');
				$('.treatment-chart-graph-wrap').css('width', '322px');
				
			// 차트 데이터 없으면 기본 메시지 출력
			} else {
				let cont = '<h2 class="h2-default special-condition">데이터가 없습니다</h2>';
				$('.treatment-chart-body').html(cont).addClass('special-condition');
				
				// 날짜 선택시 이벤트
				$(document).on('change', '#treatmentMonthPicker', function(){
					// 선택된 날짜 가져오기
					let date = $('#treatmentMonthPicker').val();
					// 날짜를 기준으로 차트 그리기
					drawChart(date, false);
				});
			}
		// 실적통계 그리기, 사원별 치료 실적
		} else if(currentIndex === 2){
			// 각 사원별 치료실적 계산
			let treatmentPerformanceCounts = {};
			
			$.each(clinicChartData, function(index, clinicChartVO){
				// 전체통계가 아니면
				if(!isTotalView){
					// 날짜가 맞아야하므로 날짜 데이터 비교를 위해 진료 날짜를 가져옴
					let clinicDt = formatDateYn(clinicChartVO.clinicDt);
					
					$('#treatmentTitle').text("사원별 치료시행 횟수");
					$('#treatmentTitleDate').text('('+month+')');
					
					// 선택된 년도/달에 해당되는 차트만 고르기
					if(clinicDt === month){
						// foreach문으로 그래프에 출력시킬 데이터 넣음
						$.each(clinicChartVO.treatmentOrderVOList, function(i, treatmentOrderVO){
							if(treatmentPerformanceCounts[treatmentOrderVO.treatmentOrderEmpName]){
								treatmentPerformanceCounts[treatmentOrderVO.treatmentOrderEmpName].count += 1;
							}else{
								treatmentPerformanceCounts[treatmentOrderVO.treatmentOrderEmpName] = {
									count : 1,
									empJbpsNm : treatmentOrderVO.treatmentOrderEmpJbpsNm
								};
							}
						});
					}
				//전체 통계보기면
				} else {
					$('#treatmentTitle').text("사원별 치료시행 횟수");
					$('#treatmentTitleDate').text('(전체기간)');
					
					// foreach문으로 그래프에 출력시킬 데이터 넣음
					$.each(clinicChartVO.treatmentOrderVOList, function(i, treatmentOrderVO){
						if(treatmentPerformanceCounts[treatmentOrderVO.treatmentOrderEmpName]){
							treatmentPerformanceCounts[treatmentOrderVO.treatmentOrderEmpName].count += 1;
						}else{
							treatmentPerformanceCounts[treatmentOrderVO.treatmentOrderEmpName] = {
								count : 1,
								empJbpsNm : treatmentOrderVO.treatmentOrderEmpJbpsNm
							};
						}
					});
				}
			});
			
			console.log('사원별 통계에서 조건(날짜)에 맞게 정제한 데이터 : ', treatmentPerformanceCounts);
			
			// 차트 데이터가 있어야만 출력
			if(Object.keys(treatmentPerformanceCounts).length !== 0){
				
				//배열로 바꿈
	            const countArray = Object.entries(treatmentPerformanceCounts);

	            // count를 기준으로 내림차순으로 정렬
	            countArray.sort((a, b) => b[1].count - a[1].count);

	            // 다시 객체로 변환
	            const sortedTreatmentPerformanceCounts = {};
	            countArray.forEach(([key, value]) => {
	            	sortedTreatmentPerformanceCounts[key] = value;
	            });
	            
	          	//배열로 바꿈
	            const countArray2 = Object.entries(treatmentPerformanceCounts);

	            // count를 기준으로 오름차순으로 정렬
	            countArray2.sort((a, b) => a[1].count - b[1].count);

	            // 다시 객체로 변환
	            const sortedTreatmentPerformanceCounts2 = {};
	            countArray2.forEach(([key, value]) => {
	            	sortedTreatmentPerformanceCounts2[key] = value;
	            });
				
				// 표 출력 부분
				let trData = '';
				let trHead = '';
				
				trHead +=`
					<tr class="tr-padding tr-column" style="text-align: center;">
						<th class="td-padding-body gray-text" style="width:145px">사원명(직급)</th>
						<th class="td-padding-body gray-text" style="width:80px">치료횟수(회)</th>
					</tr>
				`
				
				// 위의 정제한 데이터 개수만큼 반복
				$.each(sortedTreatmentPerformanceCounts, function(name, cont){
					trData += `
						<tr class="tr-padding tr-data">
							<th class="td-padding-body-data gray-text" style="width:145px;">\${name}(\${cont.empJbpsNm})</th>
							<th class="td-padding-body-data gray-text" style="width:80px">\${cont.count}회</th>
						</tr>
					`
				}); 
				
				$('.table-treatment thead').html(trHead);
				$('.table-treatment tbody').html(trData);
				
				// 그래프 출력 부분
				//const counts = Object.values(sortedTreatmentPerformanceCounts).map(treatment => treatment.count);
				const employeeNames = Object.keys(sortedTreatmentPerformanceCounts2); // 사원 이름
				const treatmentCounts = Object.values(sortedTreatmentPerformanceCounts2).map(treatment => treatment.count); // 치료 횟수
				console.log("사원이름 : ", employeeNames);
				
				
				const data = {
					    labels: employeeNames, // 세로 축에 사원 이름
					    datasets: [{
					        label: '치료횟수',
					        data: treatmentCounts, // 가로 축에 치료 횟수
					        backgroundColor: 'rgba(75, 192, 192, 1)',
					        borderColor: 'rgba(54, 162, 235, 1)',
					        borderWidth: 1
					    }]
					};

				const config = {
				    type: 'line',
				    data: data,
				    options: {
				    	indexAxis: 'x', // 세로 축을 기준으로 설정
				        scales: {
				            x: {
				                title: {
				                    display: true,
				                    text: '[사원명]'
				                }
				            },
				            y: {
				            	beginAtZero: true,
				                title: {
				                    display: true,
				                }
				            }
				        }
				    }
				};

				const ctx = document.getElementById('myChart').getContext('2d');
				chartData = new Chart(ctx, config);
				
				$('.treatment-chart-table-wrap').css('width', '322px');
				$('.treatment-chart-graph-wrap').css('width', '322px');
				
			// 차트 데이터 없으면 기본 메시지 출력
			} else {
				let cont = '<h2 class="h2-default special-condition">데이터가 없습니다</h2>';
				$('.treatment-chart-body').html(cont).addClass('special-condition');
				
				// 날짜 선택시 이벤트
				$(document).on('change', '#treatmentMonthPicker', function(){
					// 선택된 날짜 가져오기
					let date = $('#treatmentMonthPicker').val();
					// 날짜를 기준으로 차트 그리기
					drawChart(date, false);
				});
			}
		}
	}
	

	//'전체기간'클릭 시 월 선택
	$(document).on('click', '#treatmentTitleDate', function(){
		$("#treatmentMonthPicker").monthpicker({
			pattern: 'yyyy-mm',
			monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			selectedYear: "2024",
			startYear : "1990",
			finalYear : "2100",
			openOnFocus : true
		});
		
		$("#treatmentMonthPicker").monthpicker('show');
	});
	
	// 날짜 선택시 이벤트
	$(document).on('change', '#treatmentMonthPicker', function(){
		// 선택된 날짜 가져오기
		let date = $('#treatmentMonthPicker').val();
		// 날짜를 기준으로 차트 그리기
		drawChart(date, false);
	});

	// 발표용 스크립트
	$(document).on('click', '.complete1', function(){
		$('#treatmentCont').val('첫번째 치료보다 상태 많이 호전되었습니다.\n치료중 약간 불편함 느끼신다고 하셨으나 그 외엔 큰 문제 없었습니다.');
	});
});

// 검색 로직 시작
function searchFunction() {
	console.log("입력되서 작동중");
    var input, filter, table, tr, td, i, txtValue;
    
	table = document.querySelector("#patient-list-table");
   	tr = table.querySelectorAll(".tr-paInfo");
	
    input = document.getElementById("search");
    filter = input.value.toUpperCase();
   
    for (i = 0; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td")[1]; // 환자의 정보 1열(이름)
        console.log(td);
        if (td) {
            txtValue = td.textContent || td.innerText;
            if (txtValue.toUpperCase().indexOf(filter) > -1) {
                tr[i].style.display = "";
            } else {
                tr[i].style.display = "none";
            }
        }
    }
}
//검색 로직 끝 =================================================
</script>

<div class="dduk-body-border patient-list">
	<div>
		<div class="dduk-title-area" style="margin-bottom: 0px;">
			<h2>치료 완료 환자</h2>
		</div>
		<div class="d-flex">
			<input type="text" id="search" class="search dduck-input" placeholder="환자의 이름을 입력해 주세요" onkeyup="searchFunction()"/>
		<div class="autocomplete"></div>
		</div>
		<div class="dduk-x-pd8">
			<table class="patient-list-table" id="patient-list-table" style="text-align: center;">
				<tr class="tr-padding">
					<th class="td-padding gray-text" style="width:20px;">No</th>
					<th class="td-padding gray-text paName" style="width:90px;">이름</th>
					<th class="td-padding gray-text" style="width:110px">생년월일</th>
				</tr>
			</table>
		</div>	
	</div>
</div>
<div>
	<div class="treatment-center-wrap">
		<div class="dduk-body-border patient-detail">
			<div class="dduk-title-area">
				<h2>환자 정보 조회</h2>
			</div>
			<div class="patient-info-div">
				<div class="dduk-row">
					<h2 class="in-h2" style="width:100%">이름 : </h2>
				</div>
				<div class="dduk-row">
					<h2 class="in-h2" style="width:50%">성별 : </h2>
					<h2 class="in-h2" style="width:50%">나이 : </h2>
				</div>
				<div class="dduk-row">
					<h2 class="in-h2" style="width:100%">연락처 : </h2>
				</div>
				<div class="dduk-row">
					<h2 class="in-h2" style="width:100%">주소 : </h2>
				</div>
				<div class="dduk-row">
					<h2 class="in-h2" style="width:33%">혈액행 : </h2>
				</div>
				<div class="dduk-row">
					<h2 class="in-h2" style="width:50%">키 : </h2>
					<h2 class="in-h2" style="width:50%">몸무게 : </h2>
				</div>
			</div>
		</div>
	<div>
		<div class="dduk-row treatment-tab-wrap">
			<div class="rounds-tab" id="clinicHistory">진료내역</div>
			<div class="rounds-tab tab-active" id="treatmentHistory">치료내역</div>
		</div>
		<div class="dduk-inner-border patient-chart">
			<div class="dduk-row clinic-history-list">
				<div class="clinic-history-head">
					<!-- 진료내역 날짜 들어오는곳 -->
				</div>
				<div class="clinic-history-body">
					<!-- 진료내역 가져오기 -->
					<h1 class="h1-default">환자를 선택해주세요</h1>
				</div>
			</div>
		</div>
	</div>
	</div>
	<div>
		<div class="dduk-body-border statistics" style="position: relative;">
			<div class="dduk-row">
				<div class="dduk-title-area statistics-header">
					<h2>치료통계</h2>
				</div>
			</div>
			<div class="dduk-row">
				<div class="treatment-chart-aside">
					<h2 class="treatment-chart-aside-tab gray-text treatment-tab-selected">치료통계</h2>
					<h2 class="treatment-chart-aside-tab gray-text">환부통계</h2>
					<h2 class="treatment-chart-aside-tab gray-text">실적통계</h2>
				</div>
				<div class="treatment-chart-cont">
					<div class="dduk-row treatment-chart-head">
						<h5 style="width:100%; text-align: center; margin-top: 25px;">
							<span id="treatmentTitle" style="font-size:18px"></span>
							<span id="treatmentTitleDate"></span>
						</h5>
						<input type="text" id="treatmentMonthPicker" />
					</div>
					<div class="dduk-row treatment-chart-body" style="margin-top: 8px;gap:8px">
						<div class="treatment-chart-table-wrap">
							<table class="table-treatment">
								<thead>
									
								</thead>
								<tbody style="text-align: center; line-height: 35px;">
									
								</tbody>
							</table>
						</div>
						<div class="treatment-chart-graph-wrap">
							<canvas id="myChart" style="width: 400px; height: 300px;"></canvas>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="treatment-chart-wirte-wrap">
	<div class="dduk-body-border treatment-chart-wirte">
		<div class="dduk-title-area treatment-chart-wirte-head">
			<h2>치료차트</h2>
			<input type="text" name="treatment-chart-w" id="treatmentChart-w" style="display: none">
		</div>
		<div class="dduk-row">
			<h2 style="margin-left: 4px; font-size: 15px !important;">당일 치료내역</h2>
		</div>
		<div id="today-treatment" class="dduk-inner-border record-content-fr">
		</div>
		<div class="dduk-row">
			<h2 style="margin-left: 4px; margin-right: -27px; font-size: 15px !important;">차트작성</h2>
			<button style="margin-top: -7px;" type="button" class="auto-complete-btn complete1">
               <svg width="24" height="24" viewBox="0 0 600 600" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path class="auto-complete-btn-path" d="m495.6 49.23-32.82-32.82C451.8 5.471 437.5 0 423.1 0c-14.33 0-28.66 5.469-39.6 16.41l-216 216.09c-8.4 7.5-12.7 17-15.1 27.3l-24.1 107.4c-1.8 8.9 5.1 16.8 12.8 16.8.916 0 1.852-.092 2.797-.281 0 0 74.03-15.71 107.4-23.56 10.1-2.377 19.13-7.46 26.46-14.79l217-217C517.5 106.5 517.4 71.1 495.6 49.23zM461.7 94.4l-217 217c-1.1 1.1-2.2 1.7-3.5 2-13.7 3.227-34.65 7.857-54.3 12.14l12.41-55.2c.29-1.44.99-2.84 2.09-3.84L417.5 50.4c1.9-1.99 4.1-2.4 5.6-2.4s3.715.406 5.65 2.342l32.82 32.83c3.23 3.168 3.23 8.098.13 11.228zM424 288c-13.25 0-24 10.75-24 24v128c0 13.23-10.78 24-24 24H72c-13.22 0-24-10.77-24-24V136c0-13.23 10.78-24 24-24h144c13.25 0 24-10.75 24-24s-10.7-24-24-24l-144.9-.01C32.31 63.99 0 96.29 0 135.1v304C0 479.7 32.31 512 71.1 512h303.1c39.69 0 71.1-32.3 71.1-72l2.7-128c0-13.2-10.7-24-24-24z" fill="#8d9ea5">
                  </path>
               </svg>
            </button>
			<button class="dduk-btn-info btn-treatment-chart-save" style=" margin-left: 94px; height: 35px;">저장</button>
		</div>
		<div class="dduk-row">
			<textarea id="treatmentCont" class="dduck-input"></textarea>
		</div>
	</div>
</div>