<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="/resources/js/jquery-3.6.0.js"></script>
<title>문자인증</title>
</head>

<style>
/* 어사이드 강조 */
.aside-ams-crm{
	width: 196px;
	border-radius: 16px 0px 0px 16px;
	background: var(--bg-02, #DBF2F4);
	height: 56px;
	border-right: 4px solid var(--ci-01, #0ABAB5);
	margin-left: 4px;
	color: var(--ci-01, #0ABAB5);
}

/* mms.jsp 전용 */
/* 현재 선택된 검색어 */
/* 현재 선택된 검색어 */
.search{
	background-image: url(/resources/images/Search.png);
	background-repeat: no-repeat;
	background-position: 280px center;
	width: 312px;
	height: 36px;
	margin-left: 8px;
}

.autocomplete{
position: absolute;
z-index: 1;
left: 420px;
}

.autocomplete > div.active {
  background: #e0e5f6;
  color: #000;
  width: 300px;

}

.autocomplete > div {
  background: #f1f3f499;
  padding: .2rem .6rem;
  width: 300px;
}

#all-patient, #has-reservation-patient, #admission-patient{
	display: none;
}

.left, .right {
   width: 810px;
   box-sizing: border-box;
   height: 410px;
}

.container {
   display: flex;
}

.crm-wrap {
   display: flex;
   height: 357px;
   gap: 9px;
   margin-bottom: 52px;
}

#formDiv{
   margin-left : 30px;
}
.fmrBtn{
   float: left;
   margin: 2px;
}

img{
   width: 25px;
   height: 25px;
   margin-bottom: 5px;
   margin-left: 5px;
}
/* mms.jsp 전용 */
</style>

<body>
<div>
	<div class="crm-wrap">
		<div class="dduk-body-border left">
			<div class="container">
            <h2>
            <select id="formSlct">
               <option>양식 선택</option>
                  <c:forEach var="mmsFormVO" items="${mmsFormVOList}">
                     <option 
                        data-json='{"cont": "${mmsFormVO.getMmsFormCont()}", "cd": "${mmsFormVO.getMmsFormCd()}" }'
                        >${mmsFormVO.getMmsFormNm()}
                        </option><br/>
                  </c:forEach>
             </select>문자 작성</h2>
          
			</div>
            <div class="container">
			<h3>양식제목 : <input class="dduck-input" type="text" id="formNm" name="formNm"/></h3>
				<div id="formDiv">
	                <button type="button" id="addForm" class="dduk-btn-active fmrBtn">양식  추가</button>
	                <button type="button" id="updateForm" class="dduk-btn-normal fmrBtn">양식  수정</button>
	                <button type="button" id="deleteForm" class="dduk-btn-danger fmrBtn">양식  삭제</button>
                 </div>
            </div>
         	<hr/>
            
			<div class="container">
            	<textarea class="dduck-input" rows="12" cols="100" id="textArea" name="textArea" style="resize: none;"></textarea>
         	</div>
		</div>
      
		<div class="dduk-body-border right">
			<div class="contents"> 
            <h2>문자 발송 내역</h2>
            <hr/>
				<div class="card-body table-responsive p-0" style="height: 250px;">
					<table class="table table-head-fixed text-nowrap">
						<thead>
							<tr>
								<th>발신 직원</th>
								<th>수신 고객</th>
								<th>날짜</th>
								<th>내용</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="mmsHstrVO" items="${mmsHstrVOList}" varStatus="stat">
	                    	<tr>
		                        <td>${mmsHstrVO.mmsSent}</td>
		                        <td>${mmsHstrVO.mmsRecv}</td>
		                        <td><fmt:formatDate value="${mmsHstrVO.mmsDate}" pattern="yyyy-MM-dd" /></td>
		                        <td>${mmsHstrVO.mmsCont}</td>
	                    	</tr>
		                </c:forEach>
						</tbody>
					</table>
				</div>
         	</div>
      	</div>
	</div>
   
<br/>

   <div class="crm-wrap">
      <div class="dduk-body-border left">
         <div class="contents"> 
         	<div>
            <h2>
            <select id="patient-type">
               <option>분류</option>
               <option>전체</option>
               <option>예약</option>
               <option>입원</option>
            </select>
           	 환자 검색 : 
           	<input class="dduck-input search" type="text"  id="search" placeholder="분류를 선택한 뒤 환자 이름을 검색해주세요." onkeyup="searchFunction()" />
           	<div class="autocomplete"></div>
            </h2>
            </div>
            
            <hr/>
            
            <div class="card-body table-responsive p-0" style="height: 320px;">
	            <table class="table table-head-fixed text-nowrap" id="table">
					<thead style="position:sticky; top: 0;  background-color: #fff;">
						<tr class="tr-padding">
							<th><input type="checkbox" id="check-all-patient"/> 전체</th>
							<th>이름</th>
							<th>예약날짜</th>
							<th>예약시간</th>
							<th>전화번호</th>
						</tr>
					</thead>
					
					<tbody id="all-patient">
					<c:forEach var="patient" items="${patientVOList}" varStatus="status">
						<tr class="tr-padding all-patient-tr" data-paNo="${patient.paNo}">
							<td><input type="checkbox" class="all-patient-check"/></td>
							<td class="td-padding gray-text">${patient.paName}</td>
							<td class="td-padding gray-text"></td>
							<td class="td-padding gray-text"></td>
							<td class="td-padding gray-text">${patient.paPh}</td>
						</tr>
					</c:forEach>
					</tbody>
					
					<tbody id="has-reservation-patient">
					<c:forEach var="receptionVO" items="${receptionVOList}" varStatus="status">
						<tr class="tr-padding has-reservation-patient-tr" data-paNo="${receptionVO.patientVO.paNo}">
							<td><input type="checkbox" class="has-reservation-patient-check"/></td>
							<td class="td-padding gray-text">${receptionVO.patientVO.paName}</td>
							<td class="td-padding gray-text"><fmt:formatDate value="${receptionVO.rsvtDt}" pattern="MM월 dd일"/></td>
							<td class="td-padding gray-text"><fmt:formatDate value="${receptionVO.rsvtDt}" pattern="hh:mm"/></td>
							<td class="td-padding gray-text">${receptionVO.patientVO.paPh}</td>
						</tr>
					</c:forEach>
					</tbody>
					
					<tbody id="admission-patient">
					<c:forEach var="admissionPatientVO" items="${admissionPatientVOList}" varStatus="status">
						<tr class="tr-padding admission-patient-tr" data-paNo="${admissionPatientVO.paNo}">
							<td><input type="checkbox" class="admission-patient-check"/></td>
							<td class="td-padding gray-text">${admissionPatientVO.paName}</td>
							<td class="td-padding gray-text"></td>
							<td class="td-padding gray-text"></td>
							<td class="td-padding gray-text">${admissionPatientVO.paPh}</td>
						</tr>
					</c:forEach>
					</tbody>
					
					<tbody id="searched-patient">
					</tbody>
					
				</table>
			</div>
			
         </div>
      </div>
      
	<div class="dduk-body-border right">
		<div class="contents"> 
			<!-- 문자보내는 전송버튼 -->
			<h2> 발송 대상<img src="/resources/images/send.png"/><button type="button" class="dduk-btn-active" id="send" style="float: right;">발송</button></h2>
		</div>
        <hr/>
        <div class="card-body table-responsive p-0" style="height: 320px;">
			<table class="table table-head-fixed text-nowrap">
				<thead style="position:sticky; top: 0;  background-color: #fff;">
					<tr class="tr-padding">
						<th><input type="checkbox" id="check-all-send"/> 전체</th>
						<th>이름</th>
						<th>예약날짜</th>
						<th>예약시간</th>
						<th>전화번호</th>
					</tr>
				</thead>
				<tbody id="send-patient-list">
				</tbody>
			</table>
		</div>
      </div>
   </div>
</div>
</body>

<script type="text/javascript">
$(document).ready(function() {
	$('.aside-ams-crm').find('svg').find('path').attr('fill', '#0ABAB5');
	$('.aside-ams-crm').find('.dduk-nav-menu').css('color', '#0ABAB5');
});

function searchFunction() {
    var input, filter, table, tr, td, i, txtValue;
    
	if($('#patient-type option:selected').val()=='전체'){
		table = document.querySelector("#all-patient");
    	tr = table.querySelectorAll(".all-patient-tr");
	}else if($('#patient-type option:selected').val()=='예약'){
		table = document.querySelector("#has-reservation-patient");
    	tr = table.querySelectorAll(".has-reservation-patient-tr");
	}else{
		table = document.querySelector("#admission-patient");
		tr = table.querySelectorAll(".admission-patient-tr");
	}
	
    input = document.getElementById("search");
    filter = input.value.toUpperCase();
   
    console.log(tr);

    for (i = 0; i < tr.length; i++) { // 시작 인덱스를 1로 설정하여 테이블 헤더를 제외
        td = tr[i].getElementsByTagName("td")[1]; // 여기서 1은 학생명이 있는 열의 인덱스입니다.
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

//function들에서 쓸 변수
var dataJson="";
var data="";
var cd="";
const table = document.getElementById('table');

$(document).ready(function() {
	//접수 아이콘 강조
	$('.aside-ams-crm').find('svg').find('path').attr('fill', '#0ABAB5');
	
   $('#formSlct').change(formSlctChange);
   
   sendMMS();
   addForm();
   updateForm();
   deleteForm();
});

function formSlctChange(){
   //선택된 option에 들어있는 data-json 꺼내기
   dataJson = $('#formSlct option:selected').attr('data-json');
   data = JSON.parse(dataJson);
   
   //각 변수에 코드와 내용 할당
   cd = data.cd;
   var cont = data.cont;
   
   $('#formNm').val($('#formSlct option:selected').val());
   $('#textArea').val(cont);
};

$(document).on('change', '.all-patient-check', function() {
    if ($(this).is(':checked')) {
        $('#send-patient-list').prepend($(this).closest('tr'));
        console.log("체크됨");
    } else {
        $('#all-patient').prepend($(this).closest('tr'));
        console.log("체크해제됨");
    }
});

//셀렉트 변경될 때
$('#patient-type').change(function(){
    $('#send-patient-list tr').each(function(index, element){
        $(element).find('input[type="checkbox"]').prop('checked', false);
        var className = $(element).attr('class');
        if(className.includes('all-patient-tr')){
            $('#all-patient').prepend(element);
        }else if(className.includes('has-reservation-tr')){
        	$('#has-reservation-patient').prepend(element);
        }else if(className.includes('admission-patient-tr')){
        	$('#admission-patient').prepend(element);
        }
    });
	
	//선택된 옵션이 전체 일 때
	if($('#patient-type option:selected').val()=='전체'){
		//검색창 초기화
		$('#search').val("");
		//예약 환자 테이블 숨기기
		$('#has-reservation-patient').hide();
		//입원 환자 테이블 숨기기
		$('#admission-patient').hide();
		//모든 환자 테이블 보이기
		$('#all-patient').show();
	}
	if($('#patient-type option:selected').val()=='예약'){
		//검색창 초기화
		$('#search').val("");
		//모든 환자 테이블 숨기기
		$('#all-patient').hide();
		//입원 환자 테이블 숨기기
		$('#admission-patient').hide();
		//예약 환자 테이블 보이기
		$('#has-reservation-patient').show();
	}
	if($('#patient-type option:selected').val()=='입원'){
		//검색창 초기화
		$('#search').val("");
		//모든 환자 테이블 숨기기
		$('#all-patient').hide();
		//검색 환자 테이블 숨기기
		$('#searched-patient').hide();
		//예약 환자 테이블 숨기기
		$('#has-reservation-patient').hide();
		//예약 환자 테이블 보이기
		$('#admission-patient').show();
	}
});


//전체 체크되면 모두 체크되기
$('#check-all-patient').change(function(){
	//공통으로 쓸 변수
	var tr = "";
	var firstTd = "";
	var sendPatientList = $('#send-patient-list');
	
    if($(this).is(':checked')) {
        if($('#patient-type option:selected').val() == '전체') {
            tr = document.querySelectorAll('.all-patient-tr');
            
            tr.forEach(function(row) {
                firstTd = row.querySelector('.all-patient-check');
                firstTd.checked = true; // checked 속성 변경
                sendPatientList.append(row);
            });
        }
        
        if($('#patient-type option:selected').val() == '예약') {
            tr = document.querySelectorAll('.has-reservation-patient-tr');
            
            tr.forEach(function(row) {
                firstTd = row.querySelector('.has-reservation-patient-check');
                firstTd.checked = true; // checked 속성 변경
                sendPatientList.append(row);
            });
        }
        
        if($('#patient-type option:selected').val() == '입원') {
            tr = document.querySelectorAll('.admission-patient-tr');
            
            tr.forEach(function(row) {
                firstTd = row.querySelector('.admission-patient-check');
                firstTd.checked = true; // checked 속성 변경
                sendPatientList.append(row);
            });
        }
    }
    $('#check-all-patient').prop('checked', false);
});

//전송 전체 체크하면 다시 되돌리는겨
$('#check-all-send').change(function(){
	if($(this).is(':checked')) {
		if($('#patient-type option:selected').val()=='전체'){
			$('.all-patient-check').prop('checked', false);
			$('#all-patient').append($('.all-patient-check').parent().parent());
		}
		if($('#patient-type option:selected').val()=='예약'){
			$('.has-reservation-patient-check').prop('checked', false);
			$('#has-reservation-patient').append($('.has-reservation-patient-check').parent().parent());
		}
		if($('#patient-type option:selected').val()=='입원'){
			$('.admission-patient-check').prop('checked', false);
			$('#admission-patient').append($('.admission-patient-check').parent().parent());
		}
	}
	$('#check-all-send').prop('checked', false);
});

//전체 환자로 불러온 애들 왔다갔다 로직
$('.all-patient-check').change(function() {
       if ($(this).is(':checked')) {
    	   $('#send-patient-list').prepend($(this).closest('tr'));
       }else{
    	   $('#all-patient').prepend($(this).parent().parent());
       }
});

//예약 환자로 불러온 애들 왔다갔다 로직
$('.has-reservation-patient-check').change(function() {
       if ($(this).is(':checked')) {
    	   $('#send-patient-list').prepend($(this).parent().parent());
       }else{
    	   $('#has-reservation-patient').prepend($(this).parent().parent());
       }
   });

//입원 환자 왔다갔다
$('.admission-patient-check').change(function() {
       if ($(this).is(':checked')) {
    	   $('#send-patient-list').prepend($(this).parent().parent());
       }else{
    	   $('#admission-patient').prepend($(this).parent().parent());
       }
   });

$(document).on('change', '.all-search-tr td:nth-child(1) input[type="checkbox"]', function() {
	if ($(this).is(':checked')) {
 	   $('#send-patient-list').prepend($(this).closest('tr'));
    }else{
 	   $('#searched-patient').prepend($(this).parent().parent());
    }
});

$(document).on('change', '.reservation-search-tr td:nth-child(1) input[type="checkbox"]', function() {
	if ($(this).is(':checked')) {
 	   $('#send-patient-list').prepend($(this).closest('tr'));
    }else{
 	   $('#searched-patient').prepend($(this).parent().parent());
    }
});

//내역 추가
function addHstr(dataArray){
   var mmsHstrVOList = [];
   
   for(let i = 0; i < dataArray.length; i++){
	  var data = {
	   "mmsFormCd" : cd,
       "mmsSent" : empName,
       "mmsRecv" : dataArray[i].toName,
       "mmsCont" : dataArray[i].text
	  }
	  mmsHstrVOList.push(data);
	  console.log(data);
   }
   
   $.ajax ({
      url: '/crm/addHstr',
      type: 'POST',
      data: JSON.stringify(mmsHstrVOList),
//       dataType: "json",
      contentType:"application/json;charset=utf-8",
      beforeSend:function(xhr){
         xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
      },
      success: function(data) {
    	  Swal.fire({
              title: '발송 성공',
              icon: 'success',
              showCancelButton: false,
              confirmButtonColor: '#0ABAB5',
              cancelButtonColor: '#8D9EA5',
              confirmButtonText: '확인',
              cancelButtonText: '취소'
           }).then((result) => {
              // 확인버튼 클릭시
              if (result.isConfirmed) {
            	  window.location.href = '/crm/mms';
              }
           })
      },
       error: function(jqXHR, textStatus, errorThrown) {
    	   Swal.fire({
               title: '발송 실패',
               icon: 'error',
               showCancelButton: false,
               confirmButtonColor: '#0ABAB5',
               cancelButtonColor: '#8D9EA5',
               confirmButtonText: '확인',
               cancelButtonText: '취소'
    	   });
       	}
	});
};

//문자 보내기
function sendMMS(){
	$('#send').click(function() {
	  var dataArray = [];
	  var content = "";
	  
      for(let i = 0; i < $('#send-patient-list tr').length; i++){
    	  content = $('#textArea').val();
    	 
    	  //환자 이름 치환
    	  var replacedContent = content.replace("{환자명}",$('#send-patient-list tr').eq(i).children().eq(1).html());
    	  
    	  //월/일/시간 합치기
    	  var date = $('#send-patient-list tr').eq(i).children().eq(2).html() + " " + $('#send-patient-list tr').eq(i).children().eq(3).html() + '시';
    	  
    	  //예약 날짜 치환
    	  replacedContent = replacedContent.replace("{예약시간}",date);
    	  
    	  var obj = {
    			  "to" : $('#send-patient-list tr').eq(i).children().eq(4).html(),
    			  "text" : replacedContent,
    			  "toName" : $('#send-patient-list tr').eq(i).children().eq(1).html()
    	  }
    	  dataArray.push(obj);
      }
      
      $.ajax ({
         url: '/crm/sendMMS',
         type: 'POST',
         contentType:"application/json;charset=utf-8",
         data: JSON.stringify(dataArray),
         beforeSend:function(xhr){
             xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
          },
         success: function() {
        	 addHstr(dataArray);
         },
          error: function(jqXHR, textStatus, errorThrown) {
        	  Swal.fire({
                  title: '발송 실패',
                  icon: 'error',
                  showCancelButton: false,
                  confirmButtonColor: '#0ABAB5',
                  cancelButtonColor: '#8D9EA5',
                  confirmButtonText: '확인',
                  cancelButtonText: '취소'
				});
			}
		});
	});
};

//양식 추가
function addForm(){
   $('#addForm').click(function() {
      var mmsFormNm = $('#formNm').val().trim();
      var mmsFormCont = $('#textArea').val();
      
      var mmsFormVO = {
            "mmsFormNm":mmsFormNm,
            "mmsFormCont":mmsFormCont}
      
      $.ajax ({
         url: '/crm/addForm',
         type: 'POST',
         data: JSON.stringify(mmsFormVO),
   //       dataType: "json",
         contentType:"application/json;charset=utf-8",
         beforeSend:function(xhr){
            xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
         },
         success: function(data) {
            if(data!=null){
            	Swal.fire({
                   title: '추가 성공',
                   icon: 'success',
                   showCancelButton: false,
                   confirmButtonColor: '#0ABAB5',
                   cancelButtonColor: '#8D9EA5',
                   confirmButtonText: '확인',
                   cancelButtonText: '취소'
                }).then((result) => {
                   // 확인버튼 클릭시
                   if (result.isConfirmed) {
                          // 이전에 선택된 요소의 클래스 초기화
                          $('#formSlct option:selected').removeAttr('selected');
                          // 셀렉트의 옵션 추가
                          $('#formSlct').append(
	                      '<option data-json=\'{"cont":"' + data.mmsFormCont + '", "cd":"' + data.mmsFormCd + '"}\' selected>' 
	                      +data.mmsFormNm+
	                      '</option>');
                          // 입력창의 내용을 방금 추가한 양식의 제목과 내용으로 변경
                          formSlctChange();
                   }
               })
            }
         },
          error: function(jqXHR, textStatus, errorThrown) {
        	  Swal.fire({
                  title: '추가 실패',
                  icon: 'error',
                  showCancelButton: false,
                  confirmButtonColor: '#0ABAB5',
                  cancelButtonColor: '#8D9EA5',
                  confirmButtonText: '확인',
                  cancelButtonText: '취소'
				});
			}
		});
	});
};

//양식 수정
function updateForm(){
   $('#updateForm').click(function() {
      cont = $("#textArea").val();
      nm = $("#formNm").val();
   
      var mmsFormVO = {
            "mmsFormCd":cd,
            "mmsFormCont":cont,
            "mmsFormNm":nm}
      
      
      $.ajax ({
         url: '/crm/updateForm',
         type: 'POST',
         data: JSON.stringify(mmsFormVO),
   //       dataType: "json",
         contentType:"application/json;charset=utf-8",
         beforeSend:function(xhr){
            xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
         },
         success: function(data) {
            if(data>0){
            	Swal.fire({
                    title: '수정 성공',
                    icon: 'success',
                    showCancelButton: false,
                    confirmButtonColor: '#0ABAB5',
                    cancelButtonColor: '#8D9EA5',
                    confirmButtonText: '확인',
                    cancelButtonText: '취소'
                 }).then((result) => {
                    // 확인버튼 클릭시
                    if (result.isConfirmed) {
                   		$('#formSlct option:selected').html(nm);
                   		$('#textArea').html(cont);
                        // 입력창의 내용을 방금 수정한 양식의 제목과 내용으로 변경
//                     	formSlctChange();
						}
					})
				}else{
					Swal.fire({
		                  title: '수정 실패',
		                  icon: 'error',
		                  showCancelButton: false,
		                  confirmButtonColor: '#0ABAB5',
		                  cancelButtonColor: '#8D9EA5',
		                  confirmButtonText: '확인',
		                  cancelButtonText: '취소'
						});
				}
			}
		});
	});
};

//양식 삭제
function deleteForm(){
   $('#deleteForm').click(function() {
      
      var mmsFormVO = {"mmsFormCd":cd}
      
      $.ajax ({
         url: '/crm/deleteForm',
         type: 'POST',
         data: JSON.stringify(mmsFormVO),
   //       dataType: "json",
         contentType:"application/json;charset=utf-8",
         beforeSend:function(xhr){
            xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
         },
         success: function(data) {
			if(data>0){
           		Swal.fire({
                    title: '삭제 성공',
                    icon: 'success',
                    showCancelButton: false,
                    confirmButtonColor: '#0ABAB5',
                    cancelButtonColor: '#8D9EA5',
                    confirmButtonText: '확인',
                    cancelButtonText: '취소'
                 }).then((result) => {
                    // 확인버튼 클릭시
                    if (result.isConfirmed) {
                    	 $('#formSlct option:selected').remove(); // 선택된 옵션 삭제
                         $('#formNm').val("");
                         $('#textArea').val("");
						}
					})
            }else{
            	Swal.fire({
	                  title: '삭제 실패',
	                  icon: 'error',
	                  showCancelButton: false,
	                  confirmButtonColor: '#0ABAB5',
	                  cancelButtonColor: '#8D9EA5',
	                  confirmButtonText: '확인',
	                  cancelButtonText: '취소'
					});
				}
			}
		});
	});
};
</script>
</html>