<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FITDAY 커뮤니티 게시판</title>
</head>
<body>
<jsp:include page="../header.jsp"/>
	<h2>게시글 상세화면</h2>
	<div>
	<form action="<%=request.getContextPath()%>/board/updateForm/${board.boardSeq}" method="post">
		<table>
			<tr>
				<td><h2>[${board.category}]${board.title}</h2></td>
			</tr>
			<tr>
				<td>${nickName}</td>
			</tr>
			<tr>
				<td>커뮤니티&nbsp;&nbsp;${board.date}&nbsp;&nbsp;조회수${board.viewCount}</td>
			</tr>
			<tr>
				<td><hr><br>${board.content}<br><br></td>
			</tr>
			<tr>
<!-- 			로그인 상태&본인 게시글인 경우 수정, 삭제 버튼 활성화 필요 -->
				<td>
					<input type="hidden" value="${board.boardSeq}" name="boardSeq">
					<input type="submit" value="수정" id="updateBtn">
					<input type="button" value="목록" id="goListBtn" onclick="goList()">
					<input type="button" value="삭제" id="deleteBtn" onclick="deleteBoard(${board.boardSeq})">
				</td>
			</tr>
			<tr>
				<td>
	 				<hr>
				</td>
			</tr>
		</table>
	</form>
	</div>
	<!-- 댓글 불러오기 -->
	<%@ include file="../board/comment.jsp" %>
<script type="text/javascript">
	//목록버튼
	function goList(){
		location.href="${pageContext.request.contextPath}/board/list";
	}
	//삭제버튼
	function deleteBoard(boardSeq){
		let check = confirm('삭제하시겠습니까?');
		if(check==true){//예 누르면 삭제 실행
			location.href="/board/delete/"+boardSeq;
			alert("삭제되었습니다.");
		}
	}

</script>
</body>
</html>