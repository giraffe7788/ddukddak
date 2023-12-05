<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
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
	display:flex;
	justify-content: space-around;
	color: #F8F9FC;
}

.div-info {
	display:flex;
	justify-content: space-around;
}

.div-info:hover {
	background-color: #EDF8F9;
}

.div-info p {
	margin-top:3%;
	margin-bottom:3%;
}

.color-gray {
	color: #8D9EA5;
}

.color-black {
	color: #333;
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
</style>

<div id="chart1" class="dduk-body-border chart1">
	<h2>대기환자</h2>
	<button type="button" id="test">환자추가해보기</button>
	<div class="div-info-top">
		<p class="color-gray info1">NO</p>
		<p class="color-gray info2">이름</p>
		<p class="color-gray info3">생년월일</p>
	</div>
</div>

<div class="dduk-body-border chart2">
	<h2>진료차트</h2>
	<hr class="myhr">
</div>

<div class="chart-wrap">
	<div class="dduk-body-border chart3">
		<h2>검사결과</h2>
	</div>

	<div class="dduk-body-border chart4">
		<h2>오더세트</h2>
	</div>
</div>

<script>
$(function(){
	
	// 최초 1번 대기목록 갱신
	// 굳이 Ajax를 이용해 동적으로 추가하는 이유는 Websocket을 이용해 실시간으로 대기 환자 갱신을 위해
	loadReceptionList();
	
	// 클릭된 대기환자 색깔 바꾸기\
	$(document).on("click", ".div-info", function() {
        // 이전에 선택된 요소의 클래스 초기화
        $(".div-info").removeClass("selected");
        // 현재 클릭한 요소에 select클래스 추가
        $(this).addClass("selected");
    });
	
	// 테스트용
	$('#test').on('click', loadReceptionList);
	
	// 환자 대기목록 갱신
	function loadReceptionList(){
		$.ajax({
			url: '/reception/getReceptionList',
			dataType: 'json',
			type: 'post',
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success: function(rst){
				console.log("rst", rst);
				
				$.each(rst, function(index){
					let paInfo = "";
					paInfo += '<div class="div-info"><p class="color-black info1">'+(index + 1)+'</p><p class="color-black info2">'+rst[index].paName+'</p><p class="color-black info3">'+ formatResidentNumber(rst[index].paReg) +'</p></div>';
// 	다영누나가 디자인 주면 그때 적용(지금은 내용이 싹사라짐)				$('#chart1').html("");
					$('#chart1').append(paInfo);
				});
			},
			error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
			}
		});
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
});
</script>