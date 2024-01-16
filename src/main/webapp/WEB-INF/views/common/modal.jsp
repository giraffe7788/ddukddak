<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"  %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 환자 추가 모달 시작 -->
<style>
/* 모달 시작 */

#complete4 {
	position: absolute;
    bottom: 152px;
	left: 105px;
}

.modal-content {
    border-radius: 32px;
    border: 1px solid var(--border, #EBEFF0);
    background: var(--white, #FFF);
    width: auto;
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
	padding: 48px; 
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
/* 진단, 오더 모달 설정 */
.order-header {
	padding: 40px 32px 0px 31px !important;
}

.order-body {
	padding: 0px 0px 48px 48px !important;
}

.order-footer {
	padding: 0px 40px 32px 32px !important;
}

.order-arrow {
	position: absolute;
    margin: 3.8% 0% 0% -5%;
    width: 16px;
}

#searchOrder {
    width: 590px;
}

.footer-button {
	display: flex;
	width: 100px;
	padding: 8px 16px;
	justify-content: center;
	align-items: center;
	gap: 4px;
	border-radius: 12px;
	background: var(--black-01, #323537);
	font-size: 18px;
}

#btnUpdateStart, #btnUpdatePatient, #btnUpdateCancle, .modal-btn-size {
	display: flex !important;
	width: 100px !important;
	padding: 8px 16px !important;
	justify-content: center;
	align-items: center !important;
	gap: 4px !important;
	border-radius: 12px !important;
	font-size: 18px !important;
}
/* 진단, 오더 모달 설정 끝 */

/* 환부코드 선택 모달 css 시작 */
/* 환부코드 몸통 사진 조정 */
#BodyStock {
	margin-left: 190px;		
}
/* 환부코드 radio 조정 */
.body-code-wrap {
	position: absolute;
	color: #000;
}
.AACD01-wrap {
	margin: -535px 255px;
}
.AACD02-wrap {
	margin: -456px 238px;
}
.AACD03-wrap {
	margin: -370px 268px;
}
.AACD04-wrap {
	margin: -449px 336px;
    width: 50px;
}
.AACD05-wrap {
	margin: -410px 254px;
}
.AACD06-wrap {
	margin: -329px 254px;
}
.AACD07-wrap {
	margin: -263px 236px;
}
.AACD08-wrap {
	margin: -302px 199px;
}
.AACD09-wrap {
	margin: -265px 381px;
    width: 50px;
}
.AACD10-wrap {
	margin: -273px 287px;
}
.AACD11-wrap {
	margin: -154px 328px;
	width: 50px;
}
.AACD12-wrap {
	margin: -194px 205px;
}
/* 환부코드 선택 모달 css 종료 */


/* 사원 수정 모달 설정 시작 */
/* 수정하기 버튼 */
.sub-btn {
	display: flex;
	width: 100px;
	padding: 8px 16px;
	align-items: right;
	gap: 4px;
	border-radius: 12px;
}

#insertPrescription {
	position: absolute;
	top: 280px;
    left: 240px;
}

#insertCertificate {
	position: absolute;
	top: 178px;
    left: 220px;
}

#insertReferral{
	position: absolute;
	top: 180px;
    left: 240px;
}

.checkB{
	border: 1px dotted red;
}

.none {
	display: none !important;
}
.sub-btn:hover {
	background: var(--black-01, #323537);
}
/* 사원 수정 모달 설정 끝 */
.isAllDay-container {
	flex-direction: row-reverse;
	justify-content: center;
}
/* 환자 입원 진단 */
#admissionReason{
	width: 90%;
	height: 150px;
	resize: none;
}

.order-detail-ppt {
	display: flex;
    padding: 12px 16px;
    flex-direction: column;
    justify-content: center;
    align-items: flex-start;
    gap: 4px;
    border-radius: 12px;
    background: var(--bg-01, #F8F9FC);
    width: 497px;
    height: auto;
    margin-bottom: 16px;
}

* {
    font-family: 'Pretendard6';
    font-size: 14px;
}

.presMedi{
	margin: 102px 0px 0px -110px;
    display: flex;
    flex-direction: column;
    gap: 3px;
}

.presMediNm {
	width: 344px;
}

.presMediDose{
	width: 66px;
}

.presMediPer {
	width: 56px;
}

.presMediInjection {
	display: flex;
    flex-direction: column;
    gap: 3px;
    margin-left: -110px;
}

.modal-large-btn{
	display: flex;
	width: 100px;
	padding: 8px 16px;
	justify-content: center;
	align-items: center;
	gap: 4px;
	border-radius: 12px;
	background: var(--Black-01, #323537);
	color: var(--white, #FFF);
	/* Title/Small */
	font-family: 'Pretendard6';
	font-size: 18px;
	font-style: normal;
	line-height: 32px;
}

#btnUpdatePw {
	width: 20%;
    font-size: 12px;
    height: 25px;
    margin-top: -1px;
}

#empPw {
	background-color: #D5D9DB;
}
#pwConfirm {
	background-color: #D5D9DB;
}

