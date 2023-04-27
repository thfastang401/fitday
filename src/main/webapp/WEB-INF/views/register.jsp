<%--
  Created by IntelliJ IDEA.
  User: sojeong
  Date: 2023/04/18
  Time: 4:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<div>
    <h2>회원 가입</h2>
    <form id ="form" action="<%=request.getContextPath()%>/register" method="post">
        <div>
            <label for="email">이메일</label>
            <input type="email" id="email" name="email" required class="form-control">
        </div>
        <div>
            <label for="password">비밀번호</label>
            <input type="password" id="password" name="password" required class="form-control">
        </div>
        <div>
            <label for="nickname">닉네임</label>
            <input type="text" id="nickname" name="nickname" required class="form-control">
        </div>
        <div>
            <label for="fitType">관심운동</label>
            <select id="fitType" name="fitType" class="form-control">
                <option value="테니스">테니스</option>
                <option value="헬스">헬스</option>
                <option value="러닝">러닝</option>
                <option value="필라테스">필라테스</option>
                <option value="기타">기타</option>
            </select>
        </div>
        <div>
            <label for="goal">목표</label>
            <input type="text" id="goal" name="goal" class="form-control">
        </div>

        <br>
        <button type="submit">회원 가입</button>
        <button onclick="location.href='user/login'"
                        type="button">로그인</button>

    </form>
</div>
</body>
</html>
