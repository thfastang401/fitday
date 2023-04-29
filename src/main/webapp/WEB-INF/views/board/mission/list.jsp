<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
    <title>FITDAY 인증 게시판</title>
</head>
<body>
<div>
    <jsp:include page="../../header.jsp"/>
    <div>
        <c:forEach items="${missionList}" var="mission" varStatus="status">
            <div style="display:inline-block; width: 30%; margin: 5px;">
                <div onclick="location.href='/board/mission/detail/${mission.boardSeq}'">
                    <img src="<%=request.getContextPath()%>/uploads/${mission.fileName}" onerror="this.src='<%=request.getContextPath()%>/images/missionDefault.png'" width="100%">
                    <div>
                        <h4>${mission.title}</h4>
                        <h5>${mission.date}</h5>
                        <h6>작성자</h6>
                    </div>
                </div>
            </div>
            <c:if test="${status.index % 3 == 2}">
                <div style="clear: both;"></div>
            </c:if>
        </c:forEach>
    </div>

    <button type="button" onclick="location.href='/board/mission/form'">글쓰기</button>
</div>
</body>
</html>
