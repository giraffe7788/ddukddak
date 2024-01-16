<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/resources/css/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="/resources/script/jquery.mtz.monthpicker.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<title>통계</title>
<style>
canvas{
	width: 600px;
	height: 500px;
}
#month-picker-input1, #month-picker-input2, #month-picker-input3{
	visibility: hidden;
    position: absolute;
    margin-left: -150px;
    width: 100px;
    margin-top: 0px;
}
</style>
</head>
<body>
	<div>
		<canvas id="myChart6"></canvas>
		<input type="button" value="발주된 약품 통계" id="order-medicine-btn"/>
		<input type="button" value="반려된 약품 통계" id="deny-medicine-btn"/>
		<input type="button" value="몬뜨피커" id="month-picker-btn1"/>
		<input type="text" id="month-picker-input1"/>
	</div>
	
	<div>
		<canvas id="myChart7" style="width: 300px; height: 300px;"></canvas>
		<input type="button" value="재방문 환자 통계" id="multi-visit-btn"/>
		<input type="button" value="몬뜨피커" id="month-picker-btn2"/>
		<input type="text" id="month-picker-input2"/>
	</div>
	
	<div>
		<canvas id="myChart8" style="width: 300px; height: 300px;"></canvas>
		<input type="button" value="몬뜨피커" id="month-picker-btn3"/>
		<input type="text" id="month-picker-input3"/>
	</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
	purchaseMedicineStastics(date);
	patientReceptionStastics(date);
});
// 차트에 쓸 데이터를 컨트롤러에서 받아와 저장할 변수 
var data = {};
// 수량 배열
var qtyArray = [];
// 라벨 배열
var labelArray = [];
// 날짜 변수 0: 전체
var date = 0;

// 캔버스 변수에 넣기
var ctx = document.getElementById('myChart6');
// 1번 차트 깡통
var myChart6 = new Chart(ctx, {
	type : 'bar',
	data : {
		datasets : [ {
			borderWidth : 1,
			backgroundColor: [
                'rgba(255, 99, 132, 0.5)',
                'rgba(54, 162, 235, 0.5)',
                'rgba(255, 206, 86, 0.5)',
                'rgba(75, 192, 192, 0.5)',
                'rgba(153, 102, 255, 0.5)',
                'rgba(255, 159, 64, 0.5)']
		} ]
	},
	options : {
		plugins:{
            legend: {
                position : top
            },
            title: {
            	display: true,
            	text : '발주된 약품 통계'
            }
        }
	}
});
//1번 차트(발주 관련 통계) 그리기
function purchaseMedicineStastics(date){
	// 차트 데이터를 담는 변수
	var chartData = {
		labels: labelArray,
	    datasets: [{
	        data: qtyArray,
	        backgroundColor: [
                   'rgba(255, 99, 132, 1)',
                   'rgba(54, 162, 235, 1)',
                   'rgba(255, 206, 86, 1)',
                   'rgba(75, 192, 192, 1)',
                   'rgba(153, 102, 255, 1)',
                   'rgba(255, 159, 64, 1)',
                   'rgba(201, 203, 207, 1)'
	        ],
		}]
	};
	
	// 컨트롤러에서 받은 데이터를 자바스크립트 변수에 넣기
	function getPurchaseMedicineDetailData(){
		data = ${purchaseMedicineDetailVOList}
		console.log('서버에서 가져온 발주해서 최종승인된 약품의 합계 리스트 : ',data);
	}
	
	// 변수에 들어간 데이터를 초기화해둔 배열에 넣기
	function pushDataIntoArray(date){
		var keys = Object.keys(data);
		var values = Object.values(data);
		
		// 이전 데이터가 쌓이지 않게 초기화
		qtyArray = [];
		labelArray = [];
		
		if(date == 0){
			values.forEach(function(obj) {
				// 라벨과 데이터 배열에 데이터 넣기
				qtyArray.push(obj.prmeQt);
			    labelArray.push(obj.mediNm);
			});
		}else{
			values.forEach(function(obj){
				if(date === obj.prmeDt){
					qtyArray.push(obj.prmeQt);
				    labelArray.push(obj.mediNm);
				}
			});
		}
		
		// 차트 데이터 변수의 라벨과 데이터에 값 넣기
	    chartData.labels = labelArray;
	    chartData.datasets[0].data = qtyArray;
	}
	
	// 깡통 차트에 차트를 새로 그리기
	function redrawChart(chartType, date, title){
		var chartTitle = "";
		if(date === 0){
			chartTitle = title+"(전체기간)";
		}else{
			chartTitle = title+"("+date+")"
		}
	    if(myChart6){
			myChart6.destroy();
		}
	    
		const config = {
				type: chartType,
			    data: chartData,
			    options : {
		    	responsive : true,
			    	plugins:{
			            legend: {
			                display: false
			            },
			            title: {
			            	display: true,
			            	text : chartTitle
			            }
			        }
			    }
			};
		
		myChart6 = new Chart(ctx, config);
	}
	
	// 발주한 약품 통계 그려주기
	function drawPurchaseMedicineStastics(){
		// 컨트롤러에서 받은 데이터(모든 발주 정보)를 자바스크립트 변수에 넣기
		getPurchaseMedicineDetailData();
		// 변수에 들어간 데이터를 필요한 모양으로 바꿔주기
		pushDataIntoArray(date);
		// 깡통 차트에 데이터를 직접 넣어주기
		redrawChart('bar', date, '발주된 약품 통계');
	}
	
	//버튼을 담은 변수
	var denyMedicineBtn = document.getElementById('deny-medicine-btn');
	// 반려된 약품 통계 실행
	denyMedicineBtn.addEventListener('click',function(){
// 		getDeniedPurchaseMedicine();
	});
	
	// 결재상태가 PMST04인 데이터만 필터링하기
	function filterDataByApprovalState(){
		var keys = Object.keys(data);
		var values = Object.values(data);
		
		// 이전 데이터가 쌓이지 않게 초기화
		qtyArray = [];
		labelArray = [];
		
		values.forEach(function(obj) {
			// 승인상태가 PMST04(반려)인 데이터만 라벨과 데이터 배열에 데이터 넣기
			if(obj.prmeAtrlStat == 'PMST04'){
				qtyArray.push(obj.prmeQt);
			    labelArray.push(obj.mediNm);
			}
		});
		
		chartData.labels = labelArray;
	    chartData.datasets[0].data = qtyArray;
	}
	
	// 반려된 발주 통계 보기
	function getDeniedPurchaseMedicine(){
		filterDataByApprovalState();
		
		redrawChart('bar', date, "반려된 발주 통계");
	}
	
	//버튼을 담은 변수
	var orderMedicineBtn = document.getElementById('order-medicine-btn');
	// 반려된 약품 통계
	orderMedicineBtn.addEventListener('click',function(){
		drawPurchaseMedicineStastics();
	});
	
	drawPurchaseMedicineStastics();
}


