<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.aside-doc-chart{
	width: 196px;
	border-radius: 16px 0px 0px 16px;
	background: var(--bg-02, #DBF2F4);
	height: 56px;
	border-right: 4px solid var(--ci-01, #0ABAB5);
	margin-left: 4px;
	color: var(--ci-01, #0ABAB5);
}

.chart-body {
	height: 840px;
	width: 75%;
}

.dduk-title-area {
	border-bottom: 1px solid #EBEFF0;
    margin-left: -18px;
    width: 1195px;
}

.chart-category {
	display: flex;
    justify-content: flex-start;
}

.category-tab {
    margin-right: 20px;
    border-bottom: 3px solid var(--ci-01, #fff);
    margin-left: 10px;
}

.category-selected {
	border-bottom: 3px solid var(--ci-01, #0ABAB5);
}

.chart-cont {
	display: flex;
    padding-top: 16px;
    padding-left: 45px;
}

.ynheight {
	height: 345px;
	width: 554px !important;
}

#injuryChartContainer {
	height: 330px !important;
    width: 471px !important;
    position: relative;
    bottom: 25px;
}

#treatmentChartContainer {
	height: 346px !important;
    width: 471px !important;
    position: relative;
    bottom: 25px;
}


#medicineChartContainer {
	height: 330px !important;
    width: 471px !important;
    position: relative;
    bottom: 25px;
}

#bloodChartContainer {
	height: 330px !important;
    width: 471px !important;
    position: relative;
    bottom: 25px;
}

.calendar-icon {
	margin-left: -16px;
    margin-top: 3px;
	width: 24px;
	height: 24px;
}

</style>

<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/moment@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-moment@latest"></script>

<div class="dduk-inner-border chart-body">
	<div class="dduk-title-area chart-category">
		<h2 class="category-tab category-selected">&nbsp;진료통계</h2>
		<h2 class="category-tab">입원통계</h2>
	</div>
	<div class="chart-cont">
	
	</div>
</div>

<script>

$(function(){
	
	// 왼쪽 탭 이벤트
	$('.aside-doc-chart').find('svg').find('path').attr('fill', '#0ABAB5');
	$('.aside-doc-chart').find('.dduk-nav-menu').css('color', '#0ABAB5');
	
	
	// 카테고리 클릭 이벤트
	$(document).on('click', '.category-tab', function(){
		$('.category-tab').removeClass('category-selected');
		$(this).addClass('category-selected');
		
		if($(this).text().trim() === '진료통계'){
			showClinicChart();
		} else {
			showAdmissionChart();
		}
	});
	
	
	// 차트정보를 저장시켜놓고 파괴하기 위한 변수
	let injuryChart = '';
	let testChart = '';
	let medicineChart = '';
	let treatmentChart = '';
	
	let dietChart = '';
	let bloodChart = '';
	let tempChart = '';
	let ioChart = '';
	
	
	// 페이지 로딩시 진료 차트 출력	
	showClinicChart();
	
	
	// 진료통계를 출력시켜주는 부분
	function showClinicChart(){
		
		// 우선 껍데기를 만든다
		let cont = `
			<div class="col-4 gap-ver-16" style="max-width: 100%; margin-left: -40px;">
		
				<div class="dduk-body-border ynheight">
					<div class="dduk-title-area" style="width: 554px; border-bottom: 0px;">
						<div class="dduk-row">
							<h2 style="padding-left: 16px">2024년 1월 상병종류 통계</h2>
							<img class="calendar-icon" src="/resources/images/icons/calendar.png">
							<h3 style="border-bottom: 3px solid #0ABAB5;margin-left: 75px;height: 25px;">상병종류</h3>
							<h3 style="margin-left: -10px;">구분비율</h3>
							<h3 style="margin-left: -10px;">환부비율</h3>
						</div>
					</div>
					<div id="injuryChartContainer" class="w-100 absolute-center">
						<canvas id="injuryChart" width="300" height="300"></canvas>
					</div>
				</div>
				
				<div class="dduk-body-border ynheight">
					<div class="dduk-title-area" style="width: 554px; border-bottom: 0px;">
						<div class="dduk-row">
							<h2 style="padding-left: 16px">2024년 1월 처방종류 통계</h2>
							<img class="calendar-icon" src="/resources/images/icons/calendar.png">
							<h3 style="border-bottom: 3px solid #0ABAB5;margin-left: 97px;height: 25px;">처방상세별</h3>
							<h3 style="margin-left: -10px;">처방이름별</h3>
						</div>
					</div>
					<div id="medicineChartContainer" class="w-100 absolute-center" style="bottom: 50px; left: 20px;">
						<canvas id="medicineChart" width="450" height="250"></canvas>
					</div>
				</div>
				
			</div>
			
			
			<div class="col-4 gap-ver-16" style="max-width: 100%;">
			
				<div class="dduk-body-border ynheight">
					<div class="dduk-title-area" style="width: 554px; border-bottom: 0px;">
						<div class="dduk-row">
							<h2 style="padding-left: 16px">2024년 1월 검사종류 통계</h2>
							<img class="calendar-icon" src="/resources/images/icons/calendar.png">
							<h3 style="border-bottom: 3px solid #0ABAB5;margin-left: 141px;height: 25px;">검사종류</h3>
							<h3 style="margin-left: -10px;">환부비율</h3>
						</div>
					</div>
					<div id="testChartContainer" class="w-100 absolute-center">
						<canvas id="testChart" width="450" height="250"></canvas>
					</div>
				</div>
				
				<div class="dduk-body-border ynheight">
					<div class="dduk-title-area" style="width: 554px; border-bottom: 0px;">
						<div class="dduk-row">
							<h2 style="padding-left: 16px">2024년 1월 치료종류 통계</h2>
							<img class="calendar-icon" src="/resources/images/icons/calendar.png">
							<h3 style="border-bottom: 3px solid #0ABAB5;margin-left: 141px;height: 25px;">치료종류</h3>
							<h3 style="margin-left: -10px;">환부비율</h3>
						</div>
					</div>
					<div id="treatmentChartContainer" class="w-100 absolute-center" style="bottom: 25px; left: 20px;">
						<canvas id="treatmentChart" width="300" height="300"></canvas>
					</div>
				</div>
				
			</div>
		`;
		
		$('.chart-cont').html(cont);
		
		showInjuryChart();
		showMedicineChart();
		showTestChart();
		showTreatmentChart();
	}
	
	
	// 상병진단 통계 출력부분
	function showInjuryChart(){
		
		const ctx = document.getElementById('injuryChart').getContext('2d');
		
		injuryChart = new Chart(ctx,{
 
			type: 'doughnut',
			data: {
				labels : ['개방 골절', '폐쇠성 골절', '횡상 골절', '골다공증', '골수염', '오십견', '흉곽기형', '낙상', '요통', '건초염', '통풍'],
				datasets : [ {
					data : [5, 16, 3, 2, 2, 11, 5, 7, 2, 3, 5],
					borderWidth : 1,
					backgroundColor: [
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(255, 99, 132, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		                'rgba(255, 159, 64, 1)'
		            ],
	  			} ]
			},
			options: {
	   			responsive: true,
	    		plugins: {
	      			legend: {
	        			position: 'left',
	        			align: 'start'
	      			},
   				}
			}
 		});
	}
	
	
	// 검사오더 통계 출력부분
	function showTestChart(){
		
		const ctx = document.getElementById('testChart').getContext('2d');
		
		testChart = new Chart(ctx,{
		    type: 'bar', // 여기를 bar 유지
		    data: {
		        labels : ['피검사', 'X-RAY', '소변검사', 'MRI', 'CT', '초음파', '골밀도검사'],
		        datasets : [ {
		            data : [5, 16, 8, 2, 3, 5, 7],
		            borderWidth : 1,
		            backgroundColor: [
		                'rgba(255, 99, 132, 1)',
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(75, 192, 192, 1)',
						'rgba(153, 102, 255, 1)',
						'rgba(255, 159, 64, 1)',
						'rgba(99, 255, 132, 1)'
					],
				}]
			},
			options: {
				indexAxis: 'y', // 이 옵션을 추가하여 수평 막대 그래프로 만듭니다.
				responsive: false,
				plugins: {
					legend: {
						display: false
					}
				}
			}
		});
	}
	
	
	// 처방오더 통계 출력부분
	function showMedicineChart(){
		
		const ctx = document.getElementById('medicineChart').getContext('2d');
		
		medicineChart = new Chart(ctx,{
 
			type: 'bar',
			data: {
				labels : ['주사', '항생제 연고', '스테로이드', '근이완제', '재생연고', '패치형 진통제', '프레가발린'],
				datasets : [ {
					data : [25, 16, 8, 12, 11, 15, 4],
					borderWidth : 1,
					backgroundColor: [
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(255, 99, 132, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		                'rgba(255, 159, 64, 1)',
		                'rgba(99, 255, 132, 1)' 
		            ],
	  			} ]
			},options:{ 
            	responsive: false,
                plugins: {
                	 legend: {
                		 display: false
               	  	}
                }
              }
 		});
	}
	
	
	// 치료오더 통계 출력부분
	function showTreatmentChart(){
		
		const ctx = document.getElementById('treatmentChart').getContext('2d');
		
		treatmentChart = new Chart(ctx,{
 
			type: 'pie',
			data: {
				labels : ['인대강화치료', '체외충격파치료', '열치료', '도수치료', '경피신경자극치료', '재활치료'],
				datasets : [ {
					data : [15, 16, 13, 19, 8, 11],
					borderWidth : 1,
					backgroundColor: [
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(255, 99, 132, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		                'rgba(255, 159, 64, 1)'
		            ],
	  			} ]
			},
			options: {
	   			responsive: true,
	    		plugins: {
	      			legend: {
	        			position: 'left',
	        			align: 'start',
	      			},
   				}
			}
 		});
	}
	
	
	// 입원통계를 출력시켜주는 부분
	function showAdmissionChart(){
		
		// 우선 껍데기를 만든다
		let cont = `
			<div class="col-4 gap-ver-16" style="max-width: 100%; margin-left: -40px;">
		
				<div class="dduk-body-border ynheight">
					<div class="dduk-title-area" style="width: 554px; border-bottom: 0px;">
						<div class="dduk-row">
							<h2 style="padding-left: 16px">2024년 1월 식이종류 통계</h2>
							<img class="calendar-icon" src="/resources/images/icons/calendar.png">
							<h3 style="border-bottom: 3px solid #0ABAB5;margin-left: 140px;height: 25px;">식이종류</h3>
							<h3 style="margin-left: -10px;">섭취열량</h3>
						</div>
					</div>
					<div id="dietChartContainer" class="w-100 absolute-center" style="position: relative; bottom: 22px;">
						<canvas id="dietChart" width="470" height="280"></canvas>
					</div>
				</div>
				
				<div class="dduk-body-border ynheight">
					<div class="dduk-title-area" style="width: 554px; border-bottom: 0px;">
						<div class="dduk-row">
							<h2 style="padding-left: 16px">연령별 평균체온 통계</h2>
							<h3 style="border-bottom: 3px solid #0ABAB5;margin-left: 240px;height: 25px;">연령별</h3>
							<h3 style="margin-left: -10px;">성별별</h3>
						</div>
					</div>
					<div id="tempChartContainer" class="w-100 absolute-center" style="position:relative; bottom: 40px;">
						<canvas id="tempChart" width="450" height="250"></canvas>
					</div>
				</div>
				
			</div>
			
			
			<div class="col-4 gap-ver-16" style="max-width: 100%;">
			
				<div class="dduk-body-border ynheight">
					<div class="dduk-title-area" style="width: 554px; border-bottom: 0px;">
						<div class="dduk-row">
							<h2 style="padding-left: 16px">연령별 평균혈압 통계</h2>
							<h3 style="border-bottom: 3px solid #0ABAB5;margin-left: 240px;height: 25px;">연령별</h3>
							<h3 style="margin-left: -10px;">성별별</h3>
						</div>
					</div>
					<div id="bloodChartContainer" class="w-100 absolute-center" style="position: relative; bottom: 58px; left: 30px;">
						<canvas id="bloodChart" width="470" height="264"></canvas>
					</div>
				</div>
				
				<div class="dduk-body-border ynheight">
					<div class="dduk-title-area" style="width: 554px; border-bottom: 0px;">
						<div class="dduk-row">
							<h2 style="padding-left: 16px">연령별 I/O 통계</h2>
							<h3 style="border-bottom: 3px solid #0ABAB5;margin-left: 280px;height: 25px;">연령별</h3>
							<h3 style="margin-left: -10px;">성별별</h3>
						</div>
					</div>
					<div id="ioChartContainer" class="w-100 absolute-center" style="position:relative; bottom: 40px;">
						<canvas id="ioChart" width="470" height="264"></canvas>
					</div>
				</div>
				
			</div>
		`;
		
		$('.chart-cont').html(cont);
		
		showDietChart();
		showBloodChart();
		showTempChart();
		showIoChart();
	}
	
	
	// 식이 통계 출력부분
	function showDietChart(){ 
		
		const ctx = document.getElementById('dietChart').getContext('2d');
		
		dietChart = new Chart(ctx,{
 
			type: 'bar',
			data: {
				labels : ['저염식단', '일반식단', '건강식단', '당뇨식단', '연식', '경식', '전유동식', '맑은 유동식'],
				datasets : [ {
					data : [25, 35, 8, 12, 11, 15, 4, 2],
					borderWidth : 1,
					backgroundColor: [
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(255, 99, 132, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		                'rgba(255, 159, 64, 1)',
		                'rgba(99, 255, 132, 1)' 
		            ],
	  			} ]
			},options:{ 
            	responsive: false,
                plugins: {
                	 legend: {
                		 display: false
               	  	}
                }
              }
 		});
	}
	
	
	// 혈압 통계 출력부분
	function showBloodChart(){
	    const ctx = document.getElementById('bloodChart').getContext('2d');
	    
	    bloodChart = new Chart(ctx, {
	        type: 'line',
	        data: {
	            labels: ['10대', '20대', '30대', '40대', '50대', '60대', '70대 이상'],
	            datasets: [{
	                label: '평균 최저혈압',
	                data: [71.2, 72.6, 73.5, 74.1, 76.3, 76.6, 77.4],
					borderColor: 'rgba(54, 162, 235, 1)',
					backgroundColor: 'rgba(54, 162, 235, 1)',
					fill: false,
				}, 
				{
					label: '평균 최고혈압',
					data: [121.5, 124.7, 127.5, 130.6, 133.2, 135.7, 136.2],
					borderColor: 'rgba(255, 99, 132, 1)',
					backgroundColor: 'rgba(255, 99, 132, 1)',
					fill: false,
				}]
			},
			options: {
				responsive: true,
				scales: {
					y: {
						beginAtZero: true
					}
				},
				plugins: {
					legend: {
						display: true
					}
				}
			}
		});
	}
	
	
	// 체온 통계 출력부분
	function showTempChart(){
	    const ctx = document.getElementById('tempChart').getContext('2d');
	    
	    tempChart = new Chart(ctx, {
	        type: 'bar',
	        data: {
	            labels: ['10대', '20대', '30대', '40대', '50대', '60대', '70대 이상'],
	            datasets: [{
	                label: '평균 체온',
	                data: [36.6, 36.7, 36.5, 36.6, 36.7, 36.8, 36.9],
					backgroundColor: [
		                'rgba(54, 162, 235, 1)',
		                'rgba(255, 206, 86, 1)',
		                'rgba(255, 99, 132, 1)',
		                'rgba(75, 192, 192, 1)',
		                'rgba(153, 102, 255, 1)',
		                'rgba(255, 159, 64, 1)',
		                'rgba(99, 255, 132, 1)' 
		            ],
	            }]
	        },
	        options: {
	            responsive: true,
	            scales: {
	                y: {
	                    beginAtZero: false,
	                    suggestedMin: 36,
	                    suggestedMax: 38
	                }
	            },
	            plugins: {
	                legend: {
	                    display: true
	                }
	            }
	        }
	    });
	}
	
	
	// IO 통계 출력부분
	function showIoChart(){
	    const ctx = document.getElementById('ioChart').getContext('2d');
	    
	    ioChart = new Chart(ctx, {
	        type: 'bar',
	        data: {
	            labels: ['10대', '20대', '30대', '40대', '50대', '60대', '70대 이상'],
	            datasets: [{
	                label: '섭취량',
	                data: [789, 762, 728, 705, 691, 638, 620],
	                backgroundColor: 'rgba(54, 162, 235, 1)',
	                stack: 'Stack 0',
	            }, {
	                label: '배출량',
	                data: [596, 581, 511, 476, 469, 405, 406],
	                backgroundColor: 'rgba(255, 99, 132, 1)',
	                stack: 'Stack 0',
	            }]
	        },
	        options: {
	            responsive: true,
	            scales: {
	                y: {
	                    beginAtZero: true
	                }
	            },
	            plugins: {
	                legend: {
	                    display: true
	                }
	            },
	            interaction: {
	                mode: 'index'
	            },
				stacked: true
			}
		});
	}
})
</script>