#empPwHrd {
	background-color: #D5D9DB;
}
#pwConfirmHrd {
	background-color: #D5D9DB;
}
/* 모달 끝 */
</style>
<!-- <script type="text/javascript" src="/resources/ckeditor/ckeditor.js"></script> -->
<script src="https://cdn.ckeditor.com/ckeditor5/40.1.0/classic/ckeditor.js"></script>
<!-- 환자 추가 모달 -->
<div id="createPatientModal" class="modal fade" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog" style="width: 800px;">
		<div class="modal-content" style="margin-top: 50px; width: 800px;">
			<div class="modal-header">
				<h1 class="modal-title">환자 등록</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body" style="margin: auto;">
				<form id="createPatient">
					<div class="login-form-content">
						<div class="dduk-row">
							<div class="dduk-login-d">
								<div class="login-input-label">성명</div>
								<input id="paNameC" name="paName" class="dduk-login-input"
									type="text" required />
							</div>
							<div class="dduk-login-d">
								<div class="login-input-label">성별</div>
								<div class="form-check" role="group">
									<span> <input type="radio" id="paSex1" name="paSex"
										class="form-check-input" value="남" required /> <label
										for="paSex1">남성</label>
									</span> <span> <input type="radio" id="paSex2" name="paSex"
										class="form-check-input" value="여" required /> <label
										for="paSex2">여성</label>
									</span>
								</div>
							</div>
						</div>
						<div class="dduk-login-d">
							<div class="login-input-label">주민번호</div>
							<input id="paReg" name="paReg" class="dduk-login-input"
								type="text" style="width: 584px;" required />
						</div>

						<div style="margin: 12px 0px;">
							<div class="dduk-row">
								<div class="dduk-login-d" style="margin-bottom: 0px;">
									<div class="login-input-label">주소</div>
									<div class="d-flex" style="align-items: baseline">
										<input type="text" id="pzZip" name="pzZip"
											class="dduk-login-input" style="width: 203px;" required />
										<button type="button" class="dduk-btn-nomal search-btn"
											id="btnPostForPatient">우편번호 찾기</button>
									</div>
								</div>
							</div>
							<div class="dduk-row">
								<div class="dduk-login-d">
									<input id="paAdd1" name="paAdd1" class="dduk-login-input"
										type="text" required />
								</div>
								<div class="dduk-login-d">
									<input id="paAdd2" name="paAdd2" class="dduk-login-input"
										type="text" placeholder="상세주소" required />
								</div>
							</div>
						</div>

						<div class="dduk-row">
							<div class="dduk-login-d">
								<div class="login-input-label">키</div>
								<input id="paHeightC" name="paHeight" class="dduk-login-input"
									type="text" required />
							</div>
							<div class="dduk-login-d">
								<div class="login-input-label">몸무게</div>
								<input id="paWeightC" name="paWeight" class="dduk-login-input"
									type="text" required />
							</div>
						</div>

						<div class="dduk-row">
							<div class="dduk-login-d">
								<div class="login-input-label">연락처</div>
								<input id="paPh" name="paPh" class="dduk-login-input"
									type="text" required />
							</div>
							<div class="dduk-login-d">
								<div class="login-input-label">혈액형</div>
								<div class="form-check" role="group">
									<span> <input type="radio" id="paBldType1"
										name="paBldType" class="form-check-input" value="A" required />
										<label for="paBldType1">A</label>
									</span> <span> <input type="radio" id="paBldType2"
										name="paBldType" class="form-check-input" value="B" required />
										<label for="paBldType2">B</label>
									</span> <span> <input type="radio" id="paBldType3"
										name="paBldType" class="form-check-input" value="AB" required />
										<label for="paBldType3">AB</label>
									</span> <span> <input type="radio" id="paBldType4"
										name="paBldType" class="form-check-input" value="O" required />
										<label for="paBldType4">O</label>
									</span>
								</div>
							</div>
						</div>

						<div class="dduk-row">
							<div class="dduk-login-d">
								<div class="login-input-label">보험 여부</div>
								<div class="form-check" role="group">
									<span> <input type="radio" id="paInsrYn1"
										name="paInsrYn" class="form-check-input" value="ISYN01"
										required /> <label for="paInsrYn1">O</label>
									</span> <span> <input type="radio" id="paInsrYn2"
										name="paInsrYn" class="form-check-input" value="ISYN02"
										required /> <label for="paInsrYn2">X</label>
									</span>
								</div>
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
				<button type="button" id="btnAddPatient" class="dduk-btn-active modal-btn-size">저장</button>
				<button type="button" class="dduk-btn-normal modal-btn-size"
					data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
<!-- 	환자 추가 모달 끝 -->

<!-- 환자 상세 모달 -->
<div id="detailPatientModal" class="modal fade" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog" style="margin-top: 50px; width: 800px;">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title">환자 상세</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body absolute-center">
				<form id="updatePatient">
					<div class="login-form-content">
						<div class="dduk-row">
							<div class="dduk-login-d">
								<div class="login-input-label">성명</div>
								<input id="paName2" name="paName" class="dduk-login-input"
									type="text" value="" disabled />
							</div>
							<div class="dduk-login-d">
								<div class="login-input-label">성별</div>
								<div class="form-check" role="group">
									<span> 
										<input type="radio" id="paSex12" name="paSex"
										class="form-check-input" value="남" disabled /> <label
										for="paSex1">남성</label>
									</span> 
									<span> 
										<input type="radio" id="paSex22" name="paSex"
										class="form-check-input" value="여" disabled /> <label
										for="paSex2">여성</label>
									</span>
								</div>
							</div>
						</div>
						<div class="dduk-login-d">
							<div class="login-input-label">주민번호</div>
							<input id="paReg2" name="paReg" class="dduk-login-input"
								type="text" style="width: 584px;" disabled />
						</div>

						<div style="margin: 12px 0px;">
							<div class="dduk-row">
								<div class="dduk-login-d" style="margin-bottom: 0px;">
									<div class="login-input-label">주소</div>
									<div class="d-flex" style="align-items: baseline">
										<input type="text" id="pzZip2" name="pzZip"
											class="dduk-login-input" style="width: 203px;" disabled />
										<button type="button" class="dduk-btn-nomal search-btn"
											id="btnPost2">우편번호 찾기</button>
									</div>
								</div>
							</div>
							<div class="dduk-row">
								<div class="dduk-login-d">
									<input id="paAdd12" name="paAdd1" class="dduk-login-input"
										type="text" disabled />
								</div>
								<div class="dduk-login-d">
									<input id="paAdd22" name="paAdd2" class="dduk-login-input"
										type="text" disabled />
								</div>
							</div>
						</div>

						<div class="dduk-row">
							<div class="dduk-login-d">
								<div class="login-input-label">키</div>
								<input id="paHeight2" name="paHeight" class="dduk-login-input"
									type="text" disabled />
							</div>
							<div class="dduk-login-d">
								<div class="login-input-label">몸무게</div>
								<input id="paWeight2" name="paWeight" class="dduk-login-input"
									type="text" disabled />
							</div>
						</div>

						<div class="dduk-row">
							<div class="dduk-login-d">
								<div class="login-input-label">연락처</div>
								<input id="paPh2" name="paPh" class="dduk-login-input"
									type="text" disabled />
							</div>
							<div class="dduk-login-d">
								<div class="login-input-label">혈액형</div>
								<div class="form-check" role="group">
									<span> <input type="radio" id="paBldType12"
										name="paBldType" class="form-check-input" value="A" disabled />
										<label for="paBldType1">A</label>
									</span> <span> <input type="radio" id="paBldType22"
										name="paBldType" class="form-check-input" value="B" disabled />
										<label for="paBldType2">B</label>
									</span> <span> <input type="radio" id="paBldType32"
										name="paBldType" class="form-check-input" value="AB" disabled />
										<label for="paBldType3">AB</label>
									</span> <span> <input type="radio" id="paBldType42"
										name="paBldType" class="form-check-input" value="O" disabled />
										<label for="paBldType4">O</label>
									</span>
								</div>
							</div>
						</div>

						<div class="dduk-row">
							<div class="dduk-login-d">
								<div class="login-input-label">보험 여부</div>
								<div class="form-check" role="group">
									<span> <input type="radio" id="paInsrYn12"
										name="paInsrYn" class="form-check-input" value="ISYN01"
										disabled /> <label for="paInsrYn1">O</label>
									</span> <span> <input type="radio" id="paInsrYn22"
										name="paInsrYn" class="form-check-input" value="ISYN02"
										disabled /> <label for="paInsrYn2">X</label>
									</span>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>

			<div class="modal-footer updateBtnSet1">
				<button type="button" id="btnUpdateStart" class="dduk-btn-active">수정</button>
				<button type="button" id="btnUpdateCancle" class="dduk-btn-normal"
					data-bs-dismiss="modal">삭제</button>
			</div>
			
			<div class="modal-footer updateBtnSet2" style="display: none;">
				<button type="button" id="btnUpdatePatient" class="dduk-btn-active">저장</button>
				<button type="button" class="dduk-btn-normal updateCancle">취소</button>
			</div>
			
		</div>
	</div>
