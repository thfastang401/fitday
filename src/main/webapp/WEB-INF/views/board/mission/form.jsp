<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>인증 게시글 작성</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <style type="text/css">
        #allDiv{
            height: 600px;
            width: 80%;
            margin: auto;
            margin-top: 20px;
            display: flex;
            justify-content: center;
        }
        form {
            width: 80%;
        }

    </style>
</head>
<body>
<jsp:include page="../../header.jsp"/>
<div id="allDiv">
    <form action="form" method="post" encType = "multipart/form-data" class="mx-auto">
        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요.">
        </div>
        <div class="form-group">
            <label for="contents">내용</label>
            <textarea class="form-control" id="contents" name="contents" rows="15"></textarea>
        </div>
        <div class="form-group">
            <label for="file">첨부파일</label>
            <input type="file" class="form-control-file" id="file">
        </div>
        <div>
            <button type="button" class="btn btn-primary" onclick="location.href='/board/mission/list'">취소</button>
            <button type="submit"  class="btn btn-primary" id="insertBtn">등록</button>
        </div>

        <input type="hidden" name="userSeq" value=${currentUser.getUserSeq()}>
    </form>

    <p>${message}</p>
</div>

</body>
</html>
