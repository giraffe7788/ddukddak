<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/resources/css/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="/resources/script/jquery.mtz.monthpicker.js"></script>

<style>
.dduk-body-border {
	height: calc(35% - 8px);
}

#container {
	height: 170px;
	min-width: 310px;
	max-width: 480px;
	margin: 0 auto;
}

.loading {
	margin-top: 10em;
	text-align: center;
	color: gray;
}

.highcharts-credits {
	display: none !important;
}

.highcharts-exporting-group {
	display: none !important;
}

.highcharts-contextbutton {
	display: none !important;
}

.col-4 {
	padding: 0px !important;
}

#reservationMonthPicker {
	margin: -4px 8px 16px 4px;
	width: 100px;
}

.selectedTab {
	border-bottom: 3px solid #0ABAB5;
}

.absolute-center {
	align-items: flex-start;
}

#workingTimeDateIcon {
	margin-top: -4px;
	margin-left: 16px;
	height: 24px;
	width: 24px;
}

#reservationMonthPicker1, #reservationMonthPicker2, #month-picker-btn1, #month-picker-btn2{
	background-image: url('/resources/images/icons/calendar.png');
	background-position: 2px center;
	background-size: 20px;
	background-repeat: no-repeat;
	padding-left: 30px;
	border: 2px solid transparent;
	width: 100px;
}

#admissionMonthPicker1, #admissionMonthPicker2 {
	background-image: url('/resources/images/icons/calendar.png');
	background-position: 2px center;
	background-size: 20px;
	background-repeat: no-repeat;
	padding-left: 30px;
	border: 2px solid transparent;
	margin: -4px 8px 16px 4px;
	width: 100px;
}

.w-100 .absolute-center {
	height: calc(100% - 71px);
}

#reservationMonthPicker2 {
	display: none;
}

#admissionMonthPicker2 {
	display: none;
}
.red-font{
	color: red !important;
}
.blue-font{
	color: blue !important;
}
</style>
<div class="col-4 gap-ver-16">
	<div class="dduk-body-border w-100">
		<div class="dduk-title-area">
			<h2>환자 현황</h2>
		</div>
		<!-- 차트 그릴 영역 -->
		<div class="w-100 absolute-center">
			<canvas id="myChart" height="190" width="480"></canvas>
		</div>
	</div>
	<div class="dduk-body-border w-100">
		<div class="dduk-title-area">
			<h2>지역 별 환자 수 현황</h2>
		</div>
		<!-- 차트 그릴 영역 -->
		<div class="w-100 absolute-center">
			<div id="container"></div>
		</div>
	</div>
	
	<div class="dduk-body-border w-100">
		<div class="dduk-title-area spa-betw" style="margin-bottom: 0px;">
			<h2>의약품 주문</h2>
			<div class="d-flex gap-row-16">
				<h3 id="order-medicine-btn" class="selectedTab">결재완료</h3>
				<h3 id="deny-medicine-btn">발주반려</h3>
			</div>
		</div>
		<div class="d-flex" style="justify-content: flex-end;">
			<input type="text" id="month-picker-btn1" /> 
<!-- 			<input type="text" id="month-picker-input1" /> -->
		</div>
		<!-- 차트 그릴 영역 -->
		<div class="w-100 absolute-center">
			<canvas id="myChart6" height="180" width="480"></canvas>
		</div>
	</div>
	
</div>

<div class="col-4 gap-ver-16">
	<div class="dduk-body-border w-100">
		<div class="dduk-title-area spa-betw" style="margin-bottom: 0px;">
			<h2>입원 환자 현황</h2>
			<div class="d-flex gap-row-16">
				<h3 id="admDuration">평균 입원 기간</h3>
				<h3 id="admPatient">환자 통계</h3>
			</div>
		</div>
		<div class="d-flex" style="justify-content: flex-end;">
			<input type="text" id="admissionMonthPicker1" /> <input type="text"
				id="admissionMonthPicker2" />
		</div>
		<!-- 차트 그릴 영역 -->
		<div class="w-100 absolute-center">
			<canvas id="myChart2" height="175" width="480"></canvas>
		</div>
	</div>
	<div class="dduk-body-border w-100">
		<div class="dduk-title-area spa-betw" style="margin-bottom: 0px;">
			<h2>예약 건수</h2>
			<div class="d-flex gap-row-16">
				<h3 id="timeReservation">시간대별</h3>
				<h3 id="weekReservation">요일별</h3>
			</div>
		</div>
		<div class="d-flex" style="justify-content: flex-end;">
			<input type="text" id="reservationMonthPicker1" /> <input
				type="text" id="reservationMonthPicker2" />
		</div>
		<!-- 차트 그릴 영역 -->
		<div class="w-100 absolute-center">
			<canvas id="myChart3" height="160" width="480"></canvas>
		</div>
	</div>
	
	<div class="dduk-body-border w-100">
		<div class="dduk-row" style="gap:0px;">
			<div>
				<h2>내원/예약 환자 비율</h2>
				<button type="button" id="multi-visit-btn">재방문 환자 통계</button>
				<input type="text" value="몬뜨피커" id="month-picker-btn2"/>
			</div>
			<div id="myChart7Div" style="width:250px;">
				<canvas id="myChart7"></canvas>
			</div>
		</div>
	</div>
</div>
<!-- <div class="dduk-title-area spa-betw" style="margin-bottom: 0px;"> -->
<!-- 			<h2>예약 건수</h2> -->
<!-- 			<div class="d-flex gap-row-16"> -->
<!-- 				<h3 id="timeReservation">시간대별</h3> -->
<!-- 				<h3 id="weekReservation">요일별</h3> -->
<!-- 			</div> -->
<!-- 		</div> -->

<div class="col-4 gap-ver-16">
	<div class="dduk-body-border w-100">
		<div class="dduk-title-area">
			<h2>매출 현황</h2>
		</div>
		<!-- 차트 그릴 영역 -->
		<canvas id="myChart4" height="180" width="480"></canvas>
	</div>
	<div class="dduk-body-border w-100">
		<div class="dduk-title-area" style="margin-bottom: 8px;">
			<h2>매출 요약</h2>
		</div>
		<!-- 차트 그릴 영역 -->
		<div class="w-100 absolute-center">