</div>
<!-- 	환자 상세 모달 끝 -->

<!-- 제증명 신청 모달 시작 -->
<div id="createProofApplicationModal" class="modal fade" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="top: 300px;">
			<div class="modal-header">
				<h1 class="modal-title paCls01">제증명 신청</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>

			<div class="modal-body">
				<h2>신청하시겠습니까?</h2>
			</div>

			<div class="modal-footer paCls01">
				<button type="button" id="createProofApplicationBtn" class="dduk-btn-active">신청</button>
				<button type="button" class="dduk-btn-normal"
					data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
<!-- 	제증명 신청 모달 끝 -->

<!-- 제증명 작성 모달 시작 -->
<div id="writeProof" class="modal fade" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="width: 920px; margin-top: 50px;">
			<div class="modal-header">
				<h1 class="modal-title paCls01">제증명 작성</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			
			<div class="modal-body proofBody" id="proofContent">
				<!--처방전 -->
				<div id="prescription" class='w-100 none'>
					<img class="d-flex" src="/resources/images/page_1_처방전.jpg" style="width:840px; margin: auto;">
					<div id="insertPrescription">
						<div class="insertPrapNo" id="presPrapNo" style="display:none;"></div>
						<div id="presPrdcCd" style="display:none;"></div>
						<div style="display: flex; gap: 150px;">
							<div style="display: flex; gap: 15px; flex-direction: column;">
								<span class="checkB" style="width: 200px; height: 30px;">
									<span id="presYear"></span><span id="presMonth"></span><span id="presDay"></span>
								</span>
								<span id="presPaName" style="width: 200px">
								 환자이름
								</span>
								<span id="presPaReg" style="width: 200px">
								 주민등록번호
								</span>
							</div>
							<div style="display: flex; gap: 4px; flex-direction: column;">
								<span style="width: 200px; height: 27px;">
								 뚝딱정형외과
								</span>
								<span style="width: 200px">
								 042-222-8202 
								</span>
								<span style="width: 200px">
								 070-8768-2972
								</span>
								<span style="width: 200px">
								 ody0225@naver.com
								</span>
							</div>
						</div>
						<div class="d-flex" style="margin-left: -78px;">
							<div style="display: flex; margin-top: 16px; gap: 16px; flex-direction: column;">
								<div style="display: flex; gap: 13px;">
									<span>H</span><span>2</span><span>0</span><span>8</span>
								</div>
								<div style="display: flex; gap: 13px;">
									<span>H</span><span>4</span><span>0</span><span>4</span><span>2</span>
								</div>
							</div>
							<div>
								<img src="/resources/images/Seal_of_Goryeo.png" style="width: 60px; margin-top: 14px; margin-left: 200px;">
							</div>
							<div style="display: flex; flex-direction: column; margin-top: 14px; margin-left: 190px; gap: 20px;">
								<div>의사</div>
								<div style="font-size: 10px;">231114-0851</div>
							</div>
						</div>
						<div class="presMedi">	
							
						</div>
						<div style="margin: 2px 0px 0px 170px; ">
							 <input type="checkbox" name="exampleCheckbox">
							 <input type="checkbox" name="exampleCheckbox" style="margin-left: 72px; margin-top: 172px;">
						</div>
						
						<div class="presMediInjection">	
							<div>주사예용</div>
						</div>
						
						<input type="text" style="border: 0px solid; background-color: transparent; width: 50px; margin-left: 40px; margin-top: 75px;" required/>
						
					</div>
				</div>
				
				<!--진단서-->
				<div id="certificate" class='w-100 none'>
					<img class="d-flex" src="/resources/images/page_1_진단서.jpg" style="width:840px; margin: auto;">
					<div id="insertCertificate">
						<div class="insertPrapNo" id="certPrapNo" style="display:none;"></div>
						<div id="certPrdcCd" style="display:none;"></div>
						<input type="text" id="certClinicNo" style="display: none;">
						<div style="display: flex; gap: 140px;">
							<div id="certEmpNm" style="width: 100px; height: 25px;">당당의</div>
							<div class="certPaReg" style="height: 25px;"></div>
						</div>
						
						<div style="display: flex; gap: 200px; margin-top: 35px; margin-left: 50px;">
							<div id="certPaName" style="width: 100px; height: 25px;"></div>
							<div class="certPaReg" style="height: 25px;"></div>
						</div>
						
						<div style="margin-top: 15px; margin-left: 50px;">
							<div id="certPaAddr" style="height: 25px;"></div>
						</div>
						
						<div style="margin-top: 45px; margin-left: 50px;">
							<div id="certClinicInjnm" style="height: 25px;"></div>
						</div>
						
						<div style="display: flex; gap: 94px; margin-top: 70px; margin-left: 50px;">
							<div id="certIndiDt" style="width: 200px; height: 25px;"></div>
							<div id="certClinicDt" style="height: 25px;"></div>
						</div>
						
						<div style="margin: 20px 0px 0px 44px;">
							<textarea rows="7" cols="61" style=" padding: 7px 8px;"></textarea>
						</div>
						
						<div style="display: flex; gap: 84px; margin-top:4px; margin-left: 50px;">
							<input type="text" style="border: 0px solid; width: 264px;">
							<input type="text" style="border: 0px solid; width: 164px;">
						</div>
						<div id="certDate" style="margin-top: 100px; margin-left: 80px;"></div>
					</div>
				</div>
				
				<!--소견서 -->
				<div id="referral" class='w-100 none'>
					<img class="d-flex" src="/resources/images/page_1_소견서.jpg" style="width:840px; margin: auto;">
					<div id="insertReferral">
						<div class="insertPrapNo" id="refPrapNo" style="display:none;"></div>
						<div id="refPrdcCd" style="display:none;"></div>
						<input type="text" id="refClinicNo" style="display: none;">
						<div class="d-flex">
							<div id="refEmpNm" style="width: 70px;">거 잘 나옴니까?</div>
							<div class="refPaReg" style="margin-left: 174px; background-color: #ffffff; height: 17px;">아 이게 안되네</div>
							<img src="/resources/images/Seal_of_Goryeo.png" style="width: 60px; height: 60px; margin-top: -50px; margin-left: 90px;">
						</div>
						<div class="d-flex" style="gap: 100px; margin-left: 30px; margin-top: 32px;">
							<div id="refPaName">이름</div>
							<div id="refPaSex" style="margin-left: 52px;">성별</div>
							<div id="refPaBirth">생년월일</div>
							<div id="refPaAge" style="margin-left: -20px;">연령</div>
						</div>
						<div class="d-flex" style="margin-top: 24px; margin-left: 30px; gap: 265px;">
							<div id="refPaAddr">주소</div>
							<div id="refPaPh">연락처</div>
						</div>
						<div id="refClinicOpinion" style="margin-top: 20px; margin-left: 30px; width: 500px; height: 200px; word-break: keep-all;">
							들어오나~~~???
						</div>
						<div class="d-flex" style="margin: 14px 0px 0px 24px;">
							<textarea style="width: 275px; height: 207px;"></textarea>
							<textarea style="margin-left:73px; width: 175px; height: 207px;"></textarea>
						</div>
						<div style="margin-left: 80px; margin-top: 52px; display: flex; gap: 44px;">
							<span id="refYear"></span><span id="refMonth"></span> <span id="refDay"></span>
						</div>
					</div>
				</div>
			</div>
			
			<div class="modal-footer paCls01">
				<button type="button" id="btnUpdateProof" class="dduk-btn-active" data-bs-dismiss="modal">완료</button>
				<button type="button" class="dduk-btn-normal"
					data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
