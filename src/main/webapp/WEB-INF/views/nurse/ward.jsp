<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}

.aside-nur-ward{
	width: 196px;
	border-radius: 16px 0px 0px 16px;
	background: var(--bg-02, #DBF2F4);
	height: 56px;
	border-right: 4px solid var(--ci-01, #0ABAB5);
	margin-left: 4px;
	color: var(--ci-01, #0ABAB5);
}

#modifyRecordTr {
	visibility: hidden;
    margin-left: 530px;
    width: 18px;
    height: 18px;
    cursor: pointer;
}

#ioType {
    margin: 40px -8px 0px -5px;
    height: 20px;
}

#ioValue {
	margin-top: 1px;
}

.io-swal-wrap {
	margin-top: 16px;
    display: flex;
    justify-content: center;
}

#temp {
	width: 100px;
}

#bloodChartContainer {
	width: 510px;
    max-height: 335px;
    overflow-y: scroll;
}

#ioChartContainer {
	width: 510px;
    max-height: 335px;
    overflow-y: scroll;
}

.gapMinus {
	color: #FF4040;
}

.gapPlus {
	color: #0ABAB5;
}

.gapEqual {

}

.table-blood .gray-text {
	color: #61737a !important;
}

#dietChartContainer {
	overflow-y: auto;
	margin-top: 16px;
    width: 100%;
    max-height: 335px;
    display: flex;
    justify-content: center;
}

#tempChartContainer {
	width: 510px;
    max-height: 335px;
    overflow-y: scroll;
}	

.chartContainer {
    max-height: 335px;
    display: flex;
    justify-content: center;
   	margin-top: 16px;
}

.daterangepicker {
  z-index: 1050 !important;
}

.btn-cancel-daterange-diet {
	display: none;
}

.btn-diet-chart-selected {
	display: flex;
    padding: 5px 12px;
    align-items: center;
    gap: 10px;
    border-radius: 8px;
    border: 0px solid var(--black-05, #E0E6E9);
    background: var(--black-05, #DBF2F4) !important;
    font-family: 'Pretendard5';
    color: var(--black-03, #0abab5);
    border: 0px;
}

.btn-day-chart-selected {
	display: flex;
    padding: 5px 12px;
    align-items: center;
    gap: 10px;
    border-radius: 8px;
    border: 0px solid var(--black-05, #E0E6E9);
    background: var(--black-05, #DBF2F4) !important;
    font-family: 'Pretendard5';
    color: var(--black-03, #0abab5);
    border: 0px;
}

.btn-save-daterange-diet {

}

.dduk-btn-info.applyBtn {
	margin-left: 175px;
}

.swal2-textarea {
	border-radius: 12px;
    border: 1px solid var(--border, #EBEFF0);
    background: var(--bg-01, #F8F9FC);
    padding-left: 16px;
    font-family: 'Pretendard5';
    font-size: 14px;
    line-height: 160%;
}

/**/
.nurse-chart-write-title {
	display: flex;
    gap: 339px;
}
.nurse-chart-view-title {
	display: flex;
    gap: 289px;
}
.btn-nurse-chart-save {
	height: 28px;
}
#nurCont {
	width: 97%;
    height: 149px;
}
.nurse-chart-view-date {
	padding-top: 3px;
	color: var(--black-03, #8D9EA5) !important;
    font-family: 'Pretendard5';
}
/**/

.ward-left {
	width: 30%;
	border: none;
	padding: 0px;
}

.ward-right-wrap {
	display: flex;
}

.nurse-chart {
	width: 700px;
    height: 350px;
}

.nurse-chart-header {
	margin: -16px -16px 0px -16px;
    padding: 16px 24px 8px 24px;
    border-bottom: 1px solid #EBEFF0;
}

.nurse-chart-body {

}

.nurse-chart-cont {
	padding-top: 16px;
}

.nurse-chart-body-top {
	padding-top: 8px;
}

.nurse-chart-list {
	height: 284px;
    width: 155px;
    margin: 0px -16px -16px -16px;
    padding: 8px 16px 16px 16px;
    border-right: 1px solid var(--border, #EBEFF0);
    overflow-y: scroll;
    overflow-x: hidden;
}

.nurse-chart-list-date {
	text-align: center;
	width: 120px;
	padding: 5px;
}

.rounds-chart-list-default {
	text-align: center;
	width: 130px;
	padding: 5px;
}

.rounds-chart-list-date:hover {
	background-color: #F8F9FC;
} 

.nurse-chart-detail {
    width: 543px;
    height: 267px;
    margin: 8px -17px -16px 16px;
    padding: 0px 16px 16px 16px;
    border-radius: 0px 0px 24px 0px;
}

.nurse-record {
    height: 474px;
    margin-top: 16px;
}

.nurse-record-header {
	width: 110%;
	margin: -16px -16px 0px -16px;
    padding: 16px 24px 8px 24px;
    border-bottom: 1px solid #EBEFF0;
}

.nurse-record-aside {
	height: 409px;
    width: 155px;
    margin: 0px -16px -16px -16px;
    padding: 8px 16px 16px 16px;
    border-right: 1px solid var(--border, #EBEFF0);
    overflow-y: scroll;
    overflow-x: hidden;
    display: flex;
    flex-direction: column;
    justify-content: space-around;
}

.nurse-record-aside-tab {
	cursor: pointer;
	margin-left: 2.5%;
    width: 100%;
    text-align: center;
    background: var(--bg-01, #F8F9FC);
    border-radius: 10px;
}


.nurse-record-aside-tab.record-tab-selected {
	margin-left: 2.5%;
    width: 100%;
    text-align: center;
    background: var(--bg-01, #DBF2F4);
    border-radius: 10px;
    color: black !important;
}

.nurse-record-body {
	width: 100%;
	height: 376px;
    margin: 16px 0px 0px 16px;
}

.diet-table-wrap {
	max-height: 376px;
    overflow-y: scroll;
}

.diet-chart-btn-wrap {
	justify-content: space-evenly;
}

.day-btn-wrap {
	justify-content: space-evenly;
}

.btn-diet-chart {
	font-size: 11px;
    font-weight: bold;
    width: 90px;
    height: 25px;
}

.btn-day-chart {
	font-size: 11px;
    font-weight: bold;
    width: 90px;
    height: 25px;
}

.table-diet {
	overflow-y: scroll;
}

.td-date {
	text-align: center;
    font-weight: bold;
}

.btn-rounds-save {
	width: 65px;
    margin-left: 65%;
    height: 30px;
    padding: 0px;
}

.btn-rounds-complete {
	width: 65px;
    margin-left: 65%;
    height: 30px;
    padding: 0px;
}

.rounds-chart-detail-inner-border {
	height: 624px;
    border-radius: 24px;
    border: 1px solid var(--border, #E0E8E6);
    padding: 16px;
    background: var(--white, #FFF);
    overflow-y: scroll;
}

.rounds-bed-list {
	width: 1016px;
}

.bed-large {
	border-radius: 24px;
	background: var(--BG-01, #F8F9FC);
	width: 400px !important;
}

.bed-small {
	border-radius: 24px;
	background: var(--BG-01, #F8F9FC);
	width: 200px !important;
	height: 160px;
}

.bed-list-2 {
	margin-top: 5%;
}

.bed-list-4 {
	position: absolute;
    margin-top: 2%;
    margin-left: 1%;
}

.bed-list-6 {
	display: flex;
	justify-content: space-evenly;
	margin-top: 10%;
	margin-left: -2%;
}

.bed-list-6-list {
	margin-left: -21%;
}

.bed-list-6-right {
	margin-right: -2%;
    margin-left: 3%;
}

.bed-wrap-2 {
	display: flex;
    gap: 24px;
    justify-content: space-evenly;
}

.bed-wrap-4 {
	display: flex;
    gap: 24px;
    justify-content: flex-end;
    margin-left: 1.5%;
}

.bed-wrap-6 {
	display: flex;
    gap: 24px;
    justify-content: space-evenly;
    flex-direction: column;
}

.title-bed-2 {
	padding: 24px 0px 0px 36px;
}

.title-bed-4 {
	padding: 38px 0px 0px 36px;
}

.title-bed-6 {
	margin-left: 190px;
	margin-bottom: 30px;
}

.btn-room-change {
	width: 230px;
    height: 48px;
    position: absolute;
    margin: 24px 0px 0px 723px;
}

.room-tab {
	border-radius: 10px;
}

.hidden {
	display: none;
}

.hand-over {
	margin-left: 16px;
	width: 300px;
	height: 840px;
}

.hand-over-create {
	position: absolute;
    width: 298px;
    margin-left: -16px;
    height: 150px;
    border-top-left-radius: 0px;
    border-top-right-radius: 0px;
    border-left: 0px;
    border-right: 0px;
}

.hand-over-create-text {
	width: 298px;
    margin: 16px 0px 16px 0px;
    height: 100%;
    border-top-left-radius: 0px;
    border-top-right-radius: 0px;
    border-bottom-left-radius: 24px;
    border-bottom-right-radius: 24px;
    border-left: 0px;
    border-right: 0px;
}

.hand-over-head {
	margin: -16px -16px 0px -16px;
    padding: 16px 24px 8px 24px;
    border-bottom: 1px solid #EBEFF0;
}

.hand-over-body {
	padding-top: 16px;
	display: flex;
	width: 100%;
	height: 755px;
	overflow-y: scroll;
	text-align: center;
	flex-direction: column;
}

.hand-over-detail {
	padding: 16px;
}

.hand-over-detail-header {

}

.hand-over-detail-profile {
	width: 24px;
	height: 24px;
	border-radius: 100%;
}

.hand-over-detail-name {
	padding-top: 3px;
}

.hand-over-detail-time {
	padding-top: 3px;
}

.hand-over-detail-body {

}

.hand-over-detail-cont {
	text-align: left;
    padding-top: 10px;
}

.hand-over-detail-date {
	margin: 48px 16px 16px 16px;
	padding-top: 5px;
	border-top: 1px solid #EBEFF0;
}

.hand-over-detail-date-first {
	margin: 0px 16px 16px 16px;
	padding-top: 5px;
}

#createHandOver {
	margin: 4px 5px;
}

.nurse-chart-list-date {
	font-size: 16px;
    padding: 8px;
}

.nurse-chart-list-date:hover {
	background-color: #F8F9FC;
} 

.nurse-chart-date-exist {
	background-color: #DBF2F4;
	color: #fff;
}

.dduk-title-area {
	margin-bottom: 0px;
}

.in-h2 {
	font-size: 14px !important;
}

.ward-medicine-order {
	margin-top: 16px;
    height: 618px;
}

.ward-medicine-order-header {
	margin: -16px -16px 0px -16px;
    padding: 16px 24px 8px 24px;
    border-bottom: 1px solid #EBEFF0;
}

.ward-medicine-order-list {
	display: flex;
    overflow-x: hidden;
    white-space: nowrap;
    padding-bottom: 16px;
    margin-top: 16px;
}

.ward-medicine-order-list-cont {
	cursor: pointer;
	display: flex;
    border-radius: 10px;
    border: 1px solid var(--border, #E0E8E6);
    padding: 8px;
    width: 150px;
    height: 60px;
    flex-shrink: 0;
    flex-direction: column;
}

.btn-medicine-order-state {
	width: 47px;
    height: 25px;
    font-size: 13px;
}

.rounds-tab-wrap {
	display: flex;
    gap: 24px;
    justify-content: space-evenly;
}

.rounds-tab {
	margin-top: 32px;
    border-top-right-radius: 18px;
    border-top-left-radius: 18px;
    border: 1px solid var(--border, #E0E8E6);
    border-bottom: none;
    padding: 16px;
    background: var(--white, #FFF);
    width: 35%;
    padding: 4px;
    text-align: center;
    color: #000;
    cursor: pointer;
}

.tab-active {
	background-color: #F8F9FC;
	color: #8D9EA5;
	font-family: 'Pretendard5';
}

.clinic-history-list {
    display: flex;
    overflow-x: hidden;
	white-space: nowrap;
	padding-bottom: 16px;
}

.clinic-history-head {
	display: flex;
	border-radius: 10px;
    border: 1px solid var(--border, #E0E8E6);
    padding: 8px;
    width: 150px;
    height: 80px;
    flex-shrink: 0;
    flex-direction: column;
}

.admission-history-head {
	display: flex;
	border-radius: 10px;
    border: 1px solid var(--border, #E0E8E6);
    padding: 8px;
    width: 150px;
    height: 80px;
    flex-shrink: 0;
    flex-direction: column;
}

.calendar-wrap {
	display: flex;
    gap: 24px;
    justify-content: space-evenly;
}

::-webkit-scrollbar {
    height: 8px;
}

.history-btn {
	width: 12px;
}

.btn-mini {
	margin-left: 0px;
    width: 50px;
    height: 25px;
    font-size: 12px;
    padding-left: 0px;
    padding-right: 0px;
}

.neon-text {
  color: #0ABAB5;
  text-shadow: 0 0 1px #DBF2F4;
}

.neon-text-red {
  color: #FF4040;;
  text-shadow: 0 0 1px #FF4040;
}

.light-green-text {
	color: #00A9A4 !important;
}

.h1-default {
	text-align: center;
	width: 100%;
	margin-top: 150px;
	color: #8D9EA5 !important;
	font-size: 2em !important;
}

.h2-default {
	text-align: center;
    width: 100%;
    margin-top: 150px;
    color: #8D9EA5 !important;
    font-size: 1.8em !important;
} 

/* 커서 올리기, 클릭 시 색깔바꾸기 시작 */
.clinic-history-head:hover {
	background-color: #F8F9FC
} 

.admission-history-head:hover {
	background-color: #F8F9FC
}

.selected {
	background-color: #EDF8F9;
}

/* 과거의 진료기록은 선택하면 빨간색깔로 표시 */
.past-record.selected {
	background-color: #FFECEC !important;
}
/* 커서 올리기, 클릭 시 색깔바꾸기 끝 */

.ward-medicine-order-scroll {
	height: 433px;
	overflow-x: hidden;
	overflow-y: scroll;
	padding: 16px;
}

.table-clinic-history {
	display: flex;
	padding: 12px 16px;
	flex-direction: column;
	justify-content: center;
	gap: 4px;
	border-radius: 12px;
	background: var(--bg-01, #F8F9FC);
	width: 380px;
	height: auto;
	margin-bottom: 16px;
}

.textarea-rounds-history-opinion {
	resize: none;
	width: 93%;
	height: 150px;
}

.textarea-clinic-history-opinion {
	resize: none;
	width: 93%;
	height: 150px;
}

.textarea-rounds-history-reason {
	resize: none;
	width: 93%;
	height: 120px;
}

.textarea-rounds-history-opinion {
	resize: none;
	width: 93%;
	height: 120px;
}

#bloodSwalDate{
    margin-left: 30px;
    margin-right: -8px;
}

#vitDt {
    width: 150px;
    margin-right: 30px;
}

.date-wrap {
	display: flex;
	flex-direction: column;
	margin: 3px 0px 0px -10px;
}

textarea {
	resize: none;
}

#clinicOpinion {
	width: 475px;
    height: 150px;
}

.d-flex-column {
    display: flex!important;
    flex-direction: column;
}

.rounds-opinion-list {
	display: flex;
    overflow-x: hidden;
    overflow-y: hidden;
    white-space: nowrap;
    padding-bottom: 16px;
    height: 60px;
}

.rounds-opinion-list-head {
    display: flex;
    border-radius: 10px;
    border: 1px solid var(--border, #E0E8E6);
    padding: 8px;
    width: 100px;
    height: 60px;
    flex-shrink: 0;
    flex-direction: column;
}

.rounds-opinion-list-head:hover {
	background-color: #F8F9FC;
}

#divTrodCont {
	font-size: 16px;
}

.swal-input {
	height: 40px;
    margin: 16px;
}

swal2-html-container {
	overflow-y: hidden;
}

#ioSwalDate {
	margin-left: 20px;
}

.swal2-title {
	margin-top: 16px;
}

.swal2-actions {
	margin-bottom: 16px;
}

/* 오더추가 시작 */
.rounds-table{
	width: 100%;
}
.td-padding {
    padding: 10px 0px 10px 5px;
}
.td-padding-data {
	padding-left: 5px;
}
.tr-column {
    background: #F8F9FC;
}
.medicine-order-day, .medicine-order-per, .medicine-order-dose {
	width: 20px;
	height: 20px;
	margin-right: 5px;
}
.medicine-order-qt {
	width: 25px;
	height: 20px;
	margin-right: 5px;
}
input[type=number] {
  -moz-appearance: textfield;
}
#defaultTest, #defaultMedicine, #defaultTreatment {
	text-align: center;
}
#searchOrderset {
	width: 520px;
}
.input-search-value {
	width: 520px;
	height: 48px;
	flex-shrink: 0;
	border-radius: 12px;
	border: 1px solid var(- -border, #EBEFF0);
	background: var(- -bg-01, #F8F9FC);
	color: var(- -black-01, #333);
	font-family: 'Pretendard5';
	font-size: 14px;
	font-style: normal;
	line-height: 160%;
	padding-left: 16px;
	margin: 8px 0px 0px 0px;
}

.table-search {
	width: 520px;
	height: 48px;
	border: 1px solid var(- -border, #EBEFF0);
	background-color: #F8F9FC;
	color: var(- -black-01, #333);
	font-family: 'Pretendard5';
	font-size: 14px;
	font-style: normal;
	padding-left: 16px;
	border-collapse: collapse;
	visibility: hidden;
	position: absolute;
}

.tbody-search {
	position: relative;
}

.order-search {
	width: 590px;
	height: 48px;
	background-color: #F8F9FC;
	border: 1px solid var(- -border, #EBEFF0);
	color: var(- -black-01, #333);
	font-family: 'Pretendard5';
	font-size: 14px;
	font-style: normal;
	padding-left: 16px;
	border-collapse: collapse;
	visibility: hidden;
	position: absolute;
}

.order-body-search {
	position: relative;
}

.table-result {
	margin: 8px 0px 0px 0px;
	width: 520px;
	height: 48px;
	border-style: hidden;
	box-shadow: 0 0 0 1px #EBEFF0;
	border-radius: 12px;
	background: var(- -bg-01, #F8F9FC);
	color: var(- -black-01, #333);
	font-family: 'Pretendard5';
	font-size: 14px;
	font-style: normal;
	padding-left: 16px;
	border-collapse: collapse;
}

.table-order-result {
	margin: 8px 0px 0px 0px;
	width: 590px;
	height: 48px;
	border-style: hidden;
	box-shadow: 0 0 0 1px #EBEFF0;
	border-radius: 12px;
	background: var(- -bg-01, #F8F9FC);
	color: var(- -black-01, #333);
	font-family: 'Pretendard5';
	font-size: 14px;
	font-style: normal;
	padding-left: 16px;
	border-collapse: collapse;
}

.table-search tbody * {
	padding: 2%;
}

.order-search tr * {
	padding: 2%;
}

.table-search tr:hover {
	background: #DBF2F4;
}

.order-search tr:hover {
	background: #DBF2F4;
}

.table-search.active {
	visibility: visible;
}

.order-search.active {
	visibility: visible;
}

.table-search td {
	overflow: hidden;
	text-overflow: ellipsis;
}

.order-search td {
	overflow: hidden;
	text-overflow: ellipsis;
}

.btn-body {
	width: 100.8%;
    font-size: 0.85em !important;
}
/* 오더추가 끝 */

/* 아이콘 모음 시작 */
.icon-calendar {
	width: 48px;
	height: 48px;
}
.icon-stethoscope {
	width: 42px;
	height: 42px;
}
.icon-undo {
	width: 24px;
	height: 24px;
    margin: 4px 0px 0px 559px;
    cursor: pointer;
}
#createNurseChart {
	margin-left: 50px;
}
.icon-trashbin {
	width: 16px;
	height: 16px;
	margin-top: 4px;
	cursor: pointer;
}
.ui-datepicker-trigger {
    display: block;
    width: 24px; 
    height: 24px; 
    border: none; 
    cursor: pointer; 
    margin-top: -10px;
}
#magnifyingGlass {
	width: 16px;
	height: 16px;
	margin-bottom: 1%;
}
.magnifyingGlass {
	width: 16px;
	height: 16px;
	margin-bottom: 1%;
}
.viewTestResult {
	cursor: pointer;
	width: 35%;
}
.view-trod-cont {
	cursor: pointer;
}
.icon-trashbin {
	visibility: hidden;
}
.active {
	visibility: visible;
}
.testing {
	background-image: url(/resources/images/icons/reddot.png);
    background-repeat: no-repeat;
    background-position: 100px 4px;
    background-size: 6px 6px;
}
.testdone {
	background-image: url(/resources/images/icons/greendot.png);
    background-repeat: no-repeat;
    background-position: 100px 4px;
    background-size: 6px 6px;
}
.icon-dot {
	width: 8px;
	height: 8px;
}
/* 아이콘 모음 끝 */
</style>

<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<link rel="stylesheet" href="/resources/css/nice-select.css" />

<c:import url="../common/modal.jsp"></c:import>

<div class="dduk-body-border ward-left">
	<div class="dduk-inner-border">
		<div class="dduk-title-area">
			<h2>환자 정보 조회</h2>
		</div>
		<div class="patient-info-div">
			<div class="dduk-row">
				<h2 class="in-h2" style="width:50%">이름 : </h2>
				<h2 class="in-h2" style="width:30%">성별 : </h2>
				<h2 class="in-h2" style="width:30%">나이 : </h2>
			</div>
			<div class="dduk-row">
				<h2 class="in-h2" style="width:35%">보호자 이름 : </h2>
				<h2 class="in-h2" style="width:65%">보호자 번호 : </h2>
			</div>
			<div class="dduk-row">
				<h2 class="in-h2" style="width:33%">혈액행 : </h2>
				<h2 class="in-h2" style="width:33%">키 : </h2>
				<h2 class="in-h2" style="width:33%">몸무게 : </h2>
			</div>
		</div>
	</div>
	<div class="dduk-inner-border ward-medicine-order">
		<div class="dduk-title-area ward-medicine-order-header">
			<h2>처치내역</h2>
		</div>
		<div class="ward-medicine-order-body">
			<h1 class="h1-default">병상을 선택해주세요</h1>
		</div>
	</div>
</div>
<div class="ward-right-wrap">
	
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/moment@latest"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-adapter-moment@latest"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.nice-select.min.js"></script>
<script>
$(document).ready(function() {
	$('.aside-nur-ward').find('svg').find('path').attr('fill', '#0ABAB5');
	$('.aside-nur-ward').find('.dduk-nav-menu').css('color', '#0ABAB5');
});

$(function() {
	
	// 가장 최근에 조회한 환자번호
	var currentPaNo = '';
	// 가장 최근에 조회한 입원의 정보
	var currentAdmiNo = '';
	
	// 환자정보조회 스크립트 시작
	
    // 환자 정보 갱신
    function updatePaInfo(paNo){
    	$.ajax({
    		url: '/clinic/simpleClinicChartList',
    		data: {'paNo' : paNo},
    		type: 'post',
    		dataType: 'json',
    		beforeSend: function(xhr){
    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    		},
    		success: function(rst){
    			console.log("환자 정보 가져오기 : ", rst);
    			
    			// 환자정보 갱신
    			let patientInfo = $('.patient-info-div');
    			patientInfo.find('h2').eq(0).text('이름 : ' + rst.paName);
    			patientInfo.find('h2').eq(1).text('성별 : ' + rst.paSex);
    			patientInfo.find('h2').eq(2).text('나이 : ' + getAge(formatResidentNumber(rst.paReg)));
    			patientInfo.find('h2').eq(3).text('보호자 이름 : ' + rst.paNoknm);
    			patientInfo.find('h2').eq(4).text('보호자 번호 : ' + rst.paNokph);
    			patientInfo.find('h2').eq(5).text('혈액형 : ' + rst.paBldType);
    			patientInfo.find('h2').eq(6).text('키 : ' + rst.paHeight + 'cm');
    			patientInfo.find('h2').eq(7).text('몸무게 : ' + rst.paWeight + 'kg');
    		},
    		error: function(xhr, status, error){
    			console.log('Error:', xhr, status, error);
    		}
    	});
    }
	
    
    // 환자 정보 초기화
    function resetLeftData(){
    	
    	// 환자정보 초기화
    	let patientInfo = $('.patient-info-div');
    	patientInfo.find('h2').eq(0).text('이름 : ');
		patientInfo.find('h2').eq(1).text('성별 : ');
		patientInfo.find('h2').eq(2).text('나이 : ');
		patientInfo.find('h2').eq(3).text('보호자 이름 : ');
		patientInfo.find('h2').eq(4).text('보호자 번호 : ');
		patientInfo.find('h2').eq(5).text('혈액형 : ');
		patientInfo.find('h2').eq(6).text('키 : ');
		patientInfo.find('h2').eq(7).text('몸무게 : ');
		
		// 처치내역 초기화
		let cont = '<h1 class="h1-default">병상을 선택해주세요</h1>';
		$('.ward-medicine-order-body').html(cont);
    }
    
	// 환자정보조회 스크립트 끝
	
	
	// 처치내역 스크립트 시작
	
	// DB에서 처치내역 리스트를 가져와서 갱신
	function getMedicineOrderList(selectedClinicNo){
		$.ajax({
			url: '/nurse/getMedicineOrderList',
			data: {'admiNo' : currentAdmiNo},
    		dataType: 'json',
    		type: 'post',
    		beforeSend:function(xhr){
    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    		},
    		success: function(rst){
    			console.log('입원번호 ', currentAdmiNo, '로 가져온  처치내역 리스트 : ', rst);
    			
    			// 첫번째 내역을 출력시켜주기위한 변수
    			let firstClinicNo = '';
    			
    			// 만약 데이터가 없으면 기본메시지만 출력
    			if(rst.length === 0){
    				let cont = '<h1 class="h1-default">처치 내역이 없습니다</h1>';
    				$('.ward-medicine-order-body').html(cont);
    			} else {
    				
    				let list = '';
    				
    				$.each(rst, function(index, vo){
        				
        				// 시간 포맷변경
        				let date = formatDateStringUpgrade(vo.clinicDetailDt);
        				
        				// 처치대기/처치중/처치완료 여부를 판단하기 위해 배열에 다 담아둠
        				let mdodPfynList = [];
        				let mdodState = '';
        				
        				// vo안의 medicineOrder를 다 뒤져서 처치여부를 배열에 할당
        				$.each(vo.medicineOrderVOList, function(i, medicineOrderVO){
        					// 하나라도 처치완료 상태가 아니면
        					mdodPfynList.push(medicineOrderVO.mdodPfyn);
        				});
        				
        				// 만약 해당 배열 안에 처치 대기가 포함 안돼있으면
        				if(!mdodPfynList.includes('MPYN01')){
        					// 처치 완료인거	
        					mdodState = '<span class="neon-text">처치완료</span>';
        				// 만약 해당 배열 안에 처치 완료가 포함 안돼있으면
        				} else if(!mdodPfynList.includes('MPYN02')) {
        					// 처치 대기인거
        					mdodState = '<span>처치대기</span>';
        				// 그 외엔
        				} else {
        					// 처치 진행중인거
        					mdodState = '<span class="neon-text-red">처치중</span>';
        				}
        				
        				// 만약 selectedClinicNo가 있으면
        				if(selectedClinicNo != null){
        					// 그리고 선택하고싶은 친구의 차례가 된다면?
        					if(vo.clinicNo === selectedClinicNo){
        						list += `
            						<div class="ward-medicine-order-list-cont selected" data-clinicno="\${vo.clinicNo}">
            							<div class="dduk-row">\${date}</div>
            							<div class="dduk-row">\${mdodState}</div>
            						</div>
            					`;
        						// detail에서 출력시킬 clinicNo
        						firstClinicNo = vo.clinicNo;
        					// 그 외엔
        					} else {
        						list += `
            						<div class="ward-medicine-order-list-cont" data-clinicno="\${vo.clinicNo}">
            							<div class="dduk-row">\${date}</div>
            							<div class="dduk-row">\${mdodState}</div>
            						</div>
            					`;
        					}
        				// 만약 selectedClinicNo가 없으면서 첫번째 리스트면
        				} else if(index === 0){
        					list += `
        						<div class="ward-medicine-order-list-cont selected" data-clinicno="\${vo.clinicNo}">
        							<div class="dduk-row">\${date}</div>
        							<div class="dduk-row">\${mdodState}</div>
        						</div>
        					`;
        					firstClinicNo = vo.clinicNo;
        				} else {
        					list += `
        						<div class="ward-medicine-order-list-cont" data-clinicno="\${vo.clinicNo}">
        							<div class="dduk-row">\${date}</div>
        							<div class="dduk-row">\${mdodState}</div>
        						</div>
        					`;
        				}
        			});
        			
        			let cont = `
        				<div class="dduk-row ward-medicine-order-list">
        					\${list}
        				</div>
        				
        				<div class="ward-medicine-order-scroll">
        						
        				</div>`;
        				
        			$('.ward-medicine-order-body').html(cont);
        				
        			// 첫번째 처치내역의 내용 출력
            		getMedicineOrderDetail(firstClinicNo);
    			}
    		},
    		error: function(xhr, status, error){
    			console.log('Error:', xhr, status, error);
    		}
		});
	}
	
	
	// DB에서 처치내역 리스트중 하나를 클릭하면 해당 회진에 대한 기록과 처치 내역을 가져옴
	function getMedicineOrderDetail(clinicNo){
		$.ajax({
			url: '/nurse/getMedicineOrderDetail',
			data: {'clinicNo' : clinicNo},
    		dataType: 'json',
    		type: 'post',
    		beforeSend:function(xhr){
    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    		},
    		success: function(rst){
    			console.log('진료번호 ', clinicNo, '로 가져온  처치내역 상세 : ', rst);
    			
    			let cont = `
    				<h4>회진기록</h4>
    				<textarea class="dduck-input textarea-rounds-history-opinion" readonly="readonly">\${rst.clinicOpinion}</textarea>
    				<br><br>
    				
    				<h4>진단</h4>
    				<div class="table-clinic-history">
    					<table>
    						<thead>
    							<tr>
    								<th class="gray-text" style="width: 15%">분류</th>
    								<th class="gray-text" style="width: 40%">상병명</th>
    								<th class="gray-text" style="width: 30%">발병일</th>
    								<th class="gray-text" style="width: 15%">환부</th>
    							</tr>
    						</thead>
    						<tbody>`;
    						
    						// 상병 진단 출력
    						$.each(rst.injuryDiagnosisVOList, function(index, vo){
    							cont += '<tr>';
    							if(vo.indiType === 'IDTY01'){
    								cont += '<td>주</td>';
    							} else if(vo.indiType === 'IDTY02'){
    								cont += '<td>부</td>';
    							} else if(vo.indiType === 'IDTY03'){
    								cont += '<td>배제</td>';
    							}
								cont += '<td>'+truncateText(vo.injuryVO.ijNm, 12)+'</td>';
								cont += '<td>'+vo.indiDt+'</td>';
								cont += '<td>'+vo.injuryBodyCdNm+'</td>';
								cont += '</tr>'
    						});
    							
    				cont += `
    						</tbody>
    					</table>
    				</div>
    				<br>
    				
    				<h4>처방오더</h4>
    				<div class="table-clinic-history">
    					<table>
    						<thead>
    							<tr>
    								<th class="gray-text w-25">이름</th>
    								<th class="gray-text w-40">용법</th>
    								<th class="gray-text w-15">처방량</th>
    								<th class="gray-text w-20">처치여부</th>
    							</tr>
    						</thead>
    					<tbody>`;
    					
    					// 처방 오더 출력
    					$.each(rst.medicineOrderVOList, function(index, vo){
    						cont += '<tr>';
    						cont += '<td>'+vo.medicineVO.mediNm+'</td>';
    						
    						let mediDetail = vo.medicineVO.mediDetail;
    						
    						// 1. 약품상세에 '연고' 라는 이름이 들어갈 때 -> 용법(투여주기 일 투여횟수 회) 처방량(-일분)
    						if(mediDetail.indexOf('연고') !== -1) {
    							cont += '<td>'+vo.mdodDay+'일 '+vo.mdodPer+'회</td>';
        						cont += '<td>'+vo.mdodQt+'일분</td>';
    						// 2. 약품상세가 주사일 때, 기타 처방 일 때 -> 용법(-) 처방량(-)
    						} else if(mediDetail === '주사' || mediDetail === '기타 처방') {
    							cont += '<td>-</td>';
        						cont += '<td>-</td>';
    						// 3. 패치형 진통제인 경우 -> 용법(-) 처방량(-개)
    						} else if(mediDetail === '패치형 진통제') {
    							cont += '<td>-</td>';
        						cont += '<td>'+vo.mdodQt+'개</td>';
    						// 4. 기본 -> 용법(투여주기 일 투여횟수 회 투여량 알) 처방량(-일분)
    						} else {
    							cont += '<td>'+vo.mdodDay+'일 '+vo.mdodPer+'회 '+vo.mdodDose+'알</td>';
        						cont += '<td>'+vo.mdodQt+'일분</td>';
    						}
    						
    						// 처치대기/완료 판단
    						if(vo.mdodPfyn === 'MPYN01'){
    							cont += '<td><button data-medicd="'+vo.mediCd+'" class="dduk-btn-disabled btn-mini">처치대기</button></td>';
    						} else {
    							cont += '<td><button data-medicd="'+vo.mediCd+'" class="dduk-btn-info btn-mini">처치완료</button></td>';
    						}
    						
    						cont += '</tr>';
    					});
    					
    			cont += `</tbody>
    				</table>
    				</div>
    				<br>`;
    				
    			$('.ward-medicine-order-scroll').html(cont);
    		},
    		error: function(xhr, status, error){
    			console.log('Error:', xhr, status, error);
    		}
		});
	}
	
	
	// 처치내역 날짜 리스트 클릭시 이벤트
	$(document).on('click', '.ward-medicine-order-list-cont', function(){
    	$('.ward-medicine-order-list-cont').removeClass('selected');
    	$(this).addClass('selected');
    	
    	// 해당 처치내역의 자세한 내용 출력
    	let clinicNo = $(this).data('clinicno');
    	getMedicineOrderDetail(clinicNo);
	});
	
	
	// 처치대기 버튼 클릭시
	$(document).on('click', '.dduk-btn-disabled.btn-mini', function(){
		Swal.fire({
			title: '처치상태를 완료로 바꾸시겠습니까?',
			icon: 'question',
			showCancelButton: true,
			confirmButtonColor: '#0ABAB5',
			cancelButtonColor: '#8D9EA5',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			// 확인버튼 클릭시
			if (result.isConfirmed) {
				Swal.fire({
					title: '변경되었습니다!',
					icon: 'success',
					confirmButtonColor: '#0ABAB5',
					confirmButtonText: '확인',
				})
				
				// DB에 반영
				let clinicNo = $('.ward-medicine-order-list-cont.selected').data('clinicno');
				let mediCd = $(this).data('medicd');
				let data = {
					'clinicNo' : clinicNo,
					'mediCd' : mediCd
				};
				
				$.ajax({
		    		url: '/nurse/updateMedicineOrderState',
		    		data: JSON.stringify(data),
		    		contentType: "application/json; UTF-8",
		    		dataType: 'json',
		    		type: 'post',
		    		beforeSend:function(xhr){
		    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		    		},
		    		success: function(rst){
		    			console.log(data, '를 기준으로 바꾼 처방오더상태 업데이트 결과 : ', rst);
		    			
		    			// 새로고침
						getMedicineOrderList(clinicNo);
		    		},
		    		error: function(xhr, status, error){
		    			console.log('Error:', xhr, status, error);
		    		}
				})
			}
		});
	});
	
	// 처치내역 리스트 클릭시 이벤트
	
	
	// 대기중인 처치여부 클릭시 이벤트
	
	// 처치내역 스크립트 끝
	
	
	// 병동목록 스크립트 시작
	
	// 페이지가 로딩될 때 병상 불러오기 및 DB에서 정보갱신
    updateWardBed();
    getAmsPatientVOList();
    
 	// DB에서 병상 정보들을 불러옴(환자번호, 입원번호, 담당의, 병상번호 등)
    function getAmsPatientVOList(){
    	$.ajax({
    		url: '/ams/getAmsPatientVOList',
    		dataType: 'json',
    		type: 'post',
    		beforeSend:function(xhr){
    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    		},
    		success: function(rst){
    			console.log('가져온 병상정보 : ', rst);
    			
    			// 가져온 VO만큼 반복
    			$.each(rst, function(index, patientVO){
    				// 침상정보가 담긴 div를 가져온다
    				let roomNo = $('#' + patientVO.admissionRoomVOList[0].adrmRoomno + "-" + patientVO.admissionRoomVOList[0].adrmBedno);
    				// 2인실인지 아닌지를 판단하는 변수
    				var is2room = patientVO.admissionRoomVOList[0].adrmRoomno.includes('30');
    				// svg 정보를 교체(회색 -> 연두)
    				let newSvg = '';
    				if(is2room){
    					newSvg += `<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto">`;
    				} else {
    					newSvg += `<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">`;
    				}
    				newSvg += `<g clip-path="url(#clip0_688_430)">
    					<path d="M23.3335 43.3337C28.8668 43.3337 33.3335 38.867 33.3335 33.3337C33.3335 27.8003 28.8668 23.3337 23.3335 23.3337C17.8002 23.3337 13.3335 27.8003 13.3335 33.3337C13.3335 38.867 17.8002 43.3337 23.3335 43.3337ZM63.3335 23.3337H43.3335C39.6668 23.3337 36.6668 26.3337 36.6668 30.0003V46.667H10.0002V20.0003C10.0002 18.167 8.50016 16.667 6.66683 16.667C4.8335 16.667 3.3335 18.167 3.3335 20.0003V63.3337C3.3335 65.167 4.8335 66.667 6.66683 66.667C8.50016 66.667 10.0002 65.167 10.0002 63.3337V56.667H70.0002V63.3337C70.0002 65.167 71.5002 66.667 73.3335 66.667C75.1668 66.667 76.6668 65.167 76.6668 63.3337V36.667C76.6668 29.3003 70.7002 23.3337 63.3335 23.3337Z" fill="#0ABAB5"/>
    					</g>
    					<defs>
    					<clipPath id="clip0_688_430">
    					<rect width="80" height="80" fill="white"/>
    					</clipPath>
    					</defs>
    					</svg>`;
    				roomNo.find('svg').remove().end().append(newSvg);
    				// 배경색 변경
    				roomNo.css('background-color', '#DBF2F4');
    				// 이름 변경
    				roomNo.find('.d-flex-column').find('div.gray-text').text(patientVO.paName);
    				// 이름, 방번호에 css적용
    				roomNo.find('h2').addClass('light-green-text');
    				roomNo.find('.d-flex-column').find('div.gray-text').addClass('light-green-text');
    				roomNo.find('.d-flex-column').find('div.gray-text').removeClass('gray-text');
    				// 마우스 커서 올려둠
    				roomNo.css('cursor', 'pointer');
    				// 침대에 쓰고있다는 표시의 클래스를 넣어준다
    				roomNo.addClass('using');
    				// 병상 div에 환자번호, 입원번호를 숨겨둠
    				roomNo.attr('data-pano', patientVO.paNo);
    				roomNo.attr('data-admino', patientVO.admissionChartVOList[0].admiNo);
    			});
    		},
    		error: function(xhr, status, error){
    			console.log('Error:', xhr, status, error);
    		}
    	});
    }
 	
 	
 	// n인실 클릭시 이벤트
    $(document).on('click', '.room-tab', function(){
    	// 이전에 적용됐던 클릭시 효과를 지우고 방금 클릭한곳에 적용
    	$(this).removeClass('tab-active');
    	$('.room-tab').not(this).addClass('tab-active');
    	
    	// 2인실 선택시 본인제외하고 모두 안보이게, 본인은 보이게
    	if($(this).text() == '2인실') {
    		$('.bed-list-2').removeClass('hidden');
    		$('.bed-list-4').addClass('hidden');
    		$('.bed-list-6').addClass('hidden');
    	} else if($(this).text() == '4인실') {
    		$('.bed-list-2').addClass('hidden');
    		$('.bed-list-4').removeClass('hidden');
    		$('.bed-list-6').addClass('hidden');
    	} else if($(this).text() == '6인실') {
    		$('.bed-list-2').addClass('hidden');
    		$('.bed-list-4').addClass('hidden');
    		$('.bed-list-6').removeClass('hidden');
    	}
    });
 	
 	
 	// 활성화된 병상 클릭시 이벤트, 회진차트를 불러옴
    $(document).on('click', '.using', function() {
    	
    	// 화면 전환효과(깡통페이지들 출력)
    	updateNurseChart();  // 간호차트 출력
    	updateNurseRecord(); // 간호기록 출력
    	updateHandOver();    // 인수인계 출력
    	
    	// 환자번호가져오기 
    	currentPaNo = $(this).data('pano');
    	// 입원번호가져오기
    	currentAdmiNo = $(this).data('admino');
    	
    	// DB에서 데이터를 가져와 환자정보 갱신하기
    	updatePaInfo(currentPaNo);
    	
    	// DB에서 데이터를 가져와 해당 입원의 처치내역 갱신하기
    	getMedicineOrderList();
    	
    	// DB에서 간호차트 리스트를 가져오고 담당의, 입원일, 퇴원예정일을 갱신
    	getNurseChartList();
    	
    	// 간호기록중 첫번째로 선택될 식이 갱신
    	updateDietTab();
    	
    	// DB에서 인수인계를 가져와서 갱신
    	getHandOverList();
    });
 	
 	
	// 회진차트 뒤로가기, 병상정보를 불러옴
    $(document).on('click', '#undoNurseChart', function(){
    	// 최근조회 환자번호, 입원번호 초기화
    	currentPaNo = '';
    	currentAdmiNo = '';
    	// 병상정보 불러오기
    	updateWardBed();
    	// DB에서 병상정보를 가져와서 페이지에 갱신
    	getAmsPatientVOList();
    	// 왼쪽창 초기화
    	resetLeftData();
    });
	
	
	// 병상정보 불러오기
	function updateWardBed() {
		let cont = `
			<div class="d-flex">
	         <div class="d-flex patient-info btn-room-change">
	            <div class="d-flex">
	               <button class="room-tab" id="twinRoom">2인실</button>
	            </div>
	            <div class="d-flex">
	               <button class="room-tab tab-active" id="familyRoom">4인실</button>
	            </div>
	            <div class="d-flex">
	               <button class="room-tab tab-active" id="suiteRoom">6인실</button>
	            </div>
	         </div>
	      </div>

		<div class="dduk-body-border rounds-bed-list">
		
			<div class="bed-list-2">
				<h2 class="title-bed-2">304호 </h2>
						
						<div class="bed-wrap-2">
				        	<div class="d-flex" style="margin: 0;">
								<div id="304-1" class="d-flex bed-large" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
								<div class="d-flex-column"><h2>304-1</h2><div class="gray-text">빈 침상</div></div>
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
				        	</div>
				        
				        	<div class="d-flex" style="margin: 0;">
								<div id="304-2" class="d-flex bed-large" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
								<div class="d-flex-column"><h2>304-2</h2><div class="gray-text">빈 침상</div></div>
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
				        	</div>
				        </div>
				        
				        <h2 class="title-bed-2">305호 </h2>
						
						<div class="bed-wrap-2">
				        	<div class="d-flex" style="margin: 0;">
								<div id="305-1" class="d-flex bed-large" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				        		<div class="d-flex-column"><h2>305-1</h2><div class="gray-text">빈 침상</div></div>
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
				        	</div>
				        
				        	<div class="d-flex" style="margin: 0;">
				            	<div id="305-2" class="d-flex bed-large" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				            	<div class="d-flex-column"><h2>305-2</h2><div class="gray-text">빈 침상</div></div>
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
				        	</div>
				        </div>
				        
				        <h2 class="title-bed-2">306호 </h2>
						
						<div class="bed-wrap-2">
				        	<div class="d-flex" style="margin: 0;">
								<div id="306-1" class="d-flex bed-large" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				        		<div class="d-flex-column"><h2>306-1</h2><div class="gray-text">빈 침상</div></div>
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
				        	</div>
				        
				        	<div class="d-flex" style="margin: 0;">
				            	<div id="306-2" class="d-flex bed-large" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				            	<div class="d-flex-column"><h2>306-2</h2><div class="gray-text">빈 침상</div></div>
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
				        	</div>
				        </div>
				        
				        <h2 class="title-bed-2">307호 </h2>
						
						<div class="bed-wrap-2">
				        	<div class="d-flex" style="margin: 0;">
								<div id="307-1" class="d-flex bed-large" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				        		<div class="d-flex-column"><h2>307-1</h2><div class="gray-text">빈 침상</div></div>
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
				        	</div>
				        
				        	<div class="d-flex" style="margin: 0;">
				            	<div id="307-2" class="d-flex bed-large" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				            	<div class="d-flex-column"><h2>307-2</h2><div class="gray-text">빈 침상</div></div>
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
				        	</div>
				        </div>
					</div>
					
					<div class="bed-list-4 hidden"> 
						<h2 class="title-bed-4">404호 </h2>
				
						<div class="bed-wrap-4">
				        	<div class="d-flex" style="margin: 0;">
								<div id="404-1" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				        		<div class="d-flex-column"><h2>404-1</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
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
				        
				        	<div class="d-flex" style="margin: 0;">
				            	<div id="404-2" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				            	<div class="d-flex-column"><h2>404-2</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
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
				        	
				        	<div class="d-flex" style="margin: 0;">
								<div id="404-3" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				        		<div class="d-flex-column"><h2>404-3</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
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
				        	
				        	<div class="d-flex" style="margin: 0;">
								<div id="404-4" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				        		<div class="d-flex-column"><h2>404-4</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
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
				        
				        <h2 class="title-bed-4">405호 </h2>
						
						<div class="bed-wrap-4">
				        	<div class="d-flex" style="margin: 0;">
								<div id="405-1" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				        		<div class="d-flex-column"><h2>405-1</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
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
				        
				        	<div class="d-flex" style="margin: 0;">
				            	<div id="405-2" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				            	<div class="d-flex-column"><h2>405-2</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
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
				        	
				        	<div class="d-flex" style="margin: 0;">
								<div id="405-3" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				        		<div class="d-flex-column"><h2>405-3</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
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
				        	
				        	<div class="d-flex" style="margin: 0;">
								<div id="405-4" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				        		<div class="d-flex-column"><h2>405-4</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
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
				        
				        <h2 class="title-bed-4">406호 </h2>
						
						<div class="bed-wrap-4">
				        	<div class="d-flex" style="margin: 0;">
								<div id="406-1" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				        		<div class="d-flex-column"><h2>406-1</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
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
				        
				        	<div class="d-flex" style="margin: 0;">
				            	<div id="406-2" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				            	<div class="d-flex-column"><h2>406-2</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
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
				        	
				        	<div class="d-flex" style="margin: 0;">
								<div id="406-3" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				        		<div class="d-flex-column"><h2>406-3</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
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
				        	
				        	<div class="d-flex" style="margin: 0;">
								<div id="406-4" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%; margin-right: 20px;">
				        		<div class="d-flex-column"><h2>406-4</h2><div class="gray-text">빈 침상</div></div>
				            		<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
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
				    
				    
				    <div class="bed-list-6 hidden"> 
				    	<div class="dduk-inner-border bed-list-6-left">
				    		<h2 class="title-bed-6">504호 </h2>
				    		<div class="bed-wrap-6">
				    			<div class="dduk-row">
				    				<div class="d-flex" style="margin: 0;">
										<div id="504-1" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%;">
				        					<div class="d-flex-column"><h2>504-1</h2><div class="gray-text">빈 침상</div></div>
				            					<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
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
				        			<div class="d-flex" style="margin: 0;">
										<div id="504-2" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%;">
				        					<div class="d-flex-column"><h2>504-2</h2><div class="gray-text">빈 침상</div></div>
				            					<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
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
				    			<div class="dduk-row">
				    				<div class="d-flex" style="margin: 0;">
										<div id="504-3" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%;">
				        					<div class="d-flex-column"><h2>504-3</h2><div class="gray-text">빈 침상</div></div>
				            					<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
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
				        			<div class="d-flex" style="margin: 0;">
										<div id="504-4" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%;">
				        					<div class="d-flex-column"><h2>504-4</h2><div class="gray-text">빈 침상</div></div>
				            					<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
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
				    			<div class="dduk-row">
				    				<div class="d-flex" style="margin: 0;">
										<div id="504-5" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%;">
				        					<div class="d-flex-column"><h2>504-5</h2><div class="gray-text">빈 침상</div></div>
				            					<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
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
				        			<div class="d-flex" style="margin: 0;">
										<div id="504-6" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%;">
				        					<div class="d-flex-column"><h2>504-6</h2><div class="gray-text">빈 침상</div></div>
				            					<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
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
						<div class="dduk-inner-border bed-list-6-right">
				    		<h2 class="title-bed-6">505호 </h2>
				    		<div class="bed-wrap-6">
				    			<div class="dduk-row">
				    				<div class="d-flex" style="margin: 0;">
										<div id="505-1" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%;">
				        					<div class="d-flex-column"><h2>505-1</h2><div class="gray-text">빈 침상</div></div>
				            					<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
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
				        			<div class="d-flex" style="margin: 0;">
										<div id="505-2" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%;">
				        					<div class="d-flex-column"><h2>505-2</h2><div class="gray-text">빈 침상</div></div>
				            					<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
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
				    			<div class="dduk-row">
				    				<div class="d-flex" style="margin: 0;">
										<div id="505-3" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%;">
				        					<div class="d-flex-column"><h2>505-3</h2><div class="gray-text">빈 침상</div></div>
				            					<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
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
				        			<div class="d-flex" style="margin: 0;">
										<div id="505-4" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%;">
				        					<div class="d-flex-column"><h2>505-4</h2><div class="gray-text">빈 침상</div></div>
				            					<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
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
				    			<div class="dduk-row">
				    				<div class="d-flex" style="margin: 0;">
										<div id="505-5" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%;">
				        					<div class="d-flex-column"><h2>505-5</h2><div class="gray-text">빈 침상</div></div>
				            					<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
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
				        			<div class="d-flex" style="margin: 0;">
										<div id="505-6" class="d-flex bed-small" style="padding: 16px 24px 16px 16px; margin: 0px; width:48%;">
				        					<div class="d-flex-column"><h2>505-6</h2><div class="gray-text">빈 침상</div></div>
				            					<svg xmlns="http://www.w3.org/2000/svg" width="80" height="80" viewBox="0 0 80 80" fill="none" style="margin-left: auto; margin-top:50px">
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
		`
		
		$('.ward-right-wrap').html(cont);
	}
	
	// 병동목록 스크립트 끝
	
	// 간호차트 스크립트 시작
	
	// 간호차트 날짜 클릭시 이벤트
	$(document).on('click', '.nurse-chart-list-date', function(){
		// 간호차트 번호 가져오기
		let nurNo = $(this).data('nurno');
		// 차트 내용 출력
		getNurseChartDetail(nurNo);
	});
	
	
	// 간호차트 추가버튼 클릭시 이벤트
	$(document).on('click', '#createNurseChart', function(){
		let cont = `
		<div class="nurse-chart-write-title">
			<div class="dduk-row">
				<h2>차트작성</h2>
				<button type="button" class="auto-complete-btn complete1" style="margin-left: -15px; margin-top: -6px;">
	               <svg width="24" height="24" viewBox="0 0 600 600" fill="none" xmlns="http://www.w3.org/2000/svg">
	                  <path class="auto-complete-btn-path" d="m495.6 49.23-32.82-32.82C451.8 5.471 437.5 0 423.1 0c-14.33 0-28.66 5.469-39.6 16.41l-216 216.09c-8.4 7.5-12.7 17-15.1 27.3l-24.1 107.4c-1.8 8.9 5.1 16.8 12.8 16.8.916 0 1.852-.092 2.797-.281 0 0 74.03-15.71 107.4-23.56 10.1-2.377 19.13-7.46 26.46-14.79l217-217C517.5 106.5 517.4 71.1 495.6 49.23zM461.7 94.4l-217 217c-1.1 1.1-2.2 1.7-3.5 2-13.7 3.227-34.65 7.857-54.3 12.14l12.41-55.2c.29-1.44.99-2.84 2.09-3.84L417.5 50.4c1.9-1.99 4.1-2.4 5.6-2.4s3.715.406 5.65 2.342l32.82 32.83c3.23 3.168 3.23 8.098.13 11.228zM424 288c-13.25 0-24 10.75-24 24v128c0 13.23-10.78 24-24 24H72c-13.22 0-24-10.77-24-24V136c0-13.23 10.78-24 24-24h144c13.25 0 24-10.75 24-24s-10.7-24-24-24l-144.9-.01C32.31 63.99 0 96.29 0 135.1v304C0 479.7 32.31 512 71.1 512h303.1c39.69 0 71.1-32.3 71.1-72l2.7-128c0-13.2-10.7-24-24-24z" fill="#8d9ea5">
	                  </path>
	               </svg>
	            </button>
			</div>
			<button class="dduk-btn-info btn-nurse-chart-save">저장</button>
		</div>
		<div class="dduk-row">
			<textarea id="nurCont" class="dduck-input"></textarea>
		</div>
		`
		$('.nurse-chart-cont').html(cont);
	});
	
	
	// DB에서 간호차트 리스트와 간단한 입원정보를 가져옴
	function getNurseChartList(){
		$.ajax({
    		url: '/nurse/getNurseChartList',
    		data: {'admiNo' : currentAdmiNo},
    		dataType: 'json',
    		type: 'post',
    		beforeSend:function(xhr){
    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    		},
    		success: function(rst){
    			console.log('입원번호 ', currentAdmiNo, '로 가져온 입원정보 + 간호차트 : ', rst);
    			
    			// 담당의사, 입원일, 퇴원예정일 부터 뿌려줌
    			$('.calendar-wrap').find('.empName').text(rst.admiEmpName);
    			$('.calendar-wrap').find('.inDt').text(rst.admiIndt);
    			$('.calendar-wrap').find('.expOutDt').text(rst.admiExpOutdt);
    			
    			// 간호차트 리스트 갱신
    			let cont = '';
    			// +버튼 만들어주기~
    			cont += `
    				<svg id="createNurseChart" type="button"
					xmlns="http://www.w3.org/2000/svg" width="24" height="24"
					viewBox="0 0 24 24" fill="none">
					<g clip-path="url(#clip0_142_1638)">
					<path
						d="M18 13H13V18C13 18.55 12.55 19 12 19C11.45 19 11 18.55 11 18V13H6C5.45 13 5 12.55 5 12C5 11.45 5.45 11 6 11H11V6C11 5.45 11.45 5 12 5C12.55 5 13 5.45 13 6V11H18C18.55 11 19 11.45 19 12C19 12.55 18.55 13 18 13Z"
						fill="#8D9EA5"></path>
					</g>
					<defs>
					<clipPath id="clip0_142_1638">
					<rect width="24" height="24" fill="white"></rect>
					</clipPath>
					</defs>
					</svg>
    			`;
    			// 만약 간호차트 기록이 없다면
    			if(rst.nurChartVOList.length === 0){
    				cont += '<div class="rounds-chart-list-default">차트 기록이 없습니다</div>'
    			} else {
    				$.each(rst.nurChartVOList, function(index, vo){
    					cont += '<div data-nurno="'+vo.nurNo+'" class="nurse-chart-list-date">'+formatDateString(vo.nurEndt)+'</div>';
    				});
    			}
    			$('.nurse-chart-list').html(cont);
    		},
    		error: function(xhr, status, error){
    			console.log('Error:', xhr, status, error);
    		}
    	});
	}
	
	
	// 간호기록 번호로 DB에서 간호차트 내용과 작성자를 가져옴
	function getNurseChartDetail(nurNo){
		$.ajax({
    		url: '/nurse/getNurseChartDetail',
    		data: {'nurNo' : nurNo},
    		dataType: 'json',
    		type: 'post',
    		beforeSend:function(xhr){
    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    		},
    		success: function(rst){
    			console.log('간호차트번호 ', nurNo, '로 가져온 간호차트VO : ', rst);
    			
    			// 간호차트 갱신
    			let cont = '';
    			let date = formatDateStringUpgrade(rst.nurEndt);
    			
    			cont += `
    				<div class="nurse-chart-view-title">
    					<h2>차트조회</h2>
    				<h3 class="nurse-chart-view-date">\${date}</h3>
    				</div>
    				<div class="dduk-row">
    					<textarea id="nurCont" class="dduck-input" readonly>작성자: \${rst.nurChartEmpName}\n\${rst.nurCont}</textarea>
    				</div>
    			`;
    			$('.nurse-chart-cont').html(cont);
    			
    		},
    		error: function(xhr, status, error){
    			console.log('Error:', xhr, status, error);
    		}
    	});
	}
	
	
	// 간호차트 저장버튼 클릭시 이벤트
	$(document).on('click', '.btn-nurse-chart-save', function(){
		
		Swal.fire({
			title: '차트를 저장하시겠습니까?',
			icon: 'question',
			showCancelButton: true,
			confirmButtonColor: '#0ABAB5',
			cancelButtonColor: '#8D9EA5',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			// 확인버튼 클릭시
			if (result.isConfirmed) {
				// 내용 입력 안됐으면 경고
				if($('#nurCont').val() === ''){
					Swal.fire({
						title: '내용을 입력해주세요',
						icon: 'warning',
						confirmButtonColor: '#0ABAB5',
						confirmButtonText: '확인',
					})
					return;
				}
				
				// DB에 넣어줉 데이터
				let data = {
					'admiCd' : currentAdmiNo,
					'nurCont' : $('#nurCont').val(),
					'nurType' : 'NCSO01'
				}
				
				$.ajax({
		    		url: '/nurse/createNurseChart',
		    		data: JSON.stringify(data),
		    		type: 'post',
		    		dataType: 'json',
		    		contentType: "application/json; UTF-8",
		    		beforeSend: function(xhr){
		    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		    		},
		    		success: function(rst){
		    			console.log("간호차트 넣은 결과 : ", rst);
		    			
		    			// 새로 추가됐으니 리스트 갱신
		    			getNurseChartList();
		    			
		    			// 방금 추가된거로 이동
		    			getNurseChartDetail(rst.nurNo);
		    			
		    			Swal.fire({
							title: '차트가 저장되었습니다',
							icon: 'success',
							confirmButtonColor: '#0ABAB5',
							confirmButtonText: '확인',
						})
		    		},
		    		error: function(xhr, status, error){
		    			console.log('Error:', xhr, status, error);
		    		}
		    	});
			}
		});
	});
	
	
	// 간호차트 깡통 출력
	function updateNurseChart(){
		let cont = `
			<div class="nurse-chart-record-wrap">
				<div class="dduk-body-border nurse-chart">
					<div class="dduk-title-area nurse-chart-header">
						<div class="d-flex">
							<h2>간호차트</h2>
							<img id="undoNurseChart" class="icon-undo" src="/resources/images/icons/undo.png">
						</div>
					</div>
				
					<div class="d-flex nurse-chart-body">
						<div class="nurse-chart-list">
							
						</div>
	
						<div class="nurse-chart-detail">
							<div class="nurse-chart-body-top">
								<div class="calendar-wrap">
	
									<div class="dduk-row">
										<img class="icon-stethoscope" src="/resources/images/icons/stethoscope.png">
										<div class="date-wrap">
											<div>담당의사</div>
											<div class="empName">김영남</div>
										</div>
									</div>
				
									<div class="dduk-row"> 
										<img class="icon-calendar" src="/resources/images/icons/calendar.png">
										<div class="date-wrap">
											<div>입원일</div>
											<div class="inDt">2023-12-22</div>
										</div>
									</div>
	
									<div class="dduk-row">
										<img class="icon-calendar" src="/resources/images/icons/calendar.png">
										<div class="date-wrap">
											<div>퇴원예정일</div>
											<div class="expOutDt">2023-12-28</div>
										</div>
									</div>
	
								</div>
							</div>
							<div class="nurse-chart-cont flex-d-col">
								<div class="nurse-chart-write-title">
									<div class="dduk-row">
										<h2>차트작성</h2>
										<button type="button" class="auto-complete-btn complete1" style="margin-left: -15px; margin-top: -6px;">
							               <svg width="24" height="24" viewBox="0 0 600 600" fill="none" xmlns="http://www.w3.org/2000/svg">
							                  <path class="auto-complete-btn-path" d="m495.6 49.23-32.82-32.82C451.8 5.471 437.5 0 423.1 0c-14.33 0-28.66 5.469-39.6 16.41l-216 216.09c-8.4 7.5-12.7 17-15.1 27.3l-24.1 107.4c-1.8 8.9 5.1 16.8 12.8 16.8.916 0 1.852-.092 2.797-.281 0 0 74.03-15.71 107.4-23.56 10.1-2.377 19.13-7.46 26.46-14.79l217-217C517.5 106.5 517.4 71.1 495.6 49.23zM461.7 94.4l-217 217c-1.1 1.1-2.2 1.7-3.5 2-13.7 3.227-34.65 7.857-54.3 12.14l12.41-55.2c.29-1.44.99-2.84 2.09-3.84L417.5 50.4c1.9-1.99 4.1-2.4 5.6-2.4s3.715.406 5.65 2.342l32.82 32.83c3.23 3.168 3.23 8.098.13 11.228zM424 288c-13.25 0-24 10.75-24 24v128c0 13.23-10.78 24-24 24H72c-13.22 0-24-10.77-24-24V136c0-13.23 10.78-24 24-24h144c13.25 0 24-10.75 24-24s-10.7-24-24-24l-144.9-.01C32.31 63.99 0 96.29 0 135.1v304C0 479.7 32.31 512 71.1 512h303.1c39.69 0 71.1-32.3 71.1-72l2.7-128c0-13.2-10.7-24-24-24z" fill="#8d9ea5">
							                  </path>
							               </svg>
							            </button>
							        </div>
									<button class="dduk-btn-info btn-nurse-chart-save">저장</button>
								</div>
								<div class="dduk-row">
									<textarea id="nurCont" class="dduck-input"></textarea>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>`;
		
		$('.ward-right-wrap').html(cont);
	}
	
	// 간호차트 스크립트 끝
	
	// 간호기록 스크립트 시작
	
	// 간호기록 추가 버튼 클릭
	$(document).on('click', '#createNurRecord', function(){
		
		// 지금 어떤 탭이 선택돼있는지에 따라 모달을 다르게 띄워야함
		
		// 식이 선택시
		if ($('.nurse-record-aside-tab.record-tab-selected').text() === '식이') {
			
			resetDietModal();
			$('#createDietModal').modal('show');
			var picker = $('#dietTime').data('daterangepicker');
			
		// 혈압 선택시
		} else if ($('.nurse-record-aside-tab.record-tab-selected').text() === '혈압') {
			
			// 혈압 추가 swal 띄우기
			insertBlood();
			
		// 체온 선택시
		} else if($('.nurse-record-aside-tab.record-tab-selected').text() === '체온'){
			
			// 체온 추가 swal 띄우기
			insertTemp();	
		
		// I/O 선택시
		} else if($('.nurse-record-aside-tab.record-tab-selected').text() === 'I/O'){
			
			// I/O 추가 swal 띄우기
			insertIo();
		}
	});
	
	
	// 차트 임시저장 및 삭제를 위해 선언한 변수
	let chartData = null;
	
	
	// 왼쪽 탭 누를때 이벤트들
	$(document).on('click', '.nurse-record-aside-tab', function(){
		$('.nurse-record-aside-tab').removeClass('record-tab-selected');
		$(this).addClass('record-tab-selected');
		
		let btnText = $(this).text();
		if(btnText === '식이'){
			updateDietTab();
		} else if(btnText === '혈압'){
			updateBloodTab();
		} else if(btnText === '체온'){
			updateTempTab();
		} else if(btnText === 'I/O'){
			updateIoTab();
		}
	});
	
	
	// 간호기록 tr 클릭 이벤트
	$(document).on('click', '.nurse-record-body .tr-data', function(){
		
		// 이미 selected가 적용돼있다면 해제함
		if($(this).hasClass('selected')){
			$(this).removeClass('selected');
		// selected가 없다면 적용시킴	
		} else {
			$(this).addClass('selected');
		}
		
		// tr을 누른 후에 selected된 tr이 없다면 수정 아이콘 숨김
		if($('.nurse-record-body .tr-data').hasClass('selected')){
			
			$('#modifyRecordTr').css('visibility', 'visible');
			
		// 그 외엔 그냥 수정 아이콘을 나오게함
		} else {
			
			$('#modifyRecordTr').css('visibility', 'hidden');
		}
	});
	
	
	// 간호기록 tr 수정버튼 클릭 이벤트
	$(document).on('click', '#modifyRecordTr', function(){
		
		// 만약 데이터가 여러개 선택됐으면
		
		
		Swal.fire({
			title: '선택한 데이터를 수정하시겠습니까?',
			showCancelButton: true,
			confirmButtonColor: '#0ABAB5',
			cancelButtonColor: '#8D9EA5',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			// 확인버튼 클릭시
			if (result.isConfirmed) {
				
			}
		});
	})
	
	
	// 식이 그래프 시작
	// 식이 그래프 출력을 위해 선언한 변수, 식이는 그래프가 3개여서 미리 변수에 담아둔다음 버튼 누르면 해당 데이터 계속 활용하기
	let dietData = {};
	
	// DB에서 해당 입원에 대한 식이정보를 모두 가져옴
	function updateDietTab(){
		$.ajax({
			url: '/nurse/getDietList',
    		data: {'admiNo' : currentAdmiNo},
    		type: 'post',
    		dataType: 'json',
    		beforeSend: function(xhr){
    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    		},
    		success: function(rst){
    			console.log('입원번호 ', currentAdmiNo, "로 가져온 식이 리스트 : ", rst);
    			
    			// 식이 기록이 없으면
    			if(rst.length === 0){
    				let cont = '<h2 class="h2-default">식이 기록이 없습니다</h2>';
    				$('.nurse-record-cont').html(cont);
    			
    			// 식이 기록이 있으면
    			} else {
    				
    				// 그래프 출력을 위해 담아둠
    				dietData = rst;
					
					// 식이 그래프의 틀을 만들어줌
					let cont = `
						<div class="diet-chart-wrap">
							<div class="dduk-row diet-chart-btn-wrap">
								<button class="dduk-btn-disabled btn-diet-chart btn-diet-chart-selected">섭취기록표</button>
								<button class="dduk-btn-disabled btn-diet-chart">섭취메뉴통계</button>
								<button class="dduk-btn-disabled btn-diet-chart">섭취열량통계</button>
							</div>
							<div id="dietChartContainer">
								<canvas id="dietChart"></>
							</div>
						</div>
					`;
					
					$('.nurse-record-cont').html(cont);
					
					// 첫번째 식이 그래프를 출력시켜준다
					drawDietChart(0);
    			}
    		},
    		error: function(xhr, status, error){
    			console.log('Error:', xhr, status, error);
    		}
		});
	}
	
	
	// 식이 그래프 버튼 클릭 이벤트
	$(document).on('click', '.btn-diet-chart', function(){
		$('.btn-diet-chart').removeClass('btn-diet-chart-selected');
		$(this).addClass('btn-diet-chart-selected');
		
		let index = 0;
		let btnText = $(this).text();
		
		if(btnText === '섭취기록표'){
			index = 0;
		} else if(btnText === '섭취메뉴통계'){
			index = 1;
		} else if(btnText === '섭취열량통계'){
			index = 2;
		} 
		
		drawDietChart(index);
	});
	
	
	// 식이 그래프 출력부분
	function drawDietChart(index){
		
		// 기존의 차트 파괴
		if (chartData) {
			chartData.destroy();
    	}
		
		// 섭취기록표 그리는 부분
		if(index === 0){ 
			
			// 표 출력부분
			
			// 우선 DB에서 가져온 데이터를 바탕으로 동적으로 출력될 tr부분부터
			let tbodyTr = '';
			
			$.each(dietData, function(index, vo){
					
				// 칼로리 계산
				let kcal = vo.mealVO.mealKcal * vo.dietQty;
				
				tbodyTr += `
					<tr class="tr-padding tr-data">
						<td class="td-padding-data gray-text" style="padding: 1%;width:145px">\${vo.dietTime}</td>
						<td class="td-padding-data gray-text" style="width:120px">\${vo.mealVO.mealName}</td>
						<td class="td-padding-data gray-text" style="width:80px">\${kcal}Kcal</td>
						<td class="td-padding-data gray-text" style="width:40px">\${vo.dietQty}</td>
					</tr>
				`;
			});  	
			
			// 위에서 생성한 tr + 테이블 더해서 동적으로 만들어주기
			let cont = `
					<table class="table-diet">
						<thead>
							<tr class="tr-padding tr-column">
								<th class="td-padding gray-text" style="width:145px">섭취시간</th>
								<th class="td-padding gray-text" style="width:120px">식사명</th>
								<th class="td-padding gray-text" style="width:80px">열량(Kcal)</th>
								<th class="td-padding gray-text" style="width:40px">수량</th>
							</tr>
						</thead>
						<tbody>
							\${tbodyTr}
						</tbody>
					</table>`;
				
			$('#dietChartContainer').html(cont);
			
		// 섭취메뉴통계 그리는 부분
		} else if(index === 1){
			
			// 우선 dietChartContainer안에 canvas요소를 넣어준다
			let cont = '<canvas id="dietChart"></>';
			$('#dietChartContainer').html(cont);
			
			// 각 식단의 개수 계산
			let mealNameCounts = {};
			
			$.each(dietData, function(index, vo){
				if (mealNameCounts[vo.mealVO.mealName]) {
			    	mealNameCounts[vo.mealVO.mealName] += vo.dietQty;
			    } else {
			    	mealNameCounts[vo.mealVO.mealName] = vo.dietQty;
			    }
			});
			
			const data = {
				labels: Object.keys(mealNameCounts),
			    datasets: [{
			    	label: '섭취한 식단 통계',
			        data: Object.values(mealNameCounts),
			        backgroundColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)',
                        'rgba(201, 203, 207, 1)'
			        ],
			        hoverOffset: 4
				}]
			};

			const config = {
				type: 'doughnut',
			    data: data,
			};

			const ctx = document.getElementById('dietChart').getContext('2d');
			chartData = new Chart(ctx, config);
			
		// 섭취열량통계 그리는 부분
		} else if(index === 2){
			
			// 우선 dietChartContainer안에 canvas요소를 넣어준다
			let cont = '<canvas id="dietChart"></>';
			$('#dietChartContainer').html(cont);
			
			// 날짜별로 그룹화 후 열량만큼 수치를 더함
			let kcalByDate = {};
			
			$.each(dietData, function(index, vo){
				
				let i = dietData.length - index - 1;
				
				// 날짜를 가져와서 yyyy-MM-dd 식으로 변환 후 그걸 기준으로 그룹화
				let dateKey = dietData[i].dietTime.split(' ')[0];
				
				if (kcalByDate[dateKey]) {
					kcalByDate[dateKey] += dietData[i].mealVO.mealKcal;
			    } else {
			    	kcalByDate[dateKey] = dietData[i].mealVO.mealKcal;
			    }
			});
			
			var ctx = document.getElementById('dietChart').getContext('2d');

			chartData = new Chart(ctx, {
	            type: 'bar',
	            data: {
	                labels: Object.keys(kcalByDate),
	                datasets: [{
	                    label: '일별 섭취열량(Kcal)',
	                    data: Object.values(kcalByDate),
	                    backgroundColor: [
	                        'rgba(255, 99, 132, 0.2)',
	                        'rgba(54, 162, 235, 0.2)',
	                        'rgba(255, 206, 86, 0.2)',
	                        'rgba(75, 192, 192, 0.2)',
	                        'rgba(153, 102, 255, 0.2)',
	                        'rgba(255, 159, 64, 0.2)',
	                        'rgba(201, 203, 207, 0.2)'
	                    ],
	                    borderColor: [
	                        'rgba(255, 99, 132, 1)',
	                        'rgba(54, 162, 235, 1)',
	                        'rgba(255, 206, 86, 1)',
	                        'rgba(75, 192, 192, 1)',
	                        'rgba(153, 102, 255, 1)',
	                        'rgba(255, 159, 64, 1)',
	                        'rgba(201, 203, 207, 1)'
	                    ],
	                    borderWidth: 1
	                }]
	            },
	            options: {
	                scales: {
	                    y: {
	                    	beginAtZero: true
	                    }
	                }
	            }
	        });
			
			$('#dietChartContainer').css('width', '510px');
		}
	}
	
	
	// 식이 모달에서 식단 추가시
	$(document).on('click', '#createMeal', function(){
		$('.daterangepicker').css('display', 'none');
		Swal.fire({
			title: '식단을 추가하시겠습니까?',
			showCancelButton: true,
			confirmButtonColor: '#0ABAB5',
			cancelButtonColor: '#8D9EA5',
			confirmButtonText: '확인',
			cancelButtonText: '취소',
			didOpen: () => {
    			$('.daterangepicker').css('display', 'none');
    		}
		}).then((result) => {
			// 확인 버튼 누를 시
			if (result.isConfirmed) {
				$('.daterangepicker').css('display', 'none');
				// 모달 제목 변경
				$('#createDietModal .modal-title').text('식단 추가');
				// 모달 내용을 바꿔야함
				let cont = `
					<img id="trashbinMeal" class="icon-trashbin" src="/resources/images/icons/trashbin.png" style="visibility: visible; position: absolute; margin: -111px 83px; width: 18px; height: 18px;" />
					<div class="dduk-row" style="color: black;display: flex;justify-content: space-around;">
						<span style="font-size: 18px;margin-left: -138px;">식사명</span> 
						<span style="font-size: 18px;margin-left: 0px;position: absolute;">열량</span> 
						<span style="font-size: 18px;margin-right: -124px;">식대</span>
					</div>
					<br>
					<div class="dduk-row" style="display: flex;justify-content: space-between;">
						<input type="text" id="dietName" style="width: 150px;"/>
						<input type="number" id="dietKcal" style="width: 112px;margin-left: -35px;"/><span style="position:absolute;margin-left: 338px;margin-top: 3px;">kcal</span>
						<input type="number" id="dietPrice" style="width: 116px;margin-right: 29px;"/><span style="margin-left: 560px;margin-top: 3px;position:absolute">원</span>
					</div>
				`;
				$('#createDietModal .modal-body').html(cont);
			}
		});
		$('.daterangepicker').css('display', 'none');
	});
	
	
	// 식이 모달에서 식단 삭제 버튼 클릭시
	$(document).on('click', '#trashbinMeal', function(){
		
		// DB에서 식단 가져오기
		$.ajax({
			url: '/nurse/getMealList',
    		dataType: 'json',
    		type: 'post',
    		beforeSend:function(xhr){
    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    		},
    		success: function(rst){
    			console.log('가져온 식단 리스트 : ', rst);
    			
    			// select태그 만들기
    			let option = '';
    			$.each(rst, function(index, vo){
    				option += '<option data-mealcd="'+vo.mealCd+'" value='+vo.mealName+'>'+vo.mealName+'</option>';
    			});
    			
    			let cont = `
    				<select id="swal-select">
    					\${option}
    				</select>
    			`;
    			
    			Swal.fire({
    				title: '삭제할 식단 선택',
    				html: cont,
    				showCancelButton: true,
    				confirmButtonColor: '#0ABAB5',
    				cancelButtonColor: '#8D9EA5',
    				confirmButtonText: '확인',
    				cancelButtonText: '취소',
    				preConfirm: () => {
    					let selectedOption = $('#swal-select option:selected');
    				    return {
    				    	mealNm: selectedOption.val(), 		  // 식단이름
    				    	mealCd: selectedOption.data('mealcd') // 식단코드
    					};
    				}
    			}).then((result) => {
    				// 삭제 확인 선택 시
    				if (result.isConfirmed) {
	   					// DB에서도 삭제
	   					$.ajax({
							url: '/nurse/deleteMeal',
							data: {'mealCd' : result.value.mealCd},
	   						dataType: 'json',
	   						type: 'post',
	   						beforeSend:function(xhr){
	   							xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
	   						},
	   						success: function(rst){
								console.log(result.value.mealCd, '를 삭제한 결과 : ', rst);	   							
	   							Swal.fire(result.value.mealNm + '이 삭제되었습니다!');
	   						},
	   						error: function(xhr, status, error){
	   			    			console.log('Error:', xhr, status, error);
	   			    		}
	   					});
    				}
    			});
    		},
    		error: function(xhr, status, error){
    			console.log('Error:', xhr, status, error);
    		}
		});
	});
	
	
	// 식이 모달 저장시 이벤트
	$(document).on('click', '#btnSaveCreateDietModal', function(){
		
		// 만약 지금이 식단추가이면
		if($('#createDietModal .modal-title').text() === '식단 추가'){
			
			// 입력값 가져오기
			let mealName = $('#dietName').val();
			let mealKcal = $('#dietKcal').val();
			let mealPrice = $('#dietPrice').val();

			// 만약 입력되지 않은 값이 있다면
			if(mealName === '' || mealKcal === '' || mealPrice === ''){
				// 경고
				Swal.fire({
    				title: '입력되지 않은 값이 있습니다!',
    				icon: 'warning',
    				confirmButtonColor: '#0ABAB5',
    				confirmButtonText: '확인',
    			});
    			return;
			}
			
			// DB에 넣을 데이터 처리
			let data = {
				'mealName' : mealName,
				'mealKcal' : mealKcal,
				'mealPrice' : mealPrice
			}
			
			// DB에 넣기
			$.ajax({
				url: '/nurse/insertMeal',
				data: JSON.stringify(data),
	    		dataType: 'json',
	    		type: 'post',
	    		contentType: "application/json; UTF-8",
	    		beforeSend:function(xhr){
	    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
	    		},
	    		success: function(rst){
	    			console.log(data, '를 DB에 넣은 결과 : ', rst);
	    			// 모달 초기화
	    			resetDietModal();
	    			// swal띄우기
	    			Swal.fire({
							title: '식단이 추가되었습니다',
							icon: 'success',
							confirmButtonColor: '#0ABAB5',
							confirmButtonText: '확인',
					})
	    		},
	    		error: function(xhr, status, error){
	    			console.log('Error:', xhr, status, error);
	    		}
			});
			
		// 만약 지금이 식이추가라면
		} else if($('#createDietModal .modal-title').text() === '식이 추가'){
			
			// 입력값 가져오기
			let dietTime = $('#dietTime').val();
			let mealCd = $('#selectMeal :selected').data('mealcd');
			let dietQty = $('#dietQty').val();

			// 만약 입력되지 않은 값이 있다면
			if(dietTime === '' || dietQty === ''){
				// 경고
				Swal.fire({
    				title: '입력되지 않은 값이 있습니다!',
    				icon: 'warning',
    				confirmButtonColor: '#0ABAB5',
    				confirmButtonText: '확인',
    			});
    			return;
			}
			
			// DB에 넣을 데이터 처리
			let data = {
				'admiNo' : currentAdmiNo,
				'dietTime' : dietTime,
				'mealCd' : mealCd,
				'dietQty' : dietQty
			}
			
			// DB에 넣기
			$.ajax({
				url: '/nurse/insertDiet',
				data: JSON.stringify(data),
	    		dataType: 'json',
	    		type: 'post',
	    		contentType: "application/json; UTF-8",
	    		beforeSend:function(xhr){
	    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
	    		},
	    		success: function(rst){
	    			console.log(data, '를 DB에 넣은 결과 : ', rst);
	    			
	    			// 모달창 닫기
	    			$('#createDietModal').modal('hide');
	    			// 모달창 초기화
	    			resetDietModal();
	    			// 식이정보 다시 불러오기
	    			updateDietTab();
	    			// 다시 섭취기록표에 selected 효과 적용
	    			$('.btn-diet-chart').removeClass('btn-diet-chart-selected');
	    			$('.btn-diet-chart').eq(0).addClass('btn-diet-chart-selected');
	    			
	    			// swal띄우기
	    			Swal.fire({
						title: '식이 기록이 추가되었습니다',
						icon: 'success',
						confirmButtonColor: '#0ABAB5',
						confirmButtonText: '확인',
					})
	    		},
	    		error: function(xhr, status, error){
	    			console.log('Error:', xhr, status, error);
	    		}
			});
		}
	});
	
	
	// 식이 모달 종료시 이벤트
	$(document).on('click', '#btnCancelCreateDietModal', function(){
		// 모달 초기화
		resetDietModal();
	});
	
	
	// 식이 모달 초기화 함수
	function resetDietModal(){
		
		// 제목 변경
		$('#createDietModal .modal-title').text('식이 추가');
		
		// DB에서 식단리스트 가져오기
		$.ajax({
			url: '/nurse/getMealList',
    		dataType: 'json',
    		type: 'post',
    		beforeSend:function(xhr){
    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    		},
    		success: function(rst){
    			console.log('가져온 식단 리스트 : ', rst);
    			
    			// select태그 만들기
    			let option = '';
    			$.each(rst, function(index, vo){
    				option += '<option data-mealcd="'+vo.mealCd+'" value='+vo.mealName+'>'+vo.mealName+'</option>';
    			});
    			
    			let select = `
    				<select id="selectMeal" style="margin-left: -53px;">
    					\${option}
    				</select>
    			`;
    			
    			// 내용 변경
    			let cont = `
    				<div class="dduk-row" style="color: black;display: flex;justify-content: space-around;">
    					<span style="font-size: 18px;">섭취시간</span> 
    					<span style="font-size: 18px;">섭취메뉴
    						<svg id="createMeal" type="button" style="position: absolute;margin: 2px;"
    						xmlns="http://www.w3.org/2000/svg" width="24" height="24"
    						viewBox="0 0 24 24" fill="none">
    						<g clip-path="url(#clip0_142_1638)">
    						<path
    							d="M18 13H13V18C13 18.55 12.55 19 12 19C11.45 19 11 18.55 11 18V13H6C5.45 13 5 12.55 5 12C5 11.45 5.45 11 6 11H11V6C11 5.45 11.45 5 12 5C12.55 5 13 5.45 13 6V11H18C18.55 11 19 11.45 19 12C19 12.55 18.55 13 18 13Z"
    							fill="#8D9EA5"></path>
    						</g>
    						<defs>
    						<clipPath id="clip0_142_1638">
    						<rect width="24" height="24" fill="white"></rect>
    						</clipPath>
    						</defs>
    					</svg>
    					</span> 
    					<span style="font-size: 18px;">식사수량</span>
    				</div>
    				<br>
    				<div class="dduk-row" style="display: flex;justify-content: space-between;">
    					<input type="text" id="dietTime" />
    					\${select}
    					<input style="width:70px; margin-right: 56px;"  type="number" id="dietQty" />
    				</div>
    			`;
    				
    			$('#createDietModal .modal-body').html(cont);
    			
    			$('#dietTime').daterangepicker({
    				"singleDatePicker": true,
    			    "timePicker": true,
    		    	"showDropdowns": true,
    		    	"locale": {
    		            "format": "YYYY-MM-DD HH:mm",
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
    		        "parentEl": "dduk-row",
    		   		"startDate": moment(),
    		    	"endDate": moment().add(6, 'days'),
    		    	"opens": "right",
    		    	"buttonClasses": "btn-daterange-diet",
    		    	"applyButtonClasses": "dduk-btn-info",
    		    	"cancelClass": "btn-cancel-daterange-diet"
    			});
    		},
    		error: function(xhr, status, error){
    			console.log('Error:', xhr, status, error);
    		}
		})
	}
	
	
	// 식이 표 수정
	
	
	// 식이 표 삭제
	
	// 식이 그래프 끝
	
	
	// 혈압 그래프 시작
	
	// 혈압 리스트를 변수에 담아놓은다음 3, 7, 30일, 표출력 버튼을 누를 때 재활용
	let bloodData = {};
	
	
	// DB에서 해당 입원에 대한 혈압정보를 모두 가져온 후 그래프를 그려준다
	function updateBloodTab(){
		$.ajax({
			url: '/nurse/getBloodList',
    		data: {'admiNo' : currentAdmiNo},
    		type: 'post',
    		dataType: 'json',
    		beforeSend: function(xhr){
    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    		},
    		success: function(rst){
    			console.log('입원번호 ', currentAdmiNo, "로 가져온 혈압 리스트 : ", rst);
    			
    			// 혈압 기록이 없으면
    			if(rst.length === 0){
    				let cont = '<h2 class="h2-default">혈압 기록이 없습니다</h2>';
    				$('.nurse-record-cont').html(cont);
    			
    			// 혈압 기록이 있으면
    			} else {
    				
    				// 그래프 출력을 위해 담아둠
    				bloodData = rst;
    				
					// 혈압 그래프의 틀을 만들어줌
					let cont = `
						<div class="day-chart-wrap">
							<div class="dduk-row day-btn-wrap">
								<button class="dduk-btn-disabled btn-blood btn-day-chart btn-day-chart-selected">최근3일</button>
								<button class="dduk-btn-disabled btn-blood btn-day-chart">최근7일</button>
								<button class="dduk-btn-disabled btn-blood btn-day-chart">최근30일</button>
								<button class="dduk-btn-disabled btn-blood btn-day-chart">혈압기록표</button>
							</div>
							<div id="bloodChartContainer" class="chartContainer">
								<canvas id="bloodChart"></>
							</div>
						</div>
					`;
					
					$('.nurse-record-cont').html(cont);
    				
					
					// 최근3일의 혈압 그래프를 출력시킨다
					drawBloodChart(0);

    			}
    		},
    		error: function(xhr, status, error){
    			console.log('Error:', xhr, status, error);
    		}
		})
	}
	
	
	// 혈압 그래프 버튼 클릭 이벤트
	$(document).on('click', '.btn-blood', function(){
		
		let index = 0;
		let btnText = $(this).text();
		
		if(btnText === '최근3일'){
			index = 0;
		} else if(btnText === '최근7일'){
			index = 1;
		} else if(btnText === '최근30일'){
			index = 2;
		} else if(btnText === '혈압기록표'){
			index = 3;
		} 
		
		drawBloodChart(index);
	});
	
	
	// 혈압 그래프 출력부분
	function drawBloodChart(index){
		
		// 기존의 차트 파괴
		if (chartData) {
			chartData.destroy();
		}
		
		// 차트를 그릴 데이터를 저장할 변수
		let filteredData = {};
		
		// 최근3일 혈압 데이터 추출
		if(index === 0){
			
			// 날짜 계산을 위한 오늘 날짜 선언
			let today = new Date();
			
			// 2일전으로 날짜 설정 후 0시로 돌림
			let current3Day = new Date();
			current3Day.setDate(today.getDate() - 2);
			current3Day.setHours(0, 0, 0, 0);
			
			// 혈압 데이터만큼 반복
			$.each(bloodData, function(index, vo){
				
				// 만약 최근3일 날짜 이전의 데이터면
			    if(vo.vitDt > current3Day){
			    	filteredData[formatDateStringUpgrade(vo.vitDt)] = {
			    		lowpress : vo.vitLowPress,
			    		highpress : vo.vitHighPress
			    	};
			    }
			});
		
		// 최근7일 혈압 데이터 추출
		} else if(index === 1){
			
			// 날짜 계산을 위한 오늘 날짜 선언
			let today = new Date();
			
			// 6일전으로 날짜 설정 후 0시로 돌림
			let current7Day = new Date();
			current7Day.setDate(today.getDate() - 6);
			current7Day.setHours(0, 0, 0, 0);
			
			// 혈압 데이터만큼 반복
			$.each(bloodData, function(index, vo){
				
				// 만약 최근7일 날짜 이전의 데이터면
			    if(vo.vitDt > current7Day){
			    	filteredData[formatDateStringUpgrade(vo.vitDt)] = {
			    		lowpress : vo.vitLowPress,
			    		highpress : vo.vitHighPress
			    	};
			    }
			});
			
		// 최근30일 혈압 데이터 추출
		} else if(index === 2){
			
			// 날짜 계산을 위한 오늘 날짜 선언
			let today = new Date();
			
			// 29일전으로 날짜 설정 후 0시로 돌림
			let current30Day = new Date();
			current30Day.setDate(today.getDate() - 29);
			current30Day.setHours(0, 0, 0, 0);
			
			// 혈압 데이터만큼 반복
			$.each(bloodData, function(index, vo){
				
				// 만약 최근3일 날짜 이전의 데이터면
			    if(vo.vitDt > current30Day){
			    	filteredData[formatDateStringUpgrade(vo.vitDt)] = {
			    		lowpress : vo.vitLowPress,
			    		highpress : vo.vitHighPress
			    	};
			    }
			});
		}
		
		// 만약 표 출력이면
		if(index === 3){
		
			// 우선 DB에서 가져온 데이터를 바탕으로 동적으로 출력될 tr부분부터 그린다
			let tbodyTr = '';
			
			// 바로 이전 측정 기록과 얼마나 차이나는가 측정하기 위한 변수
			let preVitLowPress = 0;
			let preVitHighPress = 0;
			
			$.each(bloodData, function(index, vo){
				
				// 날짜 형식 변환
				let vitDt = formatDateStringUpgrade(vo.vitDt);
				
				// 이전 측정 기록과 비교후 span생성
				let gapLowPressSpan = '';
				let gapHighPressSpan = '';
				
				// 만약 이전 기록이 존재하면
				if(preVitLowPress !== 0 && preVitHighPress !== 0){
				
					let gapLowPress = vo.vitLowPress-preVitLowPress;
					let gapHighPress = vo.vitHighPress-preVitHighPress;
					
					// 이전 최저혈압 기록이 더 크면
					if(preVitLowPress > vo.vitLowPress){
						gapLowPressSpan = '<span class="gapMinus">('+gapLowPress+')</span>';
					// 이전 최저혈압 기록이 더 작으면
					} else if(preVitLowPress < vo.vitLowPress){
						gapLowPressSpan = '<span class="gapPlus">(+'+gapLowPress+')</span>';
					// 기록이 같으면
					} else {
						gapLowPressSpan = '<span class="gapEqual">(-)</span>';
					}
					
					// 이전 최고혈압 기록이 더 크면
					if(preVitHighPress > vo.vitHighPress){
						gapHighPressSpan = '<span class="gapMinus">('+gapHighPress+')</span>';
					// 이전 최고혈압 기록이 더 작으면
					} else if(preVitHighPress < vo.vitHighPress){
						gapHighPressSpan = '<span class="gapPlus">(+'+gapHighPress+')</span>';
					// 기록이 같으면
					} else {
						gapHighPressSpan = '<span class="gapEqual">(-)</span>';
					}
					
				
				// 이전 기록이 없으면
				} else {
					
					gapLowPressSpan = '<span class="gapEqual">(-)</span>';
					gapHighPressSpan = '<span class="gapEqual">(-)</span>';
					
				}
				
				tbodyTr = `
					<tr class="tr-padding tr-data">
						<td class="td-padding-data gray-text" style="padding: 1%;width:145px">\${vitDt}</td>
						<td class="td-padding-data gray-text" style="width:120px">\${vo.vitLowPress}\${gapLowPressSpan}</td>
						<td class="td-padding-data gray-text" style="width:80px">\${vo.vitHighPress}\${gapHighPressSpan}</td>
					</tr>
				` + tbodyTr;
				
				// 측정 기록 갱신
				preVitLowPress = vo.vitLowPress;
				preVitHighPress = vo.vitHighPress;
			});  	
			
			// 위에서 생성한 tr + 테이블 더해서 동적으로 만들어주기
			let cont = `
					<table class="table-blood">
						<thead>
							<tr class="tr-padding tr-column">
								<th class="td-padding gray-text" style="width:145px">측정일시</th>
								<th class="td-padding gray-text" style="width:80px">최저혈압</th>
								<th class="td-padding gray-text" style="width:120px">최고혈압</th>
							</tr>
						</thead>
						<tbody>
							\${tbodyTr}
						</tbody>
					</table>`;
				
			$('#bloodChartContainer').html(cont);
			
		// 표 출력이 아니고 그래프 출력이면
		} else {
			
			// 우선 bloodChartContainer안에 canvas요소를 넣어준다
			let cont = '<canvas id="bloodChart"></>';
			$('#bloodChartContainer').html(cont);
			
			console.log('그래프로 출력시킬 데이터 : ', filteredData);
			
			const rowpress = Object.values(filteredData).map(vo => vo.lowpress);
			const highpress = Object.values(filteredData).map(vo => vo.highpress);
			
			const ctx = document.getElementById('bloodChart').getContext('2d');
			chartData = new Chart(ctx, {
			    type: 'line',
			    data: {
			        labels: Object.keys(filteredData).map(key => {
			            // 날짜와 시간을 분리해 labels를 이중배열로 넘겨서 줄넘김처리
			            return key.split(' ');
			        }),
		            datasets: [
		                {
		                    label: '최저혈압',
		                    data: rowpress,
		                    borderColor: 'rgba(54, 162, 235, 1)',
		                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
		                },
		                {
		                    label: '최고혈압',
		                    data: highpress,
		                    borderColor: 'rgba(255, 99, 132, 1)',
		                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
		                }
		            ]
			    },
			    options: {
			        scales: {
			            x: {
			                ticks: {
			                    maxTicksLimit: 7, // 최대 라벨 수 제한
			                }
			            },
			            y: {
			                beginAtZero: true
			            }
			        }
			    }
			});
			
			$('#bloodChartContainer').css('width', '510px');
			
		}
	}
	
	
	// 혈압 추가 swal 띄우기
	function insertBlood(){
		Swal.fire({
		    title: '혈압 입력',
		    html:
		    	'<label id="bloodSwalDate" for="vitDt">측정일시</label>' +
		    	'<input type="text" id="vitDt" class="dduck-input swal-input">' +
		        '<input type="number" id="lowPress" class="dduck-input swal-input" placeholder="최저혈압">' +
		        '<input type="number" id="highPress" class="dduck-input swal-input" placeholder="최고혈압">',
		    showCancelButton: true,
		    confirmButtonColor: '#0ABAB5',
		    cancelButtonColor: '#8D9EA5',
		    confirmButtonText: '확인',
		    cancelButtonText: '취소',
		    willClose: () => {
		    	$('.swal2-container').attr('style', 'z-index: 1060 !important;');
		    },			    
		    didOpen: () => {
		    	
		    	$('.swal2-container').attr('style', 'z-index: 1040 !important;');
		    	
		    	$('#vitDt').daterangepicker({
    				"singleDatePicker": true,
    			    "timePicker": true,
    		    	"showDropdowns": true,
    		    	"locale": {
    		            "format": "YYYY-MM-DD HH:mm",
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
    		        "parentEl": "dduk-row",
    		   		"startDate": moment(),
    		    	"endDate": moment().add(6, 'days'),
    		    	"opens": "right",
    		    	"buttonClasses": "btn-daterange-diet",
    		    	"applyButtonClasses": "dduk-btn-info",
    		    	"cancelClass": "btn-cancel-daterange-diet"
    			})
		    },
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
		    	
		    	const vitDt = document.getElementById('vitDt').value;
		        const lowPress = parseInt(document.getElementById('lowPress').value);
		        const highPress = parseInt(document.getElementById('highPress').value);
		    	
		        // 입력값 검증
		        if(vitDt === null || vitDt === ''){
		            Swal.showValidationMessage("측정일시를 선택해주세요");
		            return false;
		        }
		        
		        if (!lowPress || !highPress) {
		            Swal.showValidationMessage("혈압을 입력해주세요");
		            return false;
		        }
		        
		        if (lowPress >= highPress) {
		            Swal.showValidationMessage("최고혈압은 최저혈압보다 높아야합니다");
		            return false;
		        }
		        
		        if (lowPress < 0 || highPress < 0) {
		            Swal.showValidationMessage("음수값은 입력될 수 없습니다");
		            return false;
		        }
		        
		        return [vitDt, lowPress, highPress]
		    }
		}).then((result) => {
			
			// 확인을 눌렀고 값이 잘 들어왔으면
		    if (result.value) {
		    	
		    	// 입력된 혈압 값들을 가져옴
		        const [vitDt, lowPress, highPress] = result.value;
		        
		        // DB에 혈압 정보들을 넣음
		        let data = {
		        	'admiNo' : currentAdmiNo,
		        	'vitDt' : new Date(vitDt),
		        	'vitLowPress' : lowPress,
		        	'vitHighPress' : highPress
		        }
		        
		    	$.ajax({
		    		url: '/nurse/insertBlood',
		    		data: JSON.stringify(data),
		    		contentType: "application/json; UTF-8",
		    		type: 'post',
		    		dataType: 'json',
		    		beforeSend: function(xhr){
		    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		    		},
		    		success: function(rst){
		    			console.log('DB에 ', data, '넣은 결과 : ', rst);
		    			
		    			// 혈압기록 갱신
		    			updateBloodTab();
		    			 
		    			// 갱신했으니 다시 첫번째 버튼에 selected 적용
		    			$('.btn-blood btn-day-chart').removeClass('btn-day-chart-selected');
    					$('.btn-blood btn-day-chart').eq(0).addClass('btn-day-chart-selected');
		    			
		    			// swal띄우기
		    			Swal.fire({
		    				title: '혈압 기록이 추가되었습니다!',
		    				icon: 'success',
		    				confirmButtonColor: '#0ABAB5',
		    				confirmButtonText: '확인'
		    			})
		    		},
		    		error: function(xhr, status, error){
		    			console.log('Error:', xhr, status, error);
		    		}
		    	});
		    }
		});
	}
	// 혈압 그래프 끝

	
	// 체온 그래프 시작
	
	// 체온 리스트를 변수에 담아놓은다음 3, 7, 30일, 표출력 버튼을 누를 때 재활용
	let tempData = {};
	
	
	// DB에서 해당 입원에 대한 체온정보를 모두 가져온 후 그래프를 그려준다
	function updateTempTab(){
		$.ajax({
			url: '/nurse/getTempList',
    		data: {'admiNo' : currentAdmiNo},
    		type: 'post',
    		dataType: 'json',
    		beforeSend: function(xhr){
    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    		},
    		success: function(rst){
    			console.log('입원번호 ', currentAdmiNo, "로 가져온 체온 리스트 : ", rst);
    			 
    			// 체온 기록이 없으면
    			if(rst.length === 0){
    				let cont = '<h2 class="h2-default">체온 기록이 없습니다</h2>';
    				$('.nurse-record-cont').html(cont);
    			
    			// 체온 기록이 있으면
    			} else {
    				
    				// 그래프 출력을 위해 담아둠
    				tempData = rst;
    				
					// 체온 그래프의 틀을 만들어줌
					let cont = `
						<div class="day-chart-wrap">
							<div class="dduk-row day-btn-wrap">
								<button class="dduk-btn-disabled btn-temp btn-day-chart btn-day-chart-selected">최근3일</button>
								<button class="dduk-btn-disabled btn-temp btn-day-chart">최근7일</button>
								<button class="dduk-btn-disabled btn-temp btn-day-chart">최근30일</button>
								<button class="dduk-btn-disabled btn-temp btn-day-chart">체온기록표</button>
							</div>
							<div id="tempChartContainer" class="chartContainer">
								<canvas id="tempChart"></>
							</div>
						</div>
					`;
					
					$('.nurse-record-cont').html(cont);
    				
					
					// 최근3일의 체온 그래프를 출력시킨다
					drawTempChart(0);

    			}
    		},
    		error: function(xhr, status, error){
    			console.log('Error:', xhr, status, error);
    		}
		})
	}
	
	
	// 체온 그래프 버튼 클릭 이벤트
	$(document).on('click', '.btn-temp', function(){
		
		let index = 0;
		let btnText = $(this).text();
		
		if(btnText === '최근3일'){
			index = 0;
		} else if(btnText === '최근7일'){
			index = 1;
		} else if(btnText === '최근30일'){
			index = 2;
		} else if(btnText === '체온기록표'){
			index = 3;
		} 
		
		drawTempChart(index);
	});
	
	
	// 체온 그래프 출력부분
	function drawTempChart(index){
		
		// 기존의 차트 파괴
		if (chartData) {
			chartData.destroy();
		}
		
		// 차트를 그릴 데이터를 저장할 변수
		let filteredData = {};
		
		// 최근3일 체온 데이터 추출
		if(index === 0){
			
			// 날짜 계산을 위한 오늘 날짜 선언
			let today = new Date();
			
			// 2일전으로 날짜 설정 후 0시로 돌림
			let current3Day = new Date();
			current3Day.setDate(today.getDate() - 2);
			current3Day.setHours(0, 0, 0, 0);
			
			// 혈압 데이터만큼 반복
			$.each(tempData, function(index, vo){
				
				// 만약 최근3일 날짜 이전의 데이터면
			    if(vo.vitDt > current3Day){
			    	filteredData[formatDateStringUpgrade(vo.vitDt)] = {
			    		vitTemp : vo.vitTemp
			    	};
			    }
			});
		
		// 최근7일 체온 데이터 추출
		} else if(index === 1){
			
			// 날짜 계산을 위한 오늘 날짜 선언
			let today = new Date();
			
			// 6일전으로 날짜 설정 후 0시로 돌림
			let current7Day = new Date();
			current7Day.setDate(today.getDate() - 6);
			current7Day.setHours(0, 0, 0, 0);
			
			// 혈압 데이터만큼 반복
			$.each(tempData, function(index, vo){
				
				// 만약 최근7일 날짜 이전의 데이터면
			    if(vo.vitDt > current7Day){
			    	filteredData[formatDateStringUpgrade(vo.vitDt)] = {
			    		vitTemp : vo.vitTemp
			    	};
			    }
			});
			
		// 최근30일 체온 데이터 추출
		} else if(index === 2){
			
			// 날짜 계산을 위한 오늘 날짜 선언
			let today = new Date();
			
			// 29일전으로 날짜 설정 후 0시로 돌림
			let current30Day = new Date();
			current30Day.setDate(today.getDate() - 29);
			current30Day.setHours(0, 0, 0, 0);
			
			// 혈압 데이터만큼 반복
			$.each(tempData, function(index, vo){
				
				// 만약 최근3일 날짜 이전의 데이터면
			    if(vo.vitDt > current30Day){
			    	filteredData[formatDateStringUpgrade(vo.vitDt)] = {
			    		vitTemp : vo.vitTemp
			    	};
			    }
			});
		}
		
		// 만약 표 출력이면
		if(index === 3){
		
			// 우선 DB에서 가져온 데이터를 바탕으로 동적으로 출력될 tr부분부터 그린다
			let tbodyTr = '';
			
			// 바로 이전 측정 기록과 얼마나 차이나는가 측정하기 위한 변수
			let preVitTemp = 0;
			
			$.each(tempData, function(index, vo){
				
				// 날짜 형식 변환
				let vitDt = formatDateStringUpgrade(vo.vitDt);
				
				// 이전 측정 기록과 비교후 span생성
				let gapTempSpan = '';
				
				// 만약 이전 기록이 존재하면
				if(preVitTemp !== 0){
				
					let gapVitTemp = (vo.vitTemp-preVitTemp).toFixed(2);
					
					// 이전 체온 기록이 더 크면
					if(preVitTemp > vo.vitTemp){
						gapTempSpan = '<span class="gapMinus">('+gapVitTemp+')</span>';
					// 이전 체온 기록이 더 작으면
					} else if(preVitTemp < vo.vitTemp){
						gapTempSpan = '<span class="gapPlus">(+'+gapVitTemp+')</span>';
					// 기록이 같으면
					} else {
						gapTempSpan = '<span class="gapEqual">(-)</span>';
					}
				
				// 이전 기록이 없으면
				} else {
					
					gapLowPressSpan = '<span class="gapEqual">(-)</span>';
					gapHighPressSpan = '<span class="gapEqual">(-)</span>';
					
				}
				
				tbodyTr = `
					<tr class="tr-padding tr-data">
						<td class="td-padding-data gray-text" style="padding: 1%;width:145px">\${vitDt}</td>
						<td class="td-padding-data gray-text" style="width:120px">\${vo.vitTemp}°C\${gapTempSpan}</td>
					</tr>
				` + tbodyTr;
				
				// 측정 기록 갱신
				preVitTemp = vo.vitTemp;
			});  	
			
			// 위에서 생성한 tr + 테이블 더해서 동적으로 만들어주기
			let cont = `
					<table class="table-blood">
						<thead>
							<tr class="tr-padding tr-column">
								<th class="td-padding gray-text" style="width:160px">측정일시</th>
								<th class="td-padding gray-text" style="width:160px">체온</th>
							</tr>
						</thead>
						<tbody>
							\${tbodyTr}
						</tbody>
					</table>`;
				
			$('#tempChartContainer').html(cont);
			
		// 표 출력이 아니고 그래프 출력이면
		} else {
			
			// 우선 tempChartContainer안에 canvas요소를 넣어준다
			let cont = '<canvas id="tempChart"></>';
			$('#tempChartContainer').html(cont);
			
			console.log('그래프로 출력시킬 데이터 : ', filteredData);
			
			const temp = Object.values(filteredData).map(vo => vo.vitTemp);
			
			const ctx = document.getElementById('tempChart').getContext('2d');
			chartData = new Chart(ctx, {
			    type: 'line',
			    data: {
			        labels: Object.keys(filteredData).map(key => {
			            // 날짜와 시간을 분리해 labels를 이중배열로 넘겨서 줄넘김처리
			            return key.split(' ');
			        }),
		            datasets: [{
		                    label: '체온',
		                    data: temp,
		                    borderColor: 'rgba(54, 162, 235, 1)',
		                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
		                }]
			    },
			    options: {
			        scales: {
			            x: {
			                ticks: {
			                    maxTicksLimit: 7, // 최대 라벨 수 제한
			                }
			            },
			            y: {
			                beginAtZero: true
			            }
			        }
			    }
			});
			
			$('#tempChartContainer').css('width', '510px');
			
		}
	}
	
	
	// 체온 추가 swal 띄우기
	function insertTemp(){
		Swal.fire({
		    title: '체온 입력',
		    html:
		    	'<label id="bloodSwalDate" for="vitDt">측정일시</label>' +
		    	'<input type="text" id="vitDt" class="dduck-input swal-input">' +
		        '<input type="number" id="temp" class="dduck-input swal-input" placeholder="체온">' +
		        '<span>°C</span>',
		    showCancelButton: true,
		    confirmButtonColor: '#0ABAB5',
		    cancelButtonColor: '#8D9EA5',
		    confirmButtonText: '확인',
		    cancelButtonText: '취소',
		    willClose: () => {
		    	$('.swal2-container').attr('style', 'z-index: 1060 !important;');
		    },			    
		    didOpen: () => {
		    	
		    	$('.swal2-container').attr('style', 'z-index: 1040 !important;');
		    	
		    	$('#vitDt').daterangepicker({
    				"singleDatePicker": true,
    			    "timePicker": true,
    		    	"showDropdowns": true,
    		    	"locale": {
    		            "format": "YYYY-MM-DD HH:mm",
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
    		        "parentEl": "dduk-row",
    		   		"startDate": moment(),
    		    	"endDate": moment().add(6, 'days'),
    		    	"opens": "right",
    		    	"buttonClasses": "btn-daterange-diet",
    		    	"applyButtonClasses": "dduk-btn-info",
    		    	"cancelClass": "btn-cancel-daterange-diet"
    			})
		    },
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
		    	
		    	const vitDt = document.getElementById('vitDt').value;
		        const temp = parseFloat(document.getElementById('temp').value);
		    	
		        // 입력값 검증
		        if(vitDt === null || vitDt === ''){
		            Swal.showValidationMessage("측정일시를 선택해주세요");
		            return false;
		        }
		        
		        if (!temp) {
		            Swal.showValidationMessage("체온을 입력해주세요");
		            return false;
		        }
		        
		        if (temp < 0) {
		            Swal.showValidationMessage("음수값은 입력될 수 없습니다");
		            return false;
		        }
		        
		        return [vitDt, temp]
		    }
		}).then((result) => {
			
			// 확인을 눌렀고 값이 잘 들어왔으면
		    if (result.value) {
		    	
		    	// 입력된 체온 값들을 가져옴
		        const [vitDt, temp] = result.value;
		        
		        // DB에 체온 정보들을 넣음
		        let data = {
		        	'admiNo' : currentAdmiNo,
		        	'vitDt' : new Date(vitDt),
		        	'vitTemp' : temp
		        }
		        
		    	$.ajax({
		    		url: '/nurse/insertTemp',
		    		data: JSON.stringify(data),
		    		contentType: "application/json; UTF-8",
		    		type: 'post',
		    		dataType: 'json',
		    		beforeSend: function(xhr){
		    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		    		},
		    		success: function(rst){
		    			console.log('DB에 ', data, '넣은 결과 : ', rst);
		    			
		    			// 체온기록 갱신
		    			updateTempTab();
		    			 
		    			// 갱신했으니 다시 첫번째 버튼에 selected 적용
		    			$('.btn-temp btn-day-chart').removeClass('btn-day-chart-selected');
    					$('.btn-temp btn-day-chart').eq(0).addClass('btn-day-chart-selected');
		    			
		    			// swal띄우기
		    			Swal.fire({
		    				title: '체온 기록이 추가되었습니다!',
		    				icon: 'success',
		    				confirmButtonColor: '#0ABAB5',
		    				confirmButtonText: '확인'
		    			})
		    		},
		    		error: function(xhr, status, error){
		    			console.log('Error:', xhr, status, error);
		    		}
		    	});
		    }
		});
	}
	// 체온 그래프 끝
	
	
	// I/O 그래프 시작
	
	// I/O 리스트를 변수에 담아놓은다음 3, 7, 30일, 표출력 버튼을 누를 때 재활용
	let ioData = {};
	
	// DB에서 해당 입원에 대한 I/O정보를 모두 가져온 후 그래프를 그려준다
	function updateIoTab(){
		$.ajax({
			url: '/nurse/getIoList',
    		data: {'admiNo' : currentAdmiNo},
    		type: 'post',
    		dataType: 'json',
    		beforeSend: function(xhr){
    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    		},
    		success: function(rst){
    			console.log('입원번호 ', currentAdmiNo, "로 가져온 I/O 리스트 : ", rst);
    			
    			// I/O 기록이 없으면
    			if(rst.length === 0){
    				let cont = '<h2 class="h2-default">I/O 기록이 없습니다</h2>';
    				$('.nurse-record-cont').html(cont);
    			
    			// I/O 기록이 있으면
    			} else {
    				
    				// 그래프 출력을 위해 담아둠
    				ioData = rst;
    				
					// I/O 그래프의 틀을 만들어줌
					let cont = `
						<div class="day-chart-wrap">
							<div class="dduk-row day-btn-wrap">
								<button class="dduk-btn-disabled btn-io btn-day-chart btn-day-chart-selected">최근3일</button>
								<button class="dduk-btn-disabled btn-io btn-day-chart">최근7일</button>
								<button class="dduk-btn-disabled btn-io btn-day-chart">최근30일</button>
								<button class="dduk-btn-disabled btn-io btn-day-chart">I/O기록표</button>
							</div>
							<div id="ioChartContainer" class="chartContainer">
								<canvas id="ioChart"></>
							</div>
						</div>
					`;
					
					$('.nurse-record-cont').html(cont);
    				
					
					// 최근3일의 I/O 그래프를 출력시킨다
					drawIoChart(0);

    			}
    		},
    		error: function(xhr, status, error){
    			console.log('Error:', xhr, status, error);
    		}
		})
	}
	
	
	// I/O 그래프 버튼 클릭 이벤트
	$(document).on('click', '.btn-io', function(){
		
		let index = 0;
		let btnText = $(this).text();
		
		if(btnText === '최근3일'){
			index = 0;
		} else if(btnText === '최근7일'){
			index = 1;
		} else if(btnText === '최근30일'){
			index = 2;
		} else if(btnText === 'I/O기록표'){
			index = 3;
		} 
		
		drawIoChart(index);
	});
	
	
	// I/O 그래프 출력부분
	function drawIoChart(index){
		
		// 기존의 차트 파괴
		if (chartData) {
			chartData.destroy();
		}
		
		// 차트를 그릴 데이터를 저장할 변수
		let filteredData = {};
		
		// 최근3일 I/O 데이터 추출
		if(index === 0){
			
			// 날짜 계산을 위한 오늘 날짜 선언
			let today = new Date();
			
			// 2일전으로 날짜 설정 후 0시로 돌림
			let current3Day = new Date();
			current3Day.setDate(today.getDate() - 2);
			current3Day.setHours(0, 0, 0, 0);
			
			// I/O 데이터만큼 반복
			$.each(ioData, function(index, vo){
				
				// 만약 최근3일 날짜 이전의 데이터면
			    if(vo.ioDt > current3Day){
			    	// 섭취량이면
			    	if(vo.ioIntake !== 0){
			    		filteredData[formatDateStringUpgrade(vo.ioDt)] = {
				    		type : 'intake',
				    		value : vo.ioIntake
					    };
			    	// 배설량이면
			    	} else {
			    		filteredData[formatDateStringUpgrade(vo.ioDt)] = {
				    		type : 'drain',
				    		value : vo.ioDrain
					    };
			    	}
			    }
			});
		
		// 최근7일 I/O 데이터 추출
		} else if(index === 1){
			
			// 날짜 계산을 위한 오늘 날짜 선언
			let today = new Date();
			
			// 6일전으로 날짜 설정 후 0시로 돌림
			let current7Day = new Date();
			current7Day.setDate(today.getDate() - 6);
			current7Day.setHours(0, 0, 0, 0);
			
			// I/O 데이터만큼 반복
			$.each(ioData, function(index, vo){
				
				// 만약 최근7일 날짜 이전의 데이터면
			    if(vo.ioDt > current7Day){
			    	// 섭취량이면
			    	if(vo.ioIntake !== 0){
			    		filteredData[formatDateStringUpgrade(vo.ioDt)] = {
				    		type : 'intake',
				    		value : vo.ioIntake
					    };
			    	// 배설량이면
			    	} else {
			    		filteredData[formatDateStringUpgrade(vo.ioDt)] = {
				    		type : 'drain',
				    		value : vo.ioDrain
					    };
			    	}
			    }
			});
			
		// 최근30일 혈압 데이터 추출
		} else if(index === 2){
			
			// 날짜 계산을 위한 오늘 날짜 선언
			let today = new Date();
			
			// 29일전으로 날짜 설정 후 0시로 돌림
			let current30Day = new Date();
			current30Day.setDate(today.getDate() - 29);
			current30Day.setHours(0, 0, 0, 0);
			
			// 혈압 데이터만큼 반복
			$.each(ioData, function(index, vo){
				
				// 만약 최근30일 날짜 이전의 데이터면
			    if(vo.ioDt > current30Day){
			    	// 섭취량이면
			    	if(vo.ioIntake !== 0){
			    		filteredData[formatDateStringUpgrade(vo.ioDt)] = {
				    		type : 'intake',
				    		value : vo.ioIntake
					    };
			    	// 배설량이면
			    	} else {
			    		filteredData[formatDateStringUpgrade(vo.ioDt)] = {
				    		type : 'drain',
				    		value : vo.ioDrain
					    };
			    	}
			    }
			});
		}
		
		// 만약 표 출력이면
		if(index === 3){
		
			// 우선 DB에서 가져온 데이터를 바탕으로 동적으로 출력될 tr부분부터 그린다
			let tbodyTr = '';
			
			// 바로 이전 측정 기록과 얼마나 차이나는가 측정하기 위한 변수
			let preIoIntake = 0;
			let preIoDrain = 0;
			
			$.each(ioData, function(index, vo){
				
				// 날짜 형식 변환
				let ioDt = formatDateStringUpgrade(vo.ioDt);
				
				// 이전 측정 기록과 비교후 span생성
				let gapIntakeSpan = '';
				let gapDrainSpan = '';
				
				// 만약 이전 기록이 존재하면
				if(preIoIntake !== 0 && preIoDrain !== 0){
				
					let gapIntake = vo.ioIntake-preIoIntake;
					let gapDrain = vo.ioDrain-preIoDrain;
					
					// 이전 섭취량 기록이 더 크면
					if(preIoIntake > vo.ioIntake){
						gapIntakeSpan = '<span class="gapMinus">('+gapIntake+')</span>';
					// 이전 섭취량 기록이 더 작으면
					} else if(preIoIntake < vo.ioIntake){
						gapIntakeSpan = '<span class="gapPlus">(+'+gapIntake+')</span>';
					// 기록이 같으면
					} else {
						gapIntakeSpan = '<span class="gapEqual">(-)</span>';
					}
					
					// 이전 배설량 기록이 더 크면
					if(preIoDrain > vo.ioDrain){
						gapDrainSpan = '<span class="gapMinus">('+gapDrain+')</span>';
					// 이전 배설량 기록이 더 작으면
					} else if(preIoDrain < vo.ioDrain){
						gapDrainSpan = '<span class="gapPlus">(+'+gapDrain+')</span>';
					// 기록이 같으면
					} else {
						gapDrainSpan = '<span class="gapEqual">(-)</span>';
					}
					
				
				// 이전 기록이 없으면
				} else {
					
					gapIntakeSpan = '<span class="gapEqual">(-)</span>';
					gapDrainSpan = '<span class="gapEqual">(-)</span>';
					
				}
				
				// 섭취량, 배설량에 나올 섭취량+변화량을 하나로 합침
				let intakeTd = vo.ioIntake + 'mL' + gapIntakeSpan;
				let drainTd = vo.ioDrain + 'mL' + gapDrainSpan;
				
				// 만약 섭취량이 없으면 섭취량td에 -로 표시
				if(vo.ioIntake == 0){
					intakeTd = '-';
				// 만약 배설량이 없으면 배설량td에 -로 표시
				} else {
					drainTd = '-';
				}
				
				tbodyTr = `
					<tr class="tr-padding tr-data">
						<td class="td-padding-data gray-text" style="padding: 1%;width:145px">\${ioDt}</td>
						<td class="td-padding-data gray-text" style="width:140px">\${intakeTd}</td>
						<td class="td-padding-data gray-text" style="width:140px">\${drainTd}</td>
					</tr>
				` + tbodyTr;
				
				// 측정 기록 갱신, 섭취량, 배설량이 있어야 갱신을 시도
				if(vo.ioIntake != 0){
					preIoIntake = vo.ioIntake;
				} else {
					preIoDrain = vo.ioDrain;
				}
			});  	
			
			// 위에서 생성한 tr + 테이블 더해서 동적으로 만들어주기
			let cont = `
					<table class="table-blood">
						<thead>
							<tr class="tr-padding tr-column">
								<th class="td-padding gray-text" style="width:145px">측정일시</th>
								<th class="td-padding gray-text" style="width:100px">섭취량</th>
								<th class="td-padding gray-text" style="width:100px">배설량</th>
							</tr>
						</thead>
						<tbody>
							\${tbodyTr}
						</tbody>
					</table>`;
				
			$('#ioChartContainer').html(cont);
			
		// 표 출력이 아니고 그래프 출력이면
		} else {
			
			// 우선 ioChartContainer안에 canvas요소를 넣어준다
			let cont = '<canvas id="ioChart"></>';
			$('#ioChartContainer').html(cont);
			
			console.log('그래프로 출력시킬 데이터 : ', filteredData);
			
			// 날짜 레이블
			const labels = Object.keys(filteredData);
			
			// 위에서 날짜별로 필터링된 객체를 배열로 만들어서 아래에서 value만 배열식으로 뽑아준다
			const dataEntries = Object.values(filteredData);

			// 섭취량과 배설량의 value만 가져오는데 배열로 가져옴
			// 일단 섭취량의 Data인데 배설량이 있는 부분이면 null을 표시해 그래프가 나오지 않도록 한다
			const intakeData = dataEntries.map(vo => vo.type === 'intake' ? vo.value : null);
			const drainData = dataEntries.map(vo => vo.type === 'drain' ? vo.value : null);

			// 차트 생성
			const ctx = document.getElementById('ioChart').getContext('2d');
			chartData = new Chart(ctx, {
			    type: 'bar',
			    data: {
			    	labels: Object.keys(filteredData).map(key => {
			            // 날짜와 시간을 분리해 labels를 이중배열로 넘겨서 줄넘김처리
			            return key.split(' ');
			        }),
			        datasets: [{
			            label: '섭취량',
			            data: intakeData,
			            backgroundColor: 'rgba(54, 162, 235, 0.2)',
			            borderColor: 'rgba(54, 162, 235, 1)',
			            borderWidth: 1
			        }, {
			            label: '배설량',
			            data: drainData,
			            backgroundColor: 'rgba(255, 99, 132, 0.2)',
			            borderColor: 'rgba(255, 99, 132, 1)',
			            borderWidth: 1
			        }]
			    },
			    options: {
			        scales: {
			            x: {
			                stacked: true
			            },
			            y: {
			                stacked: true,
			                beginAtZero: true
			            }
			        }
			    }
			});
		}
	}
	
	
	// I/O 추가 swal 띄우기
	function insertIo(){
		Swal.fire({
		    title: 'I/O 입력',
		    html:
		    	'<div class="io-swal-wrap">' +
		    	'<select id="ioType">' +
		    	'<option value="intake">섭취량</option>' +
		    	'<option value="drain">배설량</option>' +
		        '<input type="number" id="ioValue" class="dduck-input swal-input" placeholder="섭취량">' +
		        '</div>' +
		    	'<label id="ioSwalDate" for="ioDt">측정일시</label>' +
		    	'<input type="text" id="ioDt" class="dduck-input swal-input">',
		    showCancelButton: true,
		    confirmButtonColor: '#0ABAB5',
		    cancelButtonColor: '#8D9EA5',
		    confirmButtonText: '확인',
		    cancelButtonText: '취소',
		    willClose: () => {
		    	$('.swal2-container').attr('style', 'z-index: 1060 !important;');
		    },			    
		    didOpen: () => {
		    	
		    	$('.swal2-container').attr('style', 'z-index: 1040 !important;');
		    	
		    	$('#ioType').niceSelect();
		    	
		    	$('#ioDt').daterangepicker({
    				"singleDatePicker": true,
    			    "timePicker": true,
    		    	"showDropdowns": true,
    		    	"locale": {
    		            "format": "YYYY-MM-DD HH:mm",
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
    		        "parentEl": "dduk-row",
    		   		"startDate": moment(),
    		    	"endDate": moment().add(6, 'days'),
    		    	"opens": "right",
    		    	"buttonClasses": "btn-daterange-diet",
    		    	"applyButtonClasses": "dduk-btn-info",
    		    	"cancelClass": "btn-cancel-daterange-diet"
    			})
		    },
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
		    	
		    	const ioDt = document.getElementById('ioDt').value;
		        const ioValue = parseInt(document.getElementById('ioValue').value);
		    	
		        // 입력값 검증
		        if(ioDt === null || ioDt === ''){
		            Swal.showValidationMessage("측정일시를 선택해주세요");
		            return false;
		        }
		        
		        if (!ioValue) {
		        	if($('#ioType :selected').val() === 'intake'){
		        		Swal.showValidationMessage("섭취량을 입력해주세요");
		        	} else {
		        		Swal.showValidationMessage("배설량을 입력해주세요");
		        	}
		            
		            return false;
		        }
		        
		        if (ioValue <= 0) {
		            Swal.showValidationMessage("0이상의 값을 입력해주세요");
		            return false;
		        }
		        
		        return [ioDt, ioValue]
		    }
		}).then((result) => {
			
			// 확인을 눌렀고 값이 잘 들어왔으면
		    if (result.value) {
		    	
		    	// 입력된 I/O 값들을 가져옴
		        const [ioDt, ioValue] = result.value;
		        
		        // DB에 I/O 정보들을 넣음
		        let data = {};
		        
		        // 섭취량 선택시
	        	if($('#ioType :selected').val() === 'intake'){
			        data = {
				        	'admiNo' : currentAdmiNo,
				        	'ioDt' : new Date(ioDt),
				        	'ioIntake' : ioValue,
					}
			    // 배설량 선택시
	        	} else {
			        data = {
				        	'admiNo' : currentAdmiNo,
				        	'ioDt' : new Date(ioDt),
				        	'ioDrain' : ioValue,
				    }
	        	}
		        
		    	$.ajax({
		    		url: '/nurse/insertIo',
		    		data: JSON.stringify(data),
		    		contentType: "application/json; UTF-8",
		    		type: 'post',
		    		dataType: 'json',
		    		beforeSend: function(xhr){
		    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		    		},
		    		success: function(rst){
		    			console.log('DB에 ', data, '넣은 결과 : ', rst);
		    			
		    			// I/O기록 갱신
		    			updateIoTab();
		    			 
		    			// 갱신했으니 다시 첫번째 버튼에 selected 적용
		    			$('.btn-io btn-day-chart').removeClass('btn-day-chart-selected');
    					$('.btn-io btn-day-chart').eq(0).addClass('btn-day-chart-selected');
		    			
		    			// swal띄우기
		    			Swal.fire({
		    				title: 'I/O 기록이 추가되었습니다!',
		    				icon: 'success',
		    				confirmButtonColor: '#0ABAB5',
		    				confirmButtonText: '확인'
		    			})
		    		},
		    		error: function(xhr, status, error){
		    			console.log('Error:', xhr, status, error);
		    		}
		    	});
		    }
		});
	}
	
	
	// 섭취량/배설량 선택시 이벤트
	$(document).on('change', '#ioType', function(){
		
		// 섭취량 선택시
		if($(this).val() === 'intake'){
			$('#ioValue').attr('placeholder', '섭취량')
		} else {
			$('#ioValue').attr('placeholder', '배설량')
		}
	});
	
	// I/O 그래프 끝
	
	
	// 3,7,30일 버튼 클릭 이벤트
	$(document).on('click', '.btn-day-chart', function(){
		$('.btn-day-chart').removeClass('btn-day-chart-selected');
		$(this).addClass('btn-day-chart-selected');
	});
	
	
	// 간호기록 깡통 출력
	function updateNurseRecord(){
		let cont = `
			<div class="dduk-body-border nurse-record">
			<div class="dduk-row">
				<div class="dduk-title-area  nurse-record-header">
					<h2>간호기록</h2>
					<img id="modifyRecordTr" class="modify" src="/resources/images/icons/modify.png">
					<svg id="createNurRecord" type="button"
						xmlns="http://www.w3.org/2000/svg" width="24" height="24"
						viewBox="0 0 24 24" fill="none">
						<g clip-path="url(#clip0_142_1638)">
						<path
							d="M18 13H13V18C13 18.55 12.55 19 12 19C11.45 19 11 18.55 11 18V13H6C5.45 13 5 12.55 5 12C5 11.45 5.45 11 6 11H11V6C11 5.45 11.45 5 12 5C12.55 5 13 5.45 13 6V11H18C18.55 11 19 11.45 19 12C19 12.55 18.55 13 18 13Z"
							fill="#8D9EA5"></path>
						</g>
						<defs>
						<clipPath id="clip0_142_1638">
						<rect width="24" height="24" fill="white"></rect>
						</clipPath>
						</defs>
					</svg>
				</div>
			</div>
			<div class="dduk-row">
				<div class="nurse-record-aside">
					<h2 class="nurse-record-aside-tab gray-text record-tab-selected">식이</h2>
					<h2 class="nurse-record-aside-tab gray-text">혈압</h2>
					<h2 class="nurse-record-aside-tab gray-text">체온</h2>
					<h2 class="nurse-record-aside-tab gray-text">I/O</h2>
				</div>
				<div class="nurse-record-body">
					<div class="nurse-record-title">
				
					</div>
					<div class="nurse-record-cont">
						
					</div>
				</div>
			</div>
		</div>
		`;
		
		$('.nurse-chart-record-wrap').append(cont);
	}
	
	// 간호기록 스크립트 끝
	
	// 인수인계 스크립트 시작
	
	// DB에서 인수인계 가져와서 리스트로 출력
	function getHandOverList(){
		$.ajax({
			url: '/nurse/getHandOverList',
    		data: {'admiNo' : currentAdmiNo},
    		dataType: 'json',
    		type: 'post',
    		beforeSend:function(xhr){
    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
    		},
    		success: function(rst){
    			console.log('입원번호 ', currentAdmiNo, '로 가져온 인수인계 리스트 : ', rst);
    			
    			// 인수인계 출력을 위한 변수
    			let cont = '';
    			
    			// 만약 인수인계 기록이 없으면
    			if(rst.length===0){
    				cont += '<h2 class="h2-default">인수인계 기록이 없습니다</h2>';
    			// 인수인계 기록이 있으면
    			} else {
    				
        			// 인수인계를 날짜별로 출력시켜주기 위해 날짜별로 그룹화를 시켜준다
        			// 그룹화된 데이터를 저장할 객체
        			let grouped = {};
        			
        			// 인수인계List를 모두 순회해서 날짜별로 그룹화
        			$.each(rst, function(index, vo){
        				// 날짜를 가져와서 yyyy-MM-dd 식으로 변환 후 변수에 넣어줌 
        				let dateKey = formatDateString(vo.nurEndt);
        				// 각 날짜를 키로 사용해 grouped 객체에 항목을 추가한다
        				// 해당 날짜로 배열을 찾고 존재하지 않으면 새 배열을 생성한 후 VO를 추가
        				if (!grouped[dateKey]) {
        		            grouped[dateKey] = [];
        		        }
        				// 동일한 날짜 키가 이미 존재하면 해당 배열에 VO를 추가
        		        grouped[dateKey].push(vo);
        			});
        			
        			console.log("인수인계에서 그룹화된 객체 : ", grouped);
    				
    				// 첫 날짜 부분만 클래스 다르게 주기위한 변수
        			let isFirst = true;
        			// 그룹화된 객체에 대한 반복(날짜마다 반복)
        			$.each(grouped, function(date, handOverVOList){
        				// 만약 첫 날짜면 class다르게줘야함
        				if(isFirst){
        					cont += `
        						<div class="hand-over-detail-date-first">
        							<div class="gray-text">\${date}</div>
        						</div>
        					`;
        					isFirst = false;
        				} else {
        					cont += `
        						<div class="hand-over-detail-date">
        							<div class="gray-text">\${date}</div>
        						</div>
        					`;
        				}
        				
        				// 객체안의 배열에 대한 반복(날짜배열에 있는 VO마다 반복)
        				$.each(handOverVOList, function(index, handOverVO){
        					
        					// 시간을 HH:mm 형식으로
        					let time = formatTimeString(handOverVO.nurEndt);
        					
        					// 사진설정부분
        					let imgAlt = '';
        					let imgSrc = '';
        					// 만약 사진이 없으면
        					if(handOverVO.nurChartProfileOrlng === null){
        						// 기본이미지로 설정
        						imgAlt = 'profile.png';
        						imgSrc = '/resources/images/403022_business man_male_user_avatar_profile_icon.png';
        					// 사진 있으면 
        					} else {
        						// 링크설정
        						imgAlt = handOverVO.nurChartProfileOrlng;
        						imgSrc = '/resources/upload/empProfile/' + handOverVO.nurChartProfileSavenm;
        					}
        					
        					// 인수인계 동적으로생성
        					cont += `
        						<div class="hand-over-detail">
        							<div class="hand-over-detail-header">
        								<div class="dduk-row">
        									<img class="hand-over-detail-profile" src="\${imgSrc}" alt="\${imgAlt}">
        									<div class="hand-over-detail-name">\${handOverVO.nurChartEmpName}</div>
        									<div class="hand-over-detail-time">\${time}</div>
        								</div>
        							</div>
        							<div class="hand-over-detail-body">
        								<div class="hand-over-detail-cont">\${handOverVO.nurCont}</div>
        							</div>
        						</div>`;
        				})
        			});
    			}
    			
    			$('.hand-over-body').html(cont);
    			// 스크롤 맨 아래로
    			$('.hand-over-body').scrollTop($('.hand-over-body').prop("scrollHeight"));
    		},
    		error: function(xhr, status, error){
    			console.log('Error:', xhr, status, error);
    		}
		});
	}
	
	
	// 인수인계 추가 버튼 누를때 이벤트
	$(document).on('click', '#createHandOver', function(){
		Swal.fire({
			title: '인수인계 작성<button type="button" class="auto-complete-btn complete2" style="margin-left: 253px; margin-top: -33px;"><svg width="24" height="24" viewBox="0 0 600 600" fill="none" xmlns="http://www.w3.org/2000/svg"><path class="auto-complete-btn-path" d="m495.6 49.23-32.82-32.82C451.8 5.471 437.5 0 423.1 0c-14.33 0-28.66 5.469-39.6 16.41l-216 216.09c-8.4 7.5-12.7 17-15.1 27.3l-24.1 107.4c-1.8 8.9 5.1 16.8 12.8 16.8.916 0 1.852-.092 2.797-.281 0 0 74.03-15.71 107.4-23.56 10.1-2.377 19.13-7.46 26.46-14.79l217-217C517.5 106.5 517.4 71.1 495.6 49.23zM461.7 94.4l-217 217c-1.1 1.1-2.2 1.7-3.5 2-13.7 3.227-34.65 7.857-54.3 12.14l12.41-55.2c.29-1.44.99-2.84 2.09-3.84L417.5 50.4c1.9-1.99 4.1-2.4 5.6-2.4s3.715.406 5.65 2.342l32.82 32.83c3.23 3.168 3.23 8.098.13 11.228zM424 288c-13.25 0-24 10.75-24 24v128c0 13.23-10.78 24-24 24H72c-13.22 0-24-10.77-24-24V136c0-13.23 10.78-24 24-24h144c13.25 0 24-10.75 24-24s-10.7-24-24-24l-144.9-.01C32.31 63.99 0 96.29 0 135.1v304C0 479.7 32.31 512 71.1 512h303.1c39.69 0 71.1-32.3 71.1-72l2.7-128c0-13.2-10.7-24-24-24z" fill="#8d9ea5"></path></svg></button>',
			input: 'textarea',
			inputClass: 'dduck-input',
			inputPlaceholder: '내용',
			showCancelButton: true,
			confirmButtonColor: '#0ABAB5',
			cancelButtonColor: '#8D9EA5',
			confirmButtonText: '확인',
			cancelButtonText: '취소'
		}).then((result) => {
			// 값이 입력 됐다면
			if (result.value) {
				// DB에 넣어줉 데이터
				let data = {
					'admiCd' : currentAdmiNo,
					'nurCont' : result.value,
					'nurType' : 'NCSO02'
				}
				
				$.ajax({
		    		url: '/nurse/createNurseChart',
		    		data: JSON.stringify(data),
		    		type: 'post',
		    		dataType: 'json',
		    		contentType: "application/json; UTF-8",
		    		beforeSend: function(xhr){
		    			xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
		    		},
		    		success: function(rst){
		    			console.log("인수인계 넣은 결과 : ", rst);
		    			
		    			Swal.fire({
							title: '인수인계가 갱신되었습니다',
							icon: 'success',
							confirmButtonColor: '#0ABAB5',
							confirmButtonText: '확인',
						})
		    			
		    			// 새로 추가됐으니 인수인계 갱신
						getHandOverList();
		    		},
		    		error: function(xhr, status, error){
		    			console.log('Error:', xhr, status, error);
		    		}
		    	});
			// 취소 또는 내용이 입력되지 않으면 return
			} else if (result.dismiss === Swal.DismissReason.cancel) {
				return;
			} else {
				Swal.fire({
	    			title: '내용을 입력해주세요',
	    			icon: 'warning',
	    			confirmButtonColor: '#0ABAB5',
	    			confirmButtonText: '확인'
	    		})
				return;
			}
		});
	});
	
	
	// 인수인계 깡통 출력
	function updateHandOver(){
		let cont = `
			<div class="dduk-body-border hand-over">
				<div class="dduk-title-area hand-over-head">
					<div class="d-flex">
						<h2>인수인계</h2>
						<svg id="createHandOver" type="button"
							xmlns="http://www.w3.org/2000/svg" width="24" height="24"
							viewBox="0 0 24 24" fill="none">
							<g clip-path="url(#clip0_142_1638)">
							<path
								d="M18 13H13V18C13 18.55 12.55 19 12 19C11.45 19 11 18.55 11 18V13H6C5.45 13 5 12.55 5 12C5 11.45 5.45 11 6 11H11V6C11 5.45 11.45 5 12 5C12.55 5 13 5.45 13 6V11H18C18.55 11 19 11.45 19 12C19 12.55 18.55 13 18 13Z"
								fill="#8D9EA5"></path>
							</g>
							<defs>
							<clipPath id="clip0_142_1638">
							<rect width="24" height="24" fill="white"></rect>
							</clipPath>
							</defs>
						</svg>
					</div>
				</div>
				<div class="hand-over-body">
					
				</div>
			</div>`;
			
		$('.ward-right-wrap').append(cont);
	}
	
	// 인수인계 스크립트 끝
	
	// 유틸 스크립트 시작
	
	// 이름 등이 글자를 제어하고 싶을 때 maxLength까지만 표시
    function truncateText(text, maxLength) {
    	if (text.length > maxLength) {
    		return text.slice(0, maxLength) + '...';
    	} else {
    		return text;
    	}
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
 	
 	
 	// 생년월일로 만나이 계산
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
	
	// 유틸 스크립트 끝
	
	// 발표용 스크립트
	$(document).on('click', '.complete1', function(){
		$('#nurCont').text('환자분 식사전 혈압측정 약간 낮게 나오셨지만 큰 이상 없음');
	});
	
	$(document).on('click', '.complete2', function(){
		$('#swal2-textarea').val('밤새 손목 진통 있으시다 하셔서 의사선생님 면담 후 진통제 처방 및 물리치료 진행했습니다.');
	});
})
</script>