<!-- 			<canvas id="myChart5" height="190" width="480"></canvas> -->
			<div style="height: 180px;">
				<div class="dduk-row" style="gap: 26px;">
					<div>
						<h3>총 매출</h3>
						<h1>16,908,439원</h1>
						<h3 class="red-font">↑ 10,403,600원</h3>
					</div>
					<div>
						<h3>급여 매출</h3>
						<h1>11,908,439원</h1>
						<h3 class="red-font">↑ 6,863,230원</h3>
					</div>
					<div>
						<h3>비급여 매출</h3>
						<h1>4,558,412원</h1>
						<h3 class="blue-font">↓ 403,600원</h3>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="dduk-body-border w-100">
		<div class="dduk-row" style="gap:0px;">
			<div>
				<h2>
					발송 문자 합계
				</h2>
<!-- 				<input type="button" value="몬뜨피커" id="month-picker-btn3"/> -->
			</div>
			<div style="width: 380px; height: 300px;">
				<canvas id="myChart8" style="width: 380px; height: 185px;"></canvas>
			</div>
		</div>
	</div>
	
</div>

<!-- <script src="https://code.highcharts.com/modules/marker-clusters.js"></script> -->
<!-- <script src="https://code.highcharts.com/modules/coloraxis.js"></script> -->
<!-- <script src="https://code.highcharts.com/maps/modules/accessibility.js"></script> -->
<!-- <script src="https://code.highcharts.com/modules/accessibility.js"></script> -->
<script src="https://code.highcharts.com/maps/highmaps.js"></script>
<!-- <script src="https://code.highcharts.com/maps/modules/exporting.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<!-- <script -->
<!-- 	src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script> -->
<script>
$(document).ready(function() {
    // 빈 차트를 생성한다. 
    var chart = new Chart(document.getElementById("myChart"), {
        type: 'bar',
        data: {
            labels: [],
            datasets: [
                      
            ],
            borderWidth: 1
        },
    });

//  ajax를 이용하여 json 타입의 데이터를 수신

    $.ajax({
    	url: '/common/getPatientList',
		type: 'post',
		dataType: 'json',
		contentType: "application/json; UTF-8",
		beforeSend: function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		},
		success: function(rst){
			console.log(rst);
			let m10s = 0;
			let m20s = 0;
			let m30s = 0;
			let m40s = 0;
			let m50s = 0;
			let m60s = 0;

			let f10s = 0;
			let f20s = 0;
			let f30s = 0;
			let f40s = 0;
			let f50s = 0;
			let f60s = 0;

			$.each(rst, function(idx){
			    let birth = formatResidentNumber(rst[idx].paReg);
			    let age = getAge(birth);

			    if (rst[idx].paSex == '남') {
			        if (age < 20) {
			            m10s++;
			        } else if (20 <= age && age < 30) {
			            m20s++;
			        } else if (30 <= age && age < 40) {
			            m30s++;
			        } else if (40 <= age && age < 50) {
			            m40s++;
			        } else if (50 <= age && age < 60) {
			            m50s++;
			        } else if (60 <= age) {
			            m60s++;
			        }
			    } else if (rst[idx].paSex == '여') {
			        if (age < 20) {
			            f10s++;
			        } else if (20 <= age && age < 30) {
			            f20s++;
			        } else if (30 <= age && age < 40) {
			            f30s++;
			        } else if (40 <= age && age < 50) {
			            f40s++;
			        } else if (50 <= age && age < 60) {
			            f50s++;
			        } else if (60 <= age) {
			            f60s++;
			        }
			    }
			});
			
			chart.destroy(); // 기존에 생성한 차트 오브젝트를 없앤다. 
            
            // 수신한 json 타입 데이터를 이용하여 차트를 새로 그린다. 
            chart = new Chart(document.getElementById("myChart"), {
                type: 'bar',
                data: {
                    labels: ['10대 이하', '20대', '30대', '40대', '50대', '60대 이상'],
                    datasets: [
                        {	
                        	label:'남',
                            data: [m10s, m20s, m30s, m40s, m50s, m60s],
                            borderColor: 'rgba(255, 0, 0, 0)',
                            backgroundColor:['#5CA0FF']
                        },
                        {	
                        	label:'여',
                            data: [f10s, f20s, f30s, f40s, f50s, f60s],
                            borderColor: 'rgba(255, 0, 0, 0)',
                            backgroundColor:['#FF94D2']
                        }
                    ],
                    borderWidth: 1
                },options:{ 
                	responsive: false,
                    scales: {
	                    	 x: {
	                    	      beginAtZero: true,
	                    	      stacked:true,
	                    	        scaleLineColor: 'red',
	                    	          grid: {
	                    	            color: 'transparent',
	                    	          },
	                    	       },
	                    	     y: {
	                    	       beginAtZero: true,
	                    	       stacked:true,
	                    	         grid: {
	                    	           color: 'transparent',
	                    	         },
	                    	    	}
                      		},
                    plugins: {
                    	 legend: {
                   	        position: 'right',
                   	        align: 'start'
                   	  	}
                    }
                  }
            });
			
			//지역별 환자 수 count
			let ich = 0;
			let gyeonggi = 0;
			let jeollaN = 0;
			let gyeongsangS = 0;
			let jeollaS = 0;
			let busan = 0;			
			let gyeongsangN = 0;
			let sejong = 0;
			let deajeon = 0;
			let ulsan = 0;
			let gangwon = 0;
			let chungcheongS = 0;
			let jeju = 0;
			let chungcheongN = 0;
			let seoul = 0;
			let Deagu = 0;
			let Gwangju = 0;
			$.each(rst, function(idx, item){
				 if (item.paAdd1.includes('인천')) {
				        ich++;
				    }
				    if (item.paAdd1.includes('경기')) {
				        gyeonggi++;
				    }
				    if (item.paAdd1.includes('전라남도')) {
				        jeollaN++;
				    }
				    if (item.paAdd1.includes('경상남도')) {
				        gyeongsangS++;
				    }
				    if (item.paAdd1.includes('전라북도')) {
				        jeollaS++;
				    }
				    if (item.paAdd1.includes('부산')) {
				        busan++;
				    }
				    if (item.paAdd1.includes('경상북도')) {
				        gyeongsangN++;
				    }
				    if (item.paAdd1.includes('세종')) {
				        sejong++;
				    }
				    if (item.paAdd1.includes('대전')) {
				        deajeon++;
				    }
				    if (item.paAdd1.includes('울산')) {
				        ulsan++;
				    }
				    if (item.paAdd1.includes('강원도')) {
				        gangwon++;
				    }
				    if (item.paAdd1.includes('충청남도')) {
				        chungcheongS++;
				    }
				    if (item.paAdd1.includes('제주')) {
				        jeju++;
				    }
				    if (item.paAdd1.includes('충청북도')) {
				        chungcheongN++;
				    }
				    if (item.paAdd1.includes('서울')) {
				        seoul++;
				    }
				    if (item.paAdd1.includes('대구')) {
				    	Deagu++;
				    }
				    if (item.paAdd1.includes('광주')) {
				    	Gwangju++;
				    }
				
			});
			
            const data = [
		        ['kr-4194', ich], ['kr-kg', gyeonggi], ['kr-cb', jeollaN], ['kr-kn', gyeongsangS],
		        ['kr-2685', jeollaS], ['kr-pu', busan], ['kr-2688', gyeongsangN], ['kr-sj', sejong],
		        ['kr-tj', deajeon], ['kr-ul', ulsan], ['kr-in', ich], ['kr-kw', gangwon],
		        ['kr-gn', chungcheongS], ['kr-cj', jeju], ['kr-gb', chungcheongN], ['kr-so', seoul],
		        ['kr-tg', Deagu], ['kr-kj', Gwangju]
		    ];
			
            createMapChart(data);
			
		},
		error: function(xhr, status, error){
			console.log('Error:', xhr, status, error);
		}
    });

});

