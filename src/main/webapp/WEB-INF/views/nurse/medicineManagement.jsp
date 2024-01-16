<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script type="text/javascript" src="/resources/js/jquery.min.js"></script>
<style>
/* 어사이드 강조 */
.aside-nur-medic{
	width: 196px;
	border-radius: 16px 0px 0px 16px;
	background: var(--bg-02, #DBF2F4);
	height: 56px;
	border-right: 4px solid var(--ci-01, #0ABAB5);
	margin-left: 4px;
	color: var(--ci-01, #0ABAB5);
}
/* 1592 */
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
#total-price1{
	width: 220px;
    height: 35px;
   	margin-top: 1.5px;
   	text-align: right;
   	font-size: 1.5em;
 	padding-right: 16px;
}
#total-price2{
    width: 300px;
    height: 35px;
   	margin-top: 1.5px;
   	text-align: right;
   	font-size: 1.5em;
 	padding-right: 16px;
}
#total-span{
	font-size: 1.4em;
	margin-right: 10px;
}
.total, .approval{
	display: none;
	gap: 12px;
}
.total.active, .approval.active{
	display: flex;
	border-top: 2px solid #D5D9DB;
	height: 70px;
	align-items: center;
	padding: 0px 1.2em;
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
.approval-list{
	width: 238px;
	display: flex;
	align-items: center;
}
.container {
	display: flex;
	justify-content: space-between;
	align-items: center;
}
.mySpan{
	width: 85px;
	text-align: right;
	margin-right: 6px;
}
.red-text{
	color: red !important;
}
</style>
<body>
	<div class="dduk-body-border left-div">
		<div class="dduk-row" style="margin-left: 10px;">
			<div id="inner-tab1" class="tab active"><h1>재고현황</h1></div>
			<div id="inner-tab2" class="tab"><h1>발주 리스트</h1></div>
			<div id="search-div">
				<input type="text" class="dduck-input search" id="search" placeholder="약품명을 검색하세요"
				style="width: 300px; height: 30px; margin-bottom: 15px;" onkeyup="searchFunction()"/>
				<div class="autocomplete"></div>
			</div>
		</div>
		<div class="card-body table-responsive p-0" style="height: 760px;">
   			<table class="table table-head-fixed text-nowrap list active" id="inventory-list">
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
<!-- 			발주 리스트 테이블 -->
			<table class="table table-head-fixed text-nowrap list" id="order-list">
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
							<td class="gray-text" data-empNo="${purchaseMedicineVO.prmeAtrlFst}">${purchaseMedicineVO.prmeAtrlFstName}</td>
							<td class="gray-text" data-empNo="${purchaseMedicineVO.prmeAtrlSec}">${purchaseMedicineVO.prmeAtrlSecName}</td>
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
<!-- 			발주 리스트 테이블 끝 -->
		</div>
	</div>
	
	<div class="dduk-body-border right-div">
		<div class="container dduk-row">
			<h1>발주서</h1>
		</div>
		<div class="card-body table-responsive p-0" style="height: 700px;">
			<table class="table table-head-fixed text-nowrap" id="order-table">
				<thead style="position:sticky; top: 0;  background-color: #fff;">
					<tr id="order-table-head">
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
		<div class="total active">
			<div class="price-div">
				<span id="total-span">합계 :</span><input type="text" class="dduck-input" id="total-price1" disabled/>
			</div>
			<div class="approval-div">
				<div class="approval-list">
					<div class="mySpan">
						1차결재자 :
						<br/>
						최종결재자 :
					</div>
					<div>
						<select id="first-approval-select">
					    	<option>선택</option>
						    <c:forEach var="employeeVO" items="${firstApprovalHolderList}">
						        <option data-empNo="${employeeVO.empNo}" value="${employeeVO.empName}">${employeeVO.empName}</option>
						    </c:forEach>
						</select>
						<select id="second-approval-select">
					    	<option>선택</option>
						    <c:forEach var="employeeVO" items="${secondApprovalHolderVOList}">
						        <option data-empNo="${employeeVO.empNo}" value="${employeeVO.getEmpName()}">${employeeVO.getEmpName()}</option>
						    </c:forEach>
						</select>
					</div>
				<button class="dduk-btn-info" id="purchaseMedicine" style="height: 35px; width: 70px;">신청</button>
				</div>
			</div>
		</div>
		<div class="approval">
			<div class="container">
				<span id="total-span">합계 :</span><input type="text" class="dduck-input" id="total-price2" disabled/>
				<sec:authorize access="hasRole('ROLE_NUR')">
					<button class="dduk-btn-active" id="firstApprovePurchase" style="height: 35px;">결재</button>
					<button class="dduk-btn-danger" id="denyPurchase" style="height: 35px;">반려</button>
				</sec:authorize>
				<sec:authorize access="!hasRole('ROLE_NUR')">
					<button class="dduk-btn-disabled" id="" style="height: 35px;">권한 없음</button>
				</sec:authorize>
			</div>
		</div>
	</div>
<script>
$(document).ready(function() {
	$('.aside-nur-medic').find('svg').find('path').attr('fill', '#0ABAB5');
	$('.aside-nur-medic').find('.dduk-nav-menu').css('color', '#0ABAB5');
});

//검색 로직 시작 =================================================
function searchFunction() {
	console.log("입력되서 작동중");
    var input, filter, table, tr, td, i, txtValue;
    
	table = document.querySelector("#inventory-list");
   	tr = table.querySelectorAll(".inventory-tr");
	
    input = document.getElementById("search");
    filter = input.value.toUpperCase();
   
    for (i = 0; i < tr.length; i++) { // 시작 인덱스를 1로 설정하여 테이블 헤더를 제외
        td = tr[i].getElementsByTagName("td")[3]; // 여기서 1은 학생명이 있는 열의 인덱스입니다.
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
	
// //재고의 모든 tr 요소 변수에 담기
var inventoryTrs;
inventoryTrs = document.querySelectorAll('.inventory-tr');

inventoryTrs.forEach(function(tr){
	var stock = tr.querySelector('td:nth-child(8)').innerText;
	
	if (stock <= 200) {
		tr.querySelector('td:nth-child(8)').classList.remove('gray-text');
		tr.querySelector('td:nth-child(8)').classList.add('red-text');
    }
});

//더 간단한게 있었네
// inventoryTrs.forEach(function(tr){
//     var stockCell = tr.cells[7]; // 8번째 td에 해당하는 셀을 가져옴 (인덱스는 0부터 시작하므로 7)

//     var stock = stockCell.innerText;

//     if (stock <= 200) {
//         stockCell.classList.remove('gray-text');
//         stockCell.classList.add('red-text');
//     }
// });

//검색 로직 끝 =================================================
	
// inventory check 클래스 요소를 변수에 담기 (HTML Collection 형태라서 포문써야됨)
const inventoryChecks = document.querySelectorAll('.inventory-check');
// table 요소 변수에 담기
const orderTable = document.getElementById('order-table');
const inventoryTable = document.getElementById('inventory-list');
// 체크박스 변수에 담기
const checkAllItem = document.getElementById('check-all-item');

//전체 체크박스를 체크하면 발주서로 이동하고 체크해제하면 다시 지워지기
checkAllItem.addEventListener('change', function() {
    if (checkAllItem.checked) {
        // 재고 테이블의 체크박스들을 모두 선택하고 발주로 옮기기
        for (let i = 0; i < inventoryChecks.length; i++) {
            inventoryChecks[i].checked = true;

            // 체크된 행을 발주 테이블로 옮기기
            let inventoryRow = inventoryChecks[i].closest('tr');
            let cells = inventoryRow.cells;
            let newRow = orderTable.insertRow();

            //1, 3, 4, 8, 9번째 td만 넣기
            for (let j = 0; j < cells.length; j++) {
                if (j === 1 || j === 3 || j === 4 || j === 8 || j === 9) {
                    let newCell = newRow.insertCell();
                    newCell.classList.add('gray-text');
                    
                    if(j === 3 || j === 4){
	                    newCell.classList.add('left-align');
                    }
                    
                    if(j === 8){
	                    newCell.classList.add('number');
                    }

                    if (j === 9) {
                        let inputElement = document.createElement('input');
                        inputElement.type = 'number';
                        inputElement.value = '';
                        inputElement.className = 'dduck-input order ';
                        newCell.appendChild(inputElement);
                    } else {
                        newCell.innerHTML = cells[j].innerHTML;
                    }
                }
            }
        }
    }else if(!checkAllItem.checked){
   		//모든 체크박스 해제
   		var checkboxes = document.getElementsByTagName('input');
   		for (var i = 0; i < checkboxes.length; i++) {
   		    if (checkboxes[i].type === 'checkbox') {
   		        checkboxes[i].checked = false;
   		    }
   		}
   		
   		let rows = orderTable.getElementsByTagName('tr');

   		// 마지막 행부터 역순으로 삭제
   		for (let i = rows.length - 1; i >= 1; i--) {
   		    let row = rows[i];
   		    row.parentNode.removeChild(row);
   		}
    }
});

//각 체크박스가 체크되면 재고=>발주로 복사되고, 체크해제되면 발주에서 삭제
inventoryChecks.forEach(function(checkbox) {
    checkbox.addEventListener('change', function() {
        if (this.checked) {
            // 체크되었을 때 해당 요소를 옮깁니다.
            let row = this.closest('tr').cloneNode(true);
            
            //발주 테이블에 없는 td 제거를 위해 담기
            let checkbox = row.querySelector('td:nth-child(1)');
            let type = row.querySelector('td:nth-child(3)');
            let detail = row.querySelector('td:nth-child(6)');
            let cont = row.querySelector('td:nth-child(7)');
            let stock = row.querySelector('td:nth-child(8)');
            let insr = row.querySelector('td:nth-child(10)');
            
            //td 제거하기
            row.removeChild(checkbox);
            row.removeChild(type);
            row.removeChild(detail);
            row.removeChild(cont);
            row.removeChild(stock);
            row.removeChild(insr);
            
            //input태그
            let inputElement = document.createElement('input');
            inputElement.type = 'number'; // 원하는 input 타입으로 설정
            inputElement.value = ''; // 원하는 기본값 설정
            inputElement.classList.add('dduck-input');
            inputElement.classList.add('order');
            
            let newCell = row.insertCell();
            newCell.appendChild(inputElement);
            
            var fourthChild = row.querySelector(":nth-child(6)");
            row.insertBefore(newCell, fourthChild);
            
            orderTable.appendChild(row);
        }else{
        	// 체크 해제 되었을 때
        	let row = this.closest('tr');
        	
			let rows = orderTable.getElementsByTagName('tr');
			
			for (let i = 1; i < rows.length; i++) {
			    let currentRow = rows[i];
			    let secondTDInOrderTable = currentRow.querySelector('td:nth-child(1)');
			    if (row.querySelector('td:nth-child(2)').innerText === secondTDInOrderTable.innerText) {
			        currentRow.remove();
			    }else{
			    	console.log("실패");
			    }
			}
        }
    });
});
//.order 변수에 담기
var orderInputs = document.querySelectorAll('.order');
//합계 변수 담기
const totalPrice1 = document.getElementById('total-price1');
const totalPrice2 = document.getElementById('total-price2');


//쉼표가 포함된 숫자 포맷 함수
function formatNumberWithCommas(number) {
  return new Intl.NumberFormat().format(number);
}

var result = 0;
var previousResult = 0;
var previousItem = [];
var calculatedResult = 0;

// 동적으로 추가된 order input의 부모 요소에 이벤트 리스너 추가
document.addEventListener('keyup', function(event) {
	if (event.target.classList.contains('order')) {
        const inputValue = parseFloat(event.target.value); // 숫자로 변환

        // 부모 tr 요소 찾기
        const trElement = event.target.closest('tr');
        
		// tr 요소의 자식 요소 중에서 1번째 요소 찾기
        const presentItem = trElement.children[0].textContent;
        // tr 요소의 자식 요소 중에서 3번째 요소 찾기
        const thirdElementText = trElement.children[3].textContent; // 해당 엘리먼트의 텍스트 콘텐츠 가져오기
		const thirdElementWithoutComma = thirdElementText.replace(/,/g, ''); // 쉼표 제거
        
		var isDuplicate = true;
		
		//중복되는 품목이 있는지 확인
		for(let i = 0; i < previousItem.length; i++){
			if(previousItem[i] == presentItem){
				isDuplicate = false;
			}
		}

		// 곱셈 수행
        result = inputValue * thirdElementWithoutComma;
        
        if(event.keyCode == 13){
        // 엔터키를 눌렀을 때 입력되는 결과가 이전의 결과와 동일하면(중복 입력)을 막음
        	if(previousResult != result){
        		if(isDuplicate){
	        		calculatedResult += result
			        totalPrice1.value = formatNumberWithCommas(calculatedResult);
	        		
	        		//검증을 위한 값 입력
	        		previousResult = result;
	        		previousItem.push(trElement.children[0].textContent);
        		}else{
        			Swal.fire({
  	                  title: '중복된 품목이 이미 입력되었습니다.',
  	                  icon: 'error',
  	                  showCancelButton: false,
  	                  confirmButtonColor: '#0ABAB5',
  	                  cancelButtonColor: '#8D9EA5',
  	                  confirmButtonText: '확인',
  	                  cancelButtonText: '취소'
  					});
        		}
        	}else{
        		Swal.fire({
	                  title: '중복된 값이 입력되었습니다.',
	                  icon: 'error',
	                  showCancelButton: false,
	                  confirmButtonColor: '#0ABAB5',
	                  cancelButtonColor: '#8D9EA5',
	                  confirmButtonText: '확인',
	                  cancelButtonText: '취소'
					});
        	}
		}
	}
});

$('#inner-tab1').click(function(){
	  $('#inventory-list').addClass('active');
	  $('#order-list').removeClass('active');
	  $('#inner-tab1').addClass('active');
	  $('#inner-tab2').removeClass('active');
	  $('.total').addClass('active');
	  $('.approval').removeClass('active');
	  $('#order-table tr:not(:first-child)').remove();
	  $('#total-price2').val('');
	  $('.order-tr.selected').removeClass('selected');
// 	  $('#search').attr('placeholder','약품명을 검색하세요');
});

$('#inner-tab2').click(function(){
	  $('#order-list').addClass('active');
	  $('#inventory-list').removeClass('active');
	  $('#inner-tab2').addClass('active');
	  $('#inner-tab1').removeClass('active');
	  $('.total').removeClass('active');
	  $('.approval').addClass('active');
	  $('#order-table tr:not(:first-child)').remove();
	  $('.inventory-check').prop('checked', false);
	  $('#total-price1').val("");
// 	  $('#search').attr('placeholder','ㅇㅇㅇ');
});

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
	        newTd2.classList.add('left-align');
	        var newTd3 = document.createElement('td');
	        newTd3.textContent = mediMaker;
	        newTd3.classList.add('left-align');
	        var newTd4 = document.createElement('td');
	        newTd4.textContent = mediPrice;
	        newTd4.classList.add('number');
	        var newTd5 = document.createElement('td');
	        newTd5.textContent = jsonData["prmeQt"+i]
	        newTd5.classList.add('number');
	        
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

var firstApprovalHolder = "";
var secondApprovalHolder = "";

var firstApprovalSelect = document.getElementById('first-approval-select');
firstApprovalSelect.addEventListener('change', function() {
	var firstApprovalIndex = firstApprovalSelect.selectedIndex;
	var firstApprovalOption = firstApprovalSelect.options[firstApprovalIndex];
	var firstApprovalEmpNo = firstApprovalOption.getAttribute('data-empNo');
	console.log(firstApprovalEmpNo);
	firstApprovalHolder = firstApprovalEmpNo;
});

var secondApprovalSelect = document.getElementById('second-approval-select');
secondApprovalSelect.addEventListener('change', function() {
	var secondApprovalIndex = secondApprovalSelect.selectedIndex;
	var secondApprovalOption = secondApprovalSelect.options[secondApprovalIndex];
	var secondApprovalEmpNo = secondApprovalOption.getAttribute('data-empNo');
	console.log(secondApprovalEmpNo);
	secondApprovalHolder = secondApprovalEmpNo;
});

//발주 신청 버튼을 누르면 이벤트
document.querySelector('#purchaseMedicine').addEventListener('click',function(){
	let rows = orderTable.getElementsByTagName('tr');
	if(rows.length == 1){
		Swal.fire({
            title: '신청된 품목이 없습니다',
            icon: 'warning',
            showCancelButton: false,
            confirmButtonColor: '#0ABAB5',
            cancelButtonColor: '#8D9EA5',
            confirmButtonText: '확인',
            cancelButtonText: '취소'
			});
		return;
	}
	if(totalPrice1.value === "" || totalPrice1.value === null){
		Swal.fire({
            title: '수량이 입력되지 않았습니다.',
            icon: 'warning',
            showCancelButton: false,
            confirmButtonColor: '#0ABAB5',
            cancelButtonColor: '#8D9EA5',
            confirmButtonText: '확인',
            cancelButtonText: '취소'
			});
		return;
	}
	if(firstApprovalSelect.selectedIndex == 0 || secondApprovalSelect.selectedIndex == 0){
		Swal.fire({
            title: '결재자가 선택되지 않았습니다.',
            icon: 'warning',
            showCancelButton: false,
            confirmButtonColor: '#0ABAB5',
            cancelButtonColor: '#8D9EA5',
            confirmButtonText: '확인',
            cancelButtonText: '취소'
			});
		return;
	}
	
	var detailVO = {};
	var purchaseMedicineDetailVOList = [];
	
	//발주서에 있는 tr을 변수에 담기
	
	//tr들을 돌면서 약품의 정보를 VO에 넣고 List에 넣기
	for (let i = 1; i < rows.length; i++) {
		//현재 i번째 tr
	    let currentRow = rows[i];
	   
		//0번째, 5번째 td의 값을 넣기
    	let firstTDInRow = currentRow.querySelector('td:nth-child(1)').innerText;
 	    let fifthTDInRow = currentRow.querySelector('td:nth-child(5) input').value;
 	    
 	    //VO에 값을 설정하고 List에 넣어
 	    purchaseMedicineDetailVO = {
 	    		"mediCd" : firstTDInRow, 
 	    		"prmeQt" : fifthTDInRow};
 	   purchaseMedicineDetailVOList.push(purchaseMedicineDetailVO);
    }
	
	var data = {
			"prmeAppl" : empNo,
			"prmeAtrlFst" : firstApprovalHolder,
			"prmeAtrlSec" : secondApprovalHolder,
			"purchaseMedicineDetailVOList" : purchaseMedicineDetailVOList
	};
	
	
	$.ajax({
		url:"/nurse/purchaseMedicines",
		contentType:"application/json;charset=utf-8",
		data:JSON.stringify(data),
		type:"post",
// 		dataType:"json", dataType = 보내는 데이터 형식
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success:function(result){
			Swal.fire({
                  title: '발주 신청 하시겠습니까?',
                  icon: 'question',
                  showCancelButton: true,
                  confirmButtonColor: '#0ABAB5',
                  cancelButtonColor: '#8D9EA5',
                  confirmButtonText: '확인',
                  cancelButtonText: '취소'
				}).then(result => {
					if (result.isConfirmed) {
						Swal.fire({
		                  title: '발주 신청 완료',
		                  icon: 'success',
		                  showCancelButton: false,
		                  confirmButtonColor: '#0ABAB5',
		                  cancelButtonColor: '#8D9EA5',
		                  confirmButtonText: '확인',
		                  cancelButtonText: '취소'
						}).then(result => {
	        			window.location.href = "/nurse/medicineManagement";
						})
				}else if(result.dismiss === Swal.DismissReason.cancel){
					Swal.fire({
		                  title: '발주 신청 취소',
		                  icon: 'info',
		                  showCancelButton: false,
		                  confirmButtonColor: '#0ABAB5',
		                  cancelButtonColor: '#8D9EA5',
		                  confirmButtonText: '확인',
		                  cancelButtonText: '취소'
					})
				}
       		});
		}
	});
});

//결재 버튼을 결재가 이뤄지는 메서드
var firstApprovePurchaseBtn = document.getElementById("firstApprovePurchase");
firstApprovePurchaseBtn.addEventListener('click',function(){
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
	
	//일반간호사는 결재할 수 없게 막는 부분
	if(!(empJbpsCd=="JBCD21"||empJbpsCd=="JBCD22"||empJbpsCd=="JBCD23")){
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
	
	//결재대기가 아니면 막는 부분
	let trElement = document.querySelector('.order-tr.selected'); // 선택된 요소를 가져옵니다.
	let sixthTdElement = trElement.querySelector('td:nth-child(6)').innerText;
	if(sixthTdElement != '결재대기'){
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
	
	//결재자 사번이 내 사번과 맞는지(내가 결재자가 맞는지) 확인
	let fourthTdElement = trElement.querySelector('td:nth-child(4)').innerText;
	console.log(fourthTdElement);
	console.log(empName); 
	if(fourthTdElement.normalize() !== empName.normalize()){
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
	
	var PurchaseMedicineVO = {
			//PRME_ATRL_FST
			"prmeAtrlFst" : empNo,
			"prmeNo" : prmeNo
	};
	
	$.ajax({
		url: "/nurse/firstApprove",
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
                	        selectedTd.textContent = "1차승인";
                	        
//                 	        var selectedTd = tr.querySelector(':nth-child(4)'); // 선택된 tr의 6번째 자식 요소를 찾습니다.
//                 	        selectedTd.textContent = empName;
                	    }
                	});
				})
			}
		},
		error: function(xhr, status, error){
		}
	});
});

//반려 버튼 누르면 반려되는 메서드
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
	
	//결재대기를 제외한 상태에서는 반려가 불가능하게 한다
	let trElement = document.querySelector('.order-tr.selected'); // 선택된 요소를 가져옵니다.
	let tdElement = trElement.querySelector('td:nth-child(6)').innerText;
	if(tdElement == '반려'||tdElement == '최종승인'||tdElement == '1차승인'){
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
	
	// 결재자가 내가 아니면 반려도 못해
	let fourthTdElement = trElement.querySelector('td:nth-child(4)').innerText;
	if(fourthTdElement.normalize() !== empName.normalize()){
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

