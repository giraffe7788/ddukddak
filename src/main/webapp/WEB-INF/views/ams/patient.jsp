<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
.aside-ams-patient::before {
	width: 196px;
	border-radius: 16px 0px 0px 16px;
	background: var(--bg-02, #DBF2F4);
	height: 56px;
	border-right: 4px solid var(--ci-01, #0ABAB5);
	margin-left: 4px;
	position: absolute;
}

.patient-list {
	width: 324px;
	height: 100%;
	flex-shrink: 0;
}
.patient-detail {
	width: 892px;
	height: 100%;
	flex-shrink: 0;
}	
.patient-note {
	width: 360px;
}

/* 모달 스타일 */
.modal {
  display: none;
  position: fixed;
  z-index: 1;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  overflow: auto;
  background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
  background-color: #fefefe;
  margin: 15% auto;
  padding: 20px;
  border: 1px solid #888;
  width: 60%;
}

#openModal, #closeModal{
	width: 10px;
	height: 10px;
	cursor:pointer;
	float: right;
	margin-top: 13px;
}

</style>
<html>
<body>
	<div class="dduk-body-border patient-list">
		<h1>환자 리스트
		<img src="/resources/images/plus-button.png" id="openModal"></h1>
		<hr/>
	</div>
	
	<div class="dduk-body-border patient-detail">
		<h2>김메디 남성 193cm 59kg 직업:아이돌 체온:40도</h2>
		<hr/>
	</div>
	
	<div class="dduk-body-border patient-note">
		<h1>환자 기록</h1>
		<hr/>
	</div>
	
	<!-- 모달창 -->
	<div id="myModal" class="modal">
	  <div class="modal-content">
	    <span><img src="/resources/images/close-button.png" style="width: 10px; height: 10px; cursor:pointer; float: right;"id="closeModal"></span>
	    	<div>
	    	이름 : <input type="text" name="name"/>
	    	</div>
	  </div>
	</div>
</body>
<script>
  $(document).ready(function() {
    // 모달 열기
    $("#openModal").click(function() {
      $("#myModal").css("display", "block");
    });

    // 모달 닫기
    $("#closeModal").click(function() {
      $("#myModal").css("display", "none");
    });
  });
</script>
</html>
