<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
    <!-- CKEditor -->
    <script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
    <script src="/resources/js/editor.js" type="module"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
    <script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

    <!-- CKEditor의 너비와 높이를 위한 스타일 지정 -->
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 20px;
        }

        h2 {
            border-bottom: 1px solid #ccc;
            padding-bottom: 10px;
        }

        .dduk-body-border {
            border: 1px solid #ccc;
            padding: 10px;
            margin-top: 10px;
        }

        .editor-container {
            max-width: 800px;
            margin: 20px auto;
        }

        #editor {
            min-height: 400px;
        }

        .file-input {
            margin-top: 10px;
        }

        .button-container {
            margin-top: 10px;
        }

        button {
            padding: 10px;
            margin-right: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        .ck-editor__editable {
            height: 400px;
        }

        .checkbox-container {
            margin-top: 10px;
        }

        .notice-wrap {
            display: flex;
        }

        #btnSubmit {
            float: right;
        }
    </style>
</head>

<body>
<div>
    <sec:authentication property="principal.employeeVO" var="empVO" />
    <div id="writeNotice" class="modal fade" tabindex="-1" aria-hidden="true">
    <div class="dduk-body-border" style="width="60%;">
        <form id="frm" action="/notice/write/insertNotice" method="post" enctype="multipart/form-data">
            
            <h2>공지사항 등록</h2>
            <div class="notice-wrap">
                <div>
                    <h3>제목</h3>
                    <input type="text" placeholder="제목을 입력해 주세요" id="noticeTitle" name="noticeTitle" />
                    <br><br>
                    <h3>파일첨부</h3>
                    <input type="file" id="uploadFile" name="uploadFile" />
                    <br><br>
                    <input type="hidden" value="${empVO.empNo}" id="empNo" name="empNo" />
                </div>
                <div>
                </div>
            </div>

            <div class="file-input" style="display: none;">
                <label for="noticeCont">내용:</label>
                <textarea id="noticeCont" name="noticeCont"></textarea>
            </div>
                    <div id="editor">
                        <p>이것은 샘플 내용입니다.</p>
                    </div>
                    <br><button id="btnSubmit" type="button" class="dduk-btn-normal">등록</button>
            <input type="hidden" id="hiddenNoticeCont" name="noticeCont" />
            <sec:csrfInput />
        </form>
    </div>
  </div>
</div>
</body>
</html>
