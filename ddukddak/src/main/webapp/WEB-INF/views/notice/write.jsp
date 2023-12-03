<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
    <!-- CKEditor -->
    <script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script>
    <title>홈</title>

    <!-- CKEditor의 너비와 높이를 위한 스타일 지정 -->
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 20px;
        }

        h3 {
            margin-top: 30px;
            border-bottom: 1px solid #ccc;
            padding-bottom: 10px;
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
    </style>
</head>
<body>
<form id="frm">
<input type="text" placeholder="제목" id="subject" name="subject">
<input type="text" placeholder="작성자" id="name" name="name">
<input type="text" placeholder="내용" id="content" name="content"> 
<button type="button" onclick="fn_boardRegi();">등록</button>

    <div class="editor-container">
        <h3>글 작성</h3> 
        <!-- CKEditor 인스턴스를 위한 div 요소(id 'editor' 사용) -->
        <div id="editor">
            <p>이것은 샘플 내용입니다.</p>
        </div>
    </div>

    <!-- 파일 업로드를 위한 입력 필드 -->
    <div class="file-input">
        <label for="file">파일 첨부:</label>
        <input type="file" id="file" name="file">
    </div>

    <!-- 전송 및 확인 버튼 -->
    <div class="button-container">
        <button type="button" onclick="location.href='/notice/list'">확인</button>
    </div>

    <!-- 'classic' 인스턴스를 위한 CKEditor 초기화 스크립트 -->
    <script>
        ClassicEditor
            .create(document.querySelector('#classic'))
            .catch(error => {
                console.error(error);
            });
    </script>

    <!-- 'editor' 인스턴스를 위한 CKEditor 초기화 스크립트 -->
    <script>
        ClassicEditor.create(document.querySelector('#editor'), {
            language: "ko"
        });
    </script>

    <!-- 버튼 동작을 처리하기 위한 사용자 지정 JavaScript 함수들 -->
    <script>
        function submitForm() {
            // 폼 전송을 처리하는 로직을 추가하세요
            console.log("폼이 전송되었습니다!");
            // 여기서 파일 업로드 처리도 가능하도록 구현할 수 있습니다.
        }

        function confirmChanges() {
            // 변경 사항을 확인하는 로직을 추가하세요
            console.log("변경 사항이 확인되었습니다!");
        }
    </script>
    </form>
</body>
</html>
