<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
/* 그래프 크기 변경 */
.aside-per-organ{
	width: 196px;
	border-radius: 16px 0px 0px 16px;
	background: var(--bg-02, #DBF2F4);
	height: 56px;
	border-right: 4px solid var(--ci-01, #0ABAB5);
	margin-left: 4px;
	color: var(--ci-01, #0ABAB5);
}

.dduk-body-1 {
    width: 493px;
    height: 468px;
}

.dduk-body-over1 {
	width: 463px;
	height: 948px;
}

/* monthpicker 설정 */
.icon-calendar {
	cursor:pointer;
	width: 24px;
	height: 24px;
}
.monthpicker-date {
	position: absolute;
	visibility:hidden;
}
#workingTimeDateIcon {
	margin-left: -652px;
    margin-top: -7.5px;
}
#workingTimeDate {
    margin-left: -792px;
    margin-top: -20px;
}
</style>

<link rel="stylesheet" href="/resources/css/jquery-ui.css">

<div class="dduk-body-border dduk-body-over1">
	<div class="dduk-title-area">
		<h2>인력 현황 </h2>
	</div>
	<div class="dduk-row">
		<canvas id="myChartOne"></canvas>
	</div>
	<div class="dduk-row">
		<canvas id="myChartTwo"></canvas>
	</div>	
	<div class="dduk-row">
		<canvas id="myChartThree"></canvas>
	</div>
</div>
	
<div class="dduk-dir-col">
	<div class="dduk-body-border dduk-body-1">
		<div class="dduk-title-area" style="margin-bottom: -8px;">
			<h2 class="schedualDate">인사 이동 </h2>
		</div>
		<div class="dduk-row">
			<canvas id="myChartFour"></canvas>
		</div>
	
	</div>
	
	<div class="dduk-body-border dduk-body-1" style="margin-top: 16px;">
		<div class="dduk-title-area" >
			<h2>휴가 및 병가 사용</h2>
		</div>
		<div class="dduk-row">
			<canvas id="myChartFive"></canvas>
		</div>
	</div>
	
</div>

<div class="dduk-body-border dduk-body-over1" style="width: 398px;">
	<div class="dduk-title-area">
		<h2>의사 근무 분포도</h2>
		<img id="workingTimeDateIcon" class="icon-calendar" src="/resources/images/icons/calendar.png"  alt="calendarIcon" style="margin-top: -9px; margin-left: -77px;">
		<div>
			<input id="workingTimeDate" class="monthpicker-date" type="text" style="margin-top: -15px; margin-left: -254px;" /> 
		</div>
		<div class="selected-month" style="margin-bottom: 10px;">1월</div>
	</div>
		<div class="chartSix"><canvas id="myChartSix"></canvas></div>
	<div class="dduk-title-area">
		<h2>간호사 근무 분포도</h2>
		<img id="workingTimeDateIcon2" class="icon-calendar" style="margin-top: -8px; margin-left: -70px;" src="/resources/images/icons/calendar.png" alt="calendarIcon">
		<div>
			<input id="workingTimeDate2" class="monthpicker-date" style="margin-top: -17px; margin-left: -254px;" type="text" /> 
		</div>
		<div class="selected-month2" style="margin-bottom: 10px;">1월</div>
	</div>
		<div class="chartSeven"><canvas id="myChartSeven"></canvas></div>
</div>

<!-- jQuery 및 jQuery UI -->
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<!-- chart.js 및 관련 종속성 -->
<script src="/resources/script/jquery.mtz.monthpicker.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js/dist/chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-date-fns/dist/chartjs-adapter-date-fns.bundle.min.js"></script>
  
<script>
$(document).ready(function() {
	$('.aside-per-organ').find('svg').find('path').attr('fill', '#0ABAB5');
	$('.aside-per-organ').find('.dduk-nav-menu').css('color', '#0ABAB5');
});

const myChartOne = document.getElementById('myChartOne');
const myChartTwo = document.getElementById('myChartTwo');
const myChartThree = document.getElementById('myChartThree');
const myChartFour = document.getElementById('myChartFour');
const myChartFive = document.getElementById('myChartFive');
const myChartSix = document.getElementById('myChartSix');
const myChartSeven = document.getElementById('myChartSeven');
const myChartEight = document.getElementById('myChartEight');

//받아올 데이터를 저장할 배열 전역변수 선언
let chartLabels = [];
let chartLabels2 = []; 
let chartData = [];
let chartData2 = [];
let chartData3 = [];
let chartData4 = []; 
let chartData5 = []; 
let month;
let selectedMonth;
let selectedMonth2;
// 현재 날짜 가져오기
const date = new Date();
const currentMonth = ('0' + (date.getMonth() + 1)).slice(-2);

// 연도별 입사/퇴사 사원 저장 변수
let empListData = '';

$(function(){
	$('.aside-trea-organ').find('svg').find('path').attr('fill', '#0ABAB5');
	
	$('.dduk-nav-li').mouseleave(
		function()	{
			 $('.aside-trea-organ').find('svg').find('path').attr('fill', '#0ABAB5');
		}	
	);
	
	$('.aside-trea-organ').find('.dduk-nav-menu').css('color', '#0ABAB5'); 
	
	// 월별 조회용 달력 - 의사 근무
	if(selectedMonth == null){
		$("#myChartSix").css('display', 'none');
		$(".selected-month").css('visibility', 'hidden');
	}
	
	$("#workingTimeDate").monthpicker({
		pattern: 'yyyy-mm',
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		selectedYear: 2024,
		startYear : 1990,
		finalYear : 2100,
		openOnFocus : true
	});
	$(document).on('click', '#workingTimeDateIcon', function(){
		$("#workingTimeDate").monthpicker('show');
	});
	$(document).on('change', '#workingTimeDate', function(){
		// 이전 그래프 지우기
		$('#myChartSix').remove();
		// 새 거 만들어서 보이게
		$('.chartSix').append('<canvas id="myChartSix"><canvas>');
		$("#myChartSix").css('display', 'block');
		// 선택한 달 변수 설정
		selectedMonth = $(this).val().substr(5, 2);
		// 상단에 고른 달 표시
		$(".selected-month").html(selectedMonth+'월');
		$(".selected-month").css('visibility', 'visible');
		console.log(selectedMonth);
		month = selectedMonth;
		docSchListA();
	});
	
	// 월별 조회용 달력 - 간호사 근무
	if(selectedMonth == null){
		$("#myChartSeven").css('display', 'none');
		$(".selected-month2").css('visibility', 'hidden');
	}
	
	$("#workingTimeDate2").monthpicker({
		pattern: 'yyyy-mm',
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		selectedYear: 2024,
		startYear : 1990,
		finalYear : 2100,
		openOnFocus : true
	});
	$(document).on('click', '#workingTimeDateIcon2', function(){
		$("#workingTimeDate2").monthpicker('show');
	})
	$(document).on('change', '#workingTimeDate2', function(){
		// 이전 그래프 지우기
		$('#myChartSeven').remove();
		// 새 거 만들어서 보이게
		$('.chartSeven').append('<canvas id="myChartSeven"><canvas>');
		$("#myChartSeven").css('display', 'block');
		// 선택한 달 변수 설정
		selectedMonth2 = $(this).val().substr(5, 2);
		// 상단에 고른 달 표시
		$(".selected-month2").html(selectedMonth2+'월');
		$(".selected-month2").css('visibility', 'visible');
		console.log(selectedMonth2);
		month = selectedMonth2;
		nurSchListA();
	});
	
	
	// 그래프 로딩
	workingEmpListA();
	inOutEmpListA();
	genEmpListA();
	// 월별 선택 가능한 그래프는 일단 현재 월로 그래프 보여주기
	$("#myChartSix").css('display', 'block');
	$("#myChartSeven").css('display', 'block');
	month = currentMonth;
	docSchListA();
	nurSchListA();
});

new Chart(document.getElementById("myChartFive"), {
  type: 'line',
  data: {
    labels: ['23-07', '23-08', '23-09', '23-10', '23-11', '23-12', '24-01',],
    datasets: [{ 
        data: [5.4, 5.8, 2.1, 1.2, 0.8, 2.5, 1.5],
        label: "휴가",
        borderColor: "#3e95cd",
        fill: false
      }, { 
        data: [2.0, 2.8, 1.3, 1.1, 1.8, 1.0, 0.2],
        label: "병가",
        borderColor: "#3cba9f",
        fill: false
      }]
  },
  options: {
	  plugins: {
          legend: {
              display: true,
				position: 'bottom'
          }
      }
  }
});

function workingCurrentEmpByYearA(){
	
	let inEmpCount = [];
	let outEmpCount = [];
	
	// 우선 입사/퇴사 데이터 쪼개놓기
	$.each(empListData, function(index, row){
		// 만약 입사데이터가 있으면 입사 카운트임
		if(row.JOINEMPCOUNT !== null && row.JOINEMPCOUNT !== undefined){
			inEmpCount.push(row);
		} else {
			outEmpCount.push(row);
		}
	});
	
	let totalEmpCount = 0;
	let chartLabels2 = [];
	let chartData2 = []; 
	
	// 입사 데이터 반복
	$.each(inEmpCount, function(k, v){
		
		// 만약 첫번째 년도 출력이 아니면서
		if(k !== 0){
			// 올해년도 - 작년년도가 1보다 크면(년도가 한번 스킵된 경우) 
			if(v.JOINYEAR - chartLabels2[chartLabels2.length-1] > 1){
				
				let outEmployee = empListData.find(emp => emp.OUTYEAR === String(v.JOINYEAR - 1));
				
				// 해당 입사년도에 퇴사자가 있다면
				if(outEmployee){
					totalEmpCount -= outEmployee.OUTEMPCOUNT;
				}

				// 올해 -1 년도 데이터를 Labels2에 넣어줌
				chartLabels2.push(v.JOINYEAR - 1);
				chartData2.push(totalEmpCount);
			}
		}
		
		// 입사데이터가 존재하면
		if (v.JOINYEAR !== undefined) {
	        var joinIndex = chartLabels2.indexOf(v.JOINYEAR);
	        if (joinIndex === -1) {
	            chartLabels2.push(v.JOINYEAR);
	            totalEmpCount += v.JOINEMPCOUNT;
	        } else {
	        	totalEmpCount += v.JOINEMPCOUNT;
	        }
		}
		
		let outEmployee = empListData.find(emp => emp.OUTYEAR === v.JOINYEAR);
		
		// 해당 입사년도에 퇴사자가 있다면
		if(outEmployee){
			totalEmpCount -= outEmployee.OUTEMPCOUNT;
		}
		
	    chartData2.push(totalEmpCount);
	});
	
	console.log(chartLabels2);
	console.log(chartData2);
	
	
	new Chart(myChartOne, {
		type: 'line',
		data : {
				labels: chartLabels2,
				datasets: [{
					data: chartData2,
					borderWidth: 3
				}]
			},
		options: {
			plugins: {
				legend: {
			        display: false
			    },
	            title: {
	                display: true,
					size : 30,
	                text: '년도별 전체 직원 수'
	            }
	        }
		}
	});
}


// 부서별 사원 분포
function workingEmpListA(){
	$.ajax({
		url: '/hrd/workingEmpListA',
		dataType:'JSON',
		success:function(rst){
			$.each(rst, function(k, v){
				chartLabels.push(v.COM_DET_CODE_NM);
				chartData.push(v.EMPLOYEE_COUNT);
			});
			
			chartData = {
				labels: chartLabels,
				datasets : [{
                       label : "부서별 사원 수",
                       backgroundColor: ['#4377d1','#1ddecb','#36d691','#f5ef45','#ffb947'],
                       borderColor: "#dedede",
                       pointHoverBackgroundColor: "#dedede",
                       pointHoverBorderColor: "#787878",
                       fill: false,
                       borderWidth: 2,
                       data : chartData
                   }]
			};
				
			new Chart(myChartTwo, {
				type: 'doughnut',
				data: chartData,
				options: {
					layout: {
			            padding: {
			                top: 30
			            }
			        },
			        plugins: {
			            legend: {
			                display: true,
							position: 'bottom',
			                labels: {
			                    color: 'rgb(5, 99, 13)'
			                }
			            },
						title: {
			                display: true,
							size : 30,
			                text: '부서별 직원 분포'
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

// 연도별 입사+퇴사 현황
function inOutEmpListA(){
	$.ajax({
		url: '/hrd/inOutEmpListA',
		dataType:'JSON',
		success:function(rst){
			
			// 다른 함수에서도 가져온 데이터 쓸 수 있게
			empListData = rst;
			
			// 입사년도의 길이만 구하기
			let inEmpCount = [];
			let outEmpCount = [];
			
			// 우선 입사/퇴사 데이터 쪼개놓기
			$.each(rst, function(index, row){
				// 만약 입사데이터가 있으면 입사 카운트임
				if(row.JOINEMPCOUNT !== null && row.JOINEMPCOUNT !== undefined){
					inEmpCount.push(row);
				} else {
					outEmpCount.push(row);
				}
			});
			
			//console.log("inOutEmpListA : ", rst);
			chartLabels2 = []; 
			chartData2 = []; 
			chartData3 = [];
			console.log('출력해야할 데이터 : ', rst);
			for(let i = 0; i<inEmpCount.length; i++){
				
				// 만약 첫번째 년도 출력이 아니면서
				if(i !== 0){
					// 올해년도 - 작년년도가 1보다 크면(년도가 한번 스킵된 경우) , 입사자가 없으면 스킵이 됩니다
					if(rst[i].JOINYEAR - chartLabels2[chartLabels2.length-1] > 1){
						
						let outEmployee = empListData.find(emp => emp.OUTYEAR === String(rst[i].JOINYEAR - 1));
						console.log('작년 데이터 : ', outEmployee);
						// 작년 입사년도에 퇴사자가 있다면
						if(outEmployee){
							
							// 올해-1 년도 데이터를 Labels3에 넣어줌
							chartLabels2.push(rst[i].JOINYEAR - 1);
							chartData2.push(0);
							chartData3.push('-' + outEmployee.OUTEMPCOUNT);
						}
					}
				}
				
				// 해당년도에 입사자가 있을 때
				if (rst[i].JOINYEAR !== undefined) {
			        var joinIndex = chartLabels2.indexOf(rst[i].JOINYEAR);
			        if (joinIndex === -1) {
			            chartLabels2.push(rst[i].JOINYEAR);
			            chartData2.push(rst[i].JOINEMPCOUNT);
			        } else {
			            chartData2[joinIndex] += rst[i].JOINEMPCOUNT;
			        }
			    }
			    
				// 해당년도에 퇴사자가 있는지 확인
				let outEmployee = empListData.find(emp => emp.OUTYEAR === rst[i].JOINYEAR);
				
				// 해당 년도에 입사자와 퇴사자가 모두 있을 때
			    if (outEmployee && rst[i].JOINYEAR != undefined) {
		            chartData3.push("-" + outEmployee.OUTEMPCOUNT);
		            
		        // 해당 년도에 퇴사자가 없을 때
			    } else if(!outEmployee){
			    	chartData3.push(0);
			    }
			}
			const barChart = document.getElementById("myChartFour").getContext('2d');
			new Chart(barChart, {
				type: 'bar',
				data: {
					labels: chartLabels2,
					datasets: [{
						label: '입사',
						data: chartData2,
						backgroundColor: ['rgb(54, 162, 235)', 'hsla(204, 82%, 57%, 0.5)'],
						borderWidth: 1
					},{
						label: '퇴사',
						data: chartData3,
						backgroundColor: ['rgba(255, 99, 132, 0.5)', 'rgba(255, 99, 132, 1)'],
						borderWidth: 1
					}]
				},
				options: {
					responsive: true,
					plugins: {
						legend: { position: 'bottom'},
						scales: {
							xAxes: [{
								gridLines: {
									offsetGridLines: false
								}
							}],
							yAxes: [{
								gridLines: {
									offsetGridLines: true
								}
							}]
						},
			            title: {
			                display: true,
			                text: '년도별 입사 / 퇴사 현황'
			            }
			        }
				}
			});
			
			// 가져온 입/퇴사 데이터를 토대로 옆에 그래프도 그림
			workingCurrentEmpByYearA();
		},
		error: function(xhr, status, error){
			console.log('Error:', xhr, status, error);
		}
	});
}

// 부서별 성비
function genEmpListA(){
	$.ajax({
		url: '/hrd/genEmpListA',
		dataType:'JSON',
		success:function(rst){
			//console.log("genEmpListA : ", rst);
			chartLabels = [];
			chartData = [];
			chartData2 = [];
			prevDept = '';

			$.each(rst, function(k, v){
				// 과 리스트
				if(prevDept !== v.DEPT){
					chartLabels.push(v.DEPT);
				}
				prevDept = v.DEPT;
				// 성별 따라 다른 리스트
				if(v.GEN === '남자'){
					chartData.push(v.EMP_COUNT);
				} else {
					chartData2.push(v.EMP_COUNT);
				}
			});
			
			let lineChart = new Chart(myChartThree, {
				type: 'bar',
			    data: {
					labels: chartLabels,
					datasets: [{
						label: '남자',
						data: chartData,
						backgroundColor: ['#a7db63'],
						borderWidth: 1
					},{
						label: '여자',
						data: chartData2,
						backgroundColor: ['#9678cc'],
						borderWidth: 1
					}]
				}, 
				options: {
					layout: {
			            padding: {
			                top: 30
			            }
			        },
					scales: {
						x: {
							stacked : true
						},
						y: {
							stacked : true
						}
					},
			        plugins: {
			            legend: {
			                display: true,
							position: 'bottom',
			                labels: {
			                    color: 'rgb(255, 99, 132)'
			                }
			            },
						title: {
			                display: true,
							size : 30,
			                text: '부서별 성비'
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

// 의사 일정 분포도
function docSchListA(){
	let docSchListAData = { month : month};
	console.log("docSchListAData : ", docSchListAData);
	
	$.ajax({
		url: '/hrd/docSchListA',
		data : docSchListAData,
		dataType : 'json',
		success:function(rst){
			console.log(rst);

			chartLabels = [];
			chartData = [];
			chartData2 = [];
			
			$.each(rst, function(i, val){
				chartLabels.push(val.DS_CATE);
				chartData.push(val.DOCSCHCOUNT);
			});

			new Chart(document.getElementById("myChartSix"), {
					type: 'polarArea',
					data: {
						labels: chartLabels,
						datasets: [{
							label: "해당 근무 인원",
							data: chartData,
							backgroundColor: [
							  'rgb(255, 99, 132)',
							  'rgb(75, 192, 192)',
							  'rgb(255, 205, 86)',
							  'rgb(201, 203, 207)',
							  'rgb(54, 162, 235)'
							]
						}]
					   
					},
					options: {
						scales: {
							x: {
								type: 'time',
								time: {
									unit: 'month'
								}
							}
						},
						plugins: {
							legend: { position: 'bottom' }
						}
					}
			});
		},error: function(xhr, status, error){
			console.log('Error:', xhr, status, error);
		}
	});
}

// 간호사 일정 분포
function nurSchListA(){
	let nurSchListAData = { month : month};
	console.log("nurSchListAData : ", nurSchListAData);
	
	$.ajax({
		url: '/hrd/nurSchListA',
		data : nurSchListAData,
		dataType:'JSON',
		success:function(rst){
			chartLabels = [];
			chartData = [];
			
			console.log(rst);
			
			$.each(rst, function(k, v){
				chartLabels.push(v.GEN);
				chartData.push(v.NURCOUNT);
			});
			
			chartData = {
				labels: chartLabels,
				datasets : [{
                       label : chartLabels,
                       backgroundColor: ['#4377d1','#1ddecb','#36d691','#f5ef45','#ffb947'],
                       borderColor: "#dedede",
                       pointHoverBackgroundColor: "#dedede",
                       pointHoverBorderColor: "#787878",
                       fill: false,
                       borderWidth: 2,
                       data : chartData
                   }]
			};
				
			new Chart(myChartSeven, {
				type: 'pie',
				data: chartData,
				options: {
					layout: {
			            padding: {
			                top: 30
			            }
			        },
			        plugins: {
			            legend: {
			                display: true,
							position: 'bottom'
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


</script>