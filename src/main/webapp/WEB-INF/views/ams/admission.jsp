<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
<head>
<style>
/* 어사이드 강조 */
.aside-ams-admiss{
	width: 196px;
	border-radius: 16px 0px 0px 16px;
	background: var(--bg-02, #DBF2F4);
	height: 56px;
	border-right: 4px solid var(--ci-01, #0ABAB5);
	margin-left: 4px;
	color: var(--ci-01, #0ABAB5);
}
.search{
	background-image: url(/resources/images/Search.png);
	background-repeat: no-repeat;
	background-position: calc(100% - 10px) center;
	width: 300px;
	height: 48px;
	margin-left: 18px;
}
.subTitle-margin{
	height: 50%;
	margin: -16px;
    padding: 24px;
}
hr {
    margin: 0;
    width: 100%; /* 부모 요소에 맞게 너비를 조절합니다 */
}

.dduk-history {
	height: 765px;
    margin: 0px -16px -16px -16px;
}

.dduk-title-area {
	margin: -16px -16px 0px -16px;
    padding: 16px 24px 8px 24px;
    border-bottom: 1px solid #EBEFF0;
}

tr.selected {
    background-color: #DBF2F4;
}

.patient-record{
	height: 765px;
	width: 350px;
    margin: 0px -16px -16px -16px;
}

.admission-room-detail{
	width: 860px;
	height: 840px;
}

.room-tab {
    background-color: transparent;
    border: none;
    cursor: pointer;
    padding: 8px 12px;
    margin-right: 8px;
    color: #8D9EA5;
}

.room-tab.selected {
    background-color: white;
    color: black;
}
/* 모달 시작 */
.modal-content {
    border-radius: 32px;
    border: 1px solid var(--border, #EBEFF0);
    background: var(--white, #FFF);
    width: auto;
    min-width: 680px;
    box-shadow: 0px 2px 16px 0px rgba(0, 63, 57, 0.08);
}
.admiFile-modal-content {
    border-radius: 32px;
    border: 1px solid var(--border, #EBEFF0);
    background: var(--white, #FFF);
    width: auto;
    height: 970px !important;
    min-width: 680px;
    box-shadow: 0px 2px 16px 0px rgba(0, 63, 57, 0.08);
}
.modal-header {
	background: var(--white, #FFF);
	border-radius: 32px;
	border: 0px solid var(--border, #EBEFF0);
	padding: 40px 32px !important;
}
.modal-footer {
	border: 0px solid var(--border, #EBEFF0);
	padding: 40px 32px !important;
}
.modal-title {
	color: #000 !important;
	font-family: Pretendard;
	font-size: 24px;
	font-style: normal;
	font-weight: 600;
	line-height: 40px;
}
.modal-body {
	padding: 24px 48px 0px 48px; 
}
.dduk-row {
	gap: 16px;
}
.form-check {
	display: flex;
    gap: 40px;
    padding: 8px 16px;
    margin-top: 8px;
    margin-left: 16px;
}
.dduk-login-input {
	width: 250px;
	height: 40px;
	flex-shrink: 0;
}
.fade {
	background: rgba(0, 0, 0, 0.16);
	backdrop-filter: blur(24px);
}
.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}
.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}
.dduck-input-opinion {
	border-radius: 12px;
	border: 1px solid var(--border, #EBEFF0);
	background: var(--bg-01, #F8F9FC);
	padding: 16px;
	font-family: 'Pretendard5';
	font-size: 14px;
	line-height: 160%; /* 22.4px */
}
.ebed{
	border-radius: 24px;
	background: var(--BG-01, #F8F9FC);
}
.bed{
	border-radius: 24px;
	background: var(--BG-01, #DBF2F4);
}
.bed-list-6 {
	display: flex;
	justify-content: space-evenly;
	margin-top: 10%;
	margin-left: -66%;
}
.bed-list-6-right {
	margin-right: -40%;
    margin-left: -38%;
}
.title-bed-6 {
	margin-left: 115px;
}
.admissBedPaName {
	width:54px;
}
/* 자동 완성 창 */
.autocomplete{
	position: absolute;
	z-index: 1;
	left: 410px;
	top: 66px;
}
.autocomplete > div.active {
  background: #DBF2F4;
  color: #000;
  width: 400px;
}
.autocomplete > div {
  background: #f1f3f499;
  padding: .2rem .6rem;
  width: 400px;
}
/* 검색 창 강조 색 */
.option:hover{
	background-color:#EDF8F9;
}
.light-green-text {
	color: #00A9A4 !important;
}
#doctorCheckboxName{
	font-size:16px !important;
	margin-right: 10px;
}
.admiFile-detail {
	width: 250px;
	height: 70px;
	flex-shrink: 0;
	padding: 20px;
	margin-top: 7px;
	border-radius: 12px;
}
.dduck-input-admissAdmiReason {
	width: 250px !important;
    height: 200px !important;
    border-radius: 12px;
    border: 1px solid var(--border, #EBEFF0);
    background: var(--bg-01, #F8F9FC);
    margin-top: 7px;
    padding: 16px;
    font-family: 'Pretendard5';
    font-size: 14px;
    line-height: 160%;
    
}

#admiFileBody {
	height: auto;
    width: 570px;
    margin: auto;
}

#admiFileImg {
	width: 100%;
    height: auto;
    margin: auto;
}
.file-selected {
	background-color: #0ABAB5;
	
}
</style>
</head>
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header"	content="${_csrf.headerName}" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script>
window.jsPDF = window.jspdf.jsPDF;

$(document).ready(function() {
	
	$('.aside-ams-admiss').find('svg').find('path').attr('fill', '#0ABAB5');
	$('.aside-ams-admiss').find('.dduk-nav-menu').css('color', '#0ABAB5');
	
	var header = $("meta[name='_csrf_header']").attr("content");
	var token = $("meta[name='_csrf']").attr("content");
	
	selectAdmissionList();
	selectDischargeList()
	
	//입원대기 환자 출력
	function selectAdmissionList(){
		$.ajax({
			url: '/ams/selectAdmissionList',
			type: 'post',
			dataType: 'json',
			beforeSend:function(xhr){
				xhr.setRequestHeader(header,token);
			},
			success: function(result){
				
				console.log("입원환자 대기목록VO List", result);
				
				$.each(result, function(i, vo){
				console.log("소견 : ", result[i].clinicChartVOList[0].clinicNo);
					let str = "";
					str += '<tr class="tr-padding tr-paInfo" data-admino="'+ vo.admissionChartVOList[0].admiNo +'" data-reason="'+vo.admissionChartVOList[0].admiReason+'" data-paNo="' + result[i].paNo + '" data-clinicNo="' + result[i].clinicChartVOList[0].clinicNo + '" data-empNo="' + result[i].clinicChartVOList[0].empNo + '">';
					str += '<td class="td-padding">'+(i + 1)+'</td>';
					str += '<td height="48px" class="td-padding">'+ result[i].paNo +'</td>';
					str += '<td height="48px" class="td-padding">'+ truncateText(result[i].paName) +'</td>';
					str += '<td class="td-padding">'+ formatResidentNumber(result[i].paReg) +'</td>';
					str += '<th class="td-padding">';
					str += '</th>';
					str += '</tr>';
					
					$('#admiss-list-table').append(str);
				});
			},
			error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
			}
		});
		
		$.ajax({
			url: '/ams/getAmsPatientVOList',
			type: 'post',
			dataType: 'json',
			beforeSend:function(xhr){
				xhr.setRequestHeader(header,token);
			},
			success: function(result){
				console.log("담당의... : ", result);
			}
		});
	}
	
	//퇴원대기 환자 출력
	function selectDischargeList(){
		$.ajax({
			url: '/ams/selectDischargeList',
			type: 'post',
			dataType: 'json',
			beforeSend:function(xhr){
				xhr.setRequestHeader(header,token);
			},
			success: function(result){
				
				console.log("퇴원환자 대기목록VO List", result);
				
				$.each(result, function(i, vo){
					console.log("퇴원소견 : ", result[i].clinicChartVOList[0].clinicNo);
					let str = "";
					str += '<tr class="tr-padding tr-paInfo" data-reason="'+ vo.admissionChartVOList[0].admiReason +'"data-paNo="' + result[i].paNo + '" data-clinicNo="' + result[i].clinicChartVOList[0].clinicNo + '" data-empNo="' + result[i].clinicChartVOList[0].empNo + '">';
					str += '<td class="td-padding">'+(i + 1)+'</td>';
					str += '<td height="48px" class="td-padding">'+ result[i].paNo +'</td>';
					str += '<td height="48px" class="td-padding">'+ truncateText(result[i].paName) +'</td>';
					str += '<td class="td-padding">'+ formatResidentNumber(result[i].paReg) +'</td>';
					str += '<th class="td-padding">';
					str += '</th>';
					str += '</tr>';
					
					$('#discharge-list-table').append(str);
				});
			},
			error: function(xhr, status, error){
				console.log('Error:', xhr, status, error);
			}
		});
	}
	
	// 초기에 환자 상세를 숨김
    $("#patient-detail").hide();
    $("#doctor-opinion").hide();
    
    let globalElement;
    let globalTableName;
    
    //입,퇴원 환자 클릭 시
    function handleListTableClick(element, tableName) {
        if (!element.hasClass("selected")) {
            var paNo = element.data("pano");
            console.log("paNo : ", paNo); 
            console.log("element  : ", element);
            console.log("element.data()  : ", element.data());
            
			globalElement = element;
			globalTableName = tableName;
			
            var clinicNo = element.data("clinicno");
            console.log("clinicNo : ", clinicNo); 
            var empNo = element.data("empno");
            console.log("empNo : ", empNo); 
         	// 선택된 행에만 클래스를 추가
            $(`${tableName} tr.selected`).removeClass("selected");
            element.addClass("selected");

            $("#patient-detail").show();
            $("#doctor-opinion").show();
            // 이후 해당 환자에 대한 정보를 가져와서 보여줄 수 있음
            if (tableName === "#admiss-list-table") {
                console.log("입원대기 명단 클릭");
            } else if (tableName === "#discharge-list-table") {
                console.log("퇴원대기 명단 클릭");
            }
            getPatientDetail(paNo, clinicNo);
            //getClinicOpinion(clinicNo);
            
            // 입원사유 추가
            $('.admission-reason').html($(element).data('reason'));
        }
    }

    $("#admiss-list-table").on("click", "tr", function() {
        handleListTableClick($(this), "#admiss-list-table");
    });

    $("#discharge-list-table").on("click", "tr", function() {
        handleListTableClick($(this), "#discharge-list-table");
    });
    
    var buttons = document.querySelectorAll('.room-tab');

    buttons.forEach(button => {
        button.addEventListener('click', function() {
            // 모든 버튼에서 selected 클래스 제거
            buttons.forEach(btn => btn.classList.remove('selected'));

            // 클릭된 버튼에만 selected 클래스 추가
            this.classList.add('selected');
        });
    });
    
    var paAdmDt;
    
    // 입,퇴원 대기 환자 상세 정보 출력
    function getPatientDetail(paNo, clinicNo, empNo, paAdmDt){
        $.ajax({
            url: '/ams/getPatientDetail',
            data: {
            	'paNo' : paNo,
            	'clinicNo' : clinicNo
            	},
            type: 'post',
            beforeSend:function(xhr){
                xhr.setRequestHeader(header,token);
            },
            success: function(result){
                console.log("클릭한 환자 상세정보 ", result);
                paAdmDt = result[0].paAdmDt;
                console.log("클릭한 환자 입원코드 ", paAdmDt);
                $('#patient-detail').html("");
                // 보험적용 여부 : 'ISYN01'(급여)면 O, 아니면 X
                var paInsrYnValue = result[0].paInsrYn === 'ISYN01' ? 'O' : 'X';
                let paBirthDay = formatResidentNumber(result[0].paReg);
                var paAge = getAge(paBirthDay);
                console.log("나이 : ", paAge)
                if(result.length > 0){
                	
                	var buttonElement;
                    if (result[0].paAdmDt === 'AMYN03') {
                        buttonElement = "입원대기";
                    } else if (result[0].paAdmDt === 'AMYN04') {
                        buttonElement = "퇴원대기";
                    }
                	
		            var str = `
		               	<div class="spa-betw m-8">
		                   	<div id="selectedName">\${result[0].paName}</div>
		                   	<button class='dduk-btn-info btn-state' style="margin-top: -8px;">\${buttonElement}</button>
		                </div>
		                <div>
		                   	<div class="spa-betw p-8" style="padding-bottom: 4px;"> 
		                       	<div class="gray-text d-flex w-30">성별</div> <div class="w-70 f-end paSex">\${result[0].paSex}</div>
		                    </div>
		                    <div class="spa-betw p-8" >
		                        <div class="gray-text d-flex w-30">나이</div> <div class="w-70 f-end paAge">\${paAge}</div>
		                    </div>
		                    <hr class="m-8"/>
		                    <div class="spa-betw p-8" style="padding-bottom: 4px;">
	                            <div class="gray-text d-flex w-30">건강보험</div> <div class="w-70 f-end painsrYn">\${paInsrYnValue}</div>
	                        </div>
	                        <div class="spa-betw p-8">
	                            <div class="gray-text d-flex w-30">연락처</div> <div class="w-70 f-end paPh">\${result[0].paPh}</div>
	                        </div>
	                        <hr class="m-8"/>
	                        <div class="spa-betw p-8" style="padding-bottom: 4px;">
	                            <div class="gray-text d-flex w-30">주소</div> <div class="w-70 f-end paAdd1" style="text-align: right;">\${result[0].paAdd1}</div>
	                        </div>
	                        <div class="spa-betw p-8" style="padding-bottom: 4px;">
                            	<div class="gray-text d-flex w-30"></div> <div class="w-70 f-end paAdd2" style="text-align: right;">\${result[0].paAdd2}</div>
                        	</div>
	                    </div>
	                `;
	                $('.admission-reason').text(result[0].admissionChartVOList[0].admiReason);
                	$('#patient-detail').append(str);
            	}            
            },
            error: function(xhr, status, error){
                console.log('Error:', xhr, status, error);
                console.log("에러",paNo);
            }
        });
        
        //의사 소견 가져오기
//         $.ajax({
// 			url:'/ams/getClinicOpinion',
// 			dataType: 'json',
// 			type: 'post',
// 			data: {
// 				'paNo' : paNo,
// 				'paAdmDt' : paAdmDt,
// 				'clinicNo': clinicNo,
// 				'empNo': empNo
// 				},
// 			beforeSend:function(xhr){
// 				xhr.setRequestHeader(header,token);
// 			},
// 			success: function(result){
// 				console.log("의사소견 : ", result);
// 				//의사소견 출력
// 				// 담당 의사 이름과 진료 날짜, 소견 설정
// 		        $('.doctor-name').text(result[0].empName);
// 		        $('.date-of-consultation').text(formatDateString(result[0].clinicDt));
// 		        $('.doctor-opinion').text(result[0].clinicOpinion);
				
// 			},
// 			error: function(xhr, status, error){
// 				console.log('Error:', xhr, status, error);
// 			}
// 		});
        
    }
    
    $(document).ready(function() {
        // 3층 정보 표시, 나머지 숨김
        $("#floor3").show();
        $("#floor4").hide();
        $("#floor5").hide();

        // 2인실 버튼 클릭 시
        $("#twinRoom").on("click", function() {
            $("#floor3").show();
            $("#floor4").hide();
            $("#floor5").hide();
        });

        // 4인실 버튼 클릭 시
        $("#familyRoom").on("click", function() {
            $("#floor4").show();
            $("#floor3").hide();
            $("#floor5").hide();
        });

        // 6인실 버튼 클릭 시
        $("#suiteRoom").on("click", function() {
            $("#floor5").show();
            $("#floor3").hide();
            $("#floor4").hide();
        });
    });
	
 	// 비어있는 병상
	var emptyBed = $(".ebed");
	// 데이터 들어가 있는 병상
	var bed = $(".bed");
	var admissionModal = $("#admissionModal");
	var dischargeModal = $("#dischargeModal");
	var roomNumber; // 전역 변수로 설정
	var bedNumber; // 전역 변수로 설정
	var admiNo;
	var paAdmDt;
	var empName = null;
	var empNo;

  	//빈 병상 클릭
	emptyBed.on("click", function() {
	    console.log("비어있는 병상 모달 클릭");
	
		// 클릭한 입원코드 변수에 담기
	  	var emptyBedNo = $(this).attr("id");
	  	console.log("병상번호 : " + emptyBedNo);
	  	
	  	var bedParts = emptyBedNo.split('-');
	    roomNumber = bedParts[0]; // 방 번호
	    bedNumber = bedParts[1];  // 침대 번호
	    
	  	var paNo = $(".selected").data('pano');
		console.log("선택paNo : ", paNo);
		
		var data = {
				"paNo": paNo
			};
		console.log("data : ", data);
		
		//담당의 선택
		$('.doctorCheckbox').on('change', function() {
			//한명만 체크되도록
		    $('.doctorCheckbox').not(this).prop('checked', false);
			
		    if (this.checked) {
		        var docNo = $(this).data('docno');
		        var docName = $(this).data('docname');
		        console.log('선택된 의사 번호:', docNo);
		        console.log('선택된 의사 이름:', docName);
		        
		        empNo = docNo;
		        empName = docName;
		        console.log("의사이름 전변 : ", empName);
		    } else {
		    	empName = null;
		        console.log('의사 선택 해제됨');
		    }
		});
		
		//환자선택하지 않고 병상클릭 했을때
		if(paNo == null || paNo == ""){
			Swal.fire({
				title: '선택한 환자 정보가 없습니다',
				text: '환자를 선택해주세요',
				icon: 'error',
				confirmButtonColor: '#0ABAB5',
				confirmButtonText: '확인',
			})
		//환자선택 후 병상클릭했을때
		}else{
    		admissionModal.modal("show");
    		admissionDetail(paNo, roomNumber, bedNumber);
		}
   	});
  	
	// 모달이 닫힐 때 입력 필드 초기화
  	$('#admissionModal').on('hidden.bs.modal', function (e) {
  	    $("#admissPaNokNm").val('');
  	    $("#admissPaNokPh").val('');
  	  	$('.doctorCheckbox').prop('checked', false);
  	});
  	
  	function admissionDetail(paNo, roomNumber, bedNumber){
  		$.ajax({
  			url: '/ams/getPatientDetail',
            data: {'paNo' : paNo},
            type: 'post',
            beforeSend:function(xhr){
                xhr.setRequestHeader(header,token);
            },
            success: function(result){
                console.log("클릭한 환자 병상에 : ", result);
                console.log("클릭한 환자 입원 : ", result[0].admissionChartVOList[0].admiIndt);
                console.log("클릭한 환자 예정 : ", result[0].admissionChartVOList[0].admiExpOutdt);
                
                $('#admissPaName').val(result[0].paName);
                $("#admissAdrmRoomNo").val(roomNumber);
        	    $("#admissAdrmBedNo").val(bedNumber);
        	    
        	    admiNo = result[0].admissionChartVOList[0].admiNo;
        	    paAdmDt = result[0].paAdmDt; 
        	 	// 입원일
               	dateString1 = result[0].admissionChartVOList[0].admiIndt;
			  	var date1 = new Date(dateString1);
			  	var year1 = date1.getFullYear();
			  	var month1 = (date1.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 +1 해주고 2자리로 포맷팅
			  	var day1 = date1.getDate().toString().padStart(2, '0'); // 일도 2자리로 포맷팅
			
			  	// 원하는 형식으로 조합
			  	var formattedDate1 = year1 + '-' + month1 + '-' + day1;
			   	// 입원일 끝
			  
			   	// 퇴원일
			  	var dateString2 = result[0].admissionChartVOList[0].admiExpOutdt;
			  	var date2 = new Date(dateString2);
			  	var year2 = date2.getFullYear();
			  	var month2 = (date2.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 +1 해주고 2자리로 포맷팅
			  	var day2 = date2.getDate().toString().padStart(2, '0'); // 일도 2자리로 포맷팅
			
			  	// 원하는 형식으로 조합
			  	var formattedDate2 = year2 + '-' + month2 + '-' + day2;
			  	// 퇴원일 끝
			
				$("#admissAdmiIndt").val(formattedDate1);
				$("#admissAdmiExpOutdt").val(formattedDate2);
				
				$('#admiFile').on('change', function () {
		            var fileName = $(this).val().split('\\').pop(); // 파일명 추출
		            $('#fileNameOutput').text(fileName); // 파일명을 출력할 요소에 표시
		            
		            $('#uploadBtn').addClass('file-selected');
		        });
				
				// 파일이 등록되어 있으면 클래스 추가
	            var fileName = $('#admiFile').val().split('\\').pop();
	            if (fileName) {
	                $('#uploadBtn').addClass('file-selected');
	            }
			}
		});
  	}
  	
//		입원동의서 첨부
//   	var formData = new FormData();
  	
//   	$(document).on("change", "#admiFile", function() {
//   	    var fileInput = $("#admiFile")[0].files[0];
//   	    console.log("fileInput : ", fileInput);

//   	    formData.append('uploadfile', fileInput);


//   	    // 확인을 위한 entries() 메서드 사용
//   	    for (var pair of formData.entries()) {
//   	        console.log(pair[0] + ', ' + pair[1]);
//   	    }
//   	});
  	
  	 // 입원버튼 클릭시 입원테이블 수정
     $(document).on("click", "#SaveAdmiss", function() {
        
        // 데이터를 formData형식으로 싸서 보내기 위한 변수 선언
        var formData = new FormData();
        
		// DB에 넣기위한 데이터들 미리 변수에 받아놓기        
		// 선택된 환자 tr 정보 가져오기
		let selectedTr = $('#admiss-list-table').find('.selected');
		var paNo = $(".selected").data('pano'); 				//환자번호
        var paNoknm = $("#admissPaNokNm").val().trim();         // 보호자 이름
        var paNokph = $("#admissPaNokPh").val().trim();         // 보호자 번호
        var admiNoCd = $(selectedTr).data('admino');           // 입원코드
        var doctorNo = $('.doctorCheckbox:checked').data('docno') // 담당의사번
        var fileData = $('#admiFile')[0].files[0];              // 입원동의서 파일
        var paAdmDtCd = 'AMYN01';                          // 입원여부(공통상세코드)
        var adrmRoomNo = $('#admissAdrmRoomNo').val();           // 입원호수
        var adrmBedNo =   $('#admissAdrmBedNo').val();           // 병상번호
        
        formData.append('paNo', paNo);
        formData.append('paNoknm', paNoknm);
        formData.append('paNokph', paNokph);
        formData.append('admissionRoomVOList[0].adrmRoomno', adrmRoomNo);
        formData.append('admissionRoomVOList[0].adrmBedno', adrmBedNo);
        formData.append('admissionRoomVOList[0].paNo', paNo);
        formData.append('admissionChartVOList[0].admiNo', admiNoCd);
        formData.append('admissionChartVOList[0].paNo', paNo);
        formData.append('admissionChartVOList[0].empNo', doctorNo);
       	formData.append('admissionChartVOList[0].uploadFile', fileData);
       	formData.append('paAdmDt', paAdmDtCd);
       	formData.append('admissionChartVOList[0].adrmRoomno', adrmRoomNo);
       	formData.append('admissionChartVOList[0].adrmBedno', adrmBedNo);

        console.log("update시킬 formData : ", formData);
        console.log(JSON.stringify(formData));
        
        if (doctorNo === null || doctorNo === '') {
            Swal.fire({
                title: '담당의를 선택해주세요.',
                icon: 'error',
                confirmButtonColor: '#0ABAB5',
                confirmButtonText: '확인'
            });
        } else if (paNoknm === null || paNoknm === '') {
            Swal.fire({
                title: '보호자 이름을 입력해주세요.',
                icon: 'error',
                confirmButtonColor: '#0ABAB5',
                confirmButtonText: '확인'
            });
        } else if (paNokph === null || paNokph === '') {
            Swal.fire({
                title: '보호자 연락처를 입력해주세요.',
                icon: 'error',
                confirmButtonColor: '#0ABAB5',
                confirmButtonText: '확인'
            });
        } else {
         let title = '';
         
         Swal.fire({
            title: '입원처리 하시겠습니까?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#0ABAB5',
            cancelButtonColor: '#8D9EA5',
            confirmButtonText: '확인',
            cancelButtonText: '취소'
         }).then((result) => {
            if (result.isConfirmed) {
               
               // DB에 입원정보들을 넣고 입원테이블 update시킨다
                  $.ajax({
                    url: '/ams/admissionUpdateYN',
                     data: formData,
                     type: 'post',
                     dataType: 'json',
                     // formData로 보내줄때 아래 두개 false처리 한다음 보내야됨
                     processData: false,
                     contentType: false,
                     enctype: 'multipart/form-data',
                     beforeSend:function(xhr){
                         xhr.setRequestHeader(header,token);
                     },
                     success: function(result){
                        console.log("결과 ", result);
                        
                        Swal.fire({
		        			title: '입원 처리 완료',
		        			icon: 'success',
		        			confirmButtonColor: '#0ABAB5',
		        			confirmButtonText: '확인'
		        		}).then(result => {
		        			window.location.href = "/ams/admission";
		        		})
                     },
                     error: function(xhr, status, error){
                     console.log('Error:', xhr, status, error);
                  	}
                  });
            }
         })
        }
     });
  	
  	//퇴원버튼 클릭시 필요한 전역변수
  	var clickedPaNo;
  	var clickedAdmiNo;
  	
  	//자리있는 병상 클릭
  	bed.on("click", function() {
  		// 클릭한 입원코드 변수에 담기
	  	var admiNo = $(this).attr("id");
  		var paNo = $(this).data("pano");
	  	roomNumber = $(this).data("roomNumber");
	  	bedNumber = $(this).data("bedNumber");
	  	var doctorName = empName;
	  	
	  	console.log("자리있을때 환자선택한 환자번호 : ", paNo);
	  	
	  	clickedPaNo = paNo; // 전역 변수에 할당
	    clickedAdmiNo = admiNo; // 전역 변수에 할당
	  	
	  	dischargeModal.modal("show");
	  	admissionRoomDetail(admiNo, paNo, roomNumber, bedNumber);

  	});
  	
  	//자리 있는 병상 클릭시 상세정보 출력
  	function admissionRoomDetail(admiNo, paNo, roomNumber, bedNumber, doctorName){
  		$.ajax({
  			url: '/ams/admissionRoomDetail',
            type: 'post',
            beforeSend:function(xhr){
                xhr.setRequestHeader(header,token);
            },
            success: function(result){
                console.log("입원되어있는 병상들 : ", result);
                
                //클릭한 사람 정보 가져오기
                let currentBed = '';
                
                $.each(result, function(index, vo){
                	if(vo.paNo === paNo){
                		currentBed = vo;
                	}
                });
                
                console.log("클릭한 사람의 정보 : ", currentBed);
                
                $('#admissPaName2').val(currentBed.paName);
                $('#admissAdrmRoomNo2').val(roomNumber);
        	    $('#admissAdrmBedNo2').val(bedNumber);
        	    $('#admissDoctor').val(currentBed.admissionChartVOList[0].clinicChartVOList[0].empName);
        	    
        	    dateString1 = currentBed.admissionChartVOList[0].admiIndt;
			  	var date1 = new Date(dateString1);
			  	var year1 = date1.getFullYear();
			  	var month1 = (date1.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 +1 해주고 2자리로 포맷팅
			  	var day1 = date1.getDate().toString().padStart(2, '0'); // 일도 2자리로 포맷팅
			
			  	// 원하는 형식으로 조합
			  	var formattedDate1 = year1 + '-' + month1 + '-' + day1;
			   	// 입원일 끝
			  
			   	// 퇴원일
			  	var dateString2 = currentBed.admissionChartVOList[0].admiExpOutdt;
			  	var date2 = new Date(dateString2);
			  	var year2 = date2.getFullYear();
			  	var month2 = (date2.getMonth() + 1).toString().padStart(2, '0'); // 월은 0부터 시작하므로 +1 해주고 2자리로 포맷팅
			  	var day2 = date2.getDate().toString().padStart(2, '0'); // 일도 2자리로 포맷팅
			
			  	// 원하는 형식으로 조합
			  	var formattedDate2 = year2 + '-' + month2 + '-' + day2;
			  	// 퇴원일 끝
			
				$("#admissAdmiIndt2").val(formattedDate1);
				$("#admissAdmiExpOutdt2").val(formattedDate2);
				$('.admissAdmiReason').text(currentBed.admissionChartVOList[0].admiReason);
				//$(".admissAdmiReason").val(currentBed.admissionChartVOList[0].admiReason);
				
				var admiFileInfo = currentBed.admissionChartVOList[0].admiFile
                console.log("입원확인서 정보 : ", admiFileInfo);
				
				let btn = `
					<button class='dduk-btn-active' id="admiFileInfo" data-admifile='\${admiFileInfo}' data-bs-toggle="modal" data-bs-target="#admiFileModal">
						입원동의서
					</button>
						`;
				if(currentBed.admissionChartVOList[0].admiFile != null) {
					$('#admiFileBtn').html("");
					$('#admiFileBtn').append(btn);
				}
				
				//입원동의서 미리보기
		  		$(document).on("click", "#admiFileInfo", function() {
		  			event.preventDefault();
		  			//모달창 안에서 모달 띄우기
		  			//$("#dischargeModal").modal('hide');
		  			$(".fade").attr('style', 'display: none');
		  			
		  			$('#admiFileBody').html("");
		  			console.log("입원동의서 확인~")
		  			let atchFileCd = $(this).data('admifile');
		  			console.log("입원동의서 있나? :", atchFileCd);
		  			
		  			let data = {
		  					"atchFileCd":atchFileCd
		  				}
		  			
// 		  			let jsonData = JSON.stringify(data);
		  			
		  			$.ajax({
						url: '/common/getFileDetail',
						contentType:"application/json;charset:utf-8",
						data:JSON.stringify(data),
						type: 'post',
						dataType: 'json',
						beforeSend:function(xhr){
							xhr.setRequestHeader(header, token);
						},
						success: function(rst){
							console.log("입원동의서 디테일~", rst);
							console.log(rst.atchFileDetailSavenm);
							
							let admiFileDocument = "<img id='admiFileImg' src='/resources/upload/admiFile/"+rst.atchFileDetailSavenm+"'/>";
							
							$('#admiFileBody').html("");
							$('#admiFileBody').append(admiFileDocument);
						},
						error: function(xhr, status, error){
							console.log('Error:', xhr, status, error);
						}
					});
		  		});
			}
		});
  		
  		$.ajax({
  			url: '/ams/getPatientDetail',
            data: {'paNo' : paNo},
            type: 'post',
            beforeSend:function(xhr){
                xhr.setRequestHeader(header,token);
            },
            success: function(result){
            	paAdmDt = result[0].paAdmDt; 
            	
            	$('#admissPaNokNm2').val(result[0].paNoknm);
        	    $('#admissPaNokPh2').val(result[0].paNokph);
            }
  		});
  	}
  	
  	//퇴원버튼 클릭시
	$(document).on("click", "#SaveDischarge", function() {
  		
		let title = '';
		
		Swal.fire({
			title: '퇴원처리 하시겠습니까?',
			icon: 'question',
			showCancelButton: true,
			confirmButtonColor: '#0ABAB5',
			cancelButtonColor: '#8D9EA5',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
		
			var paAdmDtCd = paAdmDt;
		    var paNo = clickedPaNo; // 전역 변수 값 사용
		    var adrmRoomNo = roomNumber; // 입원호수
		    var adrmBedNo = bedNumber; // 병상번호
		    var admiNo = clickedAdmiNo; // 전역 변수 값 사용
//   		var empNo
//   		var admiFile
		    //퇴원날짜
// 		  	var admiOutDt = formatDateString(new Date());
// 			console.log("퇴원날짜 : ", date);	  	  	
		    
		    let admissionChartVO = {
	  				"admiNo" : admiNo,
// 	  				"admiOutDt" : admiOutDt
	  		}
	  		let admissionRoomVO = {
	  				"adrmRoomno" : adrmRoomNo,
	  				"adrmBedno" : adrmBedNo,
	  				"paNo" : paNo
	  		}
	  		let patientVO = {
	  				"paAdmDt" : paAdmDtCd,
	  				"paNo" : paNo,
	  				"paAdmDt" : 'AMYN02'
	  		}
			
			var data = {
				"admissionChartVO" : admissionChartVO,
				"admissionRoomVO" : admissionRoomVO,
				"patientVO" : patientVO
			}
			
	  		console.log("update시킬 DataWrapper : ", data);
	  		console.log(JSON.stringify(data));
			//입원 ajax
	  	    $.ajax({
	  			url: '/ams/dischargeUpdate',
	            data: JSON.stringify(data),
	            type: 'post',
	            contentType:"application/json;charset=utf-8",
	            beforeSend:function(xhr){
	                xhr.setRequestHeader(header,token);
	            },
	            success: function(result){
	            	console.log("퇴원누름 ", result);
	            	
	            	Swal.fire({
	        			title: '퇴원 처리 완료',
	        			icon: 'success',
	        			confirmButtonColor: '#0ABAB5',
	        			confirmButtonText: '확인'
	        		}).then(result => {
	        			window.location.href = "/ams/admission";
	        		})
	            	
	            },
	            error: function(xhr, status, error){
					console.log('Error:', xhr, status, error);
				}
	  	    });
		})
  	});
  	
  	//입퇴원 환자 검색
  	var dataList = [];
  	
  	var $search = document.querySelector("#search");
  	var $autoComplete = document.querySelector(".autocomplete");
  	
	let nowIndex = 0;

	$search.onkeyup = (event) => {
	  // 검색어
	  const value = $search.value.trim();

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
	      document.querySelector("#search").value = matchDataList[nowIndex].match(/[ㄱ-ㅎㅏ-ㅣ가-힣]+/g).join(" ") || "";
		  var patientId = matchDataList[nowIndex].substring(0,6);
		  console.log(patientId);
		  console.log(globalElement);
		  console.log(globalTableName);
		  handleListTableClick(globalElement, globalTableName);
		  getPatientDetail(patientId);		  
		  $("#rsvtYN").val("RCTY01");
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


	var showList = (data, value, nowIndex) => {
	  // 정규식으로 변환
	  var regex = new RegExp("(" + value + ")", "g");
	  
	  $autoComplete.innerHTML = data
	  .map(function(label, index) {
	    return "<div class='" + (nowIndex === index ? "active" : "") + "'>" +
	      label.replace(regex, "<mark>$1</mark>") +
	      "</div>";
	  })
	  .join("");
	};
	
	$(document).ready(function() {
		//자동 검색 데이터 불러오기
		$.ajax({
				url: "/ams/selectAllPatient",
				dataType: 'json',
				type: 'POST',
				beforeSend:function(xhr){
				xhr.setRequestHeader(header, token);
				},
				success: function(rst){
					$.each(rst, function(index,vo){
						let str = "";
						$.each(vo, function(index, column){
							if(index == 'paName'){
								str += (column + ' ');
							}
							if(index == 'paNo'){
								str += (column + ' ');
							}
							if(index == 'paPh'){
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
	});
	
	// 이름 등이 글자를 제어하고 싶을 때 maxLength까지만 표시
	function truncateText(text, maxLength) {
		if (text.length > maxLength) {
			return text.slice(0, maxLength) + '...';
		} else {
		    return text;
		}
	}
	
	// 날짜형식 데이터를 넣으면 yyyy-MM-dd(요일) 로 변환해주는 함수
	function formatDateString(dateString) {
		// 요일먼저 얻기
		const week = ['일', '월', '화', '수', '목', '금', '토'];
		const dayOfWeek = week[new Date(dateString).getDay()];
		
		const dateData = new Date(dateString);
		let year = dateData.getFullYear();
		let month = dateData.getMonth(); 
		let date = dateData.getDate()
		
		let dateStr = `\${year}-\${month}-\${date}(\${dayOfWeek})`;
		
		return dateStr;
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
	
	// 주민번호로 만나이 계산
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
	
	$(document).on('click', '#autoComplete-patientCreate', function(){
		 $('#admissPaNokNm').val("김길동");
		 $('#admissPaNokPh').val("010-3384-9120");
		 $('.doctorCheckbox:first').prop('checked', true);
	});
	
	function printPage(){
	    event.stopPropagation();
	    window.print();
	}
});
</script>
<html>
<body>
<div class="dduk-body-border admission-detail"  style="position: relative; width: 732px;" >
	<div class="dduk-title-area">
		<div class="d-flex align-items-center">
			<h2  id="admissName">대기 환자 목록</h2>
			<span id="admissInfo" class="gray-text mar-b-8 mar-l-8"></span>
		</div>
		<div class="d-flex">
			<input type="text" id="search" class="search dduck-input" placeholder="환자 이름/번호를 입력해 주세요" autocomplete="off">
			<div class="autocomplete"></div>
		</div>
	</div>
	<div class="d-flex">
		<div class="dduk-history" style="width: 412px;">
			<div style="height: 760px;">
				<div class="subTitle-margin" style="border-bottom: 1px solid #EBEFF0; overflow-y: auto;">
					<h2>입원 대기</h2>
					<div class="dduk-x-pd8" style="overflow-y: auto;">
						<table class="admiss-list-table" id="admiss-list-table">
							<tr class="tr-padding">
								<th class="td-padding gray-text" style="width: 40px;">No</th>
								<th class="td-padding gray-text" style="width: 80px;">환자번호</th>
								<th class="td-padding gray-text admissName" style="width: 120px;">이름</th>
								<th class="td-padding gray-text" style="width: 100px;">생년월일</th>
							</tr>
						</table>
					</div>
				</div>
				<div class="subTitle-margin" style="overflow-y: auto;">
					<h2>퇴원 대기</h2>
					<div class="dduk-x-pd8" style="overflow: auto;">
						<table class="discharge-list-table" id="discharge-list-table">
							<tr class="tr-padding">
								<th class="td-padding gray-text" style="width: 40px;">No</th>
								<th class="td-padding gray-text" style="width: 80px;">환자번호</th>
								<th class="td-padding gray-text dischargeName" style="width: 120px;">이름</th>
								<th class="td-padding gray-text" style="width: 100px;">생년월일</th>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="patient-record">
			<div class="subTitle-margin">
				<h3>환자 상세</h3>
				<div class="gap-ver-16">
					<div id="patient-detail" 
						class="dduk-inner-border record-content-fr" style="width:288px; height: 320px">
					</div>
					<div id="doctor-opinion" 
						class="dduk-inner-border record-content-fr" style="width:288px; height: 360px">
						<h3 class="m-8">입원 사유</h3>
						<div class="dduck-input-opinion reason-box gray-text" readonly="readonly" style="width:255px; height: 285px">
							<div class="doctor-info">
						        <p><span class="admission-reason"></span></p>
						    </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="dduk-body-border admission-room-detail"  style="position: relative;">
	<div class="dduk-title-area spa-betw">
		<div class="d-flex align-items-center">
			<h2 id="admissRoomName">병상 현황</h2>
			<span id="paInfo" class="gray-text mar-b-8 mar-l-8"></span>
			<h2>(&nbsp</h2>
			<svg xmlns="http://www.w3.org/2000/svg" width="40" height="30" viewBox="0 0 80 80" fill="none" style="margin-top:-8px;">
	    		<g clip-path=".url(#clip0_464_1878)">
	        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
	      		</g>
	      		<defs>
	        		<clipPath id="clip0_464_1878">
	          			<rect width="80" height="80" fill="white"/>
	        		</clipPath>
	      		</defs>
	    	</svg>
			<p style="margin-top: 9px;">: 빈 병상 </p>
			<p>&nbsp</p>
	    	<svg xmlns="http://www.w3.org/2000/svg" width="40" height="30" viewBox="0 0 80 80" fill="none" style="margin-top: -8px;">
		    	<g clip-path=".url(#clip0_464_1878)">
		        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
		      	</g>
		      	<defs>
		        	<clipPath id="clip0_464_1878">
		          		<rect width="80" height="80" fill="white"/>
		        	</clipPath>
		      	</defs>
		    </svg>
		    <p style="margin-top: 9px; color: #0ABAB5;">: 입원중</p>
			<h2>&nbsp)</h2>
		</div>
		<div class="d-flex admissRoomName-info">
			
		</div>
		<div class="d-flex">
			<div class="d-flex patient-info" style="margin-left:-5%; margin-right:5%; width: 230px;	height: 48px;">
				<div class="d-flex">
					<button class="room-tab selected" id="twinRoom">2인실</button>
				</div>
				<div class="d-flex">
					<button class="room-tab" id="familyRoom">4인실</button>
				</div>
				<div class="d-flex">
					<button class="room-tab" id="suiteRoom">6인실</button>
				</div>
			</div>
		</div>
	</div>
	<c:set value="${admissionRoomVOList}" var="admissionRoomList"/>
	<c:set value="${patientVOList}" var="patientVOList"/>
	
	<!-- 2인실 시작 -->
	<!-- 2인실 시작 -->
	<!-- 2인실 시작 -->
	<div class="subTitle-margin" id="floor3" style="height: 100%;">
	<!-- 304호 시작-->
	<!-- 304호 1 -->
		<div class="spa-betw" style="margin-top:20px;">
			<h2>304호</h2>
			<c:set var="room304" value="0" />
				<c:forEach items="${admissionRoomList}" var="room">
				    <c:if test='${(room.adrmRoomno).startsWith("304") }'>
				        <c:set var="room304" value="${room304+1}" />
				    </c:if>
			</c:forEach>
			<span class="text-sm" style="font-size: 16px;">잔여병상 <span class="text-large" style="font-size: 16px; color:#00A9A4;">${2-room304}</span>개</span>
		</div>
			<div class="d-flex" style="margin: 0;">
				<c:set var="r3041" value="0" />
					<c:choose>
						<c:when test="${not empty admissionRoomList && fn:length('304-1') > 0 }">
							<c:forEach items="${admissionRoomList}" var="admissionRoom">
								<c:if test="${admissionRoom.adrmRoomno == '304' && admissionRoom.adrmBedno == '1' && admissionRoom.paNo != null}">
									<div id="${admissionRoom.admissionChartVOList[0].admiNo}" data-paNo="${admissionRoom.paNo}" data-room-number="304" data-bed-number="1" class="d-flex bed" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px; background-color: #DBF2F4">
										<h2 class="light-green-text">304-1<div>${admissionRoom.paName}</div></h2>  
									    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
									    	<g clip-path=".url(#clip0_464_1878)">
									        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
									      	</g>
									      	<defs>
									        	<clipPath id="clip0_464_1878">
									          		<rect width="80" height="80" fill="white"/>
									        	</clipPath>
									      	</defs>
									    </svg>
								  	</div>
					            <c:set var="r3041" value="1" />
				            	</c:if>
				        	</c:forEach>
				       	</c:when>
				       	<c:otherwise>
				    	</c:otherwise>
					</c:choose>
					    <c:if test="${r3041 == '0' }">
							<div id="304-1" class="d-flex ebed" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
							<h2 >304-1<div class="gray-text">빈 침상</div></h2>
						    	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
						    		<g clip-path=".url(#clip0_464_1878)">
						        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
						      		</g>
						      		<defs>
						        		<clipPath id="clip0_464_1878">
						          			<rect width="80" height="80" fill="white"/>
						        		</clipPath>
						      		</defs>
						    	</svg>
					  		</div>
					    </c:if>
				<!-- 304호 2 -->
				<c:set var="r3042" value="0" />
					<c:choose>
						<c:when test="${not empty admissionRoomList && fn:length('304-2') > 0 }">
							<c:forEach items="${admissionRoomList}" var="admissionRoom">
								<c:if test="${admissionRoom.adrmRoomno == '304' && admissionRoom.adrmBedno == '2' && admissionRoom.paNo != null}">
					                <h2 id="" style="margin-top:35px"></h2>
											<div id="${admissionRoom.admissionChartVOList[0].admiNo}" data-paNo="${admissionRoom.paNo}" data-room-number="304" data-bed-number="2" class="d-flex bed" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px; background-color: #DBF2F4">
												<h2 class="light-green-text">304-2<div>${admissionRoom.paName}</div></h2>  
											    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
											    	<g clip-path=".url(#clip0_464_1878)">
											        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
											      	</g>
											      	<defs>
											        	<clipPath id="clip0_464_1878">
											          		<rect width="80" height="80" fill="white"/>
											        	</clipPath>
											      	</defs>
											    </svg>
										  	</div>
					                <c:set var="r3042" value="1" />
				            	</c:if>
				        	</c:forEach>
				       	</c:when>
				       	<c:otherwise>
				    	</c:otherwise>
					</c:choose>
				    <c:if test="${r3042 == '0' }">
					<h2 style="margin-top:35px"></h2>
						<div id="304-2" class="d-flex ebed" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
						<h2 >304-2<div class="gray-text">빈 침상</div></h2>
					    	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
					    		<g clip-path=".url(#clip0_464_1878)">
					        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
					      		</g>
					      		<defs>
					        		<clipPath id="clip0_464_1878">
					          			<rect width="80" height="80" fill="white"/>
					        		</clipPath>
					      		</defs>
					    	</svg>
				  		</div>
			    	</c:if>
			</div>
			<!-- 304호 끝 -->
			<!-- 305호 시작-->
			<!-- 305호 1 -->
			<div class="spa-betw" style="margin-top:35px;">
				<h2>305호</h2>
				<c:set var="room305" value="0" />
					<c:forEach items="${admissionRoomList}" var="room">
					    <c:if test='${(room.adrmRoomno).startsWith("305") }'>
					        <c:set var="room305" value="${room305+1}" />
					    </c:if>
				</c:forEach>
				<span class="text-sm" style="font-size: 16px;">잔여병상 <span class="text-large" style="font-size: 16px; color:#00A9A4;">${2-room305}</span>개</span>
			</div>
			<div class="d-flex" style="margin: 0;">
				<c:set var="r3051" value="0" />
					<c:choose>
						<c:when test="${not empty admissionRoomList && fn:length('305-1') > 0 }">
							<c:forEach items="${admissionRoomList}" var="admissionRoom">
								<c:if test="${admissionRoom.adrmRoomno == '305' && admissionRoom.adrmBedno == '1' && admissionRoom.paNo != null}">
									<div id="${admissionRoom.admissionChartVOList[0].admiNo}" data-paNo="${admissionRoom.paNo}" data-room-number="305" data-bed-number="1" class="d-flex bed" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px; background-color: #DBF2F4">
										<h2 class="light-green-text">305-1<div>${admissionRoom.paName}</div></h2>  
									    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
									    	<g clip-path=".url(#clip0_464_1878)">
									        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
									      	</g>
									      	<defs>
									        	<clipPath id="clip0_464_1878">
									          		<rect width="80" height="80" fill="white"/>
									        	</clipPath>
									      	</defs>
									    </svg>
								  	</div>
					            <c:set var="r3051" value="1" />
				            	</c:if>
				        	</c:forEach>
				       	</c:when>
				       	<c:otherwise>
				    	</c:otherwise>
					</c:choose>
					    <c:if test="${r3051 == '0' }">
							<div id="305-1" class="d-flex ebed" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
							<h2 >305-1<div class="gray-text">빈 침상</div></h2>
						    	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
						    		<g clip-path=".url(#clip0_464_1878)">
						        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
						      		</g>
						      		<defs>
						        		<clipPath id="clip0_464_1878">
						          			<rect width="80" height="80" fill="white"/>
						        		</clipPath>
						      		</defs>
						    	</svg>
					  		</div>
					    </c:if>
				<!-- 305호 2 -->
				<c:set var="r3052" value="0" />
					<c:choose>
						<c:when test="${not empty admissionRoomList && fn:length('305-2') > 0 }">
							<c:forEach items="${admissionRoomList}" var="admissionRoom">
								<c:if test="${admissionRoom.adrmRoomno == '305' && admissionRoom.adrmBedno == '2' && admissionRoom.paNo != null}">
					                <h2 id="" style="margin-top:35px"></h2>
										<div id="${admissionRoom.admissionChartVOList[0].admiNo}" data-paNo="${admissionRoom.paNo}" data-room-number="305" data-bed-number="2" class="d-flex bed" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px; background-color: #DBF2F4">
											<h2 class="light-green-text">305-2<div>${admissionRoom.paName}</div></h2>  
										    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
										    	<g clip-path=".url(#clip0_464_1878)">
										        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
										      	</g>
										      	<defs>
										        	<clipPath id="clip0_464_1878">
										          		<rect width="80" height="80" fill="white"/>
										        	</clipPath>
										      	</defs>
										    </svg>
									  	</div>
					                <c:set var="r3052" value="1" />
				            	</c:if>
				        	</c:forEach>
				       	</c:when>
				       	<c:otherwise>
				    	</c:otherwise>
					</c:choose>
				    <c:if test="${r3052 == '0' }">
					<h2 style="margin-top:35px"></h2>
						<div id="305-2" class="d-flex ebed" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
						<h2 >305-2<div class="gray-text">빈 침상</div></h2>
					    	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
					    		<g clip-path=".url(#clip0_464_1878)">
					        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
					      		</g>
					      		<defs>
					        		<clipPath id="clip0_464_1878">
					          			<rect width="80" height="80" fill="white"/>
					        		</clipPath>
					      		</defs>
					    	</svg>
				  		</div>
			    	</c:if>
			</div>
			<!-- 305호 끝 -->
			<!-- 306호 시작-->
			<!-- 306호 1 -->
			<div class="spa-betw" style="margin-top:35px;">
				<h2>306호</h2>
				<c:set var="room306" value="0" />
					<c:forEach items="${admissionRoomList}" var="room">
					    <c:if test='${(room.adrmRoomno).startsWith("306") }'>
					        <c:set var="room306" value="${room306+1}" />
					    </c:if>
				</c:forEach>
				<span class="text-sm" style="font-size: 16px;">잔여병상 <span class="text-large" style="font-size: 16px; color:#00A9A4;">${2-room306}</span>개</span>
			</div>
			<div class="d-flex" style="margin: 0;">
				<c:set var="r3061" value="0" />
					<c:choose>
						<c:when test="${not empty admissionRoomList && fn:length('306-1') > 0 }">
							<c:forEach items="${admissionRoomList}" var="admissionRoom">
								<c:if test="${admissionRoom.adrmRoomno == '306' && admissionRoom.adrmBedno == '1' && admissionRoom.paNo != null}">
									<div id="${admissionRoom.admissionChartVOList[0].admiNo}" data-paNo="${admissionRoom.paNo}" data-room-number="306" data-bed-number="1" class="d-flex bed" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px; background-color: #DBF2F4">
										<h2 class="light-green-text">306-1<div>${admissionRoom.paName}</div></h2>  
									    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
									    	<g clip-path=".url(#clip0_464_1878)">
									        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
									      	</g>
									      	<defs>
									        	<clipPath id="clip0_464_1878">
									          		<rect width="80" height="80" fill="white"/>
									        	</clipPath>
									      	</defs>
									    </svg>
								  	</div>
					            <c:set var="r3061" value="1" />
				            	</c:if>
				        	</c:forEach>
				       	</c:when>
				       	<c:otherwise>
				    	</c:otherwise>
					</c:choose>
					    <c:if test="${r3061 == '0' }">
							<div id="306-1" class="d-flex ebed" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
							<h2 >306-1<div class="gray-text">빈 침상</div></h2>
						    	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
						    		<g clip-path=".url(#clip0_464_1878)">
						        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
						      		</g>
						      		<defs>
						        		<clipPath id="clip0_464_1878">
						          			<rect width="80" height="80" fill="white"/>
						        		</clipPath>
						      		</defs>
						    	</svg>
					  		</div>
					    </c:if>
				<!-- 306호 2 -->
				<c:set var="r3062" value="0" />
					<c:choose>
						<c:when test="${not empty admissionRoomList && fn:length('306-2') > 0 }">
							<c:forEach items="${admissionRoomList}" var="admissionRoom">
								<c:if test="${admissionRoom.adrmRoomno == '306' && admissionRoom.adrmBedno == '2' && admissionRoom.paNo != null}">
					                <h2 id="" style="margin-top:35px"></h2>
											<div id="${admissionRoom.admissionChartVOList[0].admiNo}" data-paNo="${admissionRoom.paNo}" data-room-number="306" data-bed-number="2" class="d-flex bed" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px; background-color: #DBF2F4">
												<h2 class="light-green-text">306-2<div>${admissionRoom.paName}</div></h2>  
											    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
											    	<g clip-path=".url(#clip0_464_1878)">
											        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
											      	</g>
											      	<defs>
											        	<clipPath id="clip0_464_1878">
											          		<rect width="80" height="80" fill="white"/>
											        	</clipPath>
											      	</defs>
											    </svg>
										  	</div>
					                <c:set var="r3062" value="1" />
				            	</c:if>
				        	</c:forEach>
				       	</c:when>
				       	<c:otherwise>
				    	</c:otherwise>
					</c:choose>
				    <c:if test="${r3062 == '0' }">
					<h2 style="margin-top:35px"></h2>
						<div id="306-2" class="d-flex ebed" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
						<h2 >306-2<div class="gray-text">빈 침상</div></h2>
					    	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
					    		<g clip-path=".url(#clip0_464_1878)">
					        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
					      		</g>
					      		<defs>
					        		<clipPath id="clip0_464_1878">
					          			<rect width="80" height="80" fill="white"/>
					        		</clipPath>
					      		</defs>
					    	</svg>
				  		</div>
			    	</c:if>
			</div>
			<!-- 306호 끝 -->
			<!-- 307호 시작-->
			<!-- 307호 1 -->
			<div class="spa-betw" style="margin-top:35px;">
				<h2>307호</h2>
				<c:set var="room307" value="0" />
					<c:forEach items="${admissionRoomList}" var="room">
					    <c:if test='${(room.adrmRoomno).startsWith("307") }'>
					        <c:set var="room307" value="${room307+1}" />
					    </c:if>
				</c:forEach>
				<span class="text-sm" style="font-size: 16px;">잔여병상 <span class="text-large" style="font-size: 16px; color:#00A9A4;">${2-room307}</span>개</span>
			</div>
			<div class="d-flex" style="margin: 0;">
				<c:set var="r3071" value="0" />
					<c:choose>
						<c:when test="${not empty admissionRoomList && fn:length('307-1') > 0 }">
							<c:forEach items="${admissionRoomList}" var="admissionRoom">
								<c:if test="${admissionRoom.adrmRoomno == '307' && admissionRoom.adrmBedno == '1' && admissionRoom.paNo != null}">
									<div id="${admissionRoom.admissionChartVOList[0].admiNo}" data-paNo="${admissionRoom.paNo}" data-room-number="307" data-bed-number="1" class="d-flex bed" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px; background-color: #DBF2F4">
										<h2 class="light-green-text">307-1<div>${admissionRoom.paName}</div></h2>  
									    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
									    	<g clip-path=".url(#clip0_464_1878)">
									        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
									      	</g>
									      	<defs>
									        	<clipPath id="clip0_464_1878">
									          		<rect width="80" height="80" fill="white"/>
									        	</clipPath>
									      	</defs>
									    </svg>
								  	</div>
					            <c:set var="r3071" value="1" />
				            	</c:if>
				        	</c:forEach>
				       	</c:when>
				       	<c:otherwise>
				    	</c:otherwise>
					</c:choose>
					    <c:if test="${r3071 == '0' }">
							<div id="307-1" class="d-flex ebed" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
							<h2 >307-1<div class="gray-text">빈 침상</div></h2>
						    	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
						    		<g clip-path=".url(#clip0_464_1878)">
						        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
						      		</g>
						      		<defs>
						        		<clipPath id="clip0_464_1878">
						          			<rect width="80" height="80" fill="white"/>
						        		</clipPath>
						      		</defs>
						    	</svg>
					  		</div>
					    </c:if>
				<!-- 307호 2 -->
				<c:set var="r3072" value="0" />
					<c:choose>
						<c:when test="${not empty admissionRoomList && fn:length('307-2') > 0 }">
							<c:forEach items="${admissionRoomList}" var="admissionRoom">
								<c:if test="${admissionRoom.adrmRoomno == '307' && admissionRoom.adrmBedno == '2' && admissionRoom.paNo != null}">
					                <h2 id="" style="margin-top:35px"></h2>
											<div id="${admissionRoom.admissionChartVOList[0].admiNo}" data-paNo="${admissionRoom.paNo}" data-room-number="307" data-bed-number="2" class="d-flex bed" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px; background-color: #DBF2F4">
												<h2 class="light-green-text">307-2<div>${admissionRoom.paName}</div></h2>  
											    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
											    	<g clip-path=".url(#clip0_464_1878)">
											        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
											      	</g>
											      	<defs>
											        	<clipPath id="clip0_464_1878">
											          		<rect width="80" height="80" fill="white"/>
											        	</clipPath>
											      	</defs>
											    </svg>
										  	</div>
					                <c:set var="r3072" value="1" />
				            	</c:if>
				        	</c:forEach>
				       	</c:when>
				       	<c:otherwise>
				    	</c:otherwise>
					</c:choose>
				    <c:if test="${r3072 == '0' }">
					<h2 style="margin-top:35px"></h2>
						<div id="307-2" class="d-flex ebed" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
						<h2 >307-2<div class="gray-text">빈 침상</div></h2>
					    	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
					    		<g clip-path=".url(#clip0_464_1878)">
					        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
					      		</g>
					      		<defs>
					        		<clipPath id="clip0_464_1878">
					          			<rect width="80" height="80" fill="white"/>
					        		</clipPath>
					      		</defs>
					    	</svg>
				  		</div>
			    	</c:if>
			</div>
			<!-- 307호 끝 -->
	</div>
	<!-- 2인실 끝 -->
	<!-- 2인실 끝 -->
	<!-- 2인실 끝 -->
	<!-- 4인실 시작 -->
	<!-- 4인실 시작 -->
	<!-- 4인실 시작 -->
	<div class="subTitle-margin" id="floor4" style="height: 100%;">
		<!-- 404호 시작-->
		<!-- 404호 1 -->
		<div class="spa-betw" style="margin-top:35px;">
				<h2>404호</h2>
				<c:set var="room404" value="0" />
					<c:forEach items="${admissionRoomList}" var="room">
					    <c:if test='${(room.adrmRoomno).startsWith("404") }'>
					        <c:set var="room404" value="${room404+1}" />
					    </c:if>
				</c:forEach>
				<span class="text-sm" style="font-size: 16px;">잔여병상 <span class="text-large" style="font-size: 16px; color:#00A9A4;">${4-room404}</span>개</span>
		</div>
			<div class="d-flex" style="margin: 0;">
				<c:set var="r4041" value="0" />
					<c:choose>
						<c:when test="${not empty admissionRoomList && fn:length('404-1') > 0 }">
							<c:forEach items="${admissionRoomList}" var="admissionRoom">
								<c:if test="${admissionRoom.adrmRoomno == '404' && admissionRoom.adrmBedno == '1' && admissionRoom.paNo != null}">
									<div id="${admissionRoom.admissionChartVOList[0].admiNo}" data-paNo="${admissionRoom.paNo}" data-room-number="404" data-bed-number="1" class="d-flex bed" style="padding: 16px 24px 16px 16px; margin: 0px; width:24%; margin-right: 10px; height:151px; background-color: #DBF2F4">
										<h2 class="light-green-text">404-1<div>${admissionRoom.paName}</div></h2>  
									    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
									    	<g clip-path=".url(#clip0_464_1878)">
									        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
									      	</g>
									      	<defs>
									        	<clipPath id="clip0_464_1878">
									          		<rect width="80" height="80" fill="white"/>
									        	</clipPath>
									      	</defs>
									    </svg>
								  	</div>
					            <c:set var="r4041" value="1" />
				            	</c:if>
				        	</c:forEach>
				       	</c:when>
				       	<c:otherwise>
				    	</c:otherwise>
					</c:choose>
					    <c:if test="${r4041 == '0' }">
							<div id="404-1" class="d-flex ebed" style="padding: 16px 24px 16px 16px; margin: 0px; width:24%; margin-right: 10px; height:151px;">
							<h2 >404-1<div class="gray-text">빈 침상</div></h2>
						    	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px; ">
						    		<g clip-path=".url(#clip0_464_1878)">
						        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
						      		</g>
						      		<defs>
						        		<clipPath id="clip0_464_1878">
						          			<rect width="80" height="80" fill="white"/>
						        		</clipPath>
						      		</defs>
						    	</svg>
					  		</div>
					    </c:if>
				<!-- 404호 2 -->
				<c:set var="r4042" value="0" />
					<c:choose>
						<c:when test="${not empty admissionRoomList && fn:length('404-2') > 0 }">
							<c:forEach items="${admissionRoomList}" var="admissionRoom">
								<c:if test="${admissionRoom.adrmRoomno == '404' && admissionRoom.adrmBedno == '2' && admissionRoom.paNo != null}">
					                <h2 id="" style="margin-top:35px"></h2>
											<div id="${admissionRoom.admissionChartVOList[0].admiNo}" data-paNo="${admissionRoom.paNo}" data-room-number="404" data-bed-number="2" class="d-flex bed" style="padding: 16px 24px 16px 16px; margin: 0px; width:24%; margin-right: 10px; height:151px; background-color: #DBF2F4">
												<h2 class="light-green-text">404-2<div>${admissionRoom.paName}</div></h2>  
											    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px">
											    	<g clip-path=".url(#clip0_464_1878)">
											        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
											      	</g>
											      	<defs>
											        	<clipPath id="clip0_464_1878">
											          		<rect width="80" height="80" fill="white"/>
											        	</clipPath>
											      	</defs>
											    </svg>
										  	</div>
					                <c:set var="r4042" value="1" />
				            	</c:if>
				        	</c:forEach>
				       	</c:when>
				       	<c:otherwise>
				    	</c:otherwise>
					</c:choose>
				    <c:if test="${r4042 == '0' }">
					<h2 style="margin-top:35px"></h2>
						<div id="404-2" class="d-flex ebed" style="padding: 16px 24px 16px 16px; margin: 0px; width:24%; margin-right: 10px; height:151px;">
						<h2 >404-2<div class="gray-text">빈 침상</div></h2>
					    	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
					    		<g clip-path=".url(#clip0_464_1878)">
					        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
					      		</g>
					      		<defs>
					        		<clipPath id="clip0_464_1878">
					          			<rect width="80" height="80" fill="white"/>
					        		</clipPath>
					      		</defs>
					    	</svg>
				  		</div>
			    	</c:if>
			    	<!-- 404호 3 -->
			    	<c:set var="r4043" value="0" />
					<c:choose>
						<c:when test="${not empty admissionRoomList && fn:length('404-3') > 0 }">
							<c:forEach items="${admissionRoomList}" var="admissionRoom">
								<c:if test="${admissionRoom.adrmRoomno == '404' && admissionRoom.adrmBedno == '3' && admissionRoom.paNo != null}">
									<div id="${admissionRoom.admissionChartVOList[0].admiNo}" data-paNo="${admissionRoom.paNo}" data-room-number="404" data-bed-number="3" class="d-flex bed" style="padding: 16px 24px 16px 16px; margin: 0px; width:24%; margin-right: 10px; height:151px; background-color: #DBF2F4">
										<h2 class="light-green-text">404-3<div>${admissionRoom.paName}</div></h2>  
									    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
									    	<g clip-path=".url(#clip0_464_1878)">
									        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
									      	</g>
									      	<defs>
									        	<clipPath id="clip0_464_1878">
									          		<rect width="80" height="80" fill="white"/>
									        	</clipPath>
									      	</defs>
									    </svg>
								  	</div>
					            <c:set var="r4043" value="1" />
				            	</c:if>
				        	</c:forEach>
				       	</c:when>
				       	<c:otherwise>
				    	</c:otherwise>
					</c:choose>
					    <c:if test="${r4043 == '0' }">
							<div id="404-3" class="d-flex ebed" style="padding: 16px 24px 16px 16px; margin: 0px; width:24%; margin-right: 10px; height:151px;">
							<h2 >404-3<div class="gray-text">빈 침상</div></h2>
						    	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
						    		<g clip-path=".url(#clip0_464_1878)">
						        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
						      		</g>
						      		<defs>
						        		<clipPath id="clip0_464_1878">
						          			<rect width="80" height="80" fill="white"/>
						        		</clipPath>
						      		</defs>
						    	</svg>
					  		</div>
					    </c:if>
				<!-- 404호 4 -->
				<c:set var="r4044" value="0" />
					<c:choose>
						<c:when test="${not empty admissionRoomList && fn:length('404-4') > 0 }">
							<c:forEach items="${admissionRoomList}" var="admissionRoom">
								<c:if test="${admissionRoom.adrmRoomno == '404' && admissionRoom.adrmBedno == '4' && admissionRoom.paNo != null}">
					                <h2 id="" style="margin-top:35px"></h2>
											<div id="${admissionRoom.admissionChartVOList[0].admiNo}" data-paNo="${admissionRoom.paNo}" data-room-number="404" data-bed-number="4" class="d-flex bed" style="padding: 16px 24px 16px 16px; margin: 0px; width:24%; margin-right: 10px; height:151px; background-color: #DBF2F4">
												<h2 class="light-green-text">404-4<div>${admissionRoom.paName}</div></h2>  
											    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
											    	<g clip-path=".url(#clip0_464_1878)">
											        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
											      	</g>
											      	<defs>
											        	<clipPath id="clip0_464_1878">
											          		<rect width="80" height="80" fill="white"/>
											        	</clipPath>
											      	</defs>
											    </svg>
										  	</div>
					                <c:set var="r4044" value="1" />
				            	</c:if>
				        	</c:forEach>
				       	</c:when>
				       	<c:otherwise>
				    	</c:otherwise>
					</c:choose>
				    <c:if test="${r4044 == '0' }">
					<h2 style="margin-top:35px"></h2>
						<div id="404-4" class="d-flex ebed" style="padding: 16px 24px 16px 16px; margin: 0px; width:24%; margin-right: 10px; height:151px;">
						<h2 >404-4<div class="gray-text">빈 침상</div></h2>
					    	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
					    		<g clip-path=".url(#clip0_464_1878)">
					        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
					      		</g>
					      		<defs>
					        		<clipPath id="clip0_464_1878">
					          			<rect width="80" height="80" fill="white"/>
					        		</clipPath>
					      		</defs>
					    	</svg>
				  		</div>
			    	</c:if>
			</div>
			<!-- 404호 끝 -->
			<!-- 404호 시작-->
			<!-- 405호 1 -->
			<div class="spa-betw" style="margin-top:35px;">
				<h2>405호</h2>
				<c:set var="room405" value="0" />
					<c:forEach items="${admissionRoomList}" var="room">
					    <c:if test='${(room.adrmRoomno).startsWith("405") }'>
					        <c:set var="room405" value="${room405+1}" />
					    </c:if>
				</c:forEach>
				<span class="text-sm" style="font-size: 16px;">잔여병상 <span class="text-large" style="font-size: 16px; color:#00A9A4;">${4-room405}</span>개</span>
			</div>
				<div class="d-flex" style="margin: 0;">
					<c:set var="r4051" value="0" />
						<c:choose>
							<c:when test="${not empty admissionRoomList && fn:length('405-1') > 0 }">
								<c:forEach items="${admissionRoomList}" var="admissionRoom">
									<c:if test="${admissionRoom.adrmRoomno == '405' && admissionRoom.adrmBedno == '1' && admissionRoom.paNo != null}">
										<div id="${admissionRoom.admissionChartVOList[0].admiNo}" data-paNo="${admissionRoom.paNo}" data-room-number="405" data-bed-number="1" class="d-flex bed" style="padding: 16px 24px 16px 16px; margin: 0px; width:24%; margin-right: 10px; height:151px; background-color: #DBF2F4">
											<h2 class="light-green-text">405-1<div>${admissionRoom.paName}</div></h2>  
										    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
										    	<g clip-path=".url(#clip0_464_1878)">
										        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
										      	</g>
										      	<defs>
										        	<clipPath id="clip0_464_1878">
										          		<rect width="80" height="80" fill="white"/>
										        	</clipPath>
										      	</defs>
										    </svg>
									  	</div>
						            <c:set var="r4051" value="1" />
					            	</c:if>
					        	</c:forEach>
					       	</c:when>
					       	<c:otherwise>
					    	</c:otherwise>
						</c:choose>
						    <c:if test="${r4051 == '0' }">
								<div id="405-1" class="d-flex ebed" style="padding: 16px 24px 16px 16px; margin: 0px; width:24%; margin-right: 10px; height:151px;">
								<h2 >405-1<div class="gray-text">빈 침상</div></h2>
							    	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
							    		<g clip-path=".url(#clip0_464_1878)">
							        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
							      		</g>
							      		<defs>
							        		<clipPath id="clip0_464_1878">
							          			<rect width="80" height="80" fill="white"/>
							        		</clipPath>
							      		</defs>
							    	</svg>
						  		</div>
						    </c:if>
					<!-- 405호 2 -->
					<c:set var="r4052" value="0" />
						<c:choose>
							<c:when test="${not empty admissionRoomList && fn:length('405-2') > 0 }">
								<c:forEach items="${admissionRoomList}" var="admissionRoom">
									<c:if test="${admissionRoom.adrmRoomno == '405' && admissionRoom.adrmBedno == '2' && admissionRoom.paNo != null}">
						                <h2 id="" style="margin-top:35px"></h2>
												<div id="${admissionRoom.admissionChartVOList[0].admiNo}" data-paNo="${admissionRoom.paNo}" data-room-number="405" data-bed-number="2" class="d-flex bed" style="padding: 16px 24px 16px 16px; margin: 0px; width:24%; margin-right: 10px; height:151px; background-color: #DBF2F4">
													<h2 class="light-green-text">405-2<div>${admissionRoom.paName}</div></h2>  
												    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
												    	<g clip-path=".url(#clip0_464_1878)">
												        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
												      	</g>
												      	<defs>
												        	<clipPath id="clip0_464_1878">
												          		<rect width="80" height="80" fill="white"/>
												        	</clipPath>
												      	</defs>
												    </svg>
											  	</div>
						                <c:set var="r4052" value="1" />
					            	</c:if>
					        	</c:forEach>
					       	</c:when>
					       	<c:otherwise>
					    	</c:otherwise>
						</c:choose>
					    <c:if test="${r4052 == '0' }">
						<h2 style="margin-top:35px"></h2>
							<div id="405-2" class="d-flex ebed" style="padding: 16px 24px 16px 16px; margin: 0px; width:24%; margin-right: 10px; height:151px;">
							<h2 >405-2<div class="gray-text">빈 침상</div></h2>
						    	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
						    		<g clip-path=".url(#clip0_464_1878)">
						        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
						      		</g>
						      		<defs>
						        		<clipPath id="clip0_464_1878">
						          			<rect width="80" height="80" fill="white"/>
						        		</clipPath>
						      		</defs>
						    	</svg>
					  		</div>
				    	</c:if>
				    	<!-- 405호 3 -->
				    	<c:set var="r4053" value="0" />
						<c:choose>
							<c:when test="${not empty admissionRoomList && fn:length('405-3') > 0 }">
								<c:forEach items="${admissionRoomList}" var="admissionRoom">
									<c:if test="${admissionRoom.adrmRoomno == '405' && admissionRoom.adrmBedno == '3' && admissionRoom.paNo != null}">
										<div id="${admissionRoom.admissionChartVOList[0].admiNo}" data-paNo="${admissionRoom.paNo}" data-room-number="405" data-bed-number="3" class="d-flex bed" style="padding: 16px 24px 16px 16px; margin: 0px; width:24%; margin-right: 10px; height:151px; background-color: #DBF2F4">
											<h2 class="light-green-text">405-3<div>${admissionRoom.paName}</div></h2>  
										    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
										    	<g clip-path=".url(#clip0_464_1878)">
										        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
										      	</g>
										      	<defs>
										        	<clipPath id="clip0_464_1878">
										          		<rect width="80" height="80" fill="white"/>
										        	</clipPath>
										      	</defs>
										    </svg>
									  	</div>
						            <c:set var="r4053" value="1" />
					            	</c:if>
					        	</c:forEach>
					       	</c:when>
					       	<c:otherwise>
					    	</c:otherwise>
						</c:choose>
						    <c:if test="${r4053 == '0' }">
								<div id="405-3" class="d-flex ebed" style="padding: 16px 24px 16px 16px; margin: 0px; width:24%; margin-right: 10px; height:151px;">
								<h2 >405-3<div class="gray-text">빈 침상</div></h2>
							    	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
							    		<g clip-path=".url(#clip0_464_1878)">
							        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
							      		</g>
							      		<defs>
							        		<clipPath id="clip0_464_1878">
							          			<rect width="80" height="80" fill="white"/>
							        		</clipPath>
							      		</defs>
							    	</svg>
						  		</div>
						    </c:if>
					<!-- 405호 4 -->
					<c:set var="r4054" value="0" />
						<c:choose>
							<c:when test="${not empty admissionRoomList && fn:length('405-4') > 0 }">
								<c:forEach items="${admissionRoomList}" var="admissionRoom">
									<c:if test="${admissionRoom.adrmRoomno == '405' && admissionRoom.adrmBedno == '4' && admissionRoom.paNo != null}">
						                <h2 id="" style="margin-top:35px"></h2>
												<div id="${admissionRoom.admissionChartVOList[0].admiNo}" data-paNo="${admissionRoom.paNo}" data-room-number="405" data-bed-number="4" class="d-flex bed" style="padding: 16px 24px 16px 16px; margin: 0px; width:24%; margin-right: 10px; height:151px; background-color: #DBF2F4">
													<h2 class="light-green-text">405-4<div>${admissionRoom.paName}</div></h2>  
												    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
												    	<g clip-path=".url(#clip0_464_1878)">
												        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
												      	</g>
												      	<defs>
												        	<clipPath id="clip0_464_1878">
												          		<rect width="80" height="80" fill="white"/>
												        	</clipPath>
												      	</defs>
												    </svg>
											  	</div>
						                <c:set var="r4054" value="1" />
					            	</c:if>
					        	</c:forEach>
					       	</c:when>
					       	<c:otherwise>
					    	</c:otherwise>
						</c:choose>
					    <c:if test="${r4054 == '0' }">
						<h2 style="margin-top:35px"></h2>
							<div id="405-4" class="d-flex ebed" style="padding: 16px 24px 16px 16px; margin: 0px; width:24%; margin-right: 10px; height:151px;">
							<h2 >405-4<div class="gray-text">빈 침상</div></h2>
						    	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
						    		<g clip-path=".url(#clip0_464_1878)">
						        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
						      		</g>
						      		<defs>
						        		<clipPath id="clip0_464_1878">
						          			<rect width="80" height="80" fill="white"/>
						        		</clipPath>
						      		</defs>
						    	</svg>
					  		</div>
				    	</c:if>
				</div>
				<!-- 405호 끝 -->
				<!-- 404호 시작-->
				<!-- 406호 1 -->
				<div class="spa-betw" style="margin-top:35px;">
					<h2>406호</h2>
					<c:set var="room406" value="0" />
						<c:forEach items="${admissionRoomList}" var="room">
						    <c:if test='${(room.adrmRoomno).startsWith("406") }'>
						        <c:set var="room406" value="${room406+1}" />
						    </c:if>
					</c:forEach>
					<span class="text-sm" style="font-size: 16px;">잔여병상 <span class="text-large" style="font-size: 16px; color:#00A9A4;">${4-room406}</span>개</span>
				</div>
				<div class="d-flex" style="margin: 0;">
					<c:set var="r4061" value="0" />
						<c:choose>
							<c:when test="${not empty admissionRoomList && fn:length('406-1') > 0 }">
								<c:forEach items="${admissionRoomList}" var="admissionRoom">
									<c:if test="${admissionRoom.adrmRoomno == '406' && admissionRoom.adrmBedno == '1' && admissionRoom.paNo != null}">
										<div id="${admissionRoom.admissionChartVOList[0].admiNo}" data-paNo="${admissionRoom.paNo}" data-room-number="406" data-bed-number="1" class="d-flex bed" style="padding: 16px 24px 16px 16px; margin: 0px; width:24%; margin-right: 10px; height:151px; background-color: #DBF2F4">
											<h2 class="light-green-text">406-1<div>${admissionRoom.paName}</div></h2>  
										    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
										    	<g clip-path=".url(#clip0_464_1878)">
										        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
										      	</g>
										      	<defs>
										        	<clipPath id="clip0_464_1878">
										          		<rect width="80" height="80" fill="white"/>
										        	</clipPath>
										      	</defs>
										    </svg>
									  	</div>
						            <c:set var="r4061" value="1" />
					            	</c:if>
					        	</c:forEach>
					       	</c:when>
					       	<c:otherwise>
					    	</c:otherwise>
						</c:choose>
						    <c:if test="${r4061 == '0' }">
								<div id="406-1" class="d-flex ebed" style="padding: 16px 24px 16px 16px; margin: 0px; width:24%; margin-right: 10px; height:151px;">
								<h2 >406-1<div class="gray-text">빈 침상</div></h2>
							    	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
							    		<g clip-path=".url(#clip0_464_1878)">
							        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
							      		</g>
							      		<defs>
							        		<clipPath id="clip0_464_1878">
							          			<rect width="80" height="80" fill="white"/>
							        		</clipPath>
							      		</defs>
							    	</svg>
						  		</div>
						    </c:if>
					<!-- 406호 2 -->
					<c:set var="r4062" value="0" />
						<c:choose>
							<c:when test="${not empty admissionRoomList && fn:length('406-2') > 0 }">
								<c:forEach items="${admissionRoomList}" var="admissionRoom">
									<c:if test="${admissionRoom.adrmRoomno == '406' && admissionRoom.adrmBedno == '2' && admissionRoom.paNo != null}">
						                <h2 id="" style="margin-top:35px"></h2>
												<div id="${admissionRoom.admissionChartVOList[0].admiNo}" data-paNo="${admissionRoom.paNo}" data-room-number="406" data-bed-number="2" class="d-flex bed" style="padding: 16px 24px 16px 16px; margin: 0px; width:24%; margin-right: 10px; height:151px; background-color: #DBF2F4">
													<h2 class="light-green-text">406-2<div>${admissionRoom.paName}</div></h2>  
												    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
												    	<g clip-path=".url(#clip0_464_1878)">
												        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
												      	</g>
												      	<defs>
												        	<clipPath id="clip0_464_1878">
												          		<rect width="80" height="80" fill="white"/>
												        	</clipPath>
												      	</defs>
												    </svg>
											  	</div>
						                <c:set var="r4062" value="1" />
					            	</c:if>
					        	</c:forEach>
					       	</c:when>
					       	<c:otherwise>
					    	</c:otherwise>
						</c:choose>
					    <c:if test="${r4062 == '0' }">
						<h2 style="margin-top:35px"></h2>
							<div id="406-2" class="d-flex ebed" style="padding: 16px 24px 16px 16px; margin: 0px; width:24%; margin-right: 10px; height:151px;">
							<h2 >406-2<div class="gray-text">빈 침상</div></h2>
						    	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
						    		<g clip-path=".url(#clip0_464_1878)">
						        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
						      		</g>
						      		<defs>
						        		<clipPath id="clip0_464_1878">
						          			<rect width="80" height="80" fill="white"/>
						        		</clipPath>
						      		</defs>
						    	</svg>
					  		</div>
				    	</c:if>
				    	<!-- 406호 3 -->
				    	<c:set var="r4063" value="0" />
						<c:choose>
							<c:when test="${not empty admissionRoomList && fn:length('406-3') > 0 }">
								<c:forEach items="${admissionRoomList}" var="admissionRoom">
									<c:if test="${admissionRoom.adrmRoomno == '406' && admissionRoom.adrmBedno == '3' && admissionRoom.paNo != null}">
										<div id="${admissionRoom.admissionChartVOList[0].admiNo}" data-paNo="${admissionRoom.paNo}" data-room-number="406" data-bed-number="3" class="d-flex bed" style="padding: 16px 24px 16px 16px; margin: 0px; width:24%; margin-right: 10px; height:151px; background-color: #DBF2F4">
											<h2 class="light-green-text">406-3<div>${admissionRoom.paName}</div></h2>  
										    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
										    	<g clip-path=".url(#clip0_464_1878)">
										        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
										      	</g>
										      	<defs>
										        	<clipPath id="clip0_464_1878">
										          		<rect width="80" height="80" fill="white"/>
										        	</clipPath>
										      	</defs>
										    </svg>
									  	</div>
						            <c:set var="r4063" value="1" />
					            	</c:if>
					        	</c:forEach>
					       	</c:when>
					       	<c:otherwise>
					    	</c:otherwise>
						</c:choose>
						    <c:if test="${r4063 == '0' }">
								<div id="406-3" class="d-flex ebed" style="padding: 16px 24px 16px 16px; margin: 0px; width:24%; margin-right: 10px; height:151px;">
								<h2 >406-3<div class="gray-text">빈 침상</div></h2>
							    	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
							    		<g clip-path=".url(#clip0_464_1878)">
							        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
							      		</g>
							      		<defs>
							        		<clipPath id="clip0_464_1878">
							          			<rect width="80" height="80" fill="white"/>
							        		</clipPath>
							      		</defs>
							    	</svg>
						  		</div>
						    </c:if>
					<!-- 406호 4 -->
					<c:set var="r4064" value="0" />
						<c:choose>
							<c:when test="${not empty admissionRoomList && fn:length('406-4') > 0 }">
								<c:forEach items="${admissionRoomList}" var="admissionRoom">
									<c:if test="${admissionRoom.adrmRoomno == '406' && admissionRoom.adrmBedno == '4' && admissionRoom.paNo != null}">
						                <h2 id="" style="margin-top:35px"></h2>
												<div id="${admissionRoom.admissionChartVOList[0].admiNo}" data-paNo="${admissionRoom.paNo}" data-room-number="406" data-bed-number="4" class="d-flex bed" style="padding: 16px 24px 16px 16px; margin: 0px; width:24%; margin-right: 10px; height:151px; background-color: #DBF2F4">
													<h2 class="light-green-text">406-4<div>${admissionRoom.paName}</div></h2>  
												    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
												    	<g clip-path=".url(#clip0_464_1878)">
												        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
												      	</g>
												      	<defs>
												        	<clipPath id="clip0_464_1878">
												          		<rect width="80" height="80" fill="white"/>
												        	</clipPath>
												      	</defs>
												    </svg>
											  	</div>
						                <c:set var="r4064" value="1" />
					            	</c:if>
					        	</c:forEach>
					       	</c:when>
					       	<c:otherwise>
					    	</c:otherwise>
						</c:choose>
					    <c:if test="${r4064 == '0' }">
						<h2 style="margin-top:35px"></h2>
							<div id="406-4" class="d-flex ebed" style="padding: 16px 24px 16px 16px; margin: 0px; width:24%; margin-right: 10px; height:151px;">
							<h2 >406-4<div class="gray-text">빈 침상</div></h2>
						    	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
						    		<g clip-path=".url(#clip0_464_1878)">
						        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
						      		</g>
						      		<defs>
						        		<clipPath id="clip0_464_1878">
						          			<rect width="80" height="80" fill="white"/>
						        		</clipPath>
						      		</defs>
						    	</svg>
					  		</div>
				    	</c:if>
				</div>
				<!-- 406호 끝 -->
		</div>
		<!-- 4인실 끝 -->
		<!-- 4인실 끝 -->
		<!-- 4인실 끝 -->
		<!-- 6인실 시작 -->
		<!-- 6인실 시작 -->
		<!-- 6인실 시작 -->
		<div class="subTitle-margin" id="floor5" style="height: 100%;">
		<div class="bed-list-6 hidden">
		<div class="dduk-inner-border bed-list-6-left">
			<div>
				<h2 class="title-bed-6">504호 
					<c:set var="room504" value="0" />
						<c:forEach items="${admissionRoomList}" var="room">
						    <c:if test='${(room.adrmRoomno).startsWith("504") }'>
						        <c:set var="room504" value="${room504+1}" />
						    </c:if>
					</c:forEach>
					<span class="text-sm" style="font-size: 16px; color:#858796;">(잔여병상 <span class="text-large" style="font-size: 16px; color:#00A9A4;">${6-room504}</span>개)</span>
				</h2>
			</div>
			<div class="d-flex" style="margin-top: 25px;">
					<c:set var="r5041" value="0" />
						<c:choose>
							<c:when test="${not empty admissionRoomList && fn:length('504-1') > 0 }">
								<c:forEach items="${admissionRoomList}" var="admissionRoom">
									<c:if test="${admissionRoom.adrmRoomno == '504' && admissionRoom.adrmBedno == '1' && admissionRoom.paNo != null}">
										<div id="${admissionRoom.admissionChartVOList[0].admiNo}" data-paNo="${admissionRoom.paNo}" data-room-number="504" data-bed-number="1" class="d-flex bed" style="padding: 16px 20px 16px 16px; margin: 0px; width:50%; margin-right: 20px; height:151px; background-color: #DBF2F4">
											<h2 class="light-green-text">504-1<div>${admissionRoom.paName}</div></h2>  
										    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
										    	<g clip-path=".url(#clip0_464_1878)">
										        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
										      	</g>
										      	<defs>
										        	<clipPath id="clip0_464_1878">
										          		<rect width="80" height="80" fill="white"/>
										        	</clipPath>
										      	</defs>
										    </svg>
									  	</div>
						            <c:set var="r5041" value="1" />
					            	</c:if>
					        	</c:forEach>
					       	</c:when>
					       	<c:otherwise>
					    	</c:otherwise>
						</c:choose>
						    <c:if test="${r5041 == '0' }">
								<div id="504-1" class="d-flex ebed" style="padding: 16px 20px 16px 16px; margin: 0px; width:50%; margin-right: 20px; height:151px;">
								<h2 >504-1<div class="admissBedPaName gray-text">빈 침상</div></h2>
							    	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px; ">
							    		<g clip-path=".url(#clip0_464_1878)">
							        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
							      		</g>
							      		<defs>
							        		<clipPath id="clip0_464_1878">
							          			<rect width="80" height="80" fill="white"/>
							        		</clipPath>
							      		</defs>
							    	</svg>
						  		</div>
						    </c:if>
					<!-- 504호 2 -->
					<c:set var="r5042" value="0" />
						<c:choose>
							<c:when test="${not empty admissionRoomList && fn:length('504-2') > 0 }">
								<c:forEach items="${admissionRoomList}" var="admissionRoom">
									<c:if test="${admissionRoom.adrmRoomno == '504' && admissionRoom.adrmBedno == '2' && admissionRoom.paNo != null}">
						                <h2 id="" style="margin-top:35px"></h2>
												<div id="${admissionRoom.admissionChartVOList[0].admiNo}" data-paNo="${admissionRoom.paNo}" data-room-number="504" data-bed-number="2" class="d-flex bed" style="padding: 16px 20px 16px 16px; margin: 0px; width:50%; margin-right: 5px; height:151px; background-color: #DBF2F4">
													<h2 class="light-green-text">504-2<div>${admissionRoom.paName}</div></h2>  
												    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px">
												    	<g clip-path=".url(#clip0_464_1878)">
												        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
												      	</g>
												      	<defs>
												        	<clipPath id="clip0_464_1878">
												          		<rect width="80" height="80" fill="white"/>
												        	</clipPath>
												      	</defs>
												    </svg>
											  	</div>
						                <c:set var="r5042" value="1" />
					            	</c:if>
					        	</c:forEach>
					       	</c:when>
					       	<c:otherwise>
					    	</c:otherwise>
						</c:choose>
					    <c:if test="${r5042 == '0' }">
						<h2 style="margin-top:35px"></h2>
							<div id="504-2" class="d-flex ebed" style="padding: 16px 20px 16px 16px; margin: 0px; width:50%; margin-right: 5px; height:151px;">
							<h2 >504-2<div class="admissBedPaName gray-text">빈 침상</div></h2>
						    	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
						    		<g clip-path=".url(#clip0_464_1878)">
						        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
						      		</g>
						      		<defs>
						        		<clipPath id="clip0_464_1878">
						          			<rect width="80" height="80" fill="white"/>
						        		</clipPath>
						      		</defs>
						    	</svg>
					  		</div>
				    	</c:if>
				    </div>
				    <div class="dduk-row">
				    <div class="d-flex" style="margin-top: 35px;"">
				    	<!-- 504호 3 -->
				    	<c:set var="r5043" value="0" />
						<c:choose>
							<c:when test="${not empty admissionRoomList && fn:length('504-3') > 0 }">
								<c:forEach items="${admissionRoomList}" var="admissionRoom">
									<c:if test="${admissionRoom.adrmRoomno == '504' && admissionRoom.adrmBedno == '3' && admissionRoom.paNo != null}">
										<div id="${admissionRoom.admissionChartVOList[0].admiNo}" data-paNo="${admissionRoom.paNo}" data-room-number="504" data-bed-number="3" class="d-flex bed" style="padding: 16px 20px 16px 16px; margin: 0px; width:50%; margin-right: 20px; height:151px; background-color: #DBF2F4">
											<h2 class="light-green-text">504-3<div>${admissionRoom.paName}</div></h2>  
										    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
										    	<g clip-path=".url(#clip0_464_1878)">
										        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
										      	</g>
										      	<defs>
										        	<clipPath id="clip0_464_1878">
										          		<rect width="80" height="80" fill="white"/>
										        	</clipPath>
										      	</defs>
										    </svg>
									  	</div>
						            <c:set var="r5043" value="1" />
					            	</c:if>
					        	</c:forEach>
					       	</c:when>
					       	<c:otherwise>
					    	</c:otherwise>
						</c:choose>
						    <c:if test="${r5043 == '0' }">
								<div id="504-3" class="d-flex ebed" style="padding: 16px 20px 16px 16px; margin: 0px; width:50%; margin-right: 20px; height:151px;">
								<h2 >504-3<div class="admissBedPaName gray-text">빈 침상</div></h2>
							    	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
							    		<g clip-path=".url(#clip0_464_1878)">
							        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
							      		</g>
							      		<defs>
							        		<clipPath id="clip0_464_1878">
							          			<rect width="80" height="80" fill="white"/>
							        		</clipPath>
							      		</defs>
							    	</svg>
						  		</div>
						    </c:if>
					<!-- 504호 4 -->
					<c:set var="r5044" value="0" />
						<c:choose>
							<c:when test="${not empty admissionRoomList && fn:length('504-4') > 0 }">
								<c:forEach items="${admissionRoomList}" var="admissionRoom">
									<c:if test="${admissionRoom.adrmRoomno == '504' && admissionRoom.adrmBedno == '4' && admissionRoom.paNo != null}">
						                <h2 id="" style="margin-top:35px"></h2>
												<div id="${admissionRoom.admissionChartVOList[0].admiNo}" data-paNo="${admissionRoom.paNo}" data-room-number="504" data-bed-number="4" class="d-flex bed" style="padding: 16px 20px 16px 16px; margin: 0px; width:50%; margin-right: 5px; height:151px; background-color: #DBF2F4">
													<h2 class="light-green-text">504-4<div>${admissionRoom.paName}</div></h2>  
												    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px">
												    	<g clip-path=".url(#clip0_464_1878)">
												        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
												      	</g>
												      	<defs>
												        	<clipPath id="clip0_464_1878">
												          		<rect width="80" height="80" fill="white"/>
												        	</clipPath>
												      	</defs>
												    </svg>
											  	</div>
						                <c:set var="r5044" value="1" />
					            	</c:if>
					        	</c:forEach>
					       	</c:when>
					       	<c:otherwise>
					    	</c:otherwise>
						</c:choose>
					    <c:if test="${r5044 == '0' }">
						<h2 style="margin-top:35px"></h2>
							<div id="504-4" class="d-flex ebed" style="padding: 16px 20px 16px 16px; margin: 0px; width:50%; margin-right: 5px; height:151px;">
							<h2 style="width:54px;">504-4<div class="admissBedPaName admissBedPaName gray-text">빈 침상</div></h2>
						    	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
						    		<g clip-path=".url(#clip0_464_1878)">
						        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
						      		</g>
						      		<defs>
						        		<clipPath id="clip0_464_1878">
						          			<rect width="80" height="80" fill="white"/>
						        		</clipPath>
						      		</defs>
						    	</svg>
					  		</div>
				    	</c:if>
				    </div>
				</div>
				<!-- 504-5 -->
				<div class="d-flex" style="margin-top: 35px;">
					<c:set var="r5045" value="0" />
						<c:choose>
							<c:when test="${not empty admissionRoomList && fn:length('504-5') > 0 }">
								<c:forEach items="${admissionRoomList}" var="admissionRoom">
									<c:if test="${admissionRoom.adrmRoomno == '504' && admissionRoom.adrmBedno == '5' && admissionRoom.paNo != null}">
										<div id="${admissionRoom.admissionChartVOList[0].admiNo}" data-paNo="${admissionRoom.paNo}" data-room-number="504" data-bed-number="5" class="d-flex bed" style="padding: 16px 20px 16px 16px; margin: 0px; width:50%; margin-right: 20px; height:151px; background-color: #DBF2F4">
											<h2 class="light-green-text">504-5<div>${admissionRoom.paName}</div></h2>  
										    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
										    	<g clip-path=".url(#clip0_464_1878)">
										        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
										      	</g>
										      	<defs>
										        	<clipPath id="clip0_464_1878">
										          		<rect width="80" height="80" fill="white"/>
										        	</clipPath>
										      	</defs>
										    </svg>
									  	</div>
						            <c:set var="r5045" value="1" />
					            	</c:if>
					        	</c:forEach>
					       	</c:when>
					       	<c:otherwise>
					    	</c:otherwise>
						</c:choose>
						    <c:if test="${r5045 == '0' }">
								<div id="504-5" class="d-flex ebed" style="padding: 16px 20px 16px 16px; margin: 0px; width:50%; margin-right: 20px; height:151px;">
								<h2 >504-5<div class="admissBedPaName gray-text">빈 침상</div></h2>
							    	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px; ">
							    		<g clip-path=".url(#clip0_464_1878)">
							        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
							      		</g>
							      		<defs>
							        		<clipPath id="clip0_464_1878">
							          			<rect width="80" height="80" fill="white"/>
							        		</clipPath>
							      		</defs>
							    	</svg>
						  		</div>
						    </c:if>
					<!-- 504호 6 -->
					<c:set var="r5046" value="0" />
						<c:choose>
							<c:when test="${not empty admissionRoomList && fn:length('504-2') > 0 }">
								<c:forEach items="${admissionRoomList}" var="admissionRoom">
									<c:if test="${admissionRoom.adrmRoomno == '504' && admissionRoom.adrmBedno == '6' && admissionRoom.paNo != null}">
						                <h2 id="" style="margin-top:35px"></h2>
												<div id="${admissionRoom.admissionChartVOList[0].admiNo}" data-paNo="${admissionRoom.paNo}" data-room-number="504" data-bed-number="6" class="d-flex bed" style="padding: 16px 20px 16px 16px; margin: 0px; width:50%; margin-right: 5px; height:151px; background-color: #DBF2F4">
													<h2 class="light-green-text">504-6<div>${admissionRoom.paName}</div></h2>  
												    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px">
												    	<g clip-path=".url(#clip0_464_1878)">
												        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
												      	</g>
												      	<defs>
												        	<clipPath id="clip0_464_1878">
												          		<rect width="80" height="80" fill="white"/>
												        	</clipPath>
												      	</defs>
												    </svg>
											  	</div>
						                <c:set var="r5046" value="1" />
					            	</c:if>
					        	</c:forEach>
					       	</c:when>
					       	<c:otherwise>
					    	</c:otherwise>
						</c:choose>
					    <c:if test="${r5046 == '0' }">
						<h2 style="margin-top:35px"></h2>
							<div id="504-6" class="d-flex ebed" style="padding: 16px 20px 16px 16px; margin: 0px; width:50%; margin-right: 5px; height:151px;">
							<h2 >504-6<div class="admissBedPaName gray-text">빈 침상</div></h2>
						    	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
						    		<g clip-path=".url(#clip0_464_1878)">
						        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
						      		</g>
						      		<defs>
						        		<clipPath id="clip0_464_1878">
						          			<rect width="80" height="80" fill="white"/>
						        		</clipPath>
						      		</defs>
						    	</svg>
					  		</div>
				    	</c:if>
				    </div>
				
			</div>
			<div class="dduk-inner-border bed-list-6-right">
			<div>
				<h2 class="title-bed-6">505호 
					<c:set var="room505" value="0" />
						<c:forEach items="${admissionRoomList}" var="room">
						    <c:if test='${(room.adrmRoomno).startsWith("505") }'>
						        <c:set var="room505" value="${room505+1}" />
						    </c:if>
					</c:forEach>
					<span class="text-sm" style="font-size: 16px; color:#858796;">(잔여병상 <span class="text-large" style="font-size: 16px; color:#00A9A4;">${6-room505}</span>개)</span>
				</h2>
			</div>
			<div class="d-flex" style="margin-top: 25px;">
					<c:set var="r5051" value="0" />
						<c:choose>
							<c:when test="${not empty admissionRoomList && fn:length('505-1') > 0 }">
								<c:forEach items="${admissionRoomList}" var="admissionRoom">
									<c:if test="${admissionRoom.adrmRoomno == '505' && admissionRoom.adrmBedno == '1' && admissionRoom.paNo != null}">
										<div id="${admissionRoom.admissionChartVOList[0].admiNo}" data-paNo="${admissionRoom.paNo}" data-room-number="505" data-bed-number="1" class="d-flex bed" style="padding: 16px 20px 16px 16px; margin: 0px; width:50%; margin-right: 20px; height:151px; background-color: #DBF2F4">
											<h2 class="light-green-text">505-1<div>${admissionRoom.paName}</div></h2>  
										    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
										    	<g clip-path=".url(#clip0_464_1878)">
										        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
										      	</g>
										      	<defs>
										        	<clipPath id="clip0_464_1878">
										          		<rect width="80" height="80" fill="white"/>
										        	</clipPath>
										      	</defs>
										    </svg>
									  	</div>
						            <c:set var="r5051" value="1" />
					            	</c:if>
					        	</c:forEach>
					       	</c:when>
					       	<c:otherwise>
					    	</c:otherwise>
						</c:choose>
						    <c:if test="${r5051 == '0' }">
								<div id="505-1" class="d-flex ebed" style="padding: 16px 20px 16px 16px; margin: 0px; width:50%; margin-right: 20px; height:151px;">
								<h2>505-1<div class="admissBedPaName gray-text">빈 침상</div></h2>
							    	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px; ">
							    		<g clip-path=".url(#clip0_464_1878)">
							        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
							      		</g>
							      		<defs>
							        		<clipPath id="clip0_464_1878">
							          			<rect width="80" height="80" fill="white"/>
							        		</clipPath>
							      		</defs>
							    	</svg>
						  		</div>
						    </c:if>
					<!-- 505호 2 -->
					<c:set var="r5052" value="0" />
						<c:choose>
							<c:when test="${not empty admissionRoomList && fn:length('505-2') > 0 }">
								<c:forEach items="${admissionRoomList}" var="admissionRoom">
									<c:if test="${admissionRoom.adrmRoomno == '505' && admissionRoom.adrmBedno == '2' && admissionRoom.paNo != null}">
						                <h2 id="" style="margin-top:35px"></h2>
												<div id="${admissionRoom.admissionChartVOList[0].admiNo}" data-paNo="${admissionRoom.paNo}" data-room-number="505" data-bed-number="2" class="d-flex bed" style="padding: 16px 20px 16px 16px; margin: 0px; width:50%; margin-right: 5px; height:151px; background-color: #DBF2F4">
													<h2 class="light-green-text">505-2<div>${admissionRoom.paName}</div></h2>  
												    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px">
												    	<g clip-path=".url(#clip0_464_1878)">
												        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
												      	</g>
												      	<defs>
												        	<clipPath id="clip0_464_1878">
												          		<rect width="80" height="80" fill="white"/>
												        	</clipPath>
												      	</defs>
												    </svg>
											  	</div>
						                <c:set var="r5052" value="1" />
					            	</c:if>
					        	</c:forEach>
					       	</c:when>
					       	<c:otherwise>
					    	</c:otherwise>
						</c:choose>
					    <c:if test="${r5052 == '0' }">
						<h2 style="margin-top:35px"></h2>
							<div id="505-2" class="d-flex ebed" style="padding: 16px 20px 16px 16px; margin: 0px; width:50%; margin-right: 5px; height:151px;">
							<h2 >505-2<div class="admissBedPaName gray-text">빈 침상</div></h2>
						    	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
						    		<g clip-path=".url(#clip0_464_1878)">
						        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
						      		</g>
						      		<defs>
						        		<clipPath id="clip0_464_1878">
						          			<rect width="80" height="80" fill="white"/>
						        		</clipPath>
						      		</defs>
						    	</svg>
					  		</div>
				    	</c:if>
				    </div>
				    <div class="dduk-row">
				    <div class="d-flex" style="margin-top: 35px;"">
				    	<!-- 505호 3 -->
				    	<c:set var="r5053" value="0" />
						<c:choose>
							<c:when test="${not empty admissionRoomList && fn:length('505-3') > 0 }">
								<c:forEach items="${admissionRoomList}" var="admissionRoom">
									<c:if test="${admissionRoom.adrmRoomno == '505' && admissionRoom.adrmBedno == '3' && admissionRoom.paNo != null}">
										<div id="${admissionRoom.admissionChartVOList[0].admiNo}" data-paNo="${admissionRoom.paNo}" data-room-number="505" data-bed-number="3" class="d-flex bed" style="padding: 16px 20px 16px 16px; margin: 0px; width:50%; margin-right: 20px; height:151px; background-color: #DBF2F4">
											<h2 class="light-green-text">505-3<div>${admissionRoom.paName}</div></h2>  
										    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
										    	<g clip-path=".url(#clip0_464_1878)">
										        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
										      	</g>
										      	<defs>
										        	<clipPath id="clip0_464_1878">
										          		<rect width="80" height="80" fill="white"/>
										        	</clipPath>
										      	</defs>
										    </svg>
									  	</div>
						            <c:set var="r5053" value="1" />
					            	</c:if>
					        	</c:forEach>
					       	</c:when>
					       	<c:otherwise>
					    	</c:otherwise>
						</c:choose>
						    <c:if test="${r5053 == '0' }">
								<div id="505-3" class="d-flex ebed" style="padding: 16px 20px 16px 16px; margin: 0px; width:50%; margin-right: 20px; height:151px;">
								<h2 >505-3<div class="admissBedPaName gray-text">빈 침상</div></h2>
							    	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
							    		<g clip-path=".url(#clip0_464_1878)">
							        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
							      		</g>
							      		<defs>
							        		<clipPath id="clip0_464_1878">
							          			<rect width="80" height="80" fill="white"/>
							        		</clipPath>
							      		</defs>
							    	</svg>
						  		</div>
						    </c:if>
					<!-- 505호 4 -->
					<c:set var="r5054" value="0" />
						<c:choose>
							<c:when test="${not empty admissionRoomList && fn:length('505-4') > 0 }">
								<c:forEach items="${admissionRoomList}" var="admissionRoom">
									<c:if test="${admissionRoom.adrmRoomno == '505' && admissionRoom.adrmBedno == '4' && admissionRoom.paNo != null}">
						                <h2 id="" style="margin-top:35px"></h2>
												<div id="${admissionRoom.admissionChartVOList[0].admiNo}" data-paNo="${admissionRoom.paNo}" data-room-number="505" data-bed-number="4" class="d-flex bed" style="padding: 16px 20px 16px 16px; margin: 0px; width:50%; margin-right: 5px; height:151px; background-color: #DBF2F4">
													<h2 class="light-green-text">505-4<div>${admissionRoom.paName}</div></h2>  
												    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px">
												    	<g clip-path=".url(#clip0_464_1878)">
												        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
												      	</g>
												      	<defs>
												        	<clipPath id="clip0_464_1878">
												          		<rect width="80" height="80" fill="white"/>
												        	</clipPath>
												      	</defs>
												    </svg>
											  	</div>
						                <c:set var="r5054" value="1" />
					            	</c:if>
					        	</c:forEach>
					       	</c:when>
					       	<c:otherwise>
					    	</c:otherwise>
						</c:choose>
					    <c:if test="${r5054 == '0' }">
						<h2 style="margin-top:35px"></h2>
							<div id="505-4" class="d-flex ebed" style="padding: 16px 20px 16px 16px; margin: 0px; width:50%; margin-right: 5px; height:151px;">
							<h2 style="width:54px">505-4<div class="admissBedPaName gray-text">빈 침상</div></h2>
						    	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
						    		<g clip-path=".url(#clip0_464_1878)">
						        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
						      		</g>
						      		<defs>
						        		<clipPath id="clip0_464_1878">
						          			<rect width="80" height="80" fill="white"/>
						        		</clipPath>
						      		</defs>
						    	</svg>
					  		</div>
				    	</c:if>
				    </div>
				</div>
				<!-- 505-5 -->
				<div class="d-flex" style="margin-top: 35px;">
					<c:set var="r5055" value="0" />
						<c:choose>
							<c:when test="${not empty admissionRoomList && fn:length('505-5') > 0 }">
								<c:forEach items="${admissionRoomList}" var="admissionRoom">
									<c:if test="${admissionRoom.adrmRoomno == '505' && admissionRoom.adrmBedno == '5' && admissionRoom.paNo != null}">
										<div id="${admissionRoom.admissionChartVOList[0].admiNo}" data-paNo="${admissionRoom.paNo}" data-room-number="505" data-bed-number="5" class="d-flex bed" style="padding: 16px 20px 16px 16px; margin: 0px; width:50%; margin-right: 20px; height:151px; background-color: #DBF2F4">
											<h2 class="light-green-text">505-5<div>${admissionRoom.paName}</div></h2>  
										    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
										    	<g clip-path=".url(#clip0_464_1878)">
										        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
										      	</g>
										      	<defs>
										        	<clipPath id="clip0_464_1878">
										          		<rect width="80" height="80" fill="white"/>
										        	</clipPath>
										      	</defs>
										    </svg>
									  	</div>
						            <c:set var="r5055" value="1" />
					            	</c:if>
					        	</c:forEach>
					       	</c:when>
					       	<c:otherwise>
					    	</c:otherwise>
						</c:choose>
						    <c:if test="${r5055 == '0' }">
								<div id="505-5" class="d-flex ebed" style="padding: 16px 20px 16px 16px; margin: 0px; width:50%; margin-right: 20px; height:151px;">
								<h2 >505-5<div class="admissBedPaName gray-text">빈 침상</div></h2>
							    	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px; ">
							    		<g clip-path=".url(#clip0_464_1878)">
							        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
							      		</g>
							      		<defs>
							        		<clipPath id="clip0_464_1878">
							          			<rect width="80" height="80" fill="white"/>
							        		</clipPath>
							      		</defs>
							    	</svg>
						  		</div>
						    </c:if>
					<!-- 505호 6 -->
					<c:set var="r5056" value="0" />
						<c:choose>
							<c:when test="${not empty admissionRoomList && fn:length('505-2') > 0 }">
								<c:forEach items="${admissionRoomList}" var="admissionRoom">
									<c:if test="${admissionRoom.adrmRoomno == '505' && admissionRoom.adrmBedno == '6' && admissionRoom.paNo != null}">
						                <h2 id="" style="margin-top:35px"></h2>
												<div id="${admissionRoom.admissionChartVOList[0].admiNo}" data-paNo="${admissionRoom.paNo}" data-room-number="505" data-bed-number="6" class="d-flex bed" style="padding: 16px 20px 16px 16px; margin: 0px; width:50%; margin-right: 5px; height:151px; background-color: #DBF2F4">
													<h2 class="light-green-text">505-6<div>${admissionRoom.paName}</div></h2>  
												    <svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px">
												    	<g clip-path=".url(#clip0_464_1878)">
												        	<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
												      	</g>
												      	<defs>
												        	<clipPath id="clip0_464_1878">
												          		<rect width="80" height="80" fill="white"/>
												        	</clipPath>
												      	</defs>
												    </svg>
											  	</div>
						                <c:set var="r5056" value="1" />
					            	</c:if>
					        	</c:forEach>
					       	</c:when>
					       	<c:otherwise>
					    	</c:otherwise>
						</c:choose>
					    <c:if test="${r5056 == '0' }">
						<h2 style="margin-top:35px"></h2>
							<div id="505-6" class="d-flex ebed" style="padding: 16px 20px 16px 16px; margin: 0px; width:50%; margin-right: 5px; height:151px;">
							<h2 >505-6<div class="admissBedPaName gray-text">빈 침상</div></h2>
						    	<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:40px;">
						    		<g clip-path=".url(#clip0_464_1878)">
						        		<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#8D9EA5"/>
						      		</g>
						      		<defs>
						        		<clipPath id="clip0_464_1878">
						          			<rect width="80" height="80" fill="white"/>
						        		</clipPath>
						      		</defs>
						    	</svg>
					  		</div>
				    	</c:if>
				    </div>
				
			</div>
			</div>
			</div>
			<!-- 6인실 끝 -->
			<!-- 6인실 끝 -->
			<!-- 6인실 끝 -->
</div>
<!-- 빈 병상 모달 창 -->
<div id="admissionModal" class="modal fade" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title">입원</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form id="updateAdmiss">
					<div class="login-form-content">
						<div class="dduk-row">
							<div class="dduk-login-d">
								<div class="login-input-label">성명</div>
								<input id="admissPaName" name="admissPaName" class="dduk-login-input"
									type="text" value="" disabled />
							</div>
						</div>
						
						<div class="dduk-row">
							<div class="dduk-login-d">
								<div class="login-input-label">보호자 이름</div>
								<input id="admissPaNokNm" name="admissPaNokNm" class="dduk-login-input"
									type="text" />
							</div>
							<div class="dduk-login-d">
								<div class="login-input-label">보호자 연락처</div>
								<input id="admissPaNokPh" name="admissPaNokPh " class="dduk-login-input"
									type="text" />
							</div>
						</div>
						
						<div class="dduk-row">
							<div class="dduk-login-d" >
								<div class="login-input-label">입원실 호수</div>
								<input id="admissAdrmRoomNo" name="admissAdrmRoomNo" class="dduk-login-input"
									type="text" disabled style="width:70px;"/>
							</div>
							<div class="dduk-login-d">
								<div class="login-input-label">병상 번호</div>
								<input id="admissAdrmBedNo" name="admissAdrmBedNo " class="dduk-login-input"
									type="text" disabled style="width:70px;"/>
							</div>
						</div>
							
						<div class="dduk-row">
							<div class="dduk-login-d">
								<div class="login-input-label">입원 날짜</div>
								<input id="admissAdmiIndt" name="admissAdmiIndt" class="dduk-login-input"
									type="text" disabled />
							</div>
							<div class="dduk-login-d">
								<div class="login-input-label">퇴원 예정일</div>
								<input id="admissAdmiExpOutdt" name="admissAdmiExpOutdt " class="dduk-login-input"
									type="text" disabled />
							</div>
						</div>
						
						<div class="dduk-row">
						    <div class="dduk-login-d">
						        <div class="login-input-label" style="margin-bottom:10px;">담당의</div>
						        <div id="doctorList">
						            <c:forEach var="doc" items="${doctorVOList}">
						                <label>
						                    <input type="checkbox" class="doctorCheckbox" data-docNo="${doc.empNo}" data-docName="${doc.empName}">
						                    <span id="doctorCheckboxName">${doc.empName}</span>
						                </label>
						            </c:forEach>
						        </div>
						    </div>
						</div>
						
						<div class="dduk-row">
							<div class="d-flex">
								<label for="admiFile">
									<div type="button" class="dduk-btn-normal button-margin">입원동의서</div>
								</label>
								<input type="file" class="dduk-login-input" name="uploadFile" id="admiFile" style="display:none;" />
								<div id="fileNameOutput" style="padding: 7px 7px 7px 10px;">동의서를 등록해주세요</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="auto-complete-btn" id="autoComplete-patientCreate">
					<svg width="36" height="36" viewBox="0 0 600 600" fill="none" xmlns="http://www.w3.org/2000/svg">
						<path class="auto-complete-btn-path" d="m495.6 49.23-32.82-32.82C451.8 5.471 437.5 0 423.1 0c-14.33 0-28.66 5.469-39.6 16.41l-216 216.09c-8.4 7.5-12.7 17-15.1 27.3l-24.1 107.4c-1.8 8.9 5.1 16.8 12.8 16.8.916 0 1.852-.092 2.797-.281 0 0 74.03-15.71 107.4-23.56 10.1-2.377 19.13-7.46 26.46-14.79l217-217C517.5 106.5 517.4 71.1 495.6 49.23zM461.7 94.4l-217 217c-1.1 1.1-2.2 1.7-3.5 2-13.7 3.227-34.65 7.857-54.3 12.14l12.41-55.2c.29-1.44.99-2.84 2.09-3.84L417.5 50.4c1.9-1.99 4.1-2.4 5.6-2.4s3.715.406 5.65 2.342l32.82 32.83c3.23 3.168 3.23 8.098.13 11.228zM424 288c-13.25 0-24 10.75-24 24v128c0 13.23-10.78 24-24 24H72c-13.22 0-24-10.77-24-24V136c0-13.23 10.78-24 24-24h144c13.25 0 24-10.75 24-24s-10.7-24-24-24l-144.9-.01C32.31 63.99 0 96.29 0 135.1v304C0 479.7 32.31 512 71.1 512h303.1c39.69 0 71.1-32.3 71.1-72l2.7-128c0-13.2-10.7-24-24-24z" fill="#8d9ea5">
						</path>
					</svg>
				</button>
				<button type="button" id="SaveAdmiss" class="dduk-btn-active">입원</button>
				<button type="button" id="CancelAdmiss" class="dduk-btn-normal"
					data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
<!-- 환자있는 병상 모달 창 -->
<div id="dischargeModal" class="modal fade" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title">퇴원</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form id="updateAdmiss">
					<div class="login-form-content">
						<div class="dduk-row">
							<div class="dduk-login-d">
								<div class="login-input-label">성명</div>
								<input id="admissPaName2" name="admissPaName2" class="dduk-login-input"
									type="text" value="" disabled />
							</div>
						</div>
						
						<div class="dduk-row">
							<div class="dduk-login-d">
								<div class="login-input-label">보호자 이름</div>
								<input id="admissPaNokNm2" name="admissPaNokNm2" class="dduk-login-input"
									type="text" disabled/>
							</div>
							<div class="dduk-login-d">
								<div class="login-input-label">보호자 연락처</div>
								<input id="admissPaNokPh2" name="admissPaNokPh2" class="dduk-login-input"
									type="text" disabled/>
							</div>
						</div>
						
						<div class="dduk-row">
							<div class="dduk-login-d" >
								<div class="login-input-label">입원실 호수</div>
								<input id="admissAdrmRoomNo2" name="admissAdrmRoomNo2" class="dduk-login-input"
									type="text" disabled style="width:70px;"/>
							</div>
							<div class="dduk-login-d">
								<div class="login-input-label">병상 번호</div>
								<input id="admissAdrmBedNo2" name="admissAdrmBedNo2" class="dduk-login-input"
									type="text" disabled style="width:70px;"/>
							</div>
							<div class="dduk-login-d">
								<div class="login-input-label">담당의</div>
								<input id="admissDoctor" name="admissDoctor" class="dduk-login-input"
									type="text" disabled style="width:70px;"/>
							</div>
						</div>
							
						<div class="dduk-row">
							<div class="dduk-login-d">
								<div class="login-input-label">입원 날짜</div>
								<input id="admissAdmiIndt2" name="admissAdmiIndt2" class="dduk-login-input"
									type="text" disabled />
							</div>
							<div class="dduk-login-d">
								<div class="login-input-label">퇴원 예정일</div>
								<input id="admissAdmiExpOutdt2" name="admissAdmiExpOutdt2" class="dduk-login-input"
									type="text" disabled />
							</div>
						</div>
						
						<div class="dduk-row">
							<div class="dduk-login-d">
								<div class="login-input-label">입원사유</div>
<!-- 							<input id="admissAdmiReason" name="admissAdmiReason" class="dduk-login-input" -->
<!-- 									type="text" style="width: 250px; height: 200px"disabled /> -->
								<div class="dduck-input-admissAdmiReason admissAdmiReason-box gray-text" readonly="readonly" style="width:255px; height: 285px">
					        	<p><span class="admissAdmiReason"></span></p>
					    		</div>
							</div>
							<div class="dduk-login-d">
								<div class="login-input-label" id="">문서확인</div>
								<div class="dduk-body-border admiFile-detail">
									<div class="spa-betw"><span class="text16" style="margin-top: 3px;">입원동의서</span>
										<div id="admiFileBtn"></div>
									</div>  
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
			
			<div class="modal-footer">
				<button type="button" id="SaveDischarge" class="dduk-btn-active">퇴원</button>
				<button type="button" id="CancelDischarge" class="dduk-btn-normal"
					data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
<!-- 입원동의서 모달 시작 -->
<div id="admiFileModal" class="modal fade" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="admiFile-modal-content" style="top: 100px;">
			<div class="modal-header">
				<h1 class="modal-title paCls01">입원동의서 조회</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>

			<div class="admiFile-modal-body">
				<div id="admiFileBody">
				</div>
			</div>

			<div class="modal-footer paCls01">
<!-- 				<button type="button" class="print" onclick="printPage()"><b>출력</b></button> -->
				<button type="button" class="modal-large-btn"
					data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
<!-- 입원동의서 모달 끝 -->
</body>
</html>