// 캔버스 변수에 넣기
const ctx7 = document.getElementById('myChart7');
// 2번 차트 깡통
var myChart7 = new Chart(ctx7, {
	type: 'doughnut',
	data: {
		datasets : [ {
			borderWidth : 1,
			backgroundColor: [
                'rgba(54, 162, 235, 0.5)',
                'rgba(255, 206, 86, 0.5)',
                'rgba(255, 99, 132, 0.5)',
                'rgba(75, 192, 192, 0.5)',
                'rgba(153, 102, 255, 0.5)',
                'rgba(255, 159, 64, 0.5)'],
	  } ],
		options: {
	    responsive: true,
	    plugins: {
	      legend: {
	        position: 'top',
	      },
	      title: {
	        display: true,
	        text: 'Chart.js Doughnut Chart'
      			}
    		}
	  	}
	}
});
// 2번 차트(접수 관련 통계) 그리기
function patientReceptionStastics(date){
	 // 받아온 date 설정
    this.date = date;
	 
	// 비동기 통신으로 모든 접수 내역을 가져와서 내원/예약 접수 분류하기
	$.ajax({
		url:"getAllReceptionList",
		type:"post",
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(result){
			// 날짜 선택되면 해당 월의 데이터만 넣을 배열 변수
			var array = [];
			
			// 날짜가 들어와서 date가 0이면 분류하지 않고
			if(date === 0){
				$.each(result, function(index, item){
					array.push(item);
				})
				// 그렇지 않으면 해당 날짜와 맞는 데이터만 분류 하고싶은데;
			}else{
				$.each(result, function(index, item){
					var time = new Date(item.hsrpDt);
				    var formattedDate = time.toISOString().slice(0, 7);
				    console.log(formattedDate); // '2024-01'과 같은 형태의 날짜 출력
				    if(date === formattedDate){
				    	array.push(item);
				    }
				})
			}
			
			if(myChart7){
					myChart7.destroy();
				}
			
			// 내원접수 환자
			var walkInPatient = 0;
			// 예약접수 환자
			var reservationPatient = 0;
			
			// 하나씩 돌면서 분류하기
			 $.each(array, function(index, item) {
				 // RCTY01 내원접수 환자 카운트
				 if(item.hsrpType == 'RCTY01'){
					 walkInPatient++;
					 // RCTY02 예약접수 환자 카운트
				 }else if(item.hsrpType == 'RCTY02'){
					 reservationPatient++;
				 }
	        });
			 
			// 차트 라벨과 데이터 바꾸기
			 myChart7 = new Chart(ctx7,{
				 
			 	type: 'doughnut',
				data: {
					labels : [ "내원환자", "예약환자"],
					datasets : [ {
						data : [ walkInPatient, reservationPatient ],
						borderWidth : 1,
						backgroundColor: [
			                'rgba(54, 162, 235, 0.5)',
			                'rgba(255, 206, 86, 0.5)',
			                'rgba(255, 99, 132, 0.5)',
			                'rgba(75, 192, 192, 0.5)',
			                'rgba(153, 102, 255, 0.5)',
			                'rgba(255, 159, 64, 0.5)'],
				  	} ]
				},
					options: {
					    responsive: true,
					    plugins: {
					      legend: {
					        position: 'top',
					      },
					      title: {
					        display: true,
					        text: '내원, 예약환자 통계'
						 }
	      			}
	    		}
		  	});
		}
	});
}