<!-- 	제증명 작성 모달 끝 -->

<!-- 제증명 발급 모달 시작 -->
<div id="releaseProofApplicationModal" class="modal fade" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="top: 100px;">
			<div class="modal-header">
				<h1 class="modal-title paCls01">제증명 발급</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>

			<div class="modal-body">
				<div id="releaseProofBody" style="height: 950px;">
				</div>
			</div>

			<div class="modal-footer paCls01">
				<button type="button" class="modal-large-btn"
					data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
<!-- 	제증명 발급 모달 끝 -->

<!-- 	환자 접수 모달 시작	 -->
<div id="createReceptionModal" class="modal fade" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title">환자 접수</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="login-form-content">
					<div class="dduk-row">
						<div class="dduk-login-d">
							<div class="login-input-label">담당의</div>
							<select id="doctorList">
							    <c:forEach var="doc" items="${doctorVOList}">
							        <c:forEach var="docOffice" items="${docOfficeVOList}">
							            <c:if test="${doc.empNo == docOffice.empNo}">
							                <option data-docNo="${doc.empNo}">${doc.empName}</option>
							            </c:if>
							        </c:forEach>
							    </c:forEach>
							</select>
						</div>
						<div class="dduk-login-d">
							<div class="login-input-label">내원 사유</div>
							<textarea id="reasonForVisit" rows="10" cols="56"></textarea>
						</div>
					</div>
				</div>
			</div>

			<div class="modal-footer">
				<button type="button" id="btnSaveReception" class="dduk-btn-active">저장</button>
				<button type="button" class="dduk-btn-normal"
					data-bs-dismiss="modal">취소</button>
			</div>
			
		</div>
	</div>
</div>
<!-- 	환자 접수 모달 끝 -->

<!-- 환자 예약 모달 시작 -->
<div id="createReservationModal" class="modal fade" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog" style="max-width: 680px; margin: auto;">
		<div class="modal-content" style="top: 100px;">
			<div class="modal-header">
				<h1 class="modal-title paCls01">진료 예약</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>

			<div class="modal-body">
				<input style="display:none;" id="reservPaNo" name="paNo" />
				<input style="display:none;" id="reservRsvtTime" name="rsvtTime" />
				<input style="display:none;" id="reservEmpNo" name="empNo" />
				
				<div class="flex-d-col gap-32">
					<div>
						<label>예약 일시</label>
						<div class="spa-betw">
							<input class="dduck-input" type="date" id="reservRsvtDt" name="rsvtDt" style="width: 220px;"/>
							<div>
								<input class="dduck-input" type="text" id="reservDsStrTime" style="width: 150px;"/>-
								<input class="dduck-input" type="text" id="reservDsEndTime" style="width: 150px;"/>
							</div>
						</div>
					</div>
					
					<div class="spa-betw">
						<div>
							<label>이름</label>
							<input class="dduck-input" type="text" id="reservPaName" name="paName"/>
						</div>
						
						<div>
							<label>담당의</label>
							<input class="dduck-input" type="text" id="reservEmpName" name="empName"/>
						</div>				
					</div>
					
					<div>
						<label>예약 사유</label><br/>
						<textarea class="dduck-input" id="reservrsvtReason" name="rsvtReason" style="width: 100%; height: 160px;"></textarea>
					</div>				
				</div>
				
			</div>

			<div class="modal-footer paCls01">
				<button type="button" id="createReservationSubmitBtn" class="modal-large-btn" data-bs-dismiss="modal">예약</button>
			</div>
		</div>
	</div>
</div>
<!-- 환자 예약 모달 끝 -->

<!-- 오더세트 추가 모달 시작 -->
<div id="createOrdersetModal" class="modal fade" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title">오더세트 추가</h1>
			</div>
			<div id="createOrdersetBody" class="modal-body">
				<form id="createOrderSet">
					<div class="login-form-content">
						<div class="dduk-row">
							<div class="dduk-login-d">
								<div class="login-input-label">오더세트 유형</div>
								<div role="group">
									<span> 
										<select class="order-select" id="ordersetType" name="ordersetType">
											<option data-type="orderset">오더세트</option>
											<option data-type="order">오더</option>
										</select>
									</span>
								</div>
							</div>
							<div class="dduk-login-d">
								<div class="login-input-label">오더세트이름</div>
								<input id="ordersetName" name="ordersetName" class="dduk-login-input" type="text" required />
							</div>
					
					
						</div>
						<div class="addOrderset-body">
						</div>
					</div>
				</form>
			</div>

			<div class="modal-footer">
				<button type="button" id="btnAddOrderset" class="dduk-btn-active">저장</button>
				<button type="button" id="btnCancelOrderset" class="dduk-btn-normal"
					data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
<!-- 오더세트 추가 모달 끝 -->

<!-- 상병진단, 오더추가 모달 시작  -->
<div id="createOrderModal" class="modal fade" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title order-title">#</h1>
			</div>
			<div class="modal-body order-body">
				<div class="login-form-content">
					<div class="dduk-row">
						<div class="input-search-wrap">
							<div id="orderSearch" class="input-search">
								<input type="text" id="searchOrder" class="input-search-value" autocomplete="off" />
								<img src="/resources/images/icons/arrow.png" class="order-arrow"/>
							</div>
							<table class="order-search" border="1">
								<tbody class="order-body-search">
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<div class="modal-footer order-footer">
				<button type="button" id="#" class="dduk-btn-active btn-save-create-order">저장</button>
				<button type="button" id="btnCancelCreateOrder" class="dduk-btn-normal"
					data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
<!-- 상병진단, 오더추가 모달 끝 -->

