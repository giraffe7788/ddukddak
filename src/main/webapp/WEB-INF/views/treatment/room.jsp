<%@page import="kr.or.dduk.vo.TreatmentOrderVO"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
$(document).ready(function() {
	$('.aside-trea-room').find('svg').find('path').attr('fill', '#0ABAB5');
	$('.aside-trea-room').find('.dduk-nav-menu').css('color', '#0ABAB5');
	
	console.log(empNo)
	
	let chkno1 = 0;//대기 환자
	let chkno2 = 0;//치료 오더
	//환자 클릭시 이벤트
	// :not() 해당 번쨰는 아니다
	// :eq(n) n번쨰 태그
	$(document).on("click", ".patient-list tbody tr", function(ss) {
		
		$('.patient-list .tr-padding').removeClass('selected');
		$(this).addClass('selected');
		
		let clinicNo = $(this).data('clinicno');
		
		chkno1 = $(this).find('td').eq(0).text()-1;
		
		let data = {
			clinicNo : clinicNo,
			paNo : $(this).data('pano')
		}
		
		$.ajax({
			url : "/treatment/selectPatient",
			data : JSON.stringify(data),
			type : 'post',
			contentType : "application/json;charset:UTF-8",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			dataType : 'json',
			success : function(result) {
				console.log(clinicNo, '로 가져온 환자VO와 진료VO : ', result);
				$("#panumber").text(result[0] && result[0].paNo ? result[0].paNo : "N/A");
				$("#paname").text(result[0].paName);
				$("#pasex").text(result[0].paSex);
				$("#paage").text(result[0].paReg);
				$("#pakey").text(result[0].paHeight);
				$("#pamon").text(result[0].paWeight);
				$("#contents").val(result[0].clinicChartVOList[0].clinicInjnm);
				$("#opinioncontent").val(result[0].clinicChartVOList[0].clinicOpinion);
				$("#opinioncontent").val(result[0].clinicChartVOList[0].clinicOpinion);
			
				// 상병 진단이 없으면
				if(result[0].clinicChartVOList[0].injuryDiagnosisVOList.length === 0){
					
					let cont = '<tr class="tr-padding tr-data"><td style="text-align:center" colspan="4" class="td-padding gray-text">진단이 없습니다</td></tr>';
					$('.injury-list-table tbody').html(cont);
					
				// 있으면
				} else {
					// 상병넣어주기
					let injuryCont = '';
					// 상병진단List의 길이만큼 반복
					$.each(result[0].clinicChartVOList[0].injuryDiagnosisVOList, function(index, vo){
						
						// 상병구분 변수
						let injuryType = '';
						if(vo.indiType === 'IDTY01'){
							injuryType = '주 상병';
						} else if(vo.indiType === 'IDTY02'){
							injuryType = '부 상병';
						} else if(vo.indiType === 'IDTY03'){
							injuryType = '배제 상병';
						}
						injuryCont += `
							<tr class="tr-padding tr-data">
								<td class="td-padding gray-text">\${injuryType}</td>
								<td class="td-padding gray-text">\${vo.injuryVO.ijNm}</td>
								<td class="td-padding gray-text">\${vo.indiDt}</td>
								<td class="td-padding gray-text">\${vo.injuryBodyCdNm}</td>
							</tr>
						`;
					});
					$('.injury-list-table tbody').html(injuryCont);
				}
				
				// 치료 오더가 없으면
				if(result[0].clinicChartVOList[0].treatmentOrderVOList.length === 0){
					
					let cont = '<tr class="tr-padding tr-data"><td style="text-align:center" colspan="4" class="td-padding gray-text">치료 오더가 없습니다</td></tr>';
					$('.order-list-table tbody').html(cont);
					
				// 있으면
				} else {
					//치료 넣어주기
					let treatmentCont = '';
					// 치료진단List의 길이만큼 반복
					$.each(result[0].clinicChartVOList[0].treatmentOrderVOList, function(index, vo){
							 console.log('vo.tmCd:', vo.tmCd);
						    console.log('vo.treatmentVO.tmCd:', vo.treatmentVO.tmCd);
						    console.log('vo.treatmentVO.tmNm:', vo.treatmentVO.tmNm);
						    console.log('vo.treatmentVO.treatmentOrderBodyCdNm:', vo.treatmentVO.treatmentOrderBodyCdNm);

						let stateBtn = '';
						if(vo.trodCont !== null){
							stateBtn = '<button class="dduk-btn-info btn-state">치료완료</button>';
						} else if(vo.treatmentOrderEmpNo !== null){
							stateBtn = '<button class="dduk-btn-info btn-state">치료중</button>';
						} else {
							stateBtn = '<button class="dduk-btn-disabled btn-state">대기중</button>';
						}
						
						treatmentCont += `
					        <tr class="tr-padding tr-data">
					            <td class="td-padding gray-text" style="width: 50px;">\${vo.tmCd}</td>
					            <td class="td-padding gray-text">\${vo.treatmentVO.tmNm}</td>
					            <td class="td-padding gray-text" style="width: 50px;">\${vo.treatmentOrderBodyCdNm}</td>
					           <td> \${stateBtn}</td>
					        </tr>
					    `;
					}); 
					$('.order-list-table tbody').html(treatmentCont);
				}
			}
		});
	});
	
	$(document).on("click", ".icon-undo", function(ss) {
		$('.treatement-office-div').html("");
		let str = `
			<div class="dduk-inner-border treatement-office 301" data-roomno="301">
			<div class='dduk-row'></div>
			<div>
				<h1>301호</h1>
				<h2 class="in-h3">이용중인 침상 : 2개</h2>				
				<h2 class="in-h3">이용가능 침상 : 2개</h2>				
			</div>
		</div>

		<div class="dduk-inner-border treatement-office 302" data-roomno="302">
			<div class='dduk-row'></div>
			<div>
				<h1>302호</h1>
				<h2 class="in-h3">이용중인 침상 : 1개</h2>				
				<h2 class="in-h3">이용가능 침상 : 3개</h2>	
			</div>
		</div>

		<div class="dduk-inner-border treatement-office 303" data-roomno="303">
			<div class='dduk-row'></div>
			<div>
				<h1>303호</h1>
				<h2 class="in-h3">이용중인 침상 : 1개</h2>				
				<h2 class="in-h3">이용가능 침상 : 3개</h2>	
			</div>
		</div>

		<div class="dduk-inner-border treatement-office 304" data-roomno="304">
			<div class='dduk-row'></div>
			<div>
				<h1>304호</h1>
				<h2 class="in-h3">이용중인 침상 : 0개</h2>				
				<h2 class="in-h3">이용가능 침상 : 4개</h2>	
			</div>
		</div>
		`;
		$('.treatement-office-div').append(str);

	});
	
	// 마지막으로 클릭한 치료실 번호
	let currentTmrmRoomNo = '';
	
	//치료실 클릭시 이벤트
	$(document).on("click", ".treatement-office", function() {
	
		let tmrmRoomNo = $(this).data('roomno');
		currentTmrmRoomNo = tmrmRoomNo;
		console.log(tmrmRoomNo);
		
		// 클릭한 치료실 정보를 불러온다
		loadTreatmentRoom(tmrmRoomNo);
	});
	
	/**이름 나이 */
	function hello(name,age){
		return name + age
	}
		hello()
	
	function loadTreatmentRoom(tmrmRoomNo){

		$('.treatement-office-div').html("");
		$('#undoRoundsChart').css('display', 'block');
		let str = `
			<div class="patient-info-div dduk-inner-border" style="height: 95%;">
				<div class="bed-list-2">
					<div class="room-grid">
							<div class="bed-wrap-2">
					        	<div class="d-flex bed-wraper" style="margin: 0;">
									<div id="\${tmrmRoomNo}-1" class="d-flex ebed bedAbled" data-roomno="\${tmrmRoomNo}" data-bedno="1">
									<div class="d-flex-column"><h2 class="roomNm">\${tmrmRoomNo}-1</h2><div class="gray-text">빈 침상</div></div>
					            		<svg xmlns="http://www.w3.org/2000/svg" width="200" height="100" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
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
					        	</div>
					        </div>
					        <div class="bed-wrap-2">
					        	<div class="d-flex bed-wraper" style="margin: 0;">
									<div id="\${tmrmRoomNo}-2" class="d-flex ebed bedAbled" data-roomno="\${tmrmRoomNo}" data-bedno="2">
									<div class="d-flex-column"><h2 class="roomNm">\${tmrmRoomNo}-2</h2><div class="gray-text">빈 침상</div></div>
					            		<svg xmlns="http://www.w3.org/2000/svg" width="200" height="100" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
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
					        	</div>
					        </div>
					        <div class="bed-wrap-2">
					        	<div class="d-flex bed-wraper" style="margin: 0;">
									<div id="\${tmrmRoomNo}-3" class="d-flex ebed bedAbled" data-roomno="\${tmrmRoomNo}" data-bedno="3">
									<div class="d-flex-column"><h2 class="roomNm">\${tmrmRoomNo}-3</h2><div class="gray-text">빈 침상</div></div>
					            		<svg xmlns="http://www.w3.org/2000/svg" width="200" height="100" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
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
					        	</div>
					        </div>
					        <div class="bed-wrap-2">
					        	<div class="d-flex bed-wraper" style="margin: 0;">
									<div id="\${tmrmRoomNo}-4" class="d-flex ebed bedAbled" data-roomno="\${tmrmRoomNo}" data-bedno="4">
									<div class="d-flex-column"><h2 class="roomNm">\${tmrmRoomNo}-4</h2><div class="gray-text">빈 침상</div></div>
					            		<svg xmlns="http://www.w3.org/2000/svg" width="200" height="100" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
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
					        	</div>
					        </div>
						</div>
					   </div>
				</div>
		`;
		$('.treatement-office-div').append(str);
			
		$.ajax({
			url : "/treatment/selectroom",
			data : JSON.stringify({ "treatmentroomNumber": tmrmRoomNo }),
			type : 'post',
			contentType : "application/json;charset=UTF-8",
			beforeSend : function(xhr) {
				xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			},
			dataType : 'json',
			success : function(result) {
				console.log("result: ", result);
				$.each(result, function(idx){
					if(result[idx].paNo != null && result[idx].paNo !== ""){
						console.log('되나?????', result[idx].paNo);
						$('.ebed').each(function(index) {
							let bedNo = $(this).data('bedno');
							if(bedNo == result[idx].tmrmBedno){
								$(this).css('background-color', '#DBF2F4');
								$(this).removeClass('bedAbled');
								 var svgElement = $(this).find('svg');
								 svgElement.find('path').attr('fill', '#0ABAB5');
								 var dflex = $(this).find('.d-flex-column');
								 dflex.find('h2').css('color', '#0ABAB5 !important');
								 dflex.find('.gray-text').html("");
								 dflex.find('.gray-text').addClass('bed-paName');
								 dflex.find('.gray-text').append(result[idx].paName);
							}
						});
					}
				});
			}
		});
	}
	
	
	$(document).on('click','.ebed', function(){
		if(!$(this).hasClass('bedAbled')){
			Swal.fire({
				title: '치료를 종료하시겠습니까?',
				icon: 'question',
				showCancelButton: true,
				confirmButtonColor: '#0ABAB5',
				cancelButtonColor: '#8D9EA5',
				confirmButtonText: '확인',
				cancelButtonText: '취소'
			}).then((result) => {
				$(this).removeClass('bedAbled');
				$(this).find('.bed-paName').text('빈 침상');
				$(this).find('path').css('fill','#8D9EA5');
				$(this).css('background-color','');
			});
		}
	});
	
	$(document).on('click','.bedAbled', function(){
		
		// 만약 선택된 치료가 없다면
		if(!$('.order-list-table .tr-data').hasClass('selected')){
			Swal.fire({
				title: '환자와 치료를 선택해주세요',
				icon: 'question',
				confirmButtonColor: '#0ABAB5',
				confirmButtonText: '확인',
			})
			
			return;
		}
		
		Swal.fire({
			title: '치료를 시작하시겠습니까?',
			icon: 'question',
			showCancelButton: true,
			confirmButtonColor: '#0ABAB5',
			cancelButtonColor: '#8D9EA5',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			// 확인버튼 클릭시
			if (result.isConfirmed) {
				$('.bedAbled').removeClass('seleted');
				$(this).addClass('seleted');
				

				//값세팅, find자식 태그들 쭉 찾아서, eq=순서, data
				let roomNo = $(this).data('roomno');
				let bedNo = $(this).data('bedno');
				let panumber = $("#panumber").text();
				let clinicNo = $('.patient-list .selected').data('clinicno');
				
				let treatmentRoomVO = {
						tmrmBedno : bedNo
						,tmrmRoomno : roomNo
						,paNo : panumber
						,tmCd : tmcd
				};
				
				let clinicChartVO = {
						'clinicNo' : clinicNo
				}
				
				let data = {
					'treatmentRoomVO' : treatmentRoomVO,
					'clinicChartVO' : clinicChartVO			
				};
				
				
				divChange = $(this);
				
				$.ajax({
					url : "/treatment/updatetre",
					data : JSON.stringify(data),
					type : 'post',
					contentType : "application/json;charset=UTF-8",
					beforeSend : function(xhr) {
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					//dataType : 'json',
					success : function(result) {
						
						if(result > 0){
							//환자가 들어가있으면 색깔 바꾸기
							divChange.find('div').eq(1).css('backgroundColor', '#dbf2f4');
							divChange.find('div').eq(1).removeClass('bedAbled');
							
							// 치료실 한번 갱신
							loadTreatmentRoom(currentTmrmRoomNo);
							
							// 환자리스트 목록에서 선택된 환자의 대기중 버튼을 치료중으로 변경
							loadTreatmentRoom(currentTmrmRoomNo);
							
							// 치료오더 목록에서 선택된 치료의 대기중 버튼을 치료중으로 변경
							loadTreatmentRoom(currentTmrmRoomNo);
							
							$('.patient-list tbody tr').eq(chkno1).find('button').text('치료중');
							$('.patient-list tbody tr').eq(chkno1).find('button').removeClass('dduk-btn-disabled btn-state');
							$('.patient-list tbody tr').eq(chkno1).find('button').addClass('dduk-btn-info btn-state');
							
							$('#order-list-table tr:eq('+chkno2+')').find('button').text('치료중');
							$('#order-list-table tr:eq('+chkno2+')').find('button').removeClass('dduk-btn-disabled btn-state');
							$('#order-list-table tr:eq('+chkno2+')').find('button').addClass('dduk-btn-info btn-state');
					        
						}
					}
				});
			}
		});
	});
				
		
	// 치료오더 클릭시 치료코드 데이터를 담을 변수
	let tmcd ; 
	
	$(document).on('click','#order-list-table tr:not(:eq(0))', function(){
		tmcd = $(this).find('td').eq(0).eq(0).text();
		
		$('#order-list-table tr:not(:eq(0))').removeClass('selected');
		$(this).addClass('selected');
		
		chkno2 = $(this).prev().length+1;
	});
		
	// div를 특정하기 위한 변수
	let divChange;
});
</script>
<style>
/* 어사이드 강조 */
.aside-ams-receipt {
	width: 196px;
	border-radius: 16px 0px 0px 16px;
	background: var(- -bg-02, #DBF2F4);
	height: 56px;
	border-right: 4px solid var(- -ci-01, #0ABAB5);
	margin-left: 4px;
	color: var(- -ci-01, #0ABAB5);
}
/* 접수 페이지 전용 시작 */
.form-check-reception {
	margin-bottom: 52px;
	display: flex;
	gap: 40px;
	/*     padding: 8px 16px; */
	margin-left: 16px;
}

.form-check-input:checked {
	background-color: #0ABAB5;
	border-color: #0ABAB5;
}

.info-input {
	height: 32px;
	margin-bottom: 45px;
	width: 180px;
}

.patient-info-div {
	margin: 0px 10px 0px 10px;
	display: flex;
}

.patient-info-left {
	text-align: right;
	width: 80px;
}

.patient-info-right {
	text-align: left;
	width: 180px;
}

.in-h2 {
	margin-bottom: 45px;
}

.patient-list {
	justify-content: normal;
}

.reception-center-div {
	height: 100%;
	width: 592px;
	margin-bottom: 8px;
	overflow-y: auto;
}

.treatement-office-wrap {
	width: 1016px;
}

.treatement-office {
	height: 350px;
	width: 250px;
	float: left;
	margin: 3px -7px 28px 40px;
	cursor: pointer;
}

.search {
	background-repeat: no-repeat;
	background-position: 372px center;
	width: 280px;
	height: 30px;
	margin-left: -10px;
}

.btn-state {
	font-size: 10.9px;
	padding: 4px 8px;
	width: 100%;
}
/* 자동 완성 창 */
.autocomplete {
	width: 400px;
	background-color: #F8F9FC;
	margin-left: 140px;
	position: absolute;
	top: 205px;
	visibility: hidden;
}

.autocomplete.active {
	visibility: visible;
}

/* 현재 선택된 검색어 */
.autocomplete>div.active {
	background: #e0e5f6;
	color: #000;
}

/* 검색 창 강조 색 */
.option:hover {
	background-color: #EDF8F9;
}
/* 접수 페이지 전용 끝 */

/* 환자 선택 시 강조 */
.selected {
	background-color: #EDF8F9;
}

.dduk-inner-borders {
	height: 100%;
	border-radius: 24px;
	border: 1px solid var(- -border, #E0E8E6);
	padding: 16px;
	background: var(- -white, #FFF);
}

.in-h2 {
	font-size: 16px !important;
}

.patient-info-div {
	flex-direction: column;
}

.rounds-chart-detail {
	width: 543px;
	height: 693px;
	background: var(- -bg-01, #F8F9FC);
	margin: 17px -17px -16px 16px;
	padding: 16px;
	border-radius: 0px 0px 24px 0px;
}

.injury-list-table {
	text-align: center;
}

.rounds-bed-list {
	width: 1016px;
}

.ebed{ 
	border-radius: 24px; 
	background: var(--BG-01, #F8F9FC); 
	padding: 36px 0px 223px 24px; 
    margin: 0px; 
    width: 100%; 
    margin-right: 20px; 
} 
.bed{ 
	border-radius: 24px; 
	background: var(--BG-01, #DBF2F4); 
} 

.bed-wraper { 
	width: 100%; 
} 

.room-grid { 
	display: grid; 
    grid-template-columns: 300px 300px; 
    row-gap: 16px; 
} 
img{
	vertical-align: middle;
    border-style: none;
    width: 3%;
    margin-left: 80%;
}

.bed-paName {
	font-size: 16px;
	color: #000000 !important;
}

.seleted {
	box-shadow: 0 0 0 3px inset #0ABAB5;
}

.ebed {
	cursor: pointer;
}
</style>
<html>
<body>
	<div class="dduk-body-border patient-list">
		<div class="dduk-title-area">
			<div>
				<h2>대기 환자</h2>
				<input type="text" id="search" class="dduck-input search"
					placeholder="환자 검색" autocomplete="off">
			</div>
			<br />
		</div>
		<!-- 		대기환자 테이블 -->
		<div class="dduk-x-pd8" style="overflow-y: scroll; height: 700px;">
			<table class="waiting" id="waiting">
				<thead>
					<tr class="tr-padding">
						<th class="td-padding gray-text" style="width: 40px;">No</th>
						<th class="td-padding gray-text paName" style="width: 80px;">이름</th>
						<th class="td-padding gray-text" style="width: 90px">치료</th>
						<th class="td-padding gray-text" style="text-align: center">상태</th>
					</tr>
				</thead>

				<tbody>
					<c:set var="totalRows" value="0" />
					<c:forEach var="patientVO" items="${patientVOList}">
						<c:forEach var="clinicChartVO"
							items="${patientVO.clinicChartVOList}">
							<c:forEach var="treatmentOrderVO"
								items="${clinicChartVO.treatmentOrderVOList}">
								<c:set var="totalRows" value="${totalRows + 1}" />
								<tr class="tr-padding" data-clinicno="${clinicChartVO.clinicNo}"
									data-paNo="${patientVO.paNo}"
									data-tmcd="${treatmentOrderVO.treatmentVO.tmCd}"
									data-bodycd="${treatmentOrderVO.bodyCd}">
									<td class="td-padding gray-text">
									${totalRows}
									</td>
									<td class="td-padding gray-text"><c:choose>
											<c:when test="${fn:length(patientVO.paName) > 5}">
											${fn:substring(patientVO.paName, 0, 5)}...
										</c:when>
											<c:otherwise>
											${patientVO.paName}
										</c:otherwise>
										</c:choose></td>
									<td class="td-padding gray-text"><c:choose>
											<c:when
												test="${fn:length(treatmentOrderVO.treatmentVO.tmNm) > 5}">
											${fn:substring(treatmentOrderVO.treatmentVO.tmNm, 0, 5)}...
										</c:when>
											<c:otherwise>
											${treatmentOrderVO.treatmentVO.tmNm}
										</c:otherwise>
										</c:choose></td>
									<td class="td-padding gray-text"><c:choose>
											<c:when test="${treatmentOrderVO.treatmentOrderEmpNo == null}">
												<button class="dduk-btn-disabled btn-state">대기중</button>
											</c:when>
											<c:otherwise>
												<button class="dduk-btn-info btn-state">치료중</button>
											</c:otherwise>
										</c:choose></td>
								</tr>
							</c:forEach>
						</c:forEach>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div>
		<div class="dduk-inner-border reception-center-div"
			id="tr-patient-info">
			<h2>환자 정보</h2>
			<div class="patient-info-div dduk-inner-border">
				<div class="dduk-row">
					<h2 class="in-h2" style="width: 50%">
						환자번호 : <span id="panumber"> </span>
					</h2>
					<br>
					<h2 class="in-h2" style="width: 50%">
						이름 :<span id="paname"></span>

					</h2>
					<h2 class="in-h2" style="width: 30%">
						성별 : <span id="pasex"></span>
					</h2>
				</div>
				<div class="dduk-row">
					<h2 class="in-h2" style="width: 30%">
						주민등록번호 : <span id="paage"></span>
					</h2>
					<h2 class="in-h2" style="width: 33%">
						키 : <span id="pakey"></span>
					</h2>
					<h2 class="in-h2" style="width: 33%">
						몸무게 : <span id="pamon"></span>
					</h2>
				</div>
			</div>
			<br>
			<h2>진단 내역</h2>
			<div class="patient-info-div dduk-inner-borders">
				<h2>진단명</h2>
				<textarea id="contents" class="dduck-input content"
					placeholder="내용이 없습니다" autocomplete="off"
					style="width: 500px; height: 10%; resize: none" readonly></textarea>
				<br>
				<h2>소견</h2>
				<textarea id="opinioncontent" class="dduck-input content"
					placeholder="내용이 없습니다" autocomplete="off"
					style="width: 500px; height: 20%; resize: none" readonly></textarea>
				<br>
				<h2>상병진단</h2>
				<table class="clinic-table injury-list-table" id="injury-list-table"
					data-type="injury">
					<thead>
						<tr class="tr-padding tr-column">
							<th class="td-padding gray-text" style="width: 33px">구분</th>
							<th class="td-padding gray-text" style="width: 125px">한글명</th>
							<th class="td-padding gray-text" style="width: 80px">발병일</th>
							<th class="td-padding gray-text" style="width: 65px">환부</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
				<br>
				<h2>치료오더</h2>
				<table class="clinic-table order-list-table" id="order-list-table"
					data-type="treatment">
					<thead>
						<tr class="tr-padding tr-column">
							<th class="td-padding gray-text" style="width: 24px">코드</th>
							<th class="td-padding gray-text" style="width: 88px">치료명</th>
							<th class="td-padding gray-text" style="width: 50px">환부</th>
							<th class="td-padding gray-text" style="width: 35px">치료여부</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="dduk-body-border treatement-office-wrap"
		style="position: relative; ">
		<div class="dduk-title-area">
			<h2>치료실 배정</h2>
			<img id="undoRoundsChart" class="icon-undo" style="display:none;" src="/resources/images/icons/undo.png">
		</div>
		<div class="treatement-office-div">
			<div class="dduk-inner-border treatement-office 301" data-roomno="301">
				<div class='dduk-row'></div>
				<div>
					<h1>301호</h1>
					<h2 class="in-h3">이용중인 침상 : 2개</h2>				
					<h2 class="in-h3">이용가능 침상 : 2개</h2>				
				</div>
			</div>

			<div class="dduk-inner-border treatement-office 302" data-roomno="302">
				<div class='dduk-row'></div>
				<div>
					<h1>302호</h1>
					<h2 class="in-h3">이용중인 침상 : 1개</h2>				
					<h2 class="in-h3">이용가능 침상 : 3개</h2>	
				</div>
			</div>

			<div class="dduk-inner-border treatement-office 303" data-roomno="303">
				<div class='dduk-row'></div>
				<div>
					<h1>303호</h1>
					<h2 class="in-h3">이용중인 침상 : 1개</h2>				
					<h2 class="in-h3">이용가능 침상 : 3개</h2>	
				</div>
			</div>

			<div class="dduk-inner-border treatement-office 304" data-roomno="304">
				<div class='dduk-row'></div>
				<div>
					<h1>304호</h1>
					<h2 class="in-h3">이용중인 침상 : 1개</h2>				
					<h2 class="in-h3">이용가능 침상 : 3개</h2>	
				</div>
			</div>
		</div>
		</div>
	<!-- 	치료실 배정 하기전 껍데기 끝 -->
	
	<!-- 치료실 병동 표시	301 -->
	<div class="dduk-body-border rounds-bed-list bed301" style="display:none">
			<h2>치료실 배정
			</h2>
		<div class="patient-info-div dduk-inner-border" style="height: 95%;">
			<div class="bed-list-2">
				<div class="room-grid">
						<div class="bed-wrap-2">
				        	<div class="d-flex bed-wraper" style="margin: 0;">
								<div id="304-1" class="d-flex ebed">
								<div class="d-flex-column"><h2>301-1</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="200" height="100" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
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
				        	</div>
				        </div>
				        <div class="bed-wrap-2">
				        	<div class="d-flex bed-wraper" style="margin: 0;">
								<div id="304-2" class="d-flex ebed" >
								<div class="d-flex-column"><h2>301-2</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="200" height="100" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
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
				        	</div>
				        </div>
				        <div class="bed-wrap-2">
				        	<div class="d-flex bed-wraper" style="margin: 0;">
								<div id="304-3" class="d-flex ebed" >
								<div class="d-flex-column"><h2>301-3</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="200" height="100" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
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
				        	</div>
				        </div>
				        <div class="bed-wrap-2">
				        	<div class="d-flex bed-wraper" style="margin: 0;">
								<div id="304-4" class="d-flex ebed">
								<div class="d-flex-column"><h2>301-4</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="200" height="100" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
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
				        	</div>
				        </div>
				</div>
				   </div>
			</div>
		</div>
		<!-- 치료실 병동 표시	302 -->
		<div class="dduk-body-border rounds-bed-list bed302" style="display:none">
			<h2>치료실 배정
			<img id="undoRoundsChart" class="icon-undo" src="/resources/images/icons/undo.png"></h2>
		<div class="patient-info-div dduk-inner-border" style="height: 95%;">
			<div class="bed-list-2">
				<div class="room-grid">
						<div class="bed-wrap-2">
				        	<div class="d-flex bed-wraper" style="margin: 0;">
								<div id="304-1" class="d-flex ebed">
								<div class="d-flex-column"><h2>302-1</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="200" height="100" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
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
				        	</div>
				        </div>
				        <div class="bed-wrap-2">
				        	<div class="d-flex bed-wraper" style="margin: 0;">
								<div id="304-2" class="d-flex ebed" >
								<div class="d-flex-column"><h2>302-2</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="200" height="100" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
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
				        	</div>
				        </div>
				        <div class="bed-wrap-2">
				        	<div class="d-flex bed-wraper" style="margin: 0;">
								<div id="304-3" class="d-flex ebed" >
								<div class="d-flex-column"><h2>302-3</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="200" height="100" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
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
				        	</div>
				        </div>
				        <div class="bed-wrap-2">
				        	<div class="d-flex bed-wraper" style="margin: 0;">
								<div id="304-4" class="d-flex ebed">
								<div class="d-flex-column"><h2>302-4</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="200" height="100" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
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
				        	</div>
				        </div>
				</div>
				   </div>
			</div>
		</div>
		<!-- 치료실 병동 표시	303 -->
		<div class="dduk-body-border rounds-bed-list bed303" style="display:none">
			<h2>치료실 배정
			<img id="undoRoundsChart" class="icon-undo" src="/resources/images/icons/undo.png"></h2>
		<div class="patient-info-div dduk-inner-border" style="height: 95%;">
			<div class="bed-list-2">
				<div class="room-grid">
						<div class="bed-wrap-2">
				        	<div class="d-flex bed-wraper" style="margin: 0;">
								<div id="304-1" class="d-flex ebed">
								<div class="d-flex-column"><h2>303-1</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="200" height="100" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
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
				        	</div>
				        </div>
				        <div class="bed-wrap-2">
				        	<div class="d-flex bed-wraper" style="margin: 0;">
								<div id="304-2" class="d-flex ebed" >
								<div class="d-flex-column"><h2>303-2</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="200" height="100" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
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
				        	</div>
				        </div>
				        <div class="bed-wrap-2">
				        	<div class="d-flex bed-wraper" style="margin: 0;">
								<div id="304-3" class="d-flex ebed" >
								<div class="d-flex-column"><h2>303-3</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="200" height="100" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
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
				        	</div>
				        </div>
				        <div class="bed-wrap-2">
				        	<div class="d-flex bed-wraper" style="margin: 0;">
								<div id="304-4" class="d-flex ebed">
								<div class="d-flex-column"><h2>303-4</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="200" height="100" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
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
				        	</div>
				        </div>
				</div>
				   </div>
			</div>
		</div>
		<!-- 치료실 병동 표시	304 -->
		<div class="dduk-body-border rounds-bed-list bed304" style="display:none">
			<h2>치료실 배정
			<img id="undoRoundsChart" class="icon-undo" src="/resources/images/icons/undo.png"></h2>
		<div class="patient-info-div dduk-inner-border" style="height: 95%;">
			<div class="bed-list-2">
				<div class="room-grid">
						<div class="bed-wrap-2">
				        	<div class="d-flex bed-wraper" style="margin: 0;">
								<div id="304-1" class="d-flex ebed">
								<div class="d-flex-column"><h2>304-1</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="200" height="100" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
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
				        	</div>
				        </div>
				        <div class="bed-wrap-2">
				        	<div class="d-flex bed-wraper" style="margin: 0;">
								<div id="304-2" class="d-flex ebed" >
								<div class="d-flex-column"><h2>304-2</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="200" height="100" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
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
				        	</div>
				        </div>
				        <div class="bed-wrap-2">
				        	<div class="d-flex bed-wraper" style="margin: 0;">
								<div id="304-3" class="d-flex ebed" >
								<div class="d-flex-column"><h2>304-3</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="200" height="100" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
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
				        	</div>
				        </div>
				        <div class="bed-wrap-2">
				        	<div class="d-flex bed-wraper" style="margin: 0;">
								<div id="304-4" class="d-flex ebed">
								<div class="d-flex-column"><h2>304-4</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="200" height="100" viewBox="0 0 80 80" fill="none" style="margin-left: auto;">
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
				        	</div>
				          </div>
					</div>
				 </div>
			</div>
		</div>
			
<!-- 치료실 병동 표시	 끝-->

	<!-- 모달 임포트 -->
	<c:import url="../common/modal.jsp"></c:import>

</body>
</html>