async function createMapChart(data) {
	 const topology = await fetch(
		        'https://code.highcharts.com/mapdata/countries/kr/kr-all.topo.json'
		    ).then(response => response.json());

		    // Prepare demo data. The data is joined to map using value of 'hc-key'
		    // property by default. See API docs for 'joinBy' for more info on linking
		    // data and map.
		    
// 		    const data = [
// 		        ['kr-4194', 10], ['kr-kg', 13], ['kr-cb', 12], ['kr-kn', 13],
// 		        ['kr-2685', 14], ['kr-pu', 15], ['kr-2688', 16], ['kr-sj', 17],
// 		        ['kr-tj', 18], ['kr-ul', 19], ['kr-in', 20], ['kr-kw', 21],
// 		        ['kr-gn', 22], ['kr-cj', 23], ['kr-gb', 24], ['kr-so', 25],
// 		        ['kr-tg', 26], ['kr-kj', 27]
// 		    ];

		    // Create the chart
		    Highcharts.mapChart('container', {
		        chart: {
		            map: topology,
		            
		            style: {//차트 전체 스타일 지정
						color: '#0ABAB5',
					}
		        },

		        title: {
		            text: '',
		        },

		        subtitle: {
		            text: '',
		        },

		        mapNavigation: {
		            enabled: true,
		            buttonOptions: {
		                verticalAlign: 'bottom'
		            }
		        },

		        colorAxis: {
		            min: 0,
		            maxColor: '#0ABAB5',
		            minColor: '#ffffff'
		        },
		        
		        plotOptions: {
		            mappoint: {
		                cluster: {
		                    enabled: true,
		                    allowOverlap: false,
		                    animation: {
		                        duration: 450
		                    },
		                    layoutAlgorithm: {
		                        type: 'grid',
		                        gridSize: 70
		                    },
		                    zones: [{
		                        from: 1,
		                        to: 4,
		                        marker: {
		                            radius: 13
		                        }
		                    }, {
		                        from: 5,
		                        to: 9,
		                        marker: {
		                            radius: 15
		                        }
		                    }, {
		                        from: 10,
		                        to: 15,
		                        marker: {
		                            radius: 17
		                        }
		                    }, {
		                        from: 16,
		                        to: 20,
		                        marker: {
		                            radius: 19
		                        }
		                    }, {
		                        from: 21,
		                        to: 100,
		                        marker: {
		                            radius: 21
		                        }
		                    }]
		                }
		            }
		        },

		        series: [{
		            data: data,
		            name: 'Random data',
		            states: {
		                hover: {
		                    color: '#DBF2F4',
		                    borderColor:'#ffffff'
		                }
		            },
		            accessibility: {
		                exposeAsGroupOnly: true
		            },
		            borderColor: 'transparent',
		            nullColor: '#0ABAB5',
		            showInLegend: false
		        }, {
		            type: 'mappoint',
		            enableMouseTracking: true,
		            accessibility: {
		                point: {
		                    descriptionFormat: '{#if isCluster}' +
		                            'Grouping of {clusterPointsAmount} points.' +
		                            '{else}' +
		                            '{name}, country code: {country}.' +
		                            '{/if}'
		                }
		            },
		            colorKey: 'clusterPointsAmount',
		            name: 'Cities',
		            data: data,
		            color: Highcharts.getOptions().colors[5],
		            marker: {
		                lineWidth: 1,
		                lineColor: '#fff',
		                symbol: 'mapmarker',
		                radius: 8
		            },
		            dataLabels: {
		                enabled: true,
		                format: '{point.name}'
		            }
		        }]
		    });
}

