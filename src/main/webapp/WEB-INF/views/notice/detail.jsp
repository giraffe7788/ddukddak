<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">
<head>
<style>
body {
	font-size: 100px;
}

.container {
	padding: 10px;
	border-radius: 10px;
}

.row {
	border-bottom: 1px solid #ddd;
	margin-bottom: 10px;
	padding-bottom: 10px;
}

.row:last-child {
	border-bottom: none;
}

.btn-group {
	margin-top: 20px;
}

.notice-detail-contents {
	height: 540px;
    overflow-y: scroll;
}
.notice-detail-contents>div {
	width: 1100px;
}

figure>img {
	width: 800px !important;
	hieght: auto !important;
}

.dduk-btn-normal:hover {
	color: #ffffff !important;
}
</style>
</head>
<body>
<div class="dduk-body-border" style=" height: 100%; width: 80%;">
<div class="container">
    <h2 class="display-4">공지사항 상세</h2>
    <hr class="my-4">

    <div class="row">
        <div class="col-md-3 font-weight-bold">번호</div>
        <div class="col-md-9">${noticeVO.noticeNo}</div>
    </div>
    <div class="row">
        <div class="col-md-3 font-weight-bold">사번</div>
        <div class="col-md-9">${noticeVO.empNo}</div>
    </div>
    <div class="row">
        <div class="col-md-3 font-weight-bold">제목</div>
        <div class="col-md-9">${noticeVO.noticeTitle}</div>
    </div>
    <div class="notice-detail-contents">
	    <div class="row">
	        <div class="col-md-3 font-weight-bold">내용</div>
	        <div class="col-md-9">${noticeVO.noticeCont}</div>
	    </div>
	    <div class="row">
	    <div class="col-md-3 font-weight-bold">첨부파일</div>
		    <div class="col-md-9">
			    <c:if test="${noticeVO.atchFileNm eq null}">
			        <p>파일이 없습니다</p>
			    </c:if>
			    <a href="/download?fileName=/notice/${noticeVO.saveNm}" target="_blank" onclick="downloadFile('${noticeVO.atchFileNm}')">
			        ${noticeVO.atchFileNm}
			    </a>
			</div>
		</div>
	    <div class="row">
	        <div class="col-md-3 font-weight-bold">작성일시</div>
	        <fmt:formatDate value="${noticeVO.noticeDt}" pattern="yyyy-MM-dd" />
	    </div>
	    <div class="row">
	        <div class="col-md-3 font-weight-bold">조회수</div>
	        <div class="col-md-9">${noticeVO.noticeViews}</div>
	    </div>
    </div>

    <div class="btn-group">
        <a href="<c:url value='/notice/update?noticeNo=${noticeVO.noticeNo}'/>" class="dduk-btn-normal" role="button">수정</a>&nbsp;&nbsp;
        <a href="<c:url value='/notice/delete?noticeNo=${noticeVO.noticeNo}'/>" class="dduk-btn-normal" role="button" onclick="return confirm('정말 삭제 하는지 물어봐도 괜찮겠습니까?')">삭제</a>&nbsp;&nbsp;
        <a href="<c:url value='/notice/list'/>" class="dduk-btn-normal" role="button">이전으로 돌아가기</a>
    </div>
</div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>

