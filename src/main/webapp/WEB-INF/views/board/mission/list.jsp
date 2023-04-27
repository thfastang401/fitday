<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <title>FITDAY 인증 게시판</title>
</head>
<body>
<div>
    <table>
        <thead>
        <tr>
            <th scope="col">제목</th>
            <th scope="col">작성자</th>
            <th scope="col">작성일</th>
            <th scope="col">조회수</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${missionList}" var="mission">
            <tr onclick="location.href='/board/mission/detail/${mission.boardSeq}'">
                <th>${mission.title}</th>
                <td>작성자 불러오기</td>
                <td>${mission.date}</td>
                <%--<fmt:parseDate value="${board.insertDate}" var="convertedDate" pattern="yyyy-MM-dd HH:mm:ss"/>--%>
                <%--<td><fmt:formatDate value="${convertedDate}" pattern="yyyy-MM-dd"/></td>--%>
                <td>${mission.viewCount}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