//예약가져오기//////////////////////////////////////////////////////////////////////////////////////
	$('#weekReservation').click(function() {
		$('#weekReservation').addClass('selectedTab');
		$('#timeReservation').removeClass('selectedTab');
		$("#reservationMonthPicker1").val('전체 기간');
		$("#reservationMonthPicker1").css('display', 'block');
		$("#reservationMonthPicker2").css('display', 'none');
	});
	
	$('#timeReservation').click(function() {
		$('#timeReservation').addClass('selectedTab');
		$('#weekReservation').removeClass('selectedTab');
		$("#reservationMonthPicker2").val('전체 기간');
		$("#reservationMonthPicker1").css('display', 'none');
		$("#reservationMonthPicker2").css('display', 'block');
      });

    var chart3 = new Chart(document.getElementById("myChart3"), {
        type: 'bar',
        data: {
            labels: [],
            datasets: [
   
            ],
            borderWidth: 1
        },
    });
	
	// monthpicker 설정
    $("#reservationMonthPicker1").monthpicker({
		pattern: 'yyyy-mm',
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		selectedYear: "2024",
		startYear : "1990",
		finalYear : "2100",
		openOnFocus : true
	});
	
    $("#reservationMonthPicker2").monthpicker({
		pattern: 'yyyy-mm',
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		selectedYear: "2024",
		startYear : "1990",
		finalYear : "2100",
		openOnFocus : true
	});
	
    $("#admissionMonthPicker1").monthpicker({
		pattern: 'yyyy-mm',
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		selectedYear: "2024",
		startYear : "1990",
		finalYear : "2100",
		openOnFocus : true
	});
    
    $("#admissionMonthPicker2").monthpicker({
		pattern: 'yyyy-mm',
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		selectedYear: "2024",
		startYear : "1990",
		finalYear : "2100",
		openOnFocus : true
	});
    
    /// 지윤서꺼
    $("#month-picker-btn1").monthpicker({
		pattern: 'yyyy-mm',
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		selectedYear: "2024",
		startYear : "1990",
		finalYear : "2100",
		openOnFocus : true
	});
    
    $("#month-picker-btn2").monthpicker({
		pattern: 'yyyy-mm',
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		selectedYear: "2024",
		startYear : "1990",
		finalYear : "2100",
		openOnFocus : true
	});
    
 	// 현재 날짜 객체 생성
    var currentDate = new Date();

    // 년, 월 정보 가져오기
    var year = currentDate.getFullYear();
    var month = currentDate.getMonth() + 1; // 월은 0부터 시작하므로 1을 더해줍니다.

    // 월이 한 자릿수일 경우 앞에 0을 추가
    var formattedMonth = (month < 10) ? '0' + month : month;

    // 년월까지만 가져와서 문자열로 생성
    var yearMonthString = year + '-' + formattedMonth;

    
    $("#reservationMonthPicker1").val('전체 기간');
    $("#reservationMonthPicker1").val('전체 기간');
    $("#admissionMonthPicker1").val('전체 기간');
    $("#admissionMonthPicker2").val('전체 기간');
    
    /// 지윤서꺼
    $("#month-picker-btn1").val('전체 기간');
    $("#month-picker-btn2").val('전체 기간');
    
    $("#reservationMonthPicker1").on('click', function(){
		$("#reservationMonthPicker1").monthpicker('show');
    })
    
    $("#reservationMonthPicker2").on('click', function(){
		$("#reservationMonthPicker2").monthpicker('show');
    })
    
    $("#admissionMonthPicker1").on('click', function(){
		$("#admissionMonthPicker1").monthpicker('show');
    })
    
    $("#admissionMonthPicker2").on('click', function(){
		$("#admissionMonthPicker2").monthpicker('show');
    })
    
     /// 지윤서꺼
    $("#month-picker-btn1").on('click', function(){
		$("#month-picker-btn1").monthpicker('show');
    })
    $("#month-picker-btn2").on('click', function(){
		$("#month-picker-btn2").monthpicker('show');
    })
	
    getAllReservation();
    getAllAdmission();
    
    
    $(document).on('change', '#reservationMonthPicker1', function(){
		// 선택된 날짜 가져오기
		let date = $('#reservationMonthPicker1').val();
		
		// 문자열을 '-' 기준으로 분리
		let parts = date.split('-');

		// 분리된 값에서 년도와 월 추출
		let year = parseInt(parts[0]);
		let month = parseInt(parts[1]);
		console.log('year, month', year, month);
		
		// 날짜를 기준으로 차트 그리기
		getReservationListByMonth1(year, month);
	});
    
    ////////////////////////////요일별 예약 환자
    
    function getReservationListByMonth1(year, month) {
		let data = {
			"year":year,
			"month":month
		}
		chart3.destroy(); // 기존에 생성한 차트 오브젝트를 없앤다. 
		
		$.ajax({
			url: '/reserve/getReservationListByMonth',
			type: 'post',
			data:JSON.stringify(data),
			dataType: 'json',
			contentType: "application/json; UTF-8",
			beforeSend: function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: function(rst){
				console.log('통계용 예약', rst);
				
				//요일 변수
				let mon = 0;
				let tue = 0;
				let wend = 0;
				let thur = 0;
				let fri = 0;
				let sat = 0;
				let sun = 0;
				
				
				$.each(rst, function(idx){
					var dateObject = new Date(rst[idx].rsvtDt);
					// 요일을 가져오기 (0은 일요일, 1은 월요일, ..., 6은 토요일)
					var dayOfWeek = dateObject.getDay();

					// 요일을 텍스트로 변환
					var daysOfWeekText = ["일", "월", "화", "수", "목", "금", "토"];
					var dayOfWeekText = daysOfWeekText[dayOfWeek];
					
					if(dayOfWeekText == '월') {
						mon++;
					} else if (dayOfWeekText == '화') {
						tue++; 
					} else if (dayOfWeekText == '수') {
						wend++;
					} else if (dayOfWeekText == '목') {
						thur++;
					} else if (dayOfWeekText == '금') {
						fri++;
					} else if (dayOfWeekText == '토') {
						sat++;
					} else if (dayOfWeekText == '일') {
						sun++;
					}
				});
				
				let weekData = [mon ,tue ,wend ,thur ,fri ,sat ,sun];
				
				weekReservation(weekData);
				
			}, 
			error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
			}
	});
		
		  function weekReservation(data) {
				 // 수신한 json 타입 데이터를 이용하여 차트를 새로 그린다. 
		       chart3 = new Chart(document.getElementById("myChart3"), {
		           type: 'bar',
		           data: {
		               labels: ['월', '화', '수', '목', '금', '토', '일'],
		               datasets: [
		                   {	
		                   	label:'',
		                       data: data,
		                       borderColor: 'rgba(255, 0, 0, 0)',
		                       backgroundColor:['#5CA0FF']
		                   }
		               ],
		               borderWidth: 1
		           },options:{ 
		           	responsive: false,
		               scales: {
		                   	 x: {
		                   	      beginAtZero: true,
		                   	      stacked:true,
		                   	        scaleLineColor: 'red',
		                   	          grid: {
		                   	            color: 'transparent',
		                   	          },
		                   	       },
		                   	     y: {
		                   	       beginAtZero: true,
		                   	       stacked:true,
		                   	         grid: {
		                   	           color: 'transparent',
		                   	         },
		                   	    	}
		                 		},
		               plugins: {
		               	 legend: {
		               		 display: false
		              	  	}
		               }
		             }
		       });
			}
}
  
    $(document).on('change', '#reservationMonthPicker2', function(){
		// 선택된 날짜 가져오기
		let date = $('#reservationMonthPicker2').val();
		
		// 문자열을 '-' 기준으로 분리
		let parts = date.split('-');

		// 분리된 값에서 년도와 월 추출
		let year = parseInt(parts[0]);
		let month = parseInt(parts[1]);
		console.log('year, month', year, month);
		
		// 날짜를 기준으로 차트 그리기
		getReservationListByMonth2(year, month);
	});
    
    function getReservationListByMonth2(year, month) {
		let data = {
			"year":year,
			"month":month
		}
		chart3.destroy(); // 기존에 생성한 차트 오브젝트를 없앤다. 
		
		$.ajax({
			url: '/reserve/getReservationListByMonth',
			type: 'post',
			data:JSON.stringify(data),
			dataType: 'json',
			contentType: "application/json; UTF-8",
			beforeSend: function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: function(rst){
				console.log('통계용 예약', rst);
				
				//시간대 변수
				let time1 = 0;
				let time2 = 0;
				let time3 = 0;
				let time4 = 0;
				let time5 = 0;
				let time6 = 0;
				let time7 = 0;
				let time8 = 0;
				
				$.each(rst, function(idx){
					
					var rsvtTime = rst[idx].rsvtTime;
					if(rsvtTime == '1' || rsvtTime == '2') {
						time1++;
					} else if (rsvtTime == '3' || rsvtTime == '4') {
						time2++;
					} else if (rsvtTime == '5' || rsvtTime == '6') {
						time3++;
					} else if (rsvtTime == '7' || rsvtTime == '8') {
						time4++;
					} else if (rsvtTime == '9' || rsvtTime == '10') {
						time5++;
					} else if (rsvtTime == '11' || rsvtTime == '12') {
						time6++;
					} else if (rsvtTime == '13' || rsvtTime == '14') {
						time7++;
					} else if (rsvtTime == '15' || rsvtTime == '16') {
						time8++;
					}
				});
				
				let timeData = [time1, time2, time3, time4, time5, time6, time7, time8];
				
				timeReservation(timeData);
				
			}, 
			error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
			}
	});
		
		function timeReservation(data) {
			 chart3 = new Chart(document.getElementById("myChart3"), {
		            type: 'line',
		            data: {
		                labels: ['9-10', '10-11', '11-12', '13-14', '14-15', '15-16', '16-17', '17-18'],
		                datasets: [
		                    {	
		                    	label:'',
		                        data: data,
		                        borderColor: '#0ABAB5',
		                        backgroundColor:['#0ABAB5']
		                    }
		                ],
		                borderWidth: 1
		            },options:{ 
		            	responsive: false,
		                scales: {
		                    	 x: {
		                    	      beginAtZero: true,
		                    	      stacked:true,
		                    	        scaleLineColor: 'red',
		                    	          grid: {
		                    	            color: 'transparent',
		                    	          },
		                    	       },
		                    	     y: {
		                    	       beginAtZero: true,
		                    	       stacked:true,
		                    	         grid: {
		                    	           color: 'transparent',
		                    	         },
		                    	    	}
		                  		},
		                plugins: {
		                	 legend: {
		                		 display: false
		               	  	}
		                }
		              }
		        });
		}
}
    
	
	function getAllReservation() {
		chart3.destroy(); // 기존에 생성한 차트 오브젝트를 없앤다. 
		
		$.ajax({
			url: '/ams/getAllReservation',
			type: 'post',
			dataType: 'json',
			contentType: "application/json; UTF-8",
			beforeSend: function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: function(rst){
				console.log('통계용 예약', rst);
				
				//요일 변수
				let mon = 0;
				let tue = 0;
				let wend = 0;
				let thur = 0;
				let fri = 0;
				let sat = 0;
				let sun = 0;
				
				//시간대 변수
				let time1 = 0;
				let time2 = 0;
				let time3 = 0;
				let time4 = 0;
				let time5 = 0;
				let time6 = 0;
				let time7 = 0;
				let time8 = 0;
				
				$.each(rst, function(idx){
					var dateObject = new Date(rst[idx].rsvtDt);
					// 요일을 가져오기 (0은 일요일, 1은 월요일, ..., 6은 토요일)
					var dayOfWeek = dateObject.getDay();

					// 요일을 텍스트로 변환
					var daysOfWeekText = ["일", "월", "화", "수", "목", "금", "토"];
					var dayOfWeekText = daysOfWeekText[dayOfWeek];
					
					if(dayOfWeekText == '월') {
						mon++;
					} else if (dayOfWeekText == '화') {
						tue++; 
					} else if (dayOfWeekText == '수') {
						wend++;
					} else if (dayOfWeekText == '목') {
						thur++;
					} else if (dayOfWeekText == '금') {
						fri++;
					} else if (dayOfWeekText == '토') {
						sat++;
					} else if (dayOfWeekText == '일') {
						sun++;
					}
					
					var rsvtTime = rst[idx].rsvtTime;
					if(rsvtTime == '1' || rsvtTime == '2') {
						time1++;
					} else if (rsvtTime == '3' || rsvtTime == '4') {
						time2++;
					} else if (rsvtTime == '5' || rsvtTime == '6') {
						time3++;
					} else if (rsvtTime == '7' || rsvtTime == '8') {
						time4++;
					} else if (rsvtTime == '9' || rsvtTime == '10') {
						time5++;
					} else if (rsvtTime == '11' || rsvtTime == '12') {
						time6++;
					} else if (rsvtTime == '13' || rsvtTime == '14') {
						time7++;
					} else if (rsvtTime == '15' || rsvtTime == '16') {
						time8++;
					}
				});
				
				let weekData = [mon ,tue ,wend ,thur ,fri ,sat ,sun];
				let timeData = [time1, time2, time3, time4, time5, time6, time7, time8];
				
				timeReservationAll(timeData);
				$('#timeReservation').addClass('selectedTab');
	           
				$('#weekReservation').click(function() {
					chart3.destroy();
					weekReservationAll(weekData);
			      });
				
				$('#timeReservation').click(function() {
					chart3.destroy();
					timeReservationAll(timeData);
			      });
				
			}, 
			error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
			}
	});
		
	function weekReservationAll(data) {
		 // 수신한 json 타입 데이터를 이용하여 차트를 새로 그린다. 
        chart3 = new Chart(document.getElementById("myChart3"), {
            type: 'bar',
            data: {
                labels: ['월', '화', '수', '목', '금', '토', '일'],
                datasets: [
                    {	
                    	label:'',
                        data: data,
                        borderColor: 'rgba(255, 0, 0, 0)',
                        backgroundColor:['#5CA0FF']
                    }
                ],
                borderWidth: 1
            },options:{ 
            	responsive: false,
                scales: {
                    	 x: {
                    	      beginAtZero: true,
                    	      stacked:true,
                    	        scaleLineColor: 'red',
                    	          grid: {
                    	            color: 'transparent',
                    	          },
                    	       },
                    	     y: {
                    	       beginAtZero: true,
                    	       stacked:true,
                    	         grid: {
                    	           color: 'transparent',
                    	         },
                    	    	}
                  		},
                plugins: {
                	 legend: {
                		 display: false
               	  	}
                }
              }
        });
	}
	
	function timeReservationAll(data) {
		 chart3 = new Chart(document.getElementById("myChart3"), {
	            type: 'line',
	            data: {
	                labels: ['9-10', '10-11', '11-12', '13-14', '14-15', '15-16', '16-17', '17-18'],
	                datasets: [
	                    {	
	                    	label:'',
	                        data: data,
	                        borderColor: '#0ABAB5',
	                        backgroundColor:['#0ABAB5']
	                    }
	                ],
	                borderWidth: 1
	            },options:{ 
	            	responsive: false,
	                scales: {
	                    	 x: {
	                    	      beginAtZero: true,
	                    	      stacked:true,
	                    	        scaleLineColor: 'red',
	                    	          grid: {
	                    	            color: 'transparent',
	                    	          },
	                    	       },
	                    	     y: {
	                    	       beginAtZero: true,
	                    	       stacked:true,
	                    	         grid: {
	                    	           color: 'transparent',
	                    	         },
	                    	    	}
	                  		},
	                plugins: {
	                	 legend: {
	                		 display: false
	               	  	}
	                },
	              }
	        });
	}
	}
	