<!-- 환부선택 모달 시작 -->
<div id="bodyCdModal" class="modal fade" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title">환부 선택</h1>
			</div>
			<div class="modal-body">
				<div class="login-form-content">
					<div class="dduk-row">
						<img id="BodyStock" src="/resources/images/Body.png" alt="body.png"/>
					</div>
					<div class="body-code-radio-wrap">
						<div class="AACD01-wrap body-code-wrap">
							<label for="AACD01">머리</label>
                 			<input type="radio" name="BodyCodeRadio" id="AACD01" data-bodyname="머리" data-bodycode="AACD01" />
                 		</div>
                 		<div class="AACD02-wrap body-code-wrap">
                 			<label for="AACD02">목</label>
                 			<input type="radio" name="BodyCodeRadio" id="AACD02" data-bodyname="목" data-bodycode="AACD02" />
                 		</div>
                 		<div class="AACD03-wrap body-code-wrap">
                 			<label for="AACD03">등</label>
                 			<input type="radio" name="BodyCodeRadio" id="AACD03" data-bodyname="등" data-bodycode="AACD03" />
                 		</div>
                 		<div class="AACD04-wrap body-code-wrap">
                 			<input type="radio" name="BodyCodeRadio" id="AACD04" data-bodyname="어깨" data-bodycode="AACD04" />
                 			<label for="AACD04">어깨</label>
                 		</div>
                 		<div class="AACD05-wrap body-code-wrap">
                 			<label for="AACD05">가슴</label>
                 			<input type="radio" name="BodyCodeRadio" id="AACD05" data-bodyname="가슴" data-bodycode="AACD05" />
                 		</div>
                 		<div class="AACD06-wrap body-code-wrap">
                 			<label for="AACD06">허리</label>
                 			<input type="radio" name="BodyCodeRadio" id="AACD06" data-bodyname="허리" data-bodycode="AACD06" />
                 		</div>
                 		<div class="AACD07-wrap body-code-wrap">
                 			<input type="radio" name="BodyCodeRadio" id="AACD07" data-bodyname="골반" data-bodycode="AACD07" />
                 			<label for="AACD07">골반</label>
                 		</div>
                 		<div class="AACD08-wrap body-code-wrap">
                 			<label for="AACD08">팔</label>
                 			<input type="radio" name="BodyCodeRadio" id="AACD08" data-bodyname="팔" data-bodycode="AACD08" />
                 		</div>
                 		<div class="AACD09-wrap body-code-wrap">
                 			<input type="radio" name="BodyCodeRadio" id="AACD09" data-bodyname="손" data-bodycode="AACD09" />
                 			<label for="AACD09">손</label>
                 		</div>
                 		<div class="AACD10-wrap body-code-wrap">
                 			<label for="AACD10">엉덩이</label>
                 			<input type="radio" name="BodyCodeRadio" id="AACD10" data-bodyname="엉덩이" data-bodycode="AACD10" />
                 		</div>
                 		<div class="AACD11-wrap body-code-wrap">
                 			<input type="radio" name="BodyCodeRadio" id="AACD11" data-bodyname="무릎" data-bodycode="AACD11" />
                 			<label for="AACD11">무릎</label>
                 		</div>
                 		<div class="AACD12-wrap body-code-wrap">
                 			<label for="AACD12">다리</label>
                 			<input type="radio" name="BodyCodeRadio" id="AACD12" data-bodyname="다리" data-bodycode="AACD12" />
                 		</div>
					</div>
				</div>
			</div>

			<div class="modal-footer">
				<button type="button" id="btnSaveBodyCd" class="dduk-btn-active">저장</button>
				<button type="button" id="btnCancelBodyCd" class="dduk-btn-normal"
					data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
<!-- 환부선택 모달 끝 -->

<!--공지사항 모달 시작  -->
<div id="writeNotice" class="modal fade" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
<!-- 		ck에디터를 사용하기 위해 아래 토큰 을 써쭤야함 안그러면 못씀 -->
			<form id="writeNotice" action="/notice/write/insertNotice?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data" >
			<div class="modal-header">
				<h1 class="modal-title">공지사항 등록</h1>
			</div>
			<div id="noticeWriteBody" class="modal-body">
					<div class="login-form-content">
						<div class="dduk-row">
							<div class="dduk-login-d">
								<input id="noticeTitle" name="noticeTitle" class="dduk-login-input" type="text" required />
							</div>
						</div>
						<div class="dduk-row">
							<div class="dduk-login-d">
								<div class="login-input-label">파일첨부</div>
								<label id="atchFileLabel" class="dduk-login-input"  for="atchFile"></label>
								<input id="atchFile" name="uploadFile" class="dduk-login-input" type="file" style="display:none" />
								<img id="clip" alt="clip.png" src="/resources/images/icons/clip.png">
							</div>
							<div class="dduk-login-d">
								<div class="dduk-row space-bw"> 
									<div class="login-input-label">알림</div>
									<div id="selectAll" class="login-input-label">전체선택</div>
								</div>
								<div class="dduk-row space-bw">
									<button type="button" class="dduk-btn-select btn-state">의사</button>
									<button type="button" class="dduk-btn-select btn-state">간호사</button>
									<button type="button" class="dduk-btn-select btn-state">원무과</button>
									<button type="button" class="dduk-btn-select btn-state">치료사</button>
								</div>
							</div>
						</div>
						<div class="addOrderset-body">
							<textarea rows="3" cols="5" id="noticeCont" name="noticeCont"></textarea>
						</div>
					</div>
			</div>

			<div class="modal-footer">
				<button type="submit" class="dduk-btn-active">저장</button>
				<button type="button" class="dduk-btn-normal"
					data-bs-dismiss="modal">취소</button>
			</div>
			<sec:csrfInput/>
			</form>
		</div>
	</div>
 </div>
 <!--공지사항 모달 끝  -->

