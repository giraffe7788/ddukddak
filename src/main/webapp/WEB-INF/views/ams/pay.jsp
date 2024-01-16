<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>

.f-16 {
	font-size: 16px;
}

.aside-ams-accept{
	width: 196px;
	border-radius: 16px 0px 0px 16px;
	background: var(--bg-02, #DBF2F4);
	height: 56px;
	border-right: 4px solid var(--ci-01, #0ABAB5);
	margin-left: 4px;
	color: var(--ci-01, #0ABAB5);
}

.pay-info-footer {
	margin-top: 40px;
	margin-right: 20px;
    justify-content: flex-end;
}

.pay-record-table {
	height: 373px;
    overflow: auto;
}

.btn-pay-state {
	width: 70px;	
    height: 25px;
    text-align: center;
}

.pay-wrap {
    display: flex;
    height: 840px;
    width: 1516px;
}

.patient-list-wrap {
	width: 850px;
	margin-right: 16px;
}

.pay-info-wrap {
	width: 650px;
}

.patient-list-header {
	border-bottom: 1px solid #EBEFF0;
    margin-left: -17px;
    width: 850px;
    height: 50px;
}

.pay-info-header {
	border-bottom: 1px solid #EBEFF0;
    margin-left: -17px;
    width: 650px;
    height: 50px;
}

.patient-list-body {
    max-height: 740px;
    overflow-y: scroll;
}

.pay-tr:hover{
	background-color: #F8F9FC;
}

.number {
	text-align: right;
}

.selected {
	background-color: #EDF8F9;
}

.filter-wrap {
    margin-top: -10px;
}

#payType {
	height:10px;
	width:200px;
}

#payNameSearch {
    width: 100px;
    height: 30px;
    margin-right: 10px;
    border-radius: 5px;
    border: solid 1px #e8e8e8;
}

#payDateRange {
    height: 30px;
    margin-right: 10px;
    border-radius: 5px;
    border: solid 1px #e8e8e8;
}

.nice-select {
	line-height: 30px !important;
	width: 100px !important;
    height: 30px !important;
    margin-right: 14px;
}

.h1-default {
	text-align: center;
	width: 100%;
	margin-top: 300px;
	color: #8D9EA5 !important;
	font-size: 2.5em !important;
}

.swal2-html-container {
	height: 150px;
}

#payType {
	margin-top: -2px;
	margin-left: -15px;
    height: 20px;
    width: 50px;
}

#payTypeSelect {
    margin-top: -2px;
    margin-left: -15px;
}

.leftMoney {
	margin-top: 25px;
	margin-bottom: 25px;
}

#payMoney {
	margin-bottom: 25px;
}

#payTypeSpan {
    margin-left: 145px;
}

</style>

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<link rel="stylesheet" href="/resources/css/nice-select.css" />

