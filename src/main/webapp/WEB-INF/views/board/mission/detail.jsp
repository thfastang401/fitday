<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>인증 게시판 상세 조회</title>
</head>
<body>

<div>
    <div>
        <h3><b>${mission.title}</b></h3>
        <p><span>작성자</span>&nbsp;| <span>${mission.date}</span>&nbsp;| <span>조회수 ${mission.viewCount}</span></p>
        <p>${mission.content}</p>
        <img src="<%=request.getContextPath()%>/uploads/${mission.fileName}" onerror="this.src='<%=request.getContextPath()%>/images/missionDefault.png'" width="600">
    </div>
        <div>
            <button type="button" onclick="location.href='/board/mission/update/${mission.boardSeq}'">수정하기</button>
            <button type="button" onclick="location.href='/board/mission/delete/${mission.boardSeq}'">삭제하기</button>
        </div>

</div>

</body>
</html>