var multiVisitBtn = document.getElementById('multi-visit-btn');
multiVisitBtn.addEventListener('click',function(){
	console.log("버튼 클릭됨");
	
	// 비동기 통신으로 모든 접수 내역을 가져와서 내원/예약 접수 분류하기
	$.ajax({
		url:"getRevisitPatient",
		type:"post",
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success : function(result){
			
			if(myChart7){
				myChart7.destroy();
			}
		 
		    var multiVisitPatients = result.MULTI_VISIT_PATIENTS;
		    var singleVisitPatients = result.SINGLE_VISIT_PATIENTS;
			
		    console.log(Object.keys(result)); // 맵의 키를 콘솔에 출력
		    console.log(multiVisitPatients);
		    console.log(singleVisitPatients);
		    
		    var chartData = {
		        labels: ['재방문 환자', '첫방문 환자'],
		        datasets: [{
		            data: [multiVisitPatients, singleVisitPatients],
		            backgroundColor : ['#0ABAB5', '#FF4040']
		            // 다른 차트 설정 추가
		        }]
		    };

			const config = {
					type: 'doughnut',
				    data: chartData,
				    options : {
			    	responsive : true,
				    	plugins:{
				            legend: {
				                display: true
				            },
				            title: {
				            	display: true,
				            	text : "재방문 환자 합계"
				            }
				        }
				    }
				};
				
				myChart7 = new Chart(ctx7, config);
		}
	});
});
	
//캔버스 변수에 넣기
var ctx8 = document.getElementById('myChart8');
// 3번 차트 깡통
var myChart8 = new Chart(ctx8, {
	type : 'polarArea',
	data : {
		labels: ['예약 성공','예약 실패','예약 안내','예약 전날','수술 안내'],
			  datasets: [{
			    label: ['예약 안내', '수술 안내'],
			    data: [11, 16, 7, 3, 14],
			    backgroundColor: [
			      'rgb(255, 99, 132)',
			      'rgb(75, 192, 192)',
			      'rgb(255, 205, 86)',
			      'rgb(201, 203, 207)',
			      'rgb(54, 162, 235)'
	    	]
	  	}]
	},
	options : {
		plugins:{
            legend: {
            	display : true,
            },
            title: {
            	display: true,
            	text : '발송 문자 통계'
      		}
    	}
	}
});





//Month-Picker
$(document).on('click', '#month-picker-btn1', function(){
	$("#month-picker-input1").monthpicker({
		pattern: 'yyyy-mm',
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		startYear : 1990,
		finalYear : 2100,
		selectedYear: 2024,
		openOnFocus : true
	});
	
	$("#month-picker-input1").monthpicker('show');
});
//날짜 선택시 이벤트
$(document).on('change', '#month-picker-input1', function(){
	// 선택된 날짜 가져오기
	date = $('#month-picker-input1').val();
	purchaseMedicineStastics(date);
});

//Month-Picker
$(document).on('click', '#month-picker-btn2', function(){
	$("#month-picker-input2").monthpicker({
		pattern: 'yyyy-mm',
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		startYear : 1990,
		finalYear : 2100,
		selectedYear: 2024,
		openOnFocus : true
	});
	
	$("#month-picker-input2").monthpicker('show');
});
//날짜 선택시 이벤트
$(document).on('change', '#month-picker-input2', function(){
	// 선택된 날짜 가져오기
	date = $('#month-picker-input2').val();
	patientReceptionStastics(date);
});

//Month-Picker
$(document).on('click', '#month-picker-btn3', function(){
	$("#month-picker-input3").monthpicker({
		pattern: 'yyyy-mm',
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		startYear : 1990,
		finalYear : 2100,
		selectedYear: 2024,
		openOnFocus : true
	});
	
	$("#month-picker-input3").monthpicker('show');
});
//날짜 선택시 이벤트
$(document).on('change', '#month-picker-input3', function(){
	
});
</script>
</body>
</html>