<!-- 영수증 -->
<div id="payReceiptModal" class="modal fade" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="left:-250px; width:1016px; top:16px;">
			<div class="modal-body" id="receiptImg">
				<img style="width: 1000px;" src="/resources/images/payReceipt.png">
			</div>

			<div class="modal-footer">
				<button id="printReceipt" type="button" class="dduk-btn-info" data-bs-dismiss="modal">출력</button>
				<button type="button" class="dduk-btn-normal" data-bs-dismiss="modal">닫기</button>
			</div>
			
			<img style="position:absolute;width: 24px;left: 310px;top: 60px;" src="/resources/images/icons/check2.png" />
			<img style="position:absolute;width: 24px;left: 410px;top: 60px;" src="/resources/images/icons/check2.png" />
			<div style="position:absolute; color:black; left:135px; top:117px;">20141201PA1502</div>
			<div style="position:absolute; color:black; left:367px; top:117px;">정미경</div>
			<div style="position:absolute; color:black; left:509px; top:117px;">2024&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1</div>
			<div style="position:absolute; color:black; left:624px; top:117px;">2024&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;14</div>
			<div style="position:absolute; color:black; left:170px; top:159px;">정형외과</div>
			<div style="position:absolute; color:black; left:361px; top:159px;">M0045</div>
			<div style="position:absolute; color:black; left:519px; top:159px;">405호</div>
			<div style="position:absolute; color:black; left:641px; top:159px;">일반</div>
			<div style="position:absolute; color:black; left:771px; top:159px;">2401-RC0121</div>
			
			<div style="position:absolute; color:black; left:294px; top:243px;">3,800</div>
			<div style="position:absolute; color:black; left:370px; top:243px;">11,200</div>
			
			<div style="position:absolute; color:black; left:287px; top:264px;">219,000</div>
			<div style="position:absolute; color:black; left:365px; top:264px;">821,800</div>
			
			<div style="position:absolute; color:black; left:435px; top:285px;">108,500</div>

			<div style="position:absolute; color:black; left:291px; top:306px;">12,000</div>
			<div style="position:absolute; color:black; left:368px; top:306px;">24,000</div>
			
			<div style="position:absolute; color:black; left:291px; top:327px;">42,900</div>
			<div style="position:absolute; color:black; left:367px; top:327px;">157,100</div>
			
			<div style="position:absolute; color:black; left:294px; top:348px;">8,000</div>
			<div style="position:absolute; color:black; left:368px; top:348px;">18,000</div>
			
			<div style="position:absolute; color:black; left:291px; top:369px;">35,200</div>
			<div style="position:absolute; color:black; left:368px; top:369px;">68,700</div>
			
			<div style="position:absolute; color:black; left:291px; top:433px;">32,100</div>
			<div style="position:absolute; color:black; left:368px; top:433px;">112,700</div>	
			
			<div style="position:absolute; color:black; left:291px; top:495px;">16,500</div>
			<div style="position:absolute; color:black; left:368px; top:495px;">42,500</div>
			
			<div style="position:absolute; color:black; left:291px; top:516px;">12,700</div>
			<div style="position:absolute; color:black; left:368px; top:516px;">27,900</div>
			<div style="position:absolute; color:black; left:498px; top:516px;">27,500</div>
			
			<div style="position:absolute; color:black; left:291px; top:656px;">13,100</div>
			<div style="position:absolute; color:black; left:368px; top:656px;">42,100</div>
			
			<div style="position:absolute; color:black; left:293px; top:821px;">395,300</div>
			<div style="position:absolute; color:black; left:373px; top:824px; font-size:11px;">1,326,000</div>		
			<div style="position:absolute; color:black; left:448px; top:824px; font-size:11px;">108,500</div>
			<div style="position:absolute; color:black; left:509px; top:824px; font-size:11px;">27,500</div>	
			
			<div style="position:absolute; color:black; left:821px; top:207px; font-size: 18px;">1,857,800</div>
			<div style="position:absolute; color:black; left:825px; top:249px; font-size: 18px;">531,300</div>
			<div style="position:absolute; color:black; left:825px; top:291px; font-size: 18px;">531,300</div>
			<div style="position:absolute; color:black; left:854px; top:335px; font-size: 18px;">0</div>
			<div style="position:absolute; color:black; left:833px; top:369px;">531,300</div>
			<div style="position:absolute; color:black; left:833px; top:432px;">531,300</div>
			<div style="position:absolute; color:black; left:855px; top:453px;">0</div>
		</div>
	</div>
</div>

