<%--
  Created by IntelliJ IDEA.
  User: sojeong
  Date: 2023/04/21
  Time: 6:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>게시글 등록</h3>
<form action="form" method="post" encType = "multipart/form-data" >
    <input id="title" type="text" name="title" placeholder="제목을 입력해주세요.">
    <br>
    <textarea id="content" name="content" placeholder="내용을 입력해주세요.">
        빈값으로 들어가지 않게 수정하기
    </textarea>

 <input type="hidden" name="userSeq" value=${currentUser.getUserSeq()}>

    <div>
        <button type="button" onclick="location.href='/'">취소</button>
        <button type="submit" id="insertBtn">등록</button>
    </div>
</form>
</body>
</html>