//  ajax를 이용하여 json 타입의 데이터를 수신


//예약가져오기 끝//////////////////////////////////////////////////////////////////////////////////////
	
	
//입원차트 시작!//////////////////////////////////////////////////////////////////////////////////////
	$('#admDuration').click(function() {
		$('#admDuration').addClass('selectedTab');
		$('#admPatient').removeClass('selectedTab');
		$("#admissionMonthPicker1").val('전체 기간');
		$("#admissionMonthPicker1").css('display', 'block');
		$("#admissionMonthPicker2").css('display', 'none');
		chart2.destroy();
		getAllAdmission();
	});

$('#admPatient').click(function() {
		$('#admPatient').addClass('selectedTab');
		$('#admDuration').removeClass('selectedTab');
		$("#admissionMonthPicker2").val('전체 기간');
		$("#admissionMonthPicker1").css('display', 'none');
		$("#admissionMonthPicker2").css('display', 'block');
		chart2.destroy();
		getAllAdmissionPatientList();
      });

	var chart2 = new Chart(document.getElementById("myChart2"), {
        type: 'bar',
        data: {
            labels: [],
            datasets: [

            ],
            borderWidth: 1
        },
    });
    
	// 입원 전체 통계
	function getAllAdmission() {
		
		$.ajax({
	    	url: '/ams/getAllAdmission',
			type: 'post',
			dataType: 'json',
			contentType: "application/json; UTF-8",
			beforeSend: function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: function(rst){
				console.log('입원기록리스트',rst);
				
				let fir = 0;
				let sec = 0;
				let thir = 0;
				let four = 0;
				let five = 0;
				$.each(rst, function(idx){
					if(rst[idx].admiOutdt != "" && rst[idx].admiOutdt != null) {
						
						// 문자열을 Date 객체로 변환
						var startDate = new Date(rst[idx].admiIndt);
						var endDate = new Date(rst[idx].admiOutdt);

						// 두 날짜 사이의 차이를 계산 (밀리초 단위)
						var timeDifference = endDate - startDate;

						// 밀리초를 일로 변환 (1초 = 1000밀리초, 1분 = 60초, 1시간 = 60분, 1일 = 24시간)
						var daysDifference = timeDifference / (1000 * 60 * 60 * 24);
						
						if (daysDifference <= 3) {
							fir++;
						} else if (3 < daysDifference && daysDifference <= 7) {
							sec++;
						} else if ( 7 < daysDifference && daysDifference <= 14) {
							thir++;
						} else if ( 14 < daysDifference && daysDifference <= 30) {
							four++;
						} else if ( 30 < daysDifference ) {
							five++;
						}
						
						
					} else {
						
						// 문자열을 Date 객체로 변환
						var startDateExp = new Date(rst[idx].admiIndt);
						var endDateExp = new Date(rst[idx].admiExpOutdt);

						// 두 날짜 사이의 차이를 계산 (밀리초 단위)
						var timeDifferenceExp = endDateExp - startDateExp;

						// 밀리초를 일로 변환 (1초 = 1000밀리초, 1분 = 60초, 1시간 = 60분, 1일 = 24시간)
						var daysDifferenceExp = timeDifferenceExp / (1000 * 60 * 60 * 24);
						
						if (daysDifferenceExp <= 3) {
							fir++;
						} else if (3 < daysDifferenceExp && daysDifferenceExp <= 7) {
							sec++;
						} else if ( 7 < daysDifferenceExp && daysDifferenceExp <= 14) {
							thir++;
						} else if ( 14 < daysDifferenceExp && daysDifferenceExp <= 30) {
							four++;
						} else if ( 30 < daysDifferenceExp ) {
							five++;
						}
					}
					
					let admiData = [fir, sec, thir, four, five];
					
					chart2.destroy();
					createAdmDuration(admiData);
					
					$('#admDuration').addClass('selectedTab');
			           
					$('#admDuration').click(function() {
						chart2.destroy();
						createAdmDuration(admiData);
				      });
					
					$('#admPatient').click(function() {
						chart2.destroy();
				      });
					
				});
			},
			error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
			}
		});	
	}
	
	//입원환자 전체통계
	function getAllAdmissionPatientList() {
		
		$.ajax({
	    	url: '/ams/getAllAdmissionPatientList',
			type: 'post',
			dataType: 'json',
			contentType: "application/json; UTF-8",
			beforeSend: function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: function(rst){
				console.log('getAllAdmissionPatientList', rst);
				let m10s = 0;
				let m20s = 0;
				let m30s = 0;
				let m40s = 0;
				let m50s = 0;
				let m60s = 0;

				let f10s = 0;
				let f20s = 0;
				let f30s = 0;
				let f40s = 0;
				let f50s = 0;
				let f60s = 0;

				$.each(rst, function(idx){
				    let birth = formatResidentNumber(rst[idx].paReg);
				    let age = getAge(birth);

				    if (rst[idx].paSex == '남') {
				        if (age < 20) {
				            m10s++;
				        } else if (20 <= age && age < 30) {
				            m20s++;
				        } else if (30 <= age && age < 40) {
				            m30s++;
				        } else if (40 <= age && age < 50) {
				            m40s++;
				        } else if (50 <= age && age < 60) {
				            m50s++;
				        } else if (60 <= age) {
				            m60s++;
				        }
				    } else if (rst[idx].paSex == '여') {
				        if (age < 20) {
				            f10s++;
				        } else if (20 <= age && age < 30) {
				            f20s++;
				        } else if (30 <= age && age < 40) {
				            f30s++;
				        } else if (40 <= age && age < 50) {
				            f40s++;
				        } else if (50 <= age && age < 60) {
				            f50s++;
				        } else if (60 <= age) {
				            f60s++;
				        }
				    }
				});
				
				chart2.destroy();
				
				 // 수신한 json 타입 데이터를 이용하여 차트를 새로 그린다. 
	            chart2 = new Chart(document.getElementById("myChart2"), {
	                type: 'bar',
	                data: {
	                    labels: ['10대 이하', '20대', '30대', '40대', '50대', '60대 이상'],
	                    datasets: [
	                        {	
	                        	label:'남',
	                            data: [m10s, m20s, m30s, m40s, m50s, m60s],
	                            borderColor: 'rgba(255, 0, 0, 0)',
	                            backgroundColor:['#5CA0FF']
	                        },
	                        {	
	                        	label:'여',
	                            data: [f10s, f20s, f30s, f40s, f50s, f60s],
	                            borderColor: 'rgba(255, 0, 0, 0)',
	                            backgroundColor:['#FF94D2']
	                        }
	                    ],
	                    borderWidth: 1
	                },options:{ 
	                	responsive: false,
	                    scales: {
		                    	 x: {
		                    	      beginAtZero: true,
		                    	      stacked:true,
		                    	        scaleLineColor: 'red',
		                    	          grid: {
		                    	            color: 'transparent',
		                    	          },
		                    	       },
		                    	     y: {
		                    	       beginAtZero: true,
		                    	       stacked:true,
		                    	         grid: {
		                    	           color: 'transparent',
		                    	         },
		                    	    	}
	                      		},
	                    plugins: {
	                    	 legend: {
	                   	        position: 'right',
	                   	        align: 'start'
	                   	  	}
	                    }
	                  }
	            });
			},
			error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
			}
		});	
	}
	
	$(document).on('change', '#admissionMonthPicker1', function(){
		// 선택된 날짜 가져오기
		let admDate = $('#admissionMonthPicker1').val();
		
		// 문자열을 '-' 기준으로 분리
		let admParts = admDate.split('-');

		// 분리된 값에서 년도와 월 추출
		let admYear = parseInt(admParts[0]);
		let admMonth = parseInt(admParts[1]);
		console.log('year, month', admYear, admMonth);
		
		getAdmissionListByMonth(admYear, admMonth);
	});
	
	function getAdmissionListByMonth(year, month) {
		
		let data = {
				'year' : year,
				'month' : month
			}
		
		console.log("getAdmissionListByMonth", data);
		
		$.ajax({
	    	url: '/ams/getAdmissionListByMonth',
			type: 'post',
			data:JSON.stringify(data),
			dataType: 'json',
			contentType: "application/json; UTF-8",
			beforeSend: function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: function(rst){
				console.log('입원기록리스트',rst);
				
				let fir = 0;
				let sec = 0;
				let thir = 0;
				let four = 0;
				let five = 0;
				$.each(rst, function(idx){
					if(rst[idx].admiOutdt != "" && rst[idx].admiOutdt != null) {
						
						// 문자열을 Date 객체로 변환
						var startDate = new Date(rst[idx].admiIndt);
						var endDate = new Date(rst[idx].admiOutdt);

						// 두 날짜 사이의 차이를 계산 (밀리초 단위)
						var timeDifference = endDate - startDate;

						// 밀리초를 일로 변환 (1초 = 1000밀리초, 1분 = 60초, 1시간 = 60분, 1일 = 24시간)
						var daysDifference = timeDifference / (1000 * 60 * 60 * 24);
						
						if (daysDifference <= 3) {
							fir++;
						} else if (3 < daysDifference && daysDifference <= 7) {
							sec++;
						} else if ( 7 < daysDifference && daysDifference <= 14) {
							thir++;
						} else if ( 14 < daysDifference && daysDifference <= 30) {
							four++;
						} else if ( 30 < daysDifference ) {
							five++;
						}
						
						
					} else {
						
						// 문자열을 Date 객체로 변환
						var startDateExp = new Date(rst[idx].admiIndt);
						var endDateExp = new Date(rst[idx].admiExpOutdt);

						// 두 날짜 사이의 차이를 계산 (밀리초 단위)
						var timeDifferenceExp = endDateExp - startDateExp;

						// 밀리초를 일로 변환 (1초 = 1000밀리초, 1분 = 60초, 1시간 = 60분, 1일 = 24시간)
						var daysDifferenceExp = timeDifferenceExp / (1000 * 60 * 60 * 24);
						
						if (daysDifferenceExp <= 3) {
							fir++;
						} else if (3 < daysDifferenceExp && daysDifferenceExp <= 7) {
							sec++;
						} else if ( 7 < daysDifferenceExp && daysDifferenceExp <= 14) {
							thir++;
						} else if ( 14 < daysDifferenceExp && daysDifferenceExp <= 30) {
							four++;
						} else if ( 30 < daysDifferenceExp ) {
							five++;
						}
					}
					
					let admiData = [fir, sec, thir, four, five];
					
					chart2.destroy();
					createAdmDuration(admiData);
					
				});
			},
			error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
			}
		});	
	}
	
	$(document).on('change', '#admissionMonthPicker2', function(){
		// 선택된 날짜 가져오기
		let admDate = $('#admissionMonthPicker2').val();
		
		// 문자열을 '-' 기준으로 분리
		let admParts = admDate.split('-');

		// 분리된 값에서 년도와 월 추출
		let admYear = parseInt(admParts[0]);
		let admMonth = parseInt(admParts[1]);
		console.log('year, month', admYear, admMonth);
		
		getAdmissionPatientListByMonth(admYear, admMonth);
	});
	
	function getAdmissionPatientListByMonth(year, month) {
		let data = {
				'year' : year,
				'month' : month
			}
		
		console.log("getAdmissionPatientListByMonth", data);
		
		$.ajax({
	    	url: '/ams/getAdmissionPatientListByMonth',
			type: 'post',
			data:JSON.stringify(data),
			dataType: 'json',
			contentType: "application/json; UTF-8",
			beforeSend: function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: function(rst){
				console.log('getAdmissionPatientListByMonth', rst);
				
				let m10s = 0;
				let m20s = 0;
				let m30s = 0;
				let m40s = 0;
				let m50s = 0;
				let m60s = 0;

				let f10s = 0;
				let f20s = 0;
				let f30s = 0;
				let f40s = 0;
				let f50s = 0;
				let f60s = 0;

				$.each(rst, function(idx){
				    let birth = formatResidentNumber(rst[idx].paReg);
				    let age = getAge(birth);

				    if (rst[idx].paSex == '남') {
				        if (age < 20) {
				            m10s++;
				        } else if (20 <= age && age < 30) {
				            m20s++;
				        } else if (30 <= age && age < 40) {
				            m30s++;
				        } else if (40 <= age && age < 50) {
				            m40s++;
				        } else if (50 <= age && age < 60) {
				            m50s++;
				        } else if (60 <= age) {
				            m60s++;
				        }
				    } else if (rst[idx].paSex == '여') {
				        if (age < 20) {
				            f10s++;
				        } else if (20 <= age && age < 30) {
				            f20s++;
				        } else if (30 <= age && age < 40) {
				            f30s++;
				        } else if (40 <= age && age < 50) {
				            f40s++;
				        } else if (50 <= age && age < 60) {
				            f50s++;
				        } else if (60 <= age) {
				            f60s++;
				        }
				    }
				});
				
				chart2.destroy();
				
				 // 수신한 json 타입 데이터를 이용하여 차트를 새로 그린다. 
	            chart2 = new Chart(document.getElementById("myChart2"), {
	                type: 'bar',
	                data: {
	                    labels: ['10대 이하', '20대', '30대', '40대', '50대', '60대 이상'],
	                    datasets: [
	                        {	
	                        	label:'남',
	                            data: [m10s, m20s, m30s, m40s, m50s, m60s],
	                            borderColor: 'rgba(255, 0, 0, 0)',
	                            backgroundColor:['#5CA0FF']
	                        },
	                        {	
	                        	label:'여',
	                            data: [f10s, f20s, f30s, f40s, f50s, f60s],
	                            borderColor: 'rgba(255, 0, 0, 0)',
	                            backgroundColor:['#FF94D2']
	                        }
	                    ],
	                    borderWidth: 1
	                },options:{ 
	                	responsive: false,
	                    scales: {
		                    	 x: {
		                    	      beginAtZero: true,
		                    	      stacked:true,
		                    	        scaleLineColor: 'red',
		                    	          grid: {
		                    	            color: 'transparent',
		                    	          },
		                    	       },
		                    	     y: {
		                    	       beginAtZero: true,
		                    	       stacked:true,
		                    	         grid: {
		                    	           color: 'transparent',
		                    	         },
		                    	    	}
	                      		},
	                    plugins: {
	                    	 legend: {
	                   	        position: 'right',
	                   	        align: 'start'
	                   	  	}
	                    }
	                  }
	            });
				
			},
			error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
			}
		});	
	}
	
	function createAdmDuration(data) {
		 // 수신한 json 타입 데이터를 이용하여 차트를 새로 그린다. 
		 
        chart2 = new Chart(document.getElementById("myChart2"), {
            type: 'bar',
            data: {
                labels: ['3일 이하', '3-7일', '8-14일', '15-30일', '30일 초과'],
                datasets: [
                    {	
                    	label:'',
                        data: data,
                        borderColor: 'rgba(255, 0, 0, 0)',
                        backgroundColor:['#5CA0FF']
                    }
                ],
                borderWidth: 1
            },options:{ 
            	responsive: false,
                scales: {
                    	 x: {
                    	      beginAtZero: true,
                    	      stacked:true,
                    	        scaleLineColor: 'red',
                    	          grid: {
                    	            color: 'transparent',
                    	          },
                    	       },
                    	     y: {
                    	       beginAtZero: true,
                    	       stacked:true,
                    	         grid: {
                    	           color: 'transparent',
                    	         },
                    	    	}
                  		},
                plugins: {
                	 legend: {
                		 display: false
               	  	}
                }
              }
        });
	}