<div class="pay-wrap">
	<div class="dduk-inner-border patient-list-wrap">
		<div class="dduk-title-area patient-list-header">
			<h1 style="margin-left: 16px;">수납 리스트</h1>
			<div class="filter-wrap">
				<select id="payType">
					<option>전체</option>
					<option>미수납</option>
					<option>부분수납</option>
					<option>수납완료</option>
				</select>
				<input type="text" id="payNameSearch" placeholder="이름검색" />
				<input type="text" id="payDateRange" placeholder="기간선택" />
			</div>
		</div>
		<div class="patient-list-body">
			<table class="table table-head-fixed text-nowrap table-pay-list" id="inventory-list">
	   			<thead>
					<tr>
						<th style="width: 80px;">수납상태</th>
						<th style="width: 80px;">환자명</th>
						<th style="width: 60px;">보험여부</th>
						<th style="width: 120px;">연락처</th>
						<th style="width: 60px;">수납시작일</th>
						<th style="width: 100px;">미수금액(원)</th>
						<th style="width: 100px;">납부금액(원)</th>
						<th style="width: 100px;">수납총액(원)</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
	</div>
	<div class="dduk-inner-border pay-info-wrap">
		<div class="dduk-title-area pay-info-header">
			<h1 style="margin-left: 16px;">수납 상세</h1>
		</div>
		<div class="pay-info-body">
			<h1 class="h1-default">수납을 선택해주세요</h1>
		</div>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/moment@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-moment@latest"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.nice-select.min.js"></script>
<script>
$(document).ready(function() {
	$('.aside-ams-accept').find('svg').find('path').attr('fill', '#0ABAB5');
	$('.aside-ams-accept').find('.dduk-nav-menu').css('color', '#0ABAB5');
});

