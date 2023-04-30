<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>인증 게시글 수정</title>
</head>
<body>
    <form method="post" action="form" enctype="multipart/form-data">
        <input type="text" id="title" name="title" value="${mission.title}">

        <textarea id="content" name="content">${mission.content}</textarea><br>
        <img src="<%=request.getContextPath()%>/uploads/${mission.fileName}" onerror="this.src='<%=request.getContextPath()%>/images/missionDefault.png'" width="300">

        <p>첨부파일: ${mission.fileName}</p>
        <input type="file" name="file" id="file">
<%--        <input type="hidden" name="currentFileName" value="${mission.fileName}">--%>

        <div>
            <button type="button" onclick="location.href='/board/mission/list'">취소</button>
            <button type="submit" id="insertBtn">등록</button>
        </div>
        <input type="hidden" name="userSeq" value=${currentUser.getUserSeq()}>
    </form>
<p>${message}</p>
</body>
</html>
