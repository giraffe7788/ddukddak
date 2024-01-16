<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
tr {
	padding: 4px !important;
    display: flex;
    width: 550px;
    padding: 4px !important;
    flex-direction: row;
    justify-content: space-between;
}
.aside-per-manage{
	width: 196px;
	border-radius: 16px 0px 0px 16px;
	background: var(--bg-02, #DBF2F4);
	height: 56px;
	border-right: 4px solid var(--ci-01, #0ABAB5);
	margin-left: 4px;
	color: var(--ci-01, #0ABAB5);
}
/* 검색 기능용 */
.searchEmp{
	background-repeat: no-repeat;
	background-position: 372px center;
	width: 100%;
	height: 48px;
	margin-left: 18px;
}

.searchEmpBtn {
	background-color: transparent;
    position: absolute;
}

.search-btn {
	margin-left: 8px;
	padding: 4px 14px;
	border-radius: 12px;
	height: 38px;
}
/* 자동 완성 창 */
.autocomplete{
	z-index: 1;
	position: absolute;
	width:500px;
	margin-left:30px;"
}

hr{
	margin: -8px 0 16px -16px;
	background: var(--border, #EBEFF0);
	height: 1px;
}

.dduk-row {
	gap: 16px;
}

.autocomplete > div.active {
  background: #e0e5f6;
  color: #000;
}

.autocomplete > div {
  background: #f1f3f499;
  padding: .2rem .6rem;
}

/* 인사과 회원 관리 목록 */
.emp-list {
	width: 600px;
}

.empState-btn {
	width:76px;
	height:30px;
	margin-right:50px;
}

/* 모달창 */
label{
	width: 50px;
    height: 50px;
}

.perEmp { 
	display: block; 
	overflow-y : scroll; 
	max-height: 630px; 
} 

#empListbody, #wEempTbody, #oEmpTbody { 
	display: block; 
	overflow-y : scroll; 
	max-height: 630px; 
} 

</style>
<script>

</script>
<!-- 승인 목록 창 -->
<div class="dduk-body-border patient-list emp-list ">
	<div>
		<div class="dduk-title-area">
			<h2>승인 목록</h2>
			<br/>
			<div class="dduk-row">
				<div style="color:#0ABAB5;">승인 대기중인 계정 수 : ${waitingCnt}</div>
				<div class="def-inner-tab" id="inner-tab-11" style="border-bottom: 3px solid var(--ci-01, #0ABAB5);">
					<h3>대기</h3>
				</div>
				<div class="inner-tab" id="inner-tab-12" value="ACST02">
					<h3>완료</h3>
				</div>
			</div>
		</div>
		<!-- 대기 목록 창 시작    -->
		<div class="dduk-x-pd8  waitingEmp">
			<table class="emp-list-table" id="patient-list-table">
				<thead>
					<tr class="tr-padding emps-list-cont">
						<th class="td-padding gray-text" style="width:33%">사번</th>
						<th class="td-padding gray-text paName" style="width:24%">이름</th>
						<th class="td-padding gray-text" style="width:20%">직무</th>
						<th class="td-padding gray-text" style="width:23%">상태</th>
					</tr>
				</thead>
				<tbody id="empListbody" >
					<c:forEach var="emps" items="${employeeVOList}">
						<c:if test="${emps.empAcntState eq 'ACST01'}">
							<tr class="tr-padding tr-paInfo emps-list-cont" data-pano="PA0001">
								<td class="td-padding clickEmpNo">${emps.empNo}</td>
								<td class="td-padding" >${emps.empName}</td>
								<td class="td-padding">${emps.empDeptNm}</td>
								<td class="td-padding" onclick='event.cancelBubble=true;' >
					                <button class="dduk-btn-info btn-state empState-btn" value="ACST01" style="margin-left: -21px;" onclick="changeStt(event)" >승인 대기</button>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- 대기 목록 창 끝    -->
		<!-- 완료 목록 창 시작    -->
		<div class="dduk-x-pd8  permittedEmp" style="display: none;">
			<table class="emp-list-table" id="patient-list-table">
				<thead>
					<tr class="tr-padding emps-list-cont">
						<th class="td-padding gray-text" style="width:33%">사번</th>
						<th class="td-padding gray-text paName" style="width:24%">이름</th>
						<th class="td-padding gray-text" style="width:20%">직무</th>
						<th class="td-padding gray-text" style="width:23%">상태</th>
					</tr>
				</thead>
				<tbody id="wEempTbody" class="perEmp">
					<h3 class="noneList">출력할 목록 없음</h3>
				</tbody>
			</table>
		</div>
		<!-- 완료 목록 창 끝    -->
	</div>
	<!-- 검색 창 시작   -->
	<div class="btn-container" >
		<div class="dduk-row" style="height:40px;"> 
			<input id="searchEmp1" class="search dduck-input searchWEmp" style="width:100%;" placeholder="사원 이름을 검색해주세요" />
			<button id="searchEmpBtn2" class="searchEmpBtn" style="margin-left:500px; margin-top:10px;">
				<img src="/resources/images/Search.png">
			</button>
		</div>
		<div class="autocomplete acW"></div>
	</div>
    <!-- 검색 창 끝   -->
</div>
<!-- 승인 목록 창 -->
<div class="dduk-body-border patient-list emp-list ">
	<div>
		<div class="dduk-title-area">
			<h2>사원 목록</h2>
			<br/>
			<div class="dduk-row">
				<div id="lockCntHtml" style="color:red;">잠긴 계정 수 : ${lockedCnt}</div>
				<div class="def-inner-tab" id="inner-tab-21" style="border-bottom: 3px solid var(--ci-01, #0ABAB5);">
					<h3>전체</h3>
				</div>
				<div class="inner-tab" id="inner-tab-22" value="ACST03" >
					<h3>잠김</h3>
				</div>
				<div class="inner-tab" id="inner-tab-23" value="ACST04" >
					<h3>퇴사</h3>
				</div>
			</div>
		</div>
		<!-- 전체 목록 창 시작   -->
		<div class="dduk-x-pd8 wholeEmp" >
			<table class="emp-list-table" id="patient-list-table">
				<thead>
					<tr class="tr-padding emps-list-cont">
						<th class="td-padding gray-text" style="width:33%">사번</th>
						<th class="td-padding gray-text paName" style="width:24%">이름</th>
						<th class="td-padding gray-text" style="width:20%">직무</th>
						<th class="td-padding gray-text" style="width:23%">상태</th>
					</tr>
				</thead>
				<tbody id="empListbody" style="overflow-y: scroll; height: 600px;">
					<c:forEach var="emps" items="${employeeVOList}">
						<tr class="tr-padding tr-paInfo emps-list-cont" data-pano="PA0001">
							<td class="td-padding clickEmpNo">${emps.empNo}</td>
							<td class="td-padding" >${emps.empName}</td>
							<td class="td-padding">${emps.empDeptNm}</td>
							<td class="td-padding" onclick='event.cancelBubble=true;'>
								<c:choose> 
									<c:when test="${emps.empAcntState eq 'ACST01'}">
										<button class="dduk-btn-info btn-state empState-btn" style="margin-left: -21px;" >승인 대기</button>
									</c:when> 
									<c:when test="${emps.empAcntState eq 'ACST02'}">
						                <button class="dduk-btn-disabled btn-state empState-btn" style="margin-left: -21px;" >승인</button>
									</c:when>
									<c:when test="${emps.empAcntState eq 'ACST03'}">
										<button class="dduk-btn-danger btn-state empState-btn" style="margin-left: -21px;" >잠김</button>
									</c:when> 
									<c:otherwise>
						                <button class="dduk-btn-danger btn-state empState-btn" style="margin-left: -21px;" >퇴사</button>
									</c:otherwise> 
								</c:choose> 
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- 전체 목록 창 끝   -->
		<!-- 잠김 목록 창 시작   -->
		<div class="dduk-x-pd8 lockedEmp" style="display: none;">
			<table class="emp-list-table" id="patient-list-table">
				<thead>
					<tr class="tr-padding emps-list-cont">
						<th class="td-padding gray-text" style="width:33%">사번</th>
						<th class="td-padding gray-text paName" style="width:24%">이름</th>
						<th class="td-padding gray-text" style="width:20%">직무</th>
						<th class="td-padding gray-text" style="width:23%">상태</th>
					</tr>
				</thead>
				<tbody id="lEmpTbody">
					<h3 class="noneList">출력할 목록 없음</h3>
				</tbody>
			</table>
		</div>
		<!-- 잠김 목록 창 끝   -->
		<!-- 퇴사 목록 창 시작   -->
		<div class="dduk-x-pd8 outEmp" style="display: none;">
			<table class="emp-list-table" id="patient-list-table">
				<thead>
					<tr class="tr-padding emps-list-cont">
						<th class="td-padding gray-text" style="width:33%">사번</th>
						<th class="td-padding gray-text paName" style="width:24%">이름</th>
						<th class="td-padding gray-text" style="width:20%">직무</th>
						<th class="td-padding gray-text" style="width:23%">상태</th>
					</tr>
				</thead>
				<tbody id="oEmpTbody">
					<h3 class="noneList">출력할 목록 없음</h3>
				</tbody>
			</table>
		</div>
		<!-- 퇴사 목록 창 끝   -->
	</div>
	<!-- 검색 창 시작   -->
	<div class="btn-container">
		<div class="dduk-row" style="height:40px; position: relative;"> 
			<input id="searchEmp2" class="search dduck-input searchEmp" style="width:100%;" placeholder="사원 이름을 검색해주세요" />
			<button id="searchEmpBtn2" class="searchEmpBtn" style="margin-left:500px; margin-top:10px; ">
				<img src="/resources/images/Search.png">
			</button>
		</div>
		<div id="autocomplete" class="autocomplete"></div>
	</div>
    <!-- 검색 창 끝   -->
<sec:csrfInput />
</div>
<!-- 모달    -->
<c:import url="../common/modal.jsp"></c:import>
<!-- sweetalert -->
<script src="/resources/fullcalendar-6.1.10/sweetalert2.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script>
$(document).ready(function() {
	$('.aside-per-manage').find('svg').find('path').attr('fill', '#0ABAB5');
	$('.aside-per-manage').find('.dduk-nav-menu').css('color', '#0ABAB5');
});

// 검색 기능 시작
// 승인 관련 회원 검색
// 검색어 리스트
var dataListW = [];
// 검색 입력 요소
const $searchEmpW = document.querySelector("#searchEmp1");
// 검색어 리스트 요소
const $autoCompleteW = document.querySelector(".acW");
// 현재 가르키고 있는 검색어 순번
let nowIndexW = 0;
// 단어 입력이 완료되었을 때
$searchEmpW.onkeyup = (event) => {
// 검색어
const value = $searchEmpW.value.trim();
  
// 자동완성 필터링
const matchDataList = value ? dataListW.filter((label) => label.includes(value)) : [];

  switch (event.keyCode) {
	    // UP KEY
	    case 38:
	    	nowIndexW = Math.max(nowIndexW - 1, 0);
			break;
	
	    // DOWN KEY
	    case 40:
			nowIndexW = Math.min(nowIndexW + 1, matchDataList.length - 1);
			break;
	
	    // ENTER KEY
	    case 13:
	      document.querySelector("#searchEmp1").value = matchDataList[nowIndexW].match(/[ㄱ-ㅎㅏ-ㅣ가-힣]+/g).join(" ") || "";
		  var empNo = matchDataList[nowIndexW].substring(0,10);
		  console.log(empNo);
		  selectEmp(empNo);
	      // 초기화
	      nowIndexW = 0;
	      matchDataList.length = 0;
	      break;
	      
	    // 그외 다시 초기화
	    default:
	      nowIndex = 0;
	      break;
	  }
	  // 리스트 보여주기
	  showListW(matchDataList, value, nowIndex);
	};

const showListW = (data, value, nowIndex) => {
	  // 정규식으로 변환
	  const regex = new RegExp("(" + value + ")", "g");
	  
	  $autoCompleteW.innerHTML = data
	  .map(function(label, index) {
	    return "<div class='" + (nowIndexW === index ? "active" : "") + "'>" +
	      label.replace(regex, "<mark>$1</mark>") +
	      "</div>";
	  })
	  .join("");
};

// 전체 회원 검색
// 검색어 리스트
var dataList = [];
// 검색 입력 요소
const $searchEmp = document.querySelector("#searchEmp2");
// 검색어 리스트 요소
const $autoComplete = document.querySelector("#autocomplete");
// 현재 가르키고 있는 검색어 순번
let nowIndex = 0;
// 단어 입력이 완료되었을 때
$searchEmp.onkeyup = (event) => {
  // 검색어
  const value = $searchEmp.value.trim();

  // 자동완성 필터링
  const matchDataList = value
    ? dataList.filter((label) => label.includes(value))
    : [];

  switch (event.keyCode) {
    // UP KEY
    case 38:
      nowIndex = Math.max(nowIndex - 1, 0);
      break;

    // DOWN KEY
    case 40:
      nowIndex = Math.min(nowIndex + 1, matchDataList.length - 1);
      break;

    // ENTER KEY
    case 13:
      document.querySelector("#searchEmp2").value = matchDataList[nowIndex].match(/[ㄱ-ㅎㅏ-ㅣ가-힣]+/g).join(" ") || "";
	  var empNo = matchDataList[nowIndex].substring(0,10);
	  console.log(empNo);
	  selectEmp(empNo);
      // 초기화
      nowIndex = 0;
      matchDataList.length = 0;
      break;
      
    // 그외 다시 초기화
    default:
      nowIndex = 0;
      break;
  }

  // 리스트 보여주기
  showList(matchDataList, value, nowIndex);
};

// 리스트 보여주기
const showList = (data, value, nowIndex) => {
	  // 정규식으로 변환
	  const regex = new RegExp("(" + value + ")", "g");
	  
	  $autoComplete.innerHTML = data
	  .map(function(label, index) {
	    return "<div class='" + (nowIndex === index ? "active" : "") + "'>" +
	      label.replace(regex, "<mark>$1</mark>") +
	      "</div>";
	  })
	  .join("");
};
	
// 사원 상세 정보 담긴 모달 띄우기
function selectEmp(empNo){
	let data = {empNo : empNo}
	// 해당 사원 상세 정보 모달에 입력
	$.ajax({
		url: "/hrd/detail",
		type: 'post',
		data: data,
		dataType: 'json',
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(rst){
			let src = "/resources/upload/empProfile/"+ rst.atchFileDetailSavenm;
			let jbps = "<option value=''>"+rst.empJbpsNm+"</option>";
			console.log(rst);
			$(".d-flex > img").attr({ "src": src  });
			$("#empNoHrd").val(rst.empNo);
			$("#empNameHrd").val(rst.empName);
			$("#empZipHrd").val(rst.empZip);
			$("#empAdd1Hrd").val(rst.empAdd1);
			$("#empAdd2Hrd").val(rst.empAdd2);
			$("#empPhHrd").val(rst.empPh);
			$("#empMailHrd").val(rst.empMail);
			$("#empRegHrd").val(rst.empReg);
			$("#empDeptCdHrd").val(rst.empDeptCd).prop("selected", true);
        	$("#empJbpsCdHrd").html(jbps);
		},
		error: function(xhr, status, error){
			console.log('Error:', xhr, status, error);
		}
	});
	// 모달 띄우기
	$("#detailEmpModalHrd").modal("show");
};

// 한쪽 검색 시작하면 다른 쪽은 창 닫힘
$searchEmpW.onfocus = () => {
    // 승인 관련 검색어 리스트 초기화
    $autoComplete.innerHTML = "";
};

$searchEmp.onfocus = () => {
    // 전체 사원 검색어 리스트 초기화
    $autoCompleteW.innerHTML = "";
};
//검색 기능 끝

// 클릭한 상태에 해당하는 사원 출력-공통상세코드로 구분 
function selectedStt(con){
	let state = {"empAcntState":con};
	// con === empAcntState -> list -> += html -> append
	if(con === 'ACST02'){
		$.ajax({
			url:"/emp/getSttDetail",
			data: state,
			type:"post",
			dataType:"json",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success:function(data, status, xhr){
				// 이전 출력 내용 지움
				$("#wEempTbody").empty();
				// '내용 없음' 지움
				$(".noneList").css('display', 'none');
				let str ="";
				$.each(data, function(key, value){
					let empNm = data[key].empName;
					let empNo = data[key].empNo;
					let empDeptNm = data[key].empDeptNm;
					
					str += `<tr class="tr-padding tr-paInfo emps-list-cont" data-pano="\${data[key].empNo}">
						<td class="td-padding clickEmpNo">\${empNo}</td>
						<td class="td-padding" >\${empNm}</td>
						<td class="td-padding">\${empDeptNm}</td>
						<td class="td-padding" onclick='event.cancelBubble=true;'>
							<button class="dduk-btn-disabled btn-state empState-btn" value="ACST02" style="margin-left: -21px;" onclick="changeStt(event)" >승인</button>
						</td>
					</tr>`;
				});
				$("#wEempTbody").append(str);
			},
			error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
			}
		});
	} else if(con === 'ACST03') {
		console.log(con);
		$.ajax({
			url:"/emp/getSttDetail",
			data: state,
			type:"post",
			dataType:"json",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success:function(data, status, xhr){
				//$("#lockCntHtml").remove();
				//let lockCnt = data.length;
				//let lockCntHtml = "<div id='lockCntHtml' style='color:red;'>잠긴 계정 수 : "+ lockCnt + "</div>";
				//$("#inner-tab-21").before(lockCntHtml);
				// 이전 출력 내용 지움
				$("#lEmpTbody").empty();
				// '내용 없음' 지움
				$(".noneList").css('display', 'none');
				let str ="";
				$.each(data, function(key, value){
					let empNm = data[key].empName;
					let empNo = data[key].empNo;
					let empDeptNm = data[key].empDeptNm;
					
					str += `<tr class="tr-padding tr-paInfo emps-list-cont" data-pano="\${data[key].empNo}">
						<td class="td-padding clickEmpNo">\${empNo}</td>
						<td class="td-padding" >\${empNm}</td>
						<td class="td-padding">\${empDeptNm}</td>
						<td class="td-padding" onclick='event.cancelBubble=true;'>
							<button class="dduk-btn-danger btn-state empState-btn" value="ACST03" style="margin-left: -21px;" onclick="changeStt(event)" >잠김</button>
						</td>
					</tr>`;
				});
				$("#lEmpTbody").append(str);
			},
			error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
			}
		});
	} else if(con === 'ACST04') { // ACST04 : 퇴사
		console.log(con);
		$.ajax({
			url:"/emp/getSttDetail",
			data: state,
			type:"post",
			dataType:"json",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success:function(data, status, xhr){
				// 이전 출력 내용 지움
				$("#oEmpTbody").empty();
				// '내용 없음' 지움
				$(".noneList").css('display', 'none');
				let str ="";
				$.each(data, function(key, value){
					let empNm = data[key].empName;
					let empNo = data[key].empNo;
					let empDeptNm = data[key].empDeptNm;
					
					str += `<tr class="tr-padding tr-paInfo emps-list-cont" data-pano="\${data[key].empNo}">
						<td class="td-padding clickEmpNo">\${empNo}</td>
						<td class="td-padding" >\${empNm}</td>
						<td class="td-padding">\${empDeptNm}</td>
						<td class="td-padding" onclick='event.cancelBubble=true;'>
							<button class="dduk-btn-danger btn-state empState-btn" value="ACST04" style="margin-left: -21px;" onclick="changeStt(event)" >퇴사</button>
						</td>
					</tr>`;
				});
				$("#oEmpTbody").append(str);
			},
			error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
			}
		});
	}
};


