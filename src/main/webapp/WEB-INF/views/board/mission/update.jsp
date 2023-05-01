<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>인증 게시글 수정</title>
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
        #buttonDiv {
            text-align: right;
        }

    </style>
</head>
<body>
<jsp:include page="../../header.jsp"/>
<div id="allDiv">
    <form method="post" action="/mission/update/${mission.boardSeq}" enctype="multipart/form-data" class="mx-auto">
        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" class="form-control" id="title" name="title" value="${mission.title}">
        </div>
        <div class="form-group">
            <label for="content">내용</label>
            <textarea class="form-control" id="content" name="content" rows="10">${mission.content}</textarea>
        </div>

        <div class="form-group">
            <label for="file">첨부파일</label>
            <input type="file" class="form-control-file" id="file" name="file">
            <p>기존 첨부파일: ${mission.fileName}</p>
            <%--        <input type="hidden" name="currentFileName" value="${mission.fileName}">--%>
        </div>

        <div class="text-center">
            <p>기존 이미지</p>
            <img src="<%=request.getContextPath()%>/uploads/${mission.fileName}" onerror="this.src='<%=request.getContextPath()%>/images/missionDefault.png'" width="200">
        </div>

        <div id="buttonDiv">
            <button type="button" class="btn btn-primary" onclick="location.href='/board/mission/list'">취소</button>
            <button type="submit"  class="btn btn-primary" id="insertBtn">등록</button>
        </div>

        <input type="hidden" name="boardSeq" value="${mission.boardSeq}">
    </form>

    <p>${message}</p>
</div>

</body>
</html>