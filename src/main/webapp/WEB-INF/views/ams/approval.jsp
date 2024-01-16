<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<style>
/* 어사이드 강조 */
.aside-ams-appro{
	width: 196px;
	border-radius: 16px 0px 0px 16px;
	background: var(--bg-02, #DBF2F4);
	height: 56px;
	border-right: 4px solid var(--ci-01, #0ABAB5);
	margin-left: 4px;
	color: var(--ci-01, #0ABAB5);
}
th{
	font-size:1.2em;
	text-align: center;
}
td{
	text-align: center;
}
.left-align{
	text-align: left;
}
.left-div{
	width: 984px;
}
.right-div{
	width: 592px;
}
.search{
	background-image: url(/resources/images/Search.png);
	background-repeat: no-repeat;
	background-position: 260px center;
	width: 312px;
	height: 36px;
	margin-left: 8px;
}
#search-div{
	gap-left: 30px;
}
.container {
	display: flex;
	justify-content: space-between;
	align-items: center;
}
.number, .order{
	text-align: right;
}
.dduck-input{
	width: 70px;
	height: 25px;
}
.dduk-row{
	margin-bottom: 10px;
}
.list {
	display: none;
}
.list.active {
	display: block;
}
.tab.active {
  border-bottom: 3px solid var(--ci-01, #0ABAB5);
}
#total-price1, #total-price2{
    width: 300px;
    height: 35px;
   	margin-top: 1.5px;
   	text-align: right;
   	font-size: 1.5em;
 	padding-right: 16px;
}
#total-span{
	font-size: 1.4em;
}
.total, .approval{
	display: none;
}
.total.active, .approval.active{
	display: flex;
	border-top: 2px solid #D5D9DB;
	height: 70px;
	align-items: center;
}
/* 자동 완성 창 */
.autocomplete{
	position: absolute;
	z-index: 1;
	left: 530px;
	top: 175px;
}
.autocomplete > div.active {
/* 	background: #e0e5f6; */
	background: #0ABAB5;
	color: #000;
	width: 290px;

}
.autocomplete > div {
/* 	background: #f1f3f499; */
	background: #e0e5f6;
	padding: .2rem .6rem;
	width: 290px;
}
.order-tr:hover{
    background-color: #EDF8F9 !important;
    cursor: pointer;
}
.order-tr.selected{
	background-color: #EDF8F9 !important;
}
.table{
--bs-table-bg: #fff0;
}
</style>
<body>
	<div class="dduk-body-border left-div">
		<div class="dduk-row" style="margin-left: 10px;">
			<div id="inner-tab2" class="tab"><h1>발주 리스트</h1></div>
<!-- 			<div id="search-div"> -->
<!-- 				<input type="text" class="dduck-input search" id="search"  -->
<!-- 				style="width: 300px; height: 30px; margin-bottom: 15px;"/> -->
<!-- 				<div class="autocomplete"></div> -->
<!-- 			</div> -->
		</div>
		<div class="card-body table-responsive p-0" style="height: 760px;">
			<!-- 발주 리스트 테이블 -->
			<table class="table table-head-fixed text-nowrap list active" id="order-list">
				<thead>
					<tr>
						<th style="width: 150px;">발주번호</th>
						<th style="width: 150px;">신청자</th>
						<th style="width: 200px;">신청일자</th>
						<th style="width: 150px;">1차결재자</th>
						<th style="width: 150px;">최종결재자</th>
						<th style="width: 150px;">결재상태</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="purchaseMedicineVO"
						items="${purchaseMedicineVOList}">
						<tr class="order-tr">
							<td class="gray-text">${purchaseMedicineVO.prmeNo}</td>
							<td class="gray-text">${purchaseMedicineVO.prmeApplName}</td>
							<td class="gray-text"><fmt:formatDate value="${purchaseMedicineVO.prmeDt}"
									pattern="yyyy-MM-dd" /></td>
							<td class="gray-text">${purchaseMedicineVO.prmeAtrlFstName}</td>
							<td class="gray-text">${purchaseMedicineVO.prmeAtrlSecName}</td>
							<c:choose>
								<c:when test="${purchaseMedicineVO.prmeAtrlStat=='PMST01'}">
									<td class="gray-text">결재대기</td>
								</c:when>
								<c:when test="${purchaseMedicineVO.prmeAtrlStat=='PMST02'}">
									<td class="gray-text">1차승인</td>
								</c:when>
								<c:when test="${purchaseMedicineVO.prmeAtrlStat=='PMST03'}">
									<td class="gray-text">최종승인</td>
								</c:when>
								<c:when test="${purchaseMedicineVO.prmeAtrlStat=='PMST04'}">
									<td class="gray-text">반려</td>
								</c:when>
							</c:choose>
							
						
						<c:forEach var="detailVO"
							items="${purchaseMedicineVO.purchaseMedicineDetailVOList}">

							<input type="hidden" value="${detailVO.mediCd}"
								class="medicine-code" />
							<input type="hidden" value="${detailVO.prmeQt}"
								class="medicine-quantity" />

						</c:forEach>
						</tr>
					</c:forEach>
				</tbody>
			</table>
 			<!-- 발주 리스트 테이블 끝 -->
			<!-- 약품 리스트 시작 -->
			<table class="table table-head-fixed text-nowrap list active" id="inventory-list" style="display: none;">
	   			<thead>
					<tr>
						<th style="width: 70px;"><input type="checkbox" id="check-all-item"/> 전체</th>
						<th style="width: 80px;">약품코드</th>
						<th style="width: 80px;">분류</th>
						<th style="width: 110px;">약품명</th>
						<th style="width: 150px;">제조사</th>
						<th style="width: 170px;">상세</th>
						<th style="width: 60px;">함량</th>
						<th style="width: 60px;">재고</th>
						<th style="width: 70px;">가격</th>
						<th style="width: 80px;">보험적용</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach var="medicine" items="${medicineVOList}">
					<tr class="inventory-tr">
						<td><input type="checkbox" class="inventory-check"/></td>
						<td class="gray-text">${medicine.mediCd}</td>
						<td class="gray-text">${medicine.mediType}</td>
						<td class="gray-text left-align">${medicine.mediNm}</td>
						<td class="gray-text left-align">${medicine.mediMaker}</td>
						<td class="gray-text left-align">${medicine.mediDetail}</td>
						<td class="number gray-text"><fmt:formatNumber value="${medicine.mediCont}" pattern="#,##0"/> cc</td>
						<td class="number gray-text"><fmt:formatNumber value="${medicine.mediStock}" pattern="#,##0" /></td>
						<td class="number gray-text"><fmt:formatNumber value="${medicine.mediPrice}" pattern="#,##0" /></td>
						<c:choose>
							<c:when test="${medicine.insuYn=='INYN01'}">
								<td class="inyn gray-text">O</td>
							</c:when>
							<c:otherwise>
								<td class="inyn gray-text">X</td>
							</c:otherwise>
						</c:choose>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 약품 리스트 끝 -->
		</div>
	</div>
	
	<div class="dduk-body-border right-div">
		<div class="container dduk-row">
			<h1>발주서</h1>
		</div>
		<div class="card-body table-responsive p-0" style="height: 700px;">
			<table class="table table-head-fixed text-nowrap" id="order-table">
				<thead style="position:sticky; top: 0;  background-color: #fff;">
					<tr>
						<th>약품코드</th>
						<th>약품명</th>
						<th>제조사</th>
						<th>가격</th>
						<th>수량</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</div>
		<div class="approval active">
			<div class="container">
				<span id="total-span">합계 :</span><input type="text" class="dduck-input" id="total-price2" disabled/>
				<sec:authorize access="hasRole('ROLE_AMS')">
					<button class="dduk-btn-active" id="secondApprovePurchase" style="height: 35px;">결재</button>
					<button class="dduk-btn-danger" id="denyPurchase" style="height: 35px;">반려</button>
				</sec:authorize>
				<sec:authorize access="!hasRole('ROLE_AMS')">
					<button class="dduk-btn-disabled" id="" style="height: 35px;">권한 없음</button>
				</sec:authorize>
			</div>
		</div>
	</div>
<script>
//검색 로직 시작 =================================================
// var dataList = [];

// //재고의 모든 tr 요소 변수에 담기
// var inventoryTrs = [];
// inventoryTrs = document.querySelectorAll('.inventory-tr');

// //tr의 갯수만큼 tr의 3번째 자식 요소 약품 이름을 dataList에 담는다(검색에 활용)
// for(let i = 0; i < inventoryTrs.length; i++){
// 	let str = "";
// 	str += inventoryTrs[i].children[3].innerText;
// 	dataList.push(str);
// }

// const $search = document.querySelector("#search");
// const $autoComplete = document.querySelector(".autocomplete");

// let nowIndex = 0;

// $search.onkeyup = (event) => {
// 	// 검색어
// 	var value = $search.value.trim();
	
// 	// 자동완성 필터링
// 	const matchDataList = value
// 	  ? dataList.filter((label) => label.includes(value))
// 	  : [];
	
// 	switch (event.keyCode) {
// 		// UP KEY
// 		case 38:
// 	    nowIndex = Math.max(nowIndex - 1, 0);
// 	    break;
	
// 		// DOWN KEY
// 		case 40:
// 	    nowIndex = Math.min(nowIndex + 1, matchDataList.length - 1);
// 	    break;
	
// 		// ENTER KEY
// 		case 13:
// 		value = matchDataList[nowIndex];
// 		document.querySelector("#search").value = matchDataList[nowIndex];
// 	    for(let i = 0; i < inventoryTrs.length; i++){
// 			if(inventoryTrs[i].children[3].innerText == value){
// 				inventoryTrs[i].classList.add('searched');
// 				inventoryTrs[i].style.display = ''
// 				inventoryTrs[i].style.visibility = 'visible';
// 				}else{
// 					inventoryTrs[i].style.display = 'none';
// 				}
// 			}
	    
// 	    nowIndex = 0;
// 	    matchDataList.length = 0;
// 	    break;
	    
// 		// 그외 다시 초기화
// 		default:
// 	    nowIndex = 0;
// 	 	// 일정 시간 후 실행할 함수 호출 (예: 3초 후)
// 	    setTimeout(doSomethingAfterTime, 5000); // 밀리초 단위로 시간을 설정합니다 (1000ms = 1초)
// 	    break;
	    
// 	}
//   // 리스트 보여주기
//   showList(matchDataList, value, nowIndex);
// };

// const showList = (data, value, nowIndex) => {
//   // 정규식으로 변환
//   const regex = new RegExp("(" + value + ")", "g");
  
//   $autoComplete.innerHTML = data
//   .map(function(label, index) {
//     return "<div class='" + (nowIndex === index ? "active" : "") + "'>" +
//       label.replace(regex, "<mark>$1</mark>") +
//       "</div>";
//   })
//   .join("");
// };

// // 시간이 지난 후 실행할 함수
// function doSomethingAfterTime() {
//     // 실행할 작업 추가
//     console.log('일정 시간이 경과했습니다.');
//     for(let i = 0; i < inventoryTrs.length; i++){
// 		inventoryTrs[i].classList.remove('searched');
// 		inventoryTrs[i].style.display = ''
// 		inventoryTrs[i].style.visibility = 'visible';
// 	}
// }
// //검색 로직 끝 =================================================

//aside 설정
$(document).ready(function() {
	$('.aside-ams-appro').find('svg').find('path').attr('fill', '#0ABAB5');
	$('.aside-ams-appro').find('.dduk-nav-menu').css('color', '#0ABAB5');
});
	
// table 요소 변수에 담기
const orderTable = document.getElementById('order-table');

//.order 변수에 담기
var orderInputs = document.querySelectorAll('.order');
//합계 변수 담기
const totalPrice2 = document.getElementById('total-price2');
var inventoryTrs = document.querySelectorAll('.inventory-tr');

//발주 목록 클릭 시 강조 이벤트
let orderTrs = document.querySelectorAll('.order-tr');
var prmeNo = "";

//클릭된 발주의 디테일을 보여주는 이붼트
orderTrs.forEach(function(tr) {
    tr.addEventListener('click', function(event) {
    	
    	// 발주서 비우기
    	var tempTrList = orderTable.querySelectorAll('.temp-tr');

    	tempTrList.forEach(function(tempTr) {
    	    tempTr.remove();
    	})
    	
        // 모든 tr에서 'selected' 클래스 제거
        orderTrs.forEach(function(tr) {
            tr.classList.remove('selected');
        });

        // 클릭된 요소에서 가장 가까운 tr 요소 찾기
        var selectedTr = event.target.closest('tr');
        
        // prmeNo에 발주번호 넣기
        prmeNo = selectedTr.firstElementChild.innerText;

        // 클릭된 tr에 'selected' 클래스 추가
        selectedTr.classList.add('selected');
        
        var mediCdList = [];
        var prmeQtList = [];

        mediCdList = selectedTr.querySelectorAll('.medicine-code');
        prmeQtList = selectedTr.querySelectorAll('.medicine-quantity');

        var jsonData = {}; // 클릭된 tr의 데이터를 저장할 JSON 객체

        mediCdList.forEach(function(input, index) {
            // mediCdList와 prmeQtList의 값 추출하여 JSON에 추가
            jsonData['mediCd' + (index + 1)] = input.value;
        });

        prmeQtList.forEach(function(input, index) {
            jsonData['prmeQt' + (index + 1)] = input.value;
        });

        //생성해야 할 tr 갯수
        var trNo = Object.keys(jsonData).length/2
        
        var mediName;
       	var mediMaker;
       	var mediPrice;
        // 새로운 tr 요소 생성
        for(let i = 1; i < trNo+1; i ++){
        	
			inventoryTrs.forEach(function(tr, index){
				if(tr.children[1].textContent==jsonData["mediCd"+i]){
					mediName = tr.children[3].textContent
					mediMaker = tr.children[4].textContent
					mediPrice = tr.children[8].textContent
				}
			});        	
        	
	        var newTr = document.createElement('tr');
	        newTr.classList.add('temp-tr');
	        
	        // 내용 추가 (예시로 '새로운 데이터' 텍스트를 추가함)
	        var newTd1 = document.createElement('td');
	        newTd1.textContent = jsonData["mediCd"+i];
	        var newTd2 = document.createElement('td');
	        newTd2.textContent = mediName;
	        var newTd3 = document.createElement('td');
	        newTd3.textContent = mediMaker;
	        var newTd4 = document.createElement('td');
	        newTd4.classList.add('number');
	        newTd4.textContent = mediPrice;
	        var newTd5 = document.createElement('td');
	        newTd5.classList.add('number');
	        newTd5.textContent = jsonData["prmeQt"+i]
	        
	        // 새로운 td를 tr에 추가
	        newTr.appendChild(newTd1);
	        newTr.appendChild(newTd2);
	        newTr.appendChild(newTd3);
	        newTr.appendChild(newTd4);
	        newTr.appendChild(newTd5);
	        
	        // orderTable에 새로운 tr 추가
	        orderTable.appendChild(newTr);
        }
        
        var total = 0;
        
        var tempTrList = orderTable.querySelectorAll('.temp-tr');
        tempTrList.forEach(function(tr) {
        	//발주서에 들어온 약품의 가격
            var priceWithComma = tr.querySelector('td:nth-child(4)').innerText; // 오타 수정: innerTex -> innerText
           //가격에서 , 를 없애기 
            var priceWithoutComma = priceWithComma.replace(/,/g, ''); // 쉼표 제거하는 코드 수정
           //발주서에 들어온 약품의 갯수
            var quantity = tr.querySelector('td:nth-child(5)').innerText; // 오타 수정: innerTex -> innerText
            
			//가격을 인트로 변환            
            var price = parseInt(priceWithoutComma);
            //갯수를 인트로 변환
            var number = parseInt(quantity);
            //가격*갯수
            var calculatedPrice = price * number;
            
            //합계
            total += calculatedPrice;
            totalString = total.toLocaleString();
            totalPrice2.value = totalString;
        });
    });
});

//결재 버튼을 결재가 이뤄지는 메서드
var secondApprovePurchaseBtn = document.getElementById("secondApprovePurchase");
secondApprovePurchaseBtn.addEventListener('click',function(){
	//결재할 대상이 선택되었는지 검증
	let rows = orderTable.getElementsByTagName('tr');
	if(rows.length == 1){
		Swal.fire({
            title: '선택된 발주가 없습니다.',
            icon: 'warning',
            showCancelButton: false,
            confirmButtonColor: '#0ABAB5',
            cancelButtonColor: '#8D9EA5',
            confirmButtonText: '확인',
            cancelButtonText: '취소'
			});
		return;
	}
	
	//일반 원무 사원은 결재할 수 없게 막는 부분
	if(!(empJbpsCd=="JBCD05"||empJbpsCd=="JBCD06")){
		Swal.fire({
            title: '권한이 없습니다.',
            icon: 'warning',
            showCancelButton: false,
            confirmButtonColor: '#0ABAB5',
            cancelButtonColor: '#8D9EA5',
            confirmButtonText: '확인',
            cancelButtonText: '취소'
         })
		return;
	}
	
	//1차승인이 아니면 결재가 진행되지 않아
	let trElement = document.querySelector('.order-tr.selected'); // 선택된 요소를 가져옵니다.
	let tdElement = trElement.querySelector('td:nth-child(6)').innerText;
	let nameElement = trElement.querySelector('td:nth-child(5)').innerText;
	
	if(nameElement != empName){
		Swal.fire({
            title: '지정된 결재자가 아닙니다.',
            icon: 'warning',
            showCancelButton: false,
            confirmButtonColor: '#0ABAB5',
            cancelButtonColor: '#8D9EA5',
            confirmButtonText: '확인',
            cancelButtonText: '취소'
			});
		return;
	}
	
	if(tdElement != '1차승인'){
		Swal.fire({
            title: '결재가 불가능한 상태입니다.',
            icon: 'warning',
            showCancelButton: false,
            confirmButtonColor: '#0ABAB5',
            cancelButtonColor: '#8D9EA5',
            confirmButtonText: '확인',
            cancelButtonText: '취소'
			});
		return;
	}
	
	var PurchaseMedicineVO = {
			"prmeAtrlSec" : empNo,
			"prmeNo" : prmeNo
	};
	
	$.ajax({
		url: "/ams/secondApprove",
		type: 'post',
		data: JSON.stringify(PurchaseMedicineVO),
		contentType:"application/json;charset=utf-8",
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(result){
			if(result > 0){
          		Swal.fire({
                   title: '결재 성공',
                   icon: 'success',
                   showCancelButton: false,
                   confirmButtonColor: '#0ABAB5',
                   cancelButtonColor: '#8D9EA5',
                   confirmButtonText: '확인',
                   cancelButtonText: '취소'
                }).then((result) => {
                	var apvlStst = ''; // 반복문 외부에 변수를 초기화합니다.

                	orderTrs.forEach(function(tr) {
                	    if (tr.classList.contains('selected')) {
                	        var selectedTd = tr.querySelector(':nth-child(6)'); // 선택된 tr의 6번째 자식 요소를 찾습니다.
                	        selectedTd.textContent = "최종승인";
                	    }
                	});
				})
			}
		},
		error: function(xhr, status, error){
		}
	});
});

var denyPurchaseBtn = document.getElementById("denyPurchase");
denyPurchaseBtn.addEventListener('click',function(){
	//결재할 대상이 선택되었는지 검증
	let rows = orderTable.getElementsByTagName('tr');
	if(rows.length == 1){
		Swal.fire({
            title: '선택된 발주가 없습니다.',
            icon: 'warning',
            showCancelButton: false,
            confirmButtonColor: '#0ABAB5',
            cancelButtonColor: '#8D9EA5',
            confirmButtonText: '확인',
            cancelButtonText: '취소'
			});
		return;
	}
	
	//헤더에서 가져온 직업코드
	if(!(empJbpsCd=="JBCD21"||empJbpsCd=="JBCD22"||empJbpsCd=="JBCD23")){
		Swal.fire({
            title: '권한이 없습니다.',
            icon: 'error',
            showCancelButton: false,
            confirmButtonColor: '#0ABAB5',
            cancelButtonColor: '#8D9EA5',
            confirmButtonText: '확인',
            cancelButtonText: '취소'
         })
		return;
	}
	
	//결재대기가 아니면 막는 부분
	let trElement = document.querySelector('.order-tr.selected'); // 선택된 요소를 가져옵니다.
	let tdElement = trElement.querySelector('td:nth-child(6)').innerText;
	if(tdElement == '반려'||tdElement == '최종승인'||tdElement == '결재대기'){
		Swal.fire({
            title: '반려가 불가능한 상태입니다.',
            icon: 'warning',
            showCancelButton: false,
            confirmButtonColor: '#0ABAB5',
            cancelButtonColor: '#8D9EA5',
            confirmButtonText: '확인',
            cancelButtonText: '취소'
			});
		return;
	}
	
	var PurchaseMedicineVO = {
			//PRME_ATRL_FST
			"prmeAtrlFst" : empNo,
			"prmeNo" : prmeNo
	};
	
	$.ajax({
		url: "/nurse/denyPurchase",
		type: 'post',
		data: JSON.stringify(PurchaseMedicineVO),
		contentType:"application/json;charset=utf-8",
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(result){
			if(result > 0){
          		Swal.fire({
                   title: '발주가 반려되었습니다.',
                   icon: 'success',
                   showCancelButton: false,
                   confirmButtonColor: '#0ABAB5',
                   cancelButtonColor: '#8D9EA5',
                   confirmButtonText: '확인',
                   cancelButtonText: '취소'
                }).then((result) => {
                	var apvlStst = ''; // 반복문 외부에 변수를 초기화합니다.

                	orderTrs.forEach(function(tr) {
                	    if (tr.classList.contains('selected')) {
                	        var selectedTd = tr.querySelector(':nth-child(6)'); // 선택된 tr의 6번째 자식 요소를 찾습니다.
                	        selectedTd.textContent = "반려";
                	    }
                	});
				})
			}
		},
		error: function(xhr, status, error){
		}
	});
});
</script>
</body>