// 상태 버튼 클릭하면 다른 상태로 바뀌기, 사번이랑 바꿀 상태 보냄- 전체, 퇴사는 상태 수정없는 조회 기능
function changeStt(event){
	// 선택한 사원 사번 가져와서 상태 update 하기
	// 클릭된 버튼의 부모 행(tr) 요소
    const tr = event.target.closest('tr');
	const btnVal = event.target.value;
	let nextStt = '';

    // 행 안의 각 셀(td)에서 정보
    const sttEmpNo = tr.querySelector('.td-padding:nth-child(1)').textContent;
    const empName = tr.querySelector('.td-padding:nth-child(2)').textContent;
    const empDeptNm = tr.querySelector('.td-padding:nth-child(3)').textContent;

    console.log("Employee btnVal:", btnVal);
    console.log("Employee Number:", sttEmpNo); // 2312110001
    console.log("Employee Name:", empName); // 이영흠
    console.log("Employee Department Name:", empDeptNm); // 의사

	// 상태 : 승인 대기 => 승인 완료
	if(btnVal === 'ACST01'){
		Swal.fire({
			title: '승인 처리하시겠습니까?',
			icon: 'question',
			showCancelButton: true,
			confirmButtonColor: '#0ABAB5',
			cancelButtonColor: '#8D9EA5',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => { // 이 부분이 수정되었습니다.
	        if (result.isConfirmed) {
	        	nextStt = 'ACST02';
				let sttData = {
						"empNo" : sttEmpNo,
						"empAcntState" : nextStt
				};
				
				$.ajax({
					url:"/emp/updateStt",
					contentType:"application/json;charset=utf-8",
					data: JSON.stringify(sttData),
					type:"post",
					dataType:"json",
					beforeSend:function(xhr){
						xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
					},
					success:function(rst){
						Swal.fire({
							title: '승인 완료되었습니다.',
							icon: 'success',
							confirmButtonColor: '#0ABAB5',
							confirmButtonText: '확인',
						}).then((result) => {
							// 목록 업데이트
							location.reload();
						});
					},
					error: function(xhr, status, error){
						console.log('Error:', xhr, status, error);
					}
				});
			}else if (result.isDismissed) { 
				return;
			}
		});
	} else if(btnVal === 'ACST03'){ // 상태 : 잠김 => (풀림)승인 완료
		Swal.fire({
			title: '잠김 해제하시겠습니까?',
			icon: 'question',
			showCancelButton: true,
			confirmButtonColor: '#0ABAB5',
			cancelButtonColor: '#FF4040',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			if (result.isConfirmed) {
	        	nextStt = 'ACST02';
				let sttData = {
						"empNo" : sttEmpNo,
						"empAcntState" : nextStt
				};
				
				$.ajax({
					url:"/emp/updateStt",
					contentType:"application/json;charset=utf-8",
					data: JSON.stringify(sttData),
					type:"post",
					dataType:"json",
					beforeSend:function(xhr){
						xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
					},
					success:function(rst){
						Swal.fire({
							title: '해제 완료되었습니다.',
							icon: 'success',
							confirmButtonColor: '#0ABAB5',
							confirmButtonText: '확인'
						}).then((result) => {
							// 목록 업데이트
							location.reload();
						});
					},
					error: function(xhr, status, error){
						console.log('Error:', xhr, status, error);
					}
				});
			}else if (result.isDismissed) { 
				return;
			}
			
		});
	
	} else if(btnVal === 'ACST02'){ // 승인완료 => 잠김 / 퇴사 - 바꾸면 변경 안됨 경고
		// 선택 모달 띄우기
		$("#updateSttModalHrd").modal("show");
		
		$(".stt-btn").on("click", function(e){
			if(e.target.id === 'lock-btn'){
				nextStt = 'ACST03';
				let sttData = {
						"empNo" : sttEmpNo,
						"empAcntState" : nextStt
				};
				
				$.ajax({
					url:"/emp/updateStt",
					contentType:"application/json;charset=utf-8",
					data: JSON.stringify(sttData),
					type:"post",
					dataType:"json",
					beforeSend:function(xhr){
						xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
					},
					success:function(rst){
						Swal.fire({
							title: '계정 잠김!',
							icon: 'success',
							confirmButtonColor: '#0ABAB5',
							confirmButtonText: '확인'
						}).then((result) => {
							// 목록 업데이트
							location.reload();
						});
					},
					error: function(xhr, status, error){
						console.log('Error:', xhr, status, error);
					}
				});
			}else{
				Swal.fire({
					title: '퇴사 처리는 되돌릴 수 없습니다.',
					text: '처리하시겠습니까?',
					icon: 'warning',
					showCancelButton: true,
					confirmButtonColor: '#0ABAB5',
					confirmButtonText: '확인',
					cancelButtonText: '취소'
				}).then((result) => {
					if (result.isConfirmed) {
						nextStt = 'ACST04';
						let sttData = {
								"empNo" : sttEmpNo,
								"empAcntState" : nextStt
						};
						
						$.ajax({
							url:"/emp/updateStt",
							contentType:"application/json;charset=utf-8",
							data: JSON.stringify(sttData),
							type:"post",
							dataType:"json",
							beforeSend:function(xhr){
								xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
							},
							success:function(rst){
								Swal.fire({
									title: '퇴사 처리되었습니다.',
									icon: 'success',
									confirmButtonColor: '#0ABAB5',
									confirmButtonText: '확인'
								}).then((result) => {
									// 목록 업데이트
									location.reload();
								});
							},
							error: function(xhr, status, error){
								console.log('Error:', xhr, status, error);
							}
						});
					}else if (result.isDismissed) { 
						return;
					}
				});
				
			}
		});
	}
}

// 페이지 로딩
$(function(){
	// 자동 검색 데이터-승인 관련 목록 불러오기
	$.ajax({
		url: "/hrd/getPermEmpList",
		dataType: 'json',
		type: 'get',
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(rst){
			$.each(rst, function(index,vo){
				let str = "";
				$.each(vo, function(index, column){
					if(index == 'empNo'){
						str += (column + ' ');
					}
					if(index == 'empName'){
						str += (column + ' ');
					}
					if(index == 'empDeptNm'){
						str += (column);
					}
				})
				dataListW.push(str);
			})
			console.log(dataListW);
		},
		error: function(xhr, status, error){
			console.log('Error:', xhr, status, error);
		}
	});
	
	// 자동 검색 데이터-전체 목록 불러오기
	$.ajax({
		url: "/hrd/getEmpList",
		dataType: 'json',
		type: 'get',
		beforeSend:function(xhr){
			xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		},
		success: function(rst){
			$.each(rst, function(index,vo){
				let str = "";
				$.each(vo, function(index, column){
					if(index == 'empNo'){
						str += (column + ' ');
					}
					if(index == 'empName'){
						str += (column + ' ');
					}
					if(index == 'empDeptNm'){
						str += (column);
					}
				})
				dataList.push(str);
			})
			console.log(dataList);
		},
		error: function(xhr, status, error){
			console.log('Error:', xhr, status, error);
		}
	});
	
	// 승인 목록창
	// 대기 버튼을 누르면 완료가 사라짐
	 $('#inner-tab-11').click(function(){
		$('.waitingEmp').css('display', 'block');
		$('.permittedEmp').css('display', 'none');
		$('#inner-tab-11').attr('style', 'border-bottom: 3px solid var(--ci-01, #0ABAB5)' );
		$('#inner-tab-12').attr('style', 'border-bottom: 0px solid var(--ci-01, #0ABAB5)' );
	 });
	 // 완료 버튼을 누르면 대기가 사라짐
	 $('#inner-tab-12').click(function(){
		$('.permittedEmp').css('display', 'block');
		$('.waitingEmp').css('display', 'none');
		$('#inner-tab-12').attr('style', 'border-bottom: 3px solid var(--ci-01, #0ABAB5)' );
		$('#inner-tab-11').attr('style', 'border-bottom: 0px solid var(--ci-01, #0ABAB5)' );
	 });
	 
	 // 사원 목록창	
	 // 전체 버튼을 누르면 잠김, 퇴사가 사라짐
	 $('#inner-tab-21').click(function(){
		$('.wholeEmp').css('display', 'block');
		$('.lockedEmp').css('display', 'none');
		$('.outEmp').css('display', 'none');
		$('#inner-tab-21').attr('style', 'border-bottom: 3px solid var(--ci-01, #0ABAB5)' );
		$('#inner-tab-22').attr('style', 'border-bottom: 0px solid var(--ci-01, #0ABAB5)' );
		$('#inner-tab-23').attr('style', 'border-bottom: 0px solid var(--ci-01, #0ABAB5)' );
	 });
	 // 잠김 버튼을 누르면 전체, 퇴사가 사라짐
	 $('#inner-tab-22').click(function(){
		$('.wholeEmp').css('display', 'none');
		$('.lockedEmp').css('display', 'block');
		$('.outEmp').css('display', 'none');
		$('#inner-tab-22').attr('style', 'border-bottom: 3px solid var(--ci-01, #0ABAB5)' );
		$('#inner-tab-21').attr('style', 'border-bottom: 0px solid var(--ci-01, #0ABAB5)' );
		$('#inner-tab-23').attr('style', 'border-bottom: 0px solid var(--ci-01, #0ABAB5)' );
	 });
	// 퇴사 버튼을 누르면 전체, 잠김이 사라짐
	 $('#inner-tab-23').click(function(){
		$('.wholeEmp').css('display', 'none');
		$('.lockedEmp').css('display', 'none');
		$('.outEmp').css('display', 'block');
		$('#inner-tab-23').attr('style', 'border-bottom: 3px solid var(--ci-01, #0ABAB5)' );
		$('#inner-tab-21').attr('style', 'border-bottom: 0px solid var(--ci-01, #0ABAB5)' );
		$('#inner-tab-22').attr('style', 'border-bottom: 0px solid var(--ci-01, #0ABAB5)' );
	 });
	
	// 목록에서 사원 선택 - 모달 띄우기
	$(".emp-list-table").on("click", "tr", function(e){
		let empNo = $(this).find(".clickEmpNo").text();
		console.log(empNo);
		selectEmp(empNo);
	});
	// 모달 시작
	// 이미지 미리보기 시작
	let alreadyWarned = false; // 플래그 변수 초기화

	$("#uploadFile").on("change", fileSelected);
	
	function fileSelected(e) {
		    let files = e.target.files;
		    let fileArr = Array.prototype.slice.call(files);
		
		    fileArr.forEach(function(f) {
		        let isImage = f.type.match("image.*");
		
		        if (!isImage && !alreadyWarned) {
		            Swal.fire({
		                title: '이미지 파일이 아닙니다.',
		                text: '문제가 계속된다면 관리자에게 문의하세요',
		                icon: 'error',
		                confirmButtonColor: '#0ABAB5',
		                confirmButtonText: '확인',
		            });
		            
		        }
		
		        if (isImage) {
		            let reader = new FileReader();
		            reader.onload = function(e) {
		                console.log(e.target.result);
		                $("#atchFileCdHrd").attr("src", e.target.result);
		                e.target.result = '';
		            }
		            reader.readAsDataURL(f);
		        }
		    });
	}
	// 이미지 미리보기 끝
	// 해당 사원 이미지 출력
	$("#detailEmpModalHrd").on('show.bs.modal', function () {
		//initModal();
	});
	
	
	// 비밀번호 변경 버튼 누를 떄
	$(document).on('click', '#btnUpdatePw', function(){
		$('#empPwHrd').removeAttr('readonly');
		$('#empPwHrd').css('background-color', '#F8F9FC');
		$('#pwConfirmHrd').removeAttr('readonly');
		$('#pwConfirmHrd').css('background-color', '#F8F9FC');
	})
	
	
	// 다음 우편 번호 검색 후 클릭하면 주소칸에 자동입력
	$("#btnPostHrd").on("click", function(){
		new daum.Postcode({
		//다음 창에서 검색이 완료되면 콜백함수에 의해 결과 데이터가 data 객체로 들어옴
			oncomplete:function(data){
				$("#empZipHrd").val(data.zonecode);
				$("#empAdd1Hrd").val(data.address);
				$("#empAdd2Hrd").val(data.buildingName);
			}
		}).open();
	});
    
	// 비밀번호 확인
    let pw = $("#empPwHrd");
	let pwCf = $("#pwConfirmHrd");
    
	// 확인란 입력되면 비밀번호와 일치하는지 검사
	pwCf.on("change", function(){
		if(pw.val() != pwCf.val()) {
	        Swal.fire({
		    	title: '비밀번호가 일치하지 않습니다.',
		    	text: '문제가 계속된다면 관리자에게 문의하세요',
		    	icon: 'error',
		    	confirmButtonColor: '#0ABAB5',
		    	confirmButtonText: '확인',
			})
	        
			// 비밀번호가 일치하지 않으면 내용을 비워줌
			pw.val("");
	        pwCf.val("");
			
	        return false;
	    } 
	})
	// 직무 따라서 직책 선택지 바꾸기
	$('#empDeptCdHrd').on("change", function(){
		let empDeptcd = $(this).val();
		let deptComCd = "";
		let temp = $("#empJbpsCdHrd");
		// 직무 코드에 해당하는 직책 코드에서 공통되는 부분을 찾을 값으로 설정
		if(empDeptcd == 'DTCD01'){
			deptComCd = 'JBCD1';
		} else if (empDeptcd == 'DTCD02'){
			deptComCd = 'JBCD2';
		} else if (empDeptcd == 'DTCD03'){
			deptComCd = 'JBCD3';
		} else {
			deptComCd = 'JBCD0';
		}
		
		let data = {"empDeptCd" : deptComCd};
		
		$.ajax({
			url:"/comcode/detailCodeListAjax",
			contentType:"application/json;charset=utf-8",
			data:JSON.stringify(data),
			type:"post",
			async: false,
			dataType:"json",
			beforeSend:function(xhr){
				xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
			},
			success:function(result){
				console.log(result);
				temp.html("");
	            $.each(result, function (idx) {
	                // 직책 선택지 출력
	                let temp_html = '';
	                temp_html +='<option value='+result[idx].comDetCode+'>'+result[idx].comDetCodeNm+'</option>';
	            	temp.append(temp_html);
	            });
			},
			error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
			}
		});
	});
	
	// 수정 버튼 누르면 formData 담아서 ajax로
	$("#updateEmpHrd").on("click", function(){
		// 모달창 input 값
		var fileInput = $("#uploadFile")[0];
		var empNo = $("#empNoHrd").val();
		var empName = $("#empNameHrd").val();
		var empPw = $("#empPwHrd").val();
		var empZip = $("#empZipHrd").val();
		var empAdd1 = $("#empAdd1Hrd").val();
		var empAdd2 = $("#empAdd2Hrd").val();
		var empPh = $("#empPhHrd").val();
		var empMail = $("#empMailHrd").val();
		var empReg = $("#empRegHrd").val();
		var empDeptCd = $("#empDeptCdHrd").val();
		var empJbpsCd = $("#empJbpsCdHrd").val();
		
		var formData = new FormData();
	
		// 파일 선택됐으면 저장
	    if (fileInput.files.length > 0) {
	    	formData.append('uploadFile', fileInput.files[0]);
	    }
		
	    if (empNo == "" || empPh == "" || empMail == "" || empReg == "" || empZip == "" || empAdd1 == "" || empAdd2 == "") {
			Swal.fire({
			   	title: '입력 오류',
			   	text: '입력이 부족합니다. 모든 항목을 입력해주세요.',
			   	icon: 'error',
			   	confirmButtonColor: '#0ABAB5',
			   	confirmButtonText: '확인',
			})
			return;
		}
        
        formData.append("empNo", empNo);
        formData.append("empName", empName);
        if(empPw !== ''){
        	formData.append("empPw", empPw);
        }
        formData.append("empZip", empZip);
        formData.append("empAdd1", empAdd1);
        formData.append("empAdd2", empAdd2);
        formData.append("empPh", empPh);
        formData.append("empMail", empMail);
        formData.append("empReg", empReg);
        formData.append("empDeptCd", empDeptCd);
        formData.append("empJbpsCd", empJbpsCd);
    
		// 서버로 전송
		$.ajax({
    		type: 'POST',
    		url: '/hrd/update',
    		data: formData,
    		processData: false,
    		contentType: false,
    		enctype: 'multipart/form-data',
    		beforeSend: function(xhr) {
        		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
    		},
    		success: function(rst) {
        		console.log('hrd/update : ',rst);
        		if(rst.result === 'success'){
					Swal.fire({
				    	title: '성공!',
				    	text: '사원 정보 수정 ',
				    	icon: 'success',
				    	confirmButtonColor: '#0ABAB5',
				    	confirmButtonText: '확인',
					}).then(result => {
						$("#detailEmpModalHrd").modal("hide");
						location.reload();
					})
				}
    		},
    		error: function(error) {
    			Swal.fire({
			    	title: '실패!',
			    	text: '재시도 ',  
			    	icon: 'error',
			    	confirmButtonColor: '#0ABAB5',
			    	confirmButtonText: '확인',
				}).then(then => {
					$("#detailEmpModalHrd").modal("hide");
	    			location.reload();
				})
    		}
		});
	});
	// 모달 끝


	// 탭 누르면 해당 상태 사원 목록만 보임
	$(".inner-tab").on("click", function(){
		// div에 value값으로 넣어놓은 공통코드 가져오기
	    let con = $(this).attr("value");
	    selectedStt(con);
	});


});
</script>