<!-- 마이페이지 정보 수정 모달 -->
<div id="detailEmpModal" class="modal fade" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="margin: 100px -250px; min-width: 1000px;">
			<div class="modal-header">
				<h1 class="modal-title">내 정보 수정</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form name="frm" class="d-flex" action="/emp/update?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data" style="margin-top:-50px;">
					<div class="pfPic-form-content pfPic">
						<div class="d-flex" style="margin-right: 50px; align-items: center;">
							<img class="img-circle" 
								src="/resources/upload/empProfile/${employeeVO.atchFileVO.atchFileDetailVOList[0].atchFileDetailSavenm}"
								alt="User profile picture" id="atchFileCd" style="width:200px; height:200px;" >
						</div>
						<div class="custom-file" style="position: absolute; margin-left: 280px;">
							<label for="uploadFile">
								<svg id="camIcon" xmlns="http://www.w3.org/2000/svg"><path d="M0 6c0-1.1.9-2 2-2h3l2-2h6l2 2h3a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V6zm10 10a5 5 0 1 0 0-10 5 5 0 0 0 0 10zm0-2a3 3 0 1 1 0-6 3 3 0 0 1 0 6z" fill="#8d9ea5" class="fill-000000"></path></svg>
							</label>
							<input type="file" class="dduk-login-input" name="uploadFile" id="uploadFile" style="display:none;" /> 
						</div>
					</div>
					<input id="empName" name="empName" style="display: none;" type="text" value="${employeeVO.empName}" />
					<input id="empDeptCd" name="empDeptCd" style="display: none;" type="text" value="${employeeVO.empDeptCd}" />
					<input id="empJbpsCd" name="empJbpsCd" style="display: none;" type="text" value="${employeeVO.empJbpsCd}" />
					
					<div class="login-form-content">
						<div class="dduk-login-d">
							<div class="login-input-label" >주민번호</div>
							<input id="empReg" name="empReg" class="dduk-login-input" style="background-color: #ddd;"
								type="text" value="${employeeVO.empReg}" readonly />
						</div>
					
						<div class="dduk-row">
							<div class="dduk-login-d">
								<div class="dduk-row">
									<div class="login-input-label pw-container">비밀번호</div>
									<button type="button" class="dduk-btn-info" id="btnUpdatePw2" style="width: 53px; height: 24px;">
										변경
									</button>
								</div>
								<input id="empPw" name="empPw" class="dduk-login-input" type="password" readonly/>
							</div>
							<div class="dduk-login-d">
								<div class="login-input-label pw-container">비밀번호 확인</div>
								<input id="pwConfirm" name="pwConfirm" class="dduk-login-input" type="password" readonly/>
							</div>
						</div> 

						<div style="margin: 12px 0px;">
							<div class="dduk-row">
								<div class="dduk-login-d" style="margin-bottom: 0px;">
									<div class="login-input-label">주소</div>
									<div class="d-flex" style="align-items: baseline">
										<input type="hidden" name="empNo" value="${employeeVO.empNo}">
										<input type="text" id="empZip" name="empZip" class="dduk-login-input" style="width: 203px;"
											value="${employeeVO.empZip}"  />
										<button type="button" class="dduk-btn-nomal search-btn" id="empPostBtn" style="z-index: 1500;" >우편번호 찾기</button>
									</div>
								</div>
							</div>
							<div class="dduk-row">
								<div class="dduk-login-d">
									<input id="empAdd1" name="empAdd1" class="dduk-login-input" type="text" value="${employeeVO.empAdd1}" />
								</div>
								<div class="dduk-login-d">
									<input id="empAdd2" name="empAdd2" class="dduk-login-input" type="text" value="${employeeVO.empAdd2}" />
								</div>
							</div>
						</div>

						<div class="dduk-row">
							<div class="dduk-login-d">
								<div class="login-input-label">연락처</div>
								<input id="empPh" name="empPh" class="dduk-login-input"
									type="text" value="${employeeVO.empPh}" />
							</div>
							<div class="dduk-login-d">
								<div class="login-input-label">이메일</div>
								<input id="empMail" name="empMail" class="dduk-login-input"
									type="text" value="${employeeVO.empMail}" />
							</div>
						</div>
						<div class="dduk-row" style="justify-content: flex-end;">
							<button type="submit" id="btnUpdateEmp" class="sub-btn" style="background: var(--black-01, #323537);">수정하기</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- 개인 사원 정보 수정 모달 끝 -->

<!-- 일정 추가 수정 모달 -->
<div id="createSchModal" class="modal fade" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="transform: translate(0%, 10%)">
			<div class="modal-header">
				<h1 class="modal-title schHead">일정 추가</h1>
					<input id="dsNo" name="dsNo" class="dsNo" style="display: none;" type="text" value="1" />
				<button type="button" class="btn-close" id="closeSchModal" data-bs-dismiss="modal" aria-label="Close" ></button>
			</div>
			<div class="modal-body" style="margin-top:-30px;" >
				<div class="dduk-row">
					<div class="dduk-login-d" id="strSchDate">
						<label for="eventStart">시작 일시</label>
							<input type="date" class="dduk-login-input" id="eventStart" onchange="dayCheck()"  />
							<select class="dduk-login-input" name="time-set" id="start" onchange="timeSet()">
								<option value="09:00">09:00</option>
								<option value="09:30">09:30</option>
								<option value="10:00">10:00</option>
								<option value="10:30">10:30</option>
								<option value="11:00">11:00</option>
								<option value="11:30">11:30</option>
								<option value="12:00">12:00</option>
								<option value="12:30">12:30</option>
								<option value="13:00">13:00</option>
								<option value="13:30">13:30</option>
								<option value="14:00">14:00</option>
								<option value="14:30">14:30</option>
								<option value="15:00">15:00</option>
								<option value="15:30">15:30</option>
								<option value="16:00">16:00</option>
								<option value="16:30">16:30</option>
								<option value="17:00">17:00</option>
								<option value="17:30">17:30</option>
								<option value="18:00">18:00</option>
								<option value="18:30">18:30</option>
							</select>
					</div>
				</div>
				<div class="dduk-row">
					<div class="dduk-login-d" id="endSchDate">
						<label for="eventEnd">종료 일시</label>
							<input type="date" class="dduk-login-input" id="eventEnd" onchange="dayCheck()" />
							<select class="dduk-login-input" name="time-set" id="end" onchange="timeCheck()">
								<option value="09:30">09:30</option>
								<option value="10:00">10:00</option>
								<option value="10:30">10:30</option>
								<option value="11:00">11:00</option>
								<option value="11:30">11:30</option>
								<option value="12:00">12:00</option>
								<option value="12:30">12:30</option>
								<option value="13:00">13:00</option>
								<option value="13:30">13:30</option>
								<option value="14:00">14:00</option>
								<option value="14:30">14:30</option>
								<option value="15:00">15:00</option>
								<option value="15:30">15:30</option>
								<option value="16:00">16:00</option>
								<option value="16:30">16:30</option>
								<option value="17:00">17:00</option>
								<option value="17:30">17:30</option>
								<option value="18:00">18:00</option>
								<option value="18:30">18:30</option>
								<option value="19:00" >19:00</option>
							</select>
					</div>
				</div>
				<div class="form-group isAllDay-container" >
						<label for="allDay">종일여부</label>
					<div class="dduk-login-d" id="chkAllDay">
						  <div class="form-check ">
								<input type="radio" name="allDay" id="wholeTime" class="form-check-input date-group" value="true" >예
						  </div>
						  <div class="form-check ">
								<input type="radio" name="allDay" id="partTime" checked="checked" class="form-check-input date-group" value="false" >아니오
						  </div>
					</div>
				</div>
			  	
				<div class="form-group">
					<label for="eventContent">일정 내용</label>
					<input type="text" id="eventContent" class="form-control" placeholder="내용을 입력해주세요">
				</div>
				<label for="color">분류</label>
		            <select id="color" class="form-control">
		              <option value="#DBF2F4">연구</option>
		              <option value="#ffcccc">휴진</option>
		            </select>
	            
                <div class="dduk-row" style="justify-content: flex-end; margin-top:30px;">
                	<button id="updateEvent" class="sub-btn" onclick="updateSch()" style="display:none;">수정</button>
              		<button id="realSaveEvent" class="sub-btn" onclick="modalSave()" >저장</button>
					<button type="button" id="delEvent" class="sub-btn" data-bs-dismiss="modal" onclick="delBtnEvent()" style="display:none;" >삭제</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 일정 추가 모달 끝 -->