//입원차트 끝!//////////////////////////////////////////////////////////////////////////////////////

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


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
		this.classList.add('selectedTab');
		$('#order-medicine-btn').removeClass('selectedTab');
		getDeniedPurchaseMedicine();
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
		this.classList.add('selectedTab');
		$('#deny-medicine-btn').removeClass('selectedTab');
		drawPurchaseMedicineStastics();
	});
	
	drawPurchaseMedicineStastics();
}
var myChart4 = new Chart(document.getElementById("myChart4"), {
    type: 'bar',
    data: {
        labels: ['3일', '3-7일', '8-14일', '15-30일', '30일 초과'],
        datasets: [
            {	
            	label:'매출',
                data: [10250000,
                	9800000,
                	12500000,
                	13000000,
                	16150000],
                borderColor: 'rgba(255, 0, 0, 0)',
                backgroundColor:['#5CA0FF']
            },
        ],
        borderWidth: 1
    },options:{ 
    	responsive: false,
        scales: {
            	 x: {
            	      beginAtZero: true,
            	      stacked:true,
            	        scaleLineColor: 'red',
            	          grid: {
            	            color: 'transparent',
            	          },
            	       },
            	     y: {
            	       beginAtZero: true,
            	       stacked:true,
            	         grid: {
            	           color: 'transparent',
            	         },
            	    	}
          		},
        plugins: {
        	 legend: {
       	        position: 'right',
       	        align: 'start'
       	  	}
        }
      }
});

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
		url:"/ams/getAllReceptionList",
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
					        position: 'left',
					      },
// 					      title: {
// 					        display: true,
// 					        text: '내원, 예약환자 통계'
// 						 }
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
		url:"/ams/getRevisitPatient",
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
// 				            title: {
// 				            	display: true,
// 				            	text : "재방문 환자 합계"
// 				            }
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
// 			    label: ['예약 안내', '수술 안내'],
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
            	position : 'left'
            },
//             title: {
//             	display: true,
//             	text : '발송 문자 통계'
//       		}
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
});
//날짜 선택시 이벤트
$(document).on('change', '#month-picker-btn1', function(){
	// 선택된 날짜 가져오기
	let date = $('#month-picker-btn1').val();
	
	console.log(date);

	purchaseMedicineStastics(date);
});

//Month-Picker
$(document).on('click', '#month-picker-btn2', function(){
	$("#month-picker-btn2").monthpicker({
		pattern: 'yyyy-mm',
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		startYear : 1990,
		finalYear : 2100,
		selectedYear: 2024,
		openOnFocus : true
	});
});
//날짜 선택시 이벤트
$(document).on('change', '#month-picker-input2', function(){
	// 선택된 날짜 가져오기
	let date = $('#month-picker-input2').val();
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
