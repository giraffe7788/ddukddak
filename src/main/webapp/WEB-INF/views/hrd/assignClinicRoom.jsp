<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
/* 어사이드 강조 */
.aside-per-assig{
	width: 196px;
	border-radius: 16px 0px 0px 16px;
	background: var(--bg-02, #DBF2F4);
	height: 56px;
	border-right: 4px solid var(--ci-01, #0ABAB5);
	margin-left: 4px;
	color: var(--ci-01, #0ABAB5);
}
/*페이지 전용 시작 */
.doctor-office-wrap {
	width: 660px;
}
.doctor-office{
	height: 365px;	
	width: 300px;
	float: left;
	margin: 4px 2px 4px 2px;
}
.doctor-in-office{
	height: 365px;	
	width: 300px;
	float: left;
	margin: 4px 2px 4px 2px;
}
.doctor-office-top{
    display: flex;
    flex-direction: column;
    align-items: center;
}
.doctor-office-input{
	width: 160px;
	margin-bottom: 12px;
}
.doctor-office-bottom{
	display: flex;
	margin-top: 20px;
}
.doctor-office-head{
    display: flex;
    flex-direction: row;
    align-content: stretch;
    justify-content: space-between;
}
.office-row-left{
	display: flex;
    flex-direction: column;
    width: 95px;
    margin-right: 6px;
}
.office-row-right{
	display: flex;
    justify-content: space-between;
    flex-direction: column;
}
.office-p{
	font-size: 1.2em;
	margin-bottom: 13px;
}
.search{
	background-image: url(/resources/images/Search.png);
	background-repeat: no-repeat;
	background-position: 372px center;
	width: 412px;
	height: 48px;
	margin-left: 18px;
}
.btn-state {
	font-size: 10.9px;
    padding: 4px 8px;
    width: 100%;
}
.doctor-info{
	width: 440px;
	height: 362px;
	margin: 4px 4px;
}
.doctor-info-div{
	height: 840px;
	width: 932px;
}
.doctor-info-wrap{
	display: flex;
	flex-wrap: wrap;
	overflow: auto;
    width: 910px;
    height: 740px;
}
.circle {
	width: 175px; /* 원의 지름 */
	height: 175px; /* 원의 지름 */
	border-radius: 50%; /* 테두리를 원형으로 만듦 */
	border: 1px solid var(--border, #E0E8E6);
	overflow: hidden;
}
.circle img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
.text-align-right{
	text-align: right;
}
.dduk-row{
	height: 180px;
	gap: 8px;
}
.dduk-row-left{
	display: flex;
    justify-content: space-between;
    flex-direction: column;
}
.dduk-row-right{
	display: flex;
    justify-content: space-between;
    flex-direction: column;
}
.dduk-row-right-input{
    width: 150px;
    margin: 0px 0px 4px 0px
}
.dduk-bottom{
	margin-top: 10px;
	display: flex;
}
.inner-div{
	font-size: 1.2em;
	text-align: center;
	margin-bottom: 25px;
}
p{
	margin: 0rem;
}
.schedule-div{
    width: 125px;
    height: 110px;
    display: flex;
    margin: 20px 4px;
    flex-direction: column;
    align-items: center;
}
.schedule-div-aside{
	width: 75px;
	margin: 20px 4px;
}
.notice-text{
	height: 90%;
}
.selected {
    background-color: #EDF8F9;
}
/* 진료실 배정 페이지 전용 끝 */
</style>
<html>
<body>
	<div>
		<div class="dduk-body-border doctor-info-div">
			<div class="dduk-title-area">
				<h2>의사 목록</h2>
			</div>
			<div class="autocomplete"></div>
			<div class="doctor-info-wrap">
				<c:forEach var="doctorVO" items="${doctorVOList}">
					<div class="dduk-inner-border doctor-info">
						<div class="dduk-row">
							<div class="circle">
								<img alt=""
									src="/resources/upload/empProfile/${doctorVO.atchFileDetailSavenm}">
							</div>

							<div class="dduk-row-left">
								<p class="text-align-right" style="margin-top: 2px;">이름 :</p>
								<p class="text-align-right">부서 :</p>
								<p class="text-align-right">직책 :</p>
								<p class="text-align-right">연락처 :</p>
								<input type="hidden" id="doctor-emp-no" value="${doctorVO.empNo}" />
							</div>

							<div class="dduk-row-right">
								<input type="text" class="dduck-input dduk-row-right-input"	value="${doctorVO.empName}" disabled><br />
								<c:if test="${doctorVO.empDeptCd=='DTCD01'}">
									<input type="text" class="dduck-input dduk-row-right-input"	value="의사" disabled>
									<br />
								</c:if>
								<c:choose>
									<c:when test="${doctorVO.empJbpsCd=='JBCD10'}">
										<input type="text" class="dduck-input dduk-row-right-input"	value="일반의" disabled>
										<br />
									</c:when>
									<c:when test="${doctorVO.empJbpsCd=='JBCD11'}">
										<input type="text" class="dduck-input dduk-row-right-input"	value="수련의" disabled>
										<br />
									</c:when>
									<c:when test="${doctorVO.empJbpsCd=='JBCD12'}">
										<input type="text" class="dduck-input dduk-row-right-input"	value="전공의" disabled>
										<br />
									</c:when>
									<c:when test="${doctorVO.empJbpsCd=='JBCD13'}">
										<input type="text" class="dduck-input dduk-row-right-input"	value="전문의" disabled>
										<br />
									</c:when>
								</c:choose>
								<input type="text" class="dduck-input dduk-row-right-input" value="${doctorVO.empPh}" disabled><br />
							</div>
						</div>

						<div class="dduk-bottom">
							<div class="schedule-div-aside">
								<div class="inner-div">일정</div>
								<div class="inner-div">없음</div>
							</div>

							<div class="schedule-div">
								<div class="inner-div">시작일시</div>
								<div class="inner-div"></div>
							</div>

							<div class="schedule-div">
								<div class="inner-div">종료일시</div>
								<div class="inner-div"></div>
							</div>
							<c:set var="foundMatch" value="false" />
							<c:forEach var="docOfficeVO" items="${docOfficeVOList}"
								varStatus="stat">
								<c:if
									test="${!foundMatch && docOfficeVO.empNo == doctorVO.empNo}">
									<c:set var="foundMatch" value="true" />
									<div class="schedule-div">
										<div class="inner-div">진료가능 여부</div>
										<div class="inner-div">
											<input type="button" class="dduk-btn-active" value="진료중" />
										</div>
									</div>
								</c:if>
							</c:forEach>
							<c:if test="${!foundMatch}">
								<div class="schedule-div">
									<div class="inner-div">진료가능 여부</div>
									<div class="inner-div">
										<input type="button" class="dduk-btn-info" value="진료 가능" />
									</div>
								</div>
							</c:if>
							
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<div class="dduk-body-border doctor-office-wrap"
		style="position: relative;">
		<div class="dduk-title-area">
			<h2>진료실 현황</h2>
		</div>
		<c:forEach var="docOfficeVO" items="${docOfficeVOList}"
			varStatus="stat">
				<c:choose>
					<c:when test="${empty docOfficeVO.empNo}">
						<div class="dduk-inner-border doctor-office" id="DO0${stat.count}">
							<div>
								<h3>
									진료실 ${stat.count}&nbsp;<span id="clinicCondition"></span>
								</h3>
							</div>
							<div class="notice-text">진료중인 의사가 없습니다.</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="dduk-inner-border doctor-in-office" id="DO0${stat.count}">
							<div class="doctor-office-head">
								<div>
									<h3>진료실 ${stat.count}</h3>
								</div>
								<div style="display: flex;">
									<span id="clinicCondition" style="color: red;">진료중&nbsp;</span><input type="button" class="dduk-btn-danger" 
									style="display: inline;" value="배정 취소"/>
									<input type="hidden" id="doctor-office-no" value="${docOfficeVO.doNo}"/>
								</div>
							</div>
							<div class="doctor-office-body">
								<div class="doctor-office-top">
									<div class="circle">
										<img alt=""
											src="/resources/upload/empProfile/${docOfficeVO.atchFileDetailSaveNm}">
									</div>
								</div>
								<div class="doctor-office-bottom">
									<div class="office-row-left">
										<p class="text-align-right office-p">이름 :</p>
										<p class="text-align-right office-p">사용시작일 :</p>
										<p class="text-align-right office-p">사용종료일 :</p>
									</div>
									<div class="office-row-right">
										<input type="text" class="dduck-input doctor-office-input"
											value="${docOfficeVO.empName}" />
										<input type="text"
											class="dduck-input doctor-office-input"
											value="<fmt:formatDate value="${docOfficeVO.doStdt}" pattern="yyyy-MM-dd"/>" />
										<input type="text" class="dduck-input doctor-office-input"
											value="<fmt:formatDate value="${docOfficeVO.doEddt}" pattern="yyyy-MM-dd"/>" />
									</div>
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		
<script>
$(document).ready(function() {
	$('.aside-per-assig').find('svg').find('path').attr('fill', '#0ABAB5');
	$('.aside-per-assig').find('.dduk-nav-menu').css('color', '#0ABAB5');
});

// 의사를 클릭하면 강조되는 이벤트
const doctorInfos = document.querySelectorAll('.doctor-info');
const doctorOffices = document.querySelectorAll('.doctor-office');
var doctorEmpNo = "";
let selectedExists = false; // selected 클래스가 있는지 여부 확인

//진료 불가능이나 진료중 버튼을 찾아서 존재한다면 선택되지 못하게 하기
function checkDoctorCondition(info){
    var dangerButton = info.querySelectorAll('.dduk-btn-danger');
    var activeButton = info.querySelectorAll('.dduk-btn-active');
    
    if(dangerButton.length > 0 || activeButton.length > 0){
        Swal.fire({
            title: '다른 의사를 선택해주세요.',
            icon: 'error',
            showCancelButton: false,
            confirmButtonColor: '#0ABAB5',
            cancelButtonColor: '#8D9EA5',
            confirmButtonText: '확인',
            cancelButtonText: '취소'
        });
        return true; // 불가능한 상황일 경우 true 반환하여 이벤트 종료
    }
    return false; // 가능한 상황일 경우 false 반환하여 계속 진행
}

//의사를 선택하지 않고 진료실을 클릭하면 막기
function blockIfNotSelectDoctor(event){

	console.log(event.target);
	
	doctorInfos.forEach(info => {
        if (info.classList.contains('selected')) {
            selectedExists = true;
        }
    });

    if (!selectedExists) {
        Swal.fire({
            title: '의사를 선택해주세요.',
            icon: 'error',
            showCancelButton: false,
            confirmButtonColor: '#0ABAB5',
            cancelButtonColor: '#8D9EA5',
            confirmButtonText: '확인',
            cancelButtonText: '취소'
        })
        return true;
    };
    return false;
}

//진료실 현황에 진료실 배정이 있으면 다른 곳은 배정으로 바뀌지 않게하기
function blockAssigningOtherClinicRoom() {
	let isInProgress = false;
	
	doctorOffices.forEach(function(office){
		if(office.querySelector('h3').innerText == '진료실 배정'){
			isInProgress = true;
			return;
		}
	})
	return isInProgress;
}

// 진료중인 담당의가 존재하면 배정이 불가능하게 만들기
function blockIfClinicProgressing(office){
	let isInProgress = false;
	if(office.querySelector('#clinicCondition').innerHTML.includes("진료중")){
		Swal.fire({
            title: '진료가 진행중입니다.',
            icon: 'warning',
            showCancelButton: false,
            confirmButtonColor: '#0ABAB5',
            cancelButtonColor: '#8D9EA5',
            confirmButtonText: '확인',
            cancelButtonText: '취소'
        })
		isInProgress = true;
	}
	return isInProgress;
}

// 의사를 클릭하면 진료 가능 여부를 판단하고 강조 클래스를 추가하기
doctorInfos.forEach(info => info.addEventListener('click',function(){
    // 진료 불가능 버튼을 찾아서 존재한다면 선택되지 못하게 하기
    if (checkDoctorCondition(info)) {
        return; // 불가능한 상황일 경우 이벤트 종료
    }
    // 다른 div의 selected를 지우기
    doctorInfos.forEach(otherInfo => {
        if (otherInfo !== info) {
            otherInfo.classList.remove('selected');
        }
    });
    // selected 클래스 추가
    info.classList.add('selected');
    doctorEmpNo = info.querySelector('#doctor-emp-no').value;
    console.log(doctorEmpNo);
}));

// 진료실 배정
var doNo = "";
var doctorOffice = "";

doctorOffices.forEach(office => office.addEventListener('click',function(){
	// 의사를 선택하지 않고 진료실을 클릭하면 막기
	if(blockIfNotSelectDoctor(office)){
		return;
	}
	
	// 진료중인 담당의가 존재하면 배정이 불가능하게 만들기
	if(blockIfClinicProgressing(office)){
		return;
	}
	
	// 진료실 현황에 진료실 배정이 있으면 다른 곳은 배정으로 바뀌지 않게하기
	if(office.querySelector('h3').innerText != '진료실 배정'){
		if(blockAssigningOtherClinicRoom()){
			 Swal.fire({
		            title: '배정이 진행중입니다.',
		            icon: 'warning',
		            showCancelButton: false,
		            confirmButtonColor: '#0ABAB5',
		            cancelButtonColor: '#8D9EA5',
		            confirmButtonText: '확인',
		            cancelButtonText: '취소'
		        })
			return;
		}
	}
	
	
    doNo = office.getAttribute('id');
    doctorOffice = office.getAttribute('id');
    
 
   	var cont = `
     	<div>
			<h3>진료실 배정</h3>
		</div>
		<div class="doctor-office-top">
			<br/><br/>
			사용시작일 : <input type="date" id="clinic-str-dt"><br/>
			사용종료일 : <input type="date" id="clinic-end-dt"><br/>
			<input type="button" class="dduk-btn-info" id="assignBtn" value="배정"/>
		</div>
	     `
     office.innerHTML = cont;
}));

// 이벤트를 위임해서 동적으로 생긴 배정 버튼에 이벤트 주기
document.addEventListener('click', function(event) {
    if (event.target && event.target.id === 'assignBtn') {
        console.log('클릭');
        
        var clinicStrDt = document.querySelector('#clinic-str-dt').value;
        var clinicEndDt	= document.querySelector('#clinic-end-dt').value;
        
	    var docOfficeVO = {
	    		"doNo" : doNo,
	    		"empNo" : doctorEmpNo,
	    		"doStdt" : clinicStrDt,
	    		"doEddt" : clinicEndDt
	    }
	    
// 		xhr ajax
		const xhr = new XMLHttpRequest();
		const url = '/hrd/assignDoctorToClinicRoom';
		xhr.open('POST', url);
		xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
		xhr.onreadystatechange = function() {
		   if (xhr.readyState === XMLHttpRequest.DONE) {
		       if (xhr.status === 200) {
		           console.log(xhr.responseText);
		           location.reload();
		       } else {
		           console.error('요청 실패: ' + xhr.status);
		           // 요청 실패 시 실행할 코드
		       }
		   }
		};
		xhr.send(JSON.stringify(docOfficeVO));
    }
});

// 의사 마다 개인 일정을 확인하고 현재 시간 일정이 존재하면 진료 불가로 바꿔주는 이벤트
doctorInfos.forEach(info => {
	var doctorNo = info.querySelector('#doctor-emp-no').value;
	console.log("doctorNo", doctorNo)
	employeeVO = {
			"empNo" : doctorNo
	}
	
	const xhr = new XMLHttpRequest();
	const url = '/hrd/getPresentSchedule';
	xhr.open('POST', url);
	xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
	xhr.responseType = "json";
	xhr.onreadystatechange = function() {
		if (xhr.readyState === XMLHttpRequest.DONE) {
			if (xhr.status === 200) {
   	   			const receivedData = xhr.response; // response 속성을 이용하여 응답 데이터에 접근합니다.
	           	if(receivedData == null){ // null 체크
	        	   return;
	           	}
	    	  	if(doctorNo == receivedData.empNo){
	    	  		
	    	  		var strDate = receivedData.dsStrDate.replace("T"," ");
	    	  		var endDate = receivedData.dsEndDate.replace("T"," ");
	    	  		
	          		const cont = `
	                	<div class="schedule-div-aside">
		                    <div class="inner-div">일정</div>
		                    <div class="inner-div">\${receivedData.dsCate}</div>
		                </div>
		                
		                <div class="schedule-div">
		                    <div class="inner-div">시작일시</div>
		                    <div class="inner-div">\${strDate}</div>
		                </div>
		                
		                <div class="schedule-div">
		                    <div class="inner-div">종료일시</div>
		                    <div class="inner-div">\${endDate}</div>
		                </div>
		                
		                <div class="schedule-div">
		                    <div class="inner-div">진료가능 여부</div>
		                    <div class="inner-div"><input type="button" class="dduk-btn-danger" value="진료 불가"/></div>
		                </div>
		            `;
		       	     
		            var ddukBottom = info.querySelector('.dduk-bottom');
	           		ddukBottom.innerHTML = cont;
	    	   }
	    	   
	       } else {
	           console.error('요청 실패: ' + xhr.status);
	           // 요청 실패 시 실행할 코드
	       }
	   }
	};
	xhr.send(JSON.stringify(employeeVO));
})

// 배정 취소 누를 때 이벤트
var ddukBtnDanger = document.querySelectorAll('.dduk-btn-danger');
ddukBtnDanger.forEach(function(btn){
	btn.addEventListener('click',function(){
		 Swal.fire({
	            title: '배정을 취소하시겠습니까?',
	            icon: 'question',
	            showCancelButton: true,
	            confirmButtonColor: '#0ABAB5',
	            cancelButtonColor: '#8D9EA5',
	            confirmButtonText: '확인',
	            cancelButtonText: '취소'
	        }).then(result => {
				if (result.isConfirmed) {
					Swal.fire({
	                  title: '배정 취소 완료',
	                  icon: 'success',
	                  showCancelButton: false,
	                  confirmButtonColor: '#0ABAB5',
	                  cancelButtonColor: '#8D9EA5',
	                  confirmButtonText: '확인',
	                  cancelButtonText: '취소'
				}).then(result => {
					console.log("취소 완료 뒤 과정");
					
					var doNo = btn.closest('div').querySelector('#doctor-office-no').value;
					
					
					 var docOfficeVO = {
					    		"doNo" : doNo,
					    }
					
//			 		xhr ajax
					const xhr = new XMLHttpRequest();
					const url = '/hrd/removeDoctorFromClinicRoom';
					xhr.open('POST', url);
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
					xhr.onreadystatechange = function() {
					   if (xhr.readyState === XMLHttpRequest.DONE) {
					       if (xhr.status === 200) {
					           console.log(xhr.responseText);
					           location.reload();		        	  
					       } else {
					           console.error('요청 실패: ' + xhr.status);
					           // 요청 실패 시 실행할 코드
					       }
					   }
					};
					xhr.send(JSON.stringify(docOfficeVO));
				})
			}
		})
	})
})
</script>
</body>
</html>