<!-- 영상 검사 결과 조회 모달 시작 -->
<div id="viewTestOrderResult" class="modal fade" tabindex="-1"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title">검사 결과</h1>
				<button type="button" class="close" id="closeSchModal" onclick="initModal()" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="login-form-content">
					<div class="dduk-row">

						<div id="carouselExampleControls" class="carousel slide">
							<div id="testOrderResultSlide" class="carousel-inner">
							
							</div>
							<button id="testOrderResultPrev" class="carousel-control-prev" type="button"
								data-bs-target="#carouselExampleControls" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">이전</span>
							</button>
							<button id="testOrderResultNext" class="carousel-control-next" type="button"
								data-bs-target="#carouselExampleControls" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">다음</span>
							</button>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 영상 검사 결과 조회 모달 끝 -->

<!-- 치료 내용 조회 모달 시작 -->
<div id="trodContModal" class="modal fade" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title">치료 기록</h1>
				<button type="button" class="close" id="closeSchModal" onclick="initModal()" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body" style="padding: 0px 48px 48px 48px;">
				<div class="login-form-content">
					<div class="dduk-row">
						<div id="divTrodCont">치료 내용</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 치료 내용 모달 끝 -->

<!-- 입원 정보 받기 모달 시작 -->
<div id="createAdmissionChart" class="modal fade" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="min-width: 500px;">
			<div class="modal-header">
				<h1 class="modal-title">입원 정보 입력</h1>
			</div>
			<div class="modal-body" style="padding: 0px 0px 0px 48px">
				<div class="login-form-content">
					<div class="dduk-row">
						<h3>예상 입원 기간</h3>
					</div>
					<div class="dduk-row">
						<div id="expectAdmissionDateDiv">
							<input type="text" id="expectAdmissionDateInput">
						</div>
					</div>
					<br><br>
					<div class="dduk-row">
						<div class="dduk-row">
							<h3>입원 사유</h3>
							<button id="complete4" type="button" class="auto-complete-btn">
				               <svg width="24" height="" viewBox="0 0 600 600" fill="none" xmlns="http://www.w3.org/2000/svg">
				                  <path class="auto-complete-btn-path" d="m495.6 49.23-32.82-32.82C451.8 5.471 437.5 0 423.1 0c-14.33 0-28.66 5.469-39.6 16.41l-216 216.09c-8.4 7.5-12.7 17-15.1 27.3l-24.1 107.4c-1.8 8.9 5.1 16.8 12.8 16.8.916 0 1.852-.092 2.797-.281 0 0 74.03-15.71 107.4-23.56 10.1-2.377 19.13-7.46 26.46-14.79l217-217C517.5 106.5 517.4 71.1 495.6 49.23zM461.7 94.4l-217 217c-1.1 1.1-2.2 1.7-3.5 2-13.7 3.227-34.65 7.857-54.3 12.14l12.41-55.2c.29-1.44.99-2.84 2.09-3.84L417.5 50.4c1.9-1.99 4.1-2.4 5.6-2.4s3.715.406 5.65 2.342l32.82 32.83c3.23 3.168 3.23 8.098.13 11.228zM424 288c-13.25 0-24 10.75-24 24v128c0 13.23-10.78 24-24 24H72c-13.22 0-24-10.77-24-24V136c0-13.23 10.78-24 24-24h144c13.25 0 24-10.75 24-24s-10.7-24-24-24l-144.9-.01C32.31 63.99 0 96.29 0 135.1v304C0 479.7 32.31 512 71.1 512h303.1c39.69 0 71.1-32.3 71.1-72l2.7-128c0-13.2-10.7-24-24-24z" fill="#8d9ea5">
				                  </path>
				               </svg>
				            </button>
						</div>
					</div>
					<div class="dduk-row">
						<textarea id="admissionReason"></textarea>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" id="btnSaveCreateAdmissionChart" class="dduk-btn-active">저장</button>
				<button type="button" id="btnCancelCreateAdmissionChart" class="dduk-btn-normal"
					data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
<!-- 입원 정보 받기 모달 끝 -->

<!-- 인사과 사원 정보 수정 모달 -->
<div id="detailEmpModalHrd" class="modal fade" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="margin: 100px -250px; min-width: 1000px;">
			<div class="modal-header">
				<h1 class="modal-title">사원 정보 수정</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="spa-betw">
				<div class="pfPic-form-content pfPic">
					<div class="d-flex" style="margin-left: 50px; align-items: center;">
						<img class="img-circle" 
							src="/resources/upload/empProfile/${employeeVO.atchFileVO.atchFileDetailVOList[0].atchFileDetailSavenm}"
							alt="User profile picture" id="atchFileCdHrd" style="width:200px; height:200px;" >
					</div>
					<div class="custom-file" style="position: absolute; margin-left: 150px;">
						<label for="uploadFile">
							<svg id="camIcon" xmlns="http://www.w3.org/2000/svg"><path d="M0 6c0-1.1.9-2 2-2h3l2-2h6l2 2h3a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V6zm10 10a5 5 0 1 0 0-10 5 5 0 0 0 0 10zm0-2a3 3 0 1 1 0-6 3 3 0 0 1 0 6z" fill="#8d9ea5" class="fill-000000"></path></svg>
						</label>
						<input type="file" class="dduk-login-input" name="uploadFile" id="uploadFile" style="display:none;" /> 
					</div>
				</div>
					<div class="login-form-content" style="width: 516px;">
						<div class="dduk-row">
							<div class="dduk-login-d">
								<div class="login-input-label">사번</div> 
								<input id="empNoHrd" name="empNo" class="dduk-login-input" type="text" readonly
									value="<c:out value='${employeeVO.empNo}'/>" />
							</div>
							<div class="dduk-login-d">
								<div class="login-input-label">성명</div>
								<input id="empNameHrd" name="empName" class="dduk-login-input" type="text"/>
							</div>
						</div>
						<div class="dduk-row">
							<div class="dduk-login-d">
								<div class="dduk-row">
									<div class="login-input-label pw-container">비밀번호</div>
									<button type="button" class="dduk-btn-info" id="btnUpdatePw">
										변경
									</button>
								</div>
								<input id="empPwHrd" name="empPw" class="dduk-login-input" type="password" readonly/>
							</div>
							<div class="dduk-login-d">
								<div class="login-input-label pw-container">비밀번호 확인</div>
								<input id="pwConfirmHrd" name="pwConfirm" class="dduk-login-input" type="password" readonly/>
							</div>
						</div>
						
						<div style="margin: 12px 0px;">
							<div class="dduk-row">
							<div class="dduk-login-d"  style="margin-bottom: 0px;">
								<div class="login-input-label">주소</div>
								<div class="d-flex" style="align-items: baseline">
									<input type="text" id="empZipHrd" name="empZip" class="dduk-login-input" style="width: 203px;"/>
									<button type="button" class="dduk-btn-nomal search-btn" id="btnPostHrd" style="z-index: 1500;" >우편번호 찾기</button>
								</div>
								
							</div>
						</div>
						<div class="dduk-row">
							<div class="dduk-login-d">
								<input id="empAdd1Hrd" name="empAdd1" class="dduk-login-input" type="text" />
							</div>
							<div class="dduk-login-d">
								<input id="empAdd2Hrd" name="empAdd2" class="dduk-login-input" type="text" placeholder="상세주소"/>
							</div>
						</div>
						</div>
						
						
						<div class="dduk-row">
							<div class="dduk-login-d">
								<div class="login-input-label">연락처</div> 
								<input id="empPhHrd" name="empPh" class="dduk-login-input" type="text"/>
							</div>
							<div class="dduk-login-d">
								<div class="login-input-label">이메일</div> 
								<input id="empMailHrd" name="empMail" class="dduk-login-input" type="text"/>
							</div>
						</div>
						<div class="dduk-login-d">
							<div class="login-input-label">주민번호</div> 
							<input id="empRegHrd" name="empReg" class="dduk-login-input" type="text" style="width: 100%;" />
						</div>
						
						
						<div class="dduk-row">
							<div class="dduk-login-d">
								<div class="login-input-label">직무</div>
								<select name="empDeptCd" id="empDeptCdHrd" class="dduk-login-input" style="padding-right: 8px;">
										<option value="">직무 선택</option>
										<option value="DTCD01">의사</option>
										<option value="DTCD02">간호사</option>
										<option value="DTCD03">치료사</option>
										<option value="DTCD04">원무과</option>
										<option value="DTCD05">인사과</option>
								</select>
							</div>
						
							<div class="dduk-login-d">
								<div class="login-input-label">직책</div>
								<select name="empJbpsCd" id="empJbpsCdHrd" class="dduk-login-input" style="padding-right: 8px;">
									<option value="">직책 선택</option>
								</select>
							</div>
						</div>
							<button type="button" class="dduk-btn-normal" id="updateEmpHrd" style="width: 20%;">
								수정
							</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 인사과 사원 정보 수정 모달 끝 -->

<!-- 인사과 사원 상태 선택 모달 시작 -->
<div id="updateSttModalHrd" class="modal fade" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="top: 300px;">
			<div class="modal-header">
				<h1 class="modal-title paCls01">사원 상태 변경</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>

			<div class="modal-body">
				<h2>어떤 상태로 변경하시겠습니까?</h2>
			</div>

			<div class="modal-footer paCls01">
				<button type="button" class="dduk-btn-active stt-btn" id="lock-btn" >잠금</button>
				<button type="button" class="dduk-btn-normal stt-btn" id="out-btn" data-bs-dismiss="modal">퇴사</button>
			</div>
		</div>
	</div>
</div>
<!-- 인사과 사원 상태 선택 모달 끝 -->

<!-- 식이 추가 모달 시작 -->
<div id="createDietModal" class="modal fade" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="top: 300px;">
			<div class="modal-header">
				<h1 class="modal-title">식이 추가</h1>
			</div>
			
			<div class="modal-body">

			</div>

			<div class="modal-footer">
				<button type="button" id="btnSaveCreateDietModal" class="dduk-btn-active">저장</button>
				<button type="button" id="btnCancelCreateDietModal" class="dduk-btn-normal" data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>
<!-- 식이 추가 모달 끝 -->

<!-- 발표용 -->
<div id="forPPT" class="modal fade" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content" style="min-width: 670px; background-color: #F8F9FC;">
			<div class="modal-header" style="background-color: #F8F9FC;">
				<h1 class="modal-title">진료 내역 조회</h1>
			</div>
			<div class="modal-body" style="padding: 0px 0px 0px 48px">
				<div class="login-form-content">
					<div style="display: block">
						<div>
							<h3>진료 기록</h3>
						</div>
						<div class="gap-ver-16">
							<div class="gap-row-16 w-100">
								<div class="dduk-inner-border" style="width:284px;">
									<h3 class="m-8">진료 내용</h3>
									<div>
										<div class="spa-betw p-8" style="padding-bottom: 4px;"> 
											<div class="gray-text d-flex w-30">진단일</div> <div>2023-04-20</div>
										</div>
										<div class="spa-betw p-8">
											<div class="gray-text d-flex w-30">진단내역</div> <div>무릎 연골 염증</div>
										</div>
											<hr class="m-8">
										<div class="spa-betw p-8" style="padding-bottom: 4px;">
											<div class="gray-text d-flex w-30">주상병</div> <div>무릎 연골 손상</div>
										</div>
										<div class="spa-betw p-8">
											<div class="gray-text d-flex w-30">주상병코드</div> <div>S0833</div>
										</div>
											<hr class="m-8">
									</div>
								</div>
								<div class="dduk-inner-border" style="width:272px; z-index: auto;">
									<h3 class="m-8">이미지</h3>
									<div>
							                    <img src="/resources/upload/testOrderResult/58456b25-08c5-4b39-af16-8559575e0593_img-knee-01-01.jpg" style="width: 230px;">
							                
							                    <img src="/resources/upload/testOrderResult/de9cfd43-18d6-4d49-a626-81e18c873e52_img-knee-02-01.jpg" style="width: 230px;">
							                </div>
								</div>
							</div>
							<div class="dduk-inner-border w-100" style="height: 320px; width: 572px !important; overflow: scroll;">
								<h3 class="subTitle-margin">오더 내역 </h3>
								<div class="order-scroll-ppt">
									<h4>검사</h4>
									<div class="order-detail-ppt">
										<table style="width: 100%">
											<tbody><tr>
												<td class="gray-text" style="width:25%">코드</td>
												<td class="gray-text" style="width:50%">검사명</td>
												<td class="gray-text" style="width:25%">가격</td>
											</tr>
											</tbody>
											<tbody>
									<tr>
										<td>TEST006</td>
										<td>초음파</td>
										<td>86400</td>
									</tr>
								</tbody>
										</table>
									</div>
									<h4>처방</h4>
									<div class="order-detail-ppt">
										<table style="width: 100%">
											<tbody><tr>
												<td class="gray-text">코드</td>
												<td class="gray-text">약품명</td>
												<td class="gray-text">업체명</td>
												<td class="gray-text">투여랑</td>
												<td class="gray-text">투여횟수</td>
												<td class="gray-text">기간</td>
											</tr>
											</tbody><tbody>
									<tr>
										<td>DEF02</td>
										<td>이부프로펜</td>
										<td>GC녹십자</td>
										<td>1</td>
										<td>3</td>
										<td>1</td>
									</tr>
								</tbody>
										</table>
									</div>
									<h4>치료</h4>
									<div class="order-detail-ppt">
										<table style="width: 100%">
											<tbody><tr>
												<td>코드</td>
												<td>치료명</td>
												<td>급여</td>
											</tr>
											</tbody><tbody>
								<tr>
									<td>TRMT003</td>
									<td>열치료</td>
									<td>O</td>
								</tr>
								
								<tr>
									<td>TRMT002</td>
									<td>체외충격파치료</td>
									<td>X</td>
								</tr>
								</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="dduk-btn-normal"
					data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>