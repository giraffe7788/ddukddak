<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- 
요청URI : /employee/create
요청파라미터 : {eName=개똥이,eAddress=대전,eTelno=010-123-1234,
			ePosition=과장,eDept=개발부}
요청방식 : post
model : EmployeeVO employeeVO

// @ModelAttribute EmployeeVO employeeVO
-->
<form action="/create" method="post" enctype="multipart/form-data">
	<!-- 폼데이터 -->
	<p>사번 : <input type="text" name="empNo" required /> </p>
	<p>전화번호 : <input type="text" name="empPh" required /></p>
	<p>성명 : <input type="text" name="empName" maxlength="10"required /></p>
	<p>비밀번호 : <input type="password" name="empPw" required /></p>
	<p>계정상태 : <input type="password" name="empAcntState" required /></p>
	<p>입사일 : <input type="date" name="empIn" required /></p>
	<p>퇴사예정일 : <input type="date" name="empOut" /></p>
	<p>이메일 : <input type="text" name="empMail" required /></p>
	<p>주민번호 : <input type="text" name="empReg" required /></p>
	<p>우편번호 : <input type="text" name="empZip" required /></p>
	<p>주소 : <input type="text" name="empAdd1" required /></p>
	<p>상세주소 : <input type="text" name="empAdd2" required /></p>
	
	<p>
		<input type="file" id="fileCd" name="fileCd" multiple />
	</p>
	<p>
		<input type="submit" value="저장" /> 
	</p>
</form>