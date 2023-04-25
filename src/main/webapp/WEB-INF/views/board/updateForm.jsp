<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FITDAY 커뮤니티 게시판</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
#title{
width:500px;
}
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
	<h2>상세화면 수정</h2>
	<div>
	<form action="<%=request.getContextPath()%>/board/update/${board.boardSeq}" method="post">
		<table>
			<tr>
				<td>
					<select name="boardType">
						<option value="talk">커뮤니티</option>
						<option value="excercise">인증</option>
					</select>
					<select name="category">
						<option value="공유">공유</option>
						<option value="추천">추천</option>
						<option value="잡담">잡담</option>
					</select>
				</td>
			</tr>
			<tr>
				<td><input type="text" value="${board.title}" name="title" id="title"></td>
			</tr>
			<tr>
				<td><hr><br>
				<textarea rows="20" cols="70" id="content" name="content">${board.content}</textarea><br><br></td>
			</tr>
			<tr>
<!-- 			로그인 상태&본인 게시글인 경우 수정, 삭제 버튼 활성화 필요 -->
				<td>
					<input type="hidden" value="${board.boardSeq}" id="boardSeq" name="boardSeq">
					<input type="button" value="뒤로가기" id="goBackBtn" onclick="goBack(${board.boardSeq})">
					<input type="submit" value="등록하기" id="submitBtn">
				</td>
			</tr>
		</table>
	</form>
	</div>
<script type="text/javascript">
	//목록버튼
	function goBack(boardSeq){
		location.href="${pageContext.request.contextPath}/board/detail/"+boardSeq;
	}
	
	$("#submitBtn").click(function(e){
		var title = $("#title").val();
		var content = $("#content").val();
		var boardSeq = $("#boardSeq").val();
		console.log(title);
		console.log(content);
		//공백 검색
		if(title.trim().length === 0 ||content.trim().length === 0){
			alert('내용을 입력하세요');
			e.preventDefault();
		}	
		
	});
</script>
</body>
</html>