$(function(){
	
	// 페이지 로딩시 최초 1번 수납 리스트를 DB에서 가져옴
	let payList = {};
	getPayList();
	
	// 가장 최근 클릭한 수납번호
	let currentPayNo = '';
	
	// 특정 수납 클릭시 남은 금액을 저장해둠
	let leftMoney = 0;
	
	// 영수증 출력을 위한VO들을 임시저장해놓고 영수증 버튼 클릭 시 출력
	let receiptData = {};
	
	function getPayList(){
    	$.ajax({
    		url: '/ams/getPayList',
    		dataType: 'json',
    		type: 'post',
    		beforeSend:function(xhr){
    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    		},
    		success: function(rst){
    			console.log('가져온 수납 리스트의 정보 : ', rst);
				payList = rst;
				// 수납 리스트 보여주기
				showPayList();
    		},
    		error: function(xhr, status, error){
    			console.log('Error:', xhr, status, error);
    		}
    	});
	}
	
	
	// 수납타입 필터에 niceselect 적용
	$('#payType').niceSelect();
	
	
	// 수납기간 필터에 dateRangePicker 적용
	$('#payDateRange').daterangepicker({
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
    	"opens": "right",
    	"buttonClasses": "btn-admission-range",
    	"applyButtonClasses": "btn-save-admission-range",
    	"cancelClass": "btn-cancel-admission-range"
	});
	$('#payDateRange').val('');
	
	
	// 필터 사용시 이벤트들
	$(document).on('change', '#payType', showPayList);
	$(document).on('input', '#payNameSearch', showPayList);
	$(document).on('change', '#payDateRange', showPayList);
	
	
	// 수납 리스트 출력
	function showPayList(){
		
		let tr = '';

		// 수납 리스트를 순회
		$.each(payList, function(index, vo){
			
			// 우선 결제 상태 필터링
			let payStateSelected = $('#payType :selected').val();
			let payState = vo.payState;
			
			if(payStateSelected === '미수납' && payState !== 'PMYN01') return;
			if(payStateSelected === '부분수납' && payState !== 'PMYN02') return;
			if(payStateSelected === '수납완료' && payState !== 'PMYN03') return;
			
			// 이름검색 필터링
			let nameVal = $('#payNameSearch').val();
			
			if(vo.patientVO.paName.indexOf(nameVal) === -1) return;
			
			// 기간검색 필터링
			let dateRange = $('#payDateRange').val();
			if(dateRange !== ''){
				let payStdt = new Date(vo.payStdt);
				let startDate = new Date(dateRange.split(' ~ ')[0]);
				startDate.setHours(0, 0, 0, 0);
				let endDate = new Date(dateRange.split(' ~ ')[1]);
				endDate.setHours(23, 59, 59, 999);
				// 선택 기간내에 수납시작날짜가 존재하지 않으면
				if(!(payStdt >= startDate && payStdt <= endDate)) return;
			}
			
			// 필터링으로 걸러진 데이터 출력
			// 수납 여부
			let payStateStr = '';
			if(payState === 'PMYN01') {
				payStateStr = '<button class="btn-pay-state dduk-btn-danger">미수납</button>';
			} else if(payState === 'PMYN02') {
				payStateStr = '<button class="btn-pay-state dduk-btn-disabled">부분수납</button>'
			} else if(payState === 'PMYN03') {
				payStateStr = '<button class="btn-pay-state dduk-btn-info">수납완료</button>'
			}
			
			// 보험 여부
			let hasInsr = '';
			if(vo.patientVO.paInsrYn === 'ISYN01') {
				hasInsr = 'O';
			} else if(vo.patientVO.paInsrYn === 'ISYN02') {
				hasInsr = 'X';
			}
			
			// 납부 금액 계산
			let payMn = 0;
			$.each(vo.payRecordVOList, function(i, prVO){
				payMn += prVO.prPaymn;
			});
			
			// 미수금 계산
			let leftMn = vo.payTotalmn - payMn;
			
			// 수납시작일
			let payStdt = formatDateString(vo.payStdt);
			
			tr += `
				<tr class="pay-tr" data-payno="\${vo.payNo}">
					<td class="dark-gray-text">\${payStateStr}</td>
					<td class="dark-gray-text">\${vo.patientVO.paName}</td>
					<td class="dark-gray-text">\${hasInsr}</td>
					<td class="dark-gray-text">\${vo.patientVO.paPh}</td>
					<td class="dark-gray-text">\${payStdt}</td>
					<td class="number dark-gray-text">\${leftMn}</td>
					<td class="number dark-gray-text">\${payMn}</td>
					<td class="number dark-gray-text">\${vo.payTotalmn}</td>
				</tr>
			`;
		});
		
		// 출력시킬 tr이 없으면
		if(tr === ''){
			tr += '<tr style="text-align:center"><td colspan="8" class="dark-gray-text">해당하는 데이터가 없습니다</td></tr>';
		} 
		
		$('.table-pay-list tbody').html(tr);
	}
	
	
	// 수납 리스트 클릭 이벤트
	$(document).on('click', '.pay-tr', function(){

		// 선택효과 적용
		$('.pay-tr').removeClass('selected');
		$(this).addClass('selected');
		
		// 수납 번호 가져오기
		let payNo = $(this).data('payno');
		// 최근 선택한 수납번호 갱신
		currentPayNo = payNo;
		// 수납 디테일 갱신
		updatePayDetail(payNo)
	});
	
	
	// 수납 디테일 갱신
	function updatePayDetail(payNo){
		// DB에 넣을 데이터
		let data = {
			'payNo' : payNo
		};
		
    	$.ajax({
    		url: '/ams/getPayDetail',
    		dataType: 'json',
    		data: data,
    		type: 'post',
    		beforeSend:function(xhr){
    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    		},
    		success: function(rst){
    			
    			console.log('수납번호 ', payNo, '의 수납 상세 : ', rst);
    			
    			// 우선 오른쪽 창의 깡통을 뿌려준다
    			
    			// 만약 수납이 완료된 친구면 영수증은 뿌려주면 안됨
    			let footerDiv = '';
    			if(rst.payState === 'PMYN03'){
    				footerDiv = `
    					<div class="dduk-row pay-info-footer">
		    				<button class="btn-pay dduk-btn-danger">영수증출력</button>
		    			</div>
    				`
    			} else {
    				footerDiv = `
    					<div class="dduk-row pay-info-footer">
		    				<button class="btn-pay dduk-btn-danger">영수증출력</button>
		    				<button class="btn-pay dduk-btn-info">수납</button>
		    			</div>
    				`
    			}
    			
    			let rightCont = `
    				<div class="dduk-title-area">
	    				<h2>환자 정보</h2>
	    			</div>
	    			<div class="dduk-inner-border record-content-fr record-scroll">
	    				<div class="patient-info-div">
	    					<div class="dduk-row" style="justify-content: space-between;">
	    						<h3 class="in-h2">이름 : <span id="paInfoName" class="dark-gray-text f-16"></span></h3>
	    						<h3 class="in-h2">성별 :  <span id="paInfoSex" class="dark-gray-text f-16"></span></h3>
	    						<h3 class="in-h2">생년월일 :  <span id="paBirthday" class="dark-gray-text f-16"></span></h3>
	    						<h3 class="in-h2">보험여부 :  <span id="paInfoInsrYn" class="dark-gray-text f-16"></span></h3>
	    					</div>
	    					<div class="dduk-row">
	    						<h3 class="in-h2">주소 : <span id="paHome" class="dark-gray-text f-16"></span></h3>
	    					</div>
	    				</div>
	    			</div>
	    			<div class="dduk-title-area" style="margin-top: 30px;">
	    				<h2>수납내역</h2>
	    			</div>
	    			<div class="pay-record-table">
	    				<table class="medicine-table" style="width: 550px; margin-left:33.5px;">
	    					<thead>
	    						<tr class="tr-padding tr-column">
	    							<th class="td-padding" style="width: 25%; color: #000">수납일시</th>
	    							<th class="td-padding" style="width: 25%; color: #000">수납방식</th>
	    							<th class="td-padding" style="width: 25%; color: #000">수납금액</th>
	    							<th class="td-padding" style="width: 25%; color: #000">미수금액</th>
	    						</tr>
	    					</thead>
	    					<tbody>

	    					</tbody>
	    				</table>
	    			</div>
	    			\${footerDiv}
    			`;
    			
    			$('.pay-info-body').html(rightCont);
				
    			// 영수증 출력을 위해 정보 담아두기
    			receiptData = rst;
    			
    			// 보험여부 설정
    			let insrYn = '';
    			if(rst.patientVO.paInsrYn === 'ISYN01'){
    				insrYn = 'O';
    			} else {
    				insrYn = 'X';
    			}
    			
    			// 우측 창에 환자정보 뿌려주기
    			$('#paInfoName').html(rst.patientVO.paName);
    			$('#paInfoSex').html(rst.patientVO.paSex);
    			$('#paBirthday').html(formatResidentNumber(rst.patientVO.paReg));
    			$('#paInfoInsrYn').html(insrYn);
    			let home = rst.patientVO.paAdd1 + ' ' + rst.patientVO.paAdd2 + ' ' + rst.patientVO.pzZip;
    			$('#paHome').html(home);
    			
    			// 수납상세 정보 뿌려주기
    			let tr = '';
    			
    			// 미수금 계산을 위한 수납전체금액 가져오기
    			let totalmn = rst.payTotalmn;
    			
    			// 수납 상세가 있으면 뿌려주고
    			if(rst.payRecordVOList.length !== 0){
    				
	    			$.each(rst.payRecordVOList, function(index, vo){
	    				
	    				// 미수금 계산
	    				totalmn -= vo.prPaymn;
	    				
	    				// 결제 종류
	    				let prType = '';
	    				if(vo.prPaytype === 'PSKD01') {
	    					prType = '카드';
	    				} else if(vo.prPaytype === 'PSKD02') {
	    					prType = '현금';
	    				} else if(vo.prPaytype === 'PSKD03') {
	    					prType = '이체';
	    				}
	    				
	    				tr += `
							<tr class="tr-padding">
								<td class="td-padding dark-gray-text">\${vo.prPaydt}</td>
								<td class="td-padding dark-gray-text">\${prType}</td>
								<td class="td-padding dark-gray-text">\${vo.prPaymn}</td>
								<td class="td-padding dark-gray-text">\${totalmn}</td>
							</tr>
	    				`;
	    			});
	    		// 없으면 기본 메시지 출력
    			} else {
    				tr += `
						<tr class="tr-padding"><td colspan="4" class="td-padding dark-gray-text" style="text-align: center">수납 이력이 없습니다</td></tr>
    				`;
    			}
    			
    			// 남은 금액 저장(수납시 사용)
    			leftMoney = totalmn;
    			
    			$('.pay-record-table tbody').html(tr);
    			
    			// 만약 수납이 끝나면 수납 버튼 삭제
    			if(leftMoney === 0){
    				// 수납 버튼 지우기
    				$('.btn-pay.dduk-btn-info').remove();
    			}
    			
    		},
    		error: function(xhr, status, error){
    			console.log('Error:', xhr, status, error);
    		}
    	});
	}
	
	
	// 수납 버튼 클릭 이벤트
	$(document).on('click', '.pay-info-footer .dduk-btn-info', function(){
		
		Swal.fire({
		    title: '수납',
		    html:
		    	'<div class="leftMoney">미수금 : '+leftMoney+'</div>' +
		        '<input type="number" id="payMoney" class="dduck-input swal-input" placeholder="결제금액">' +
		        '<div class="dduk-row">' +
		        '<span id="payTypeSpan">결제방식</span>' +
		    	'<select id="payTypeSelect">' +
		    	'<option value="PSKD01">카드</option>' +
		    	'<option value="PSKD02">현금</option>' +
		    	'<option value="PSKD03">이체</option>' +
		    	'</div>',
		    showCancelButton: true,
		    confirmButtonColor: '#0ABAB5',
		    cancelButtonColor: '#8D9EA5',
		    confirmButtonText: '확인',
		    cancelButtonText: '취소',
		    showClass: {
		        popup: `
		          animate__animated
		          animate__fadeInUp
		          animate__faster
		        `
		      },
		      hideClass: {
		        popup: `
		          animate__animated
		          animate__fadeOutDown
		          animate__faster
		        `
		    },
		    preConfirm: () => {
		    	
		    	const payMoney = parseInt(document.getElementById('payMoney').value);
		    	currentPayMoney = payMoney;
		        const payTypeSelect = document.getElementById('payTypeSelect').value;

		        // 입력값 검증
		        if(payMoney <= 0 || isNaN(payMoney)){
		            Swal.showValidationMessage("수납 금액은 0보다 커야합니다");
		            return false;
		        }
		        
		        if (payMoney > parseInt(leftMoney)) {
	        		Swal.showValidationMessage("수납 금액은 미수금보다 클 수 없습니다");
		            return false;
		        }
		        
		        return [payMoney, payTypeSelect]
		    }
		}).then((result) => {
			
			// 확인을 눌렀고 값이 잘 들어왔으면
		    if (result.value) {
		    	
		    	// 입력, 선택된 값들을 가져옴
		        const [payMoney, payTypeSelect] = result.value;
		    	
		    	// DB에 수납 내역을 넣는다
		    	let data = {
		    		'payNo' : currentPayNo,
		    		'prPaytype' : payTypeSelect,
		    		'prPaymn' : payMoney
		    	}
		    	
		    	$.ajax({
		    		url: '/ams/insertPayRecord',
		    		dataType: 'json',
		    		data: JSON.stringify(data),
		    		contentType: "application/json; UTF-8",
		    		type: 'post',
		    		beforeSend:function(xhr){
		    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		    		},
		    		success: function(rst){
		    			console.log('수납테이블에 ', data, '를 넣은 결과 : ', rst);
		    			
		    			// swal띄우기
		    			Swal.fire({
		    				title: '수납이 성공적으로 되었습니다!',
		    				icon: 'success',
		    				confirmButtonColor: '#0ABAB5',
		    				confirmButtonText: '확인'
		    			})
		    			
		    			// 기존의 미수금액 - 이번에 납부한 금액
		    			let inMoney = parseInt($('.pay-tr.selected').find('td').eq(5).text());
		    			inMoney -= payMoney;
		    			parseInt($('.pay-tr.selected').find('td').eq(5).text(inMoney));
		    			
		    			// 기존의 납부금액 + 이번에 납부한 금액
		    			let notMoney = parseInt($('.pay-tr.selected').find('td').eq(6).text());
		    			notMoney += payMoney;
		    			parseInt($('.pay-tr.selected').find('td').eq(6).text(notMoney));
		    			
		    			// 변경할 수납상태
		    			let payState = '';
		    			
		    			// 만약 지금 넣은과 남은 금액이 같으면(수납이 완료 됐으면) 수납상태를 완료로 변경
		    			if(payMoney === leftMoney){
		    				payState = 'PMYN03';
		    				// 선택돼있던 버튼을 수납 완료로 변경
		    				$('.pay-tr.selected').find('td').eq(0).html('<button class="btn-pay-state dduk-btn-info">수납완료</button>');
		    			// 아니면 수납상태를 부분수납으로 변경
		    			} else {
		    				payState = 'PMYN02';
		    				// 선택돼있던 버튼을 수납중으로 변경
		    				$('.pay-tr.selected').find('td').eq(0).html('<button class="btn-pay-state dduk-btn-disabled">부분수납</button>');
		    			}
		    			
		    			let payVO = {
		    				'payNo' : currentPayNo,
		    				'payState' : payState
			    		}
		    			
		    			// 수납 상태 갱신(수납중 or 수납완료)
	    		    	$.ajax({
	    		    		url: '/ams/updatePayState',
	    		    		dataType: 'json',
	    		    		data: JSON.stringify(payVO),
	    		    		contentType: "application/json; UTF-8",
	    		    		type: 'post',
	    		    		beforeSend:function(xhr){
	    		    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
	    		    		},
	    		    		success: function(rst){
	    		    			console.log('수납테이블에 ', data, '를 넣은 결과 : ', rst);
	    		    		},
	    		    		error: function(xhr, status, error){
	    		    			console.log('Error:', xhr, status, error);
	    		    		}
	    		    	});
		    			
		    			// 수납 디테일 갱신
		    			updatePayDetail(currentPayNo);

		    		},
		    		error: function(xhr, status, error){
		    			console.log('Error:', xhr, status, error);
		    		}
		    	});
		    }
		});
	});
	
	// 영수증 출력
	$(document).on('click', '.btn-pay.dduk-btn-danger', function(){
		$('#payReceiptModal').modal('show');
	});
	
	$(document).on('click', '#printReceipt', function(){
		// 프린트 팝업창 띄우기
		var sw = screen.width;
		var sh = screen.height;
		var w = 500; // 팝업창 가로길이
		var h = 500; // 세로길이
		var xpos = (sw - w) / 2; // 화면에 띄울 위치
		var ypos = (sh - h) / 2; // 중앙에 띄웁니다.
		var title = "영수증 출력";
		var pHeader = "<html><head><link rel='stylesheet' type='text/css' href='/Exp_admin/css/print.css'><title>" + title + "</title></head><body>";
		var pgetContent = document.getElementById("receiptImg").innerHTML + "<br>";
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
	
	// 유틸 스크립트 시작
	
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
	
	// 날짜형식 데이터를 넣으면 yyyy-MM-dd HH:mm 으로 변환해주는 함수
	function formatDateStringUpgrade(dateString) {
	    const dateData = new Date(dateString);
	    let year = dateData.getFullYear();
	    let month = dateData.getMonth() + 1; 
	    let date = dateData.getDate();
	    let hours = dateData.getHours();
	    let minutes = dateData.getMinutes();

	    // 한 자리 숫자에 0을 붙이는 처리
	    month = month < 10 ? '0' + month : month;
	    date = date < 10 ? '0' + date : date;
	    hours = hours < 10 ? '0' + hours : hours;
	    minutes = minutes < 10 ? '0' + minutes : minutes;

	    let dateStr = `\${year}-\${month}-\${date} \${hours}:\${minutes}`;

	    return dateStr;
	}
	
	
	// 날짜형식 데이터를 넣으면 HH:mm 으로 변환해주는 함수
	function formatTimeString(dateString) {
	    const dateData = new Date(dateString);
	    let hours = dateData.getHours();
	    let minutes = dateData.getMinutes();

	    // 한 자리 숫자에 0을 붙이는 처리
	    hours = hours < 10 ? '0' + hours : hours;
	    minutes = minutes < 10 ? '0' + minutes : minutes;

	    return `\${hours}:\${minutes}`;
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
	
	// 유틸 스크립트 끝
})
</script>