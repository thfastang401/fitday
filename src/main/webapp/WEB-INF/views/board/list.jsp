<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FITDAY 커뮤니티 게시판</title>
<style type="text/css">
#listTbl {
	border: 1px solid black;
}
</style>
</head>
<body>
	<div id="title">
		<h2>커뮤니티 게시판</h2>
	</div>
	<div>질문|추천|공유</div>
	<div id="list">
		<table id="listTbl">
			<tr>
				<th>No.</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:forEach items="${boardList}" var="list" varStatus="nickStatus">
			<c:set var="nickName" value="${nickNameList[nickStatus.index]}"/>
			<c:set var="i" value="${i+1}" />
				<tr>
					<td>${i}</td>
					<td>[${list.category}]
						<a href="<%=request.getContextPath()%>/board/detail/${list.boardSeq}">${list.title}</a></td>
					<td>${nickName}</td>
					<td>${list.date}</td>
					<td>${list.viewCount}</td>
				</tr>
			</c:forEach>
		</table>
		<input type="button" value="글작성" onclick="location.href='/board/form'" id="formBtn">
	</div>
<script type="text/javascript">

</script>	
</body>
</html>