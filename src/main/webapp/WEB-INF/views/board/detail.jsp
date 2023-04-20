<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FITDAY 커뮤니티 게시판</title>
<style type="text/css">
/* 	#goListBtn{ */
/* 		width:80px; */
/* 		margin-left: 50%; */
/* 	} */
	
/* 	#commentArea{ */
/* 		width:50%; */
/* 		height: 100px; */
/* 	} */
	
/* 	#commentSubmit{ */
/* 		width:77px; */
/* 		height: 100px; */
/* 	} */
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
	<h2>상세화면 테스트</h2>
	<div>
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
					<input type="button" value="수정" id="updateBtn">
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
		<!-- 댓글창 -->
		<form action="<%=request.getContextPath()%>/comment/insert" method="post">
			<table>
				<tr>
					<td>
						<input type="text" placeholder="댓글을 입력하세요." name="content">&nbsp;
						<input type="submit" value="등록" id="commentSubmit"><br>
						<input type="hidden" value=2 name="userSeq"><!-- 임시 댓글 유저 번호 -->
						<input type="hidden" value="${board.boardSeq}" name="boardSeq">
					</td>
				</tr>
				<!-- 댓글이 없을때 -->
				<c:choose>
					<c:when test="${fn:length(commentList) == 0}">
						<tr>
							<td>댓글이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${commentList }" var="comment" varStatus="commentStatus">
							<c:set var="nickName" value="${commentNick[commentStatus.index]}"/>
								<tr>
									<td>${nickName}&nbsp;&nbsp;${comment.date }&nbsp;<input type="button" value="삭제" onclick="deleteComment(${board.boardSeq}, ${comment.commentSeq})"> <br></td>
								</tr>
								<tr>
									<td>${comment.content}<br><br></td>
								</tr>
							</c:forEach>
					</c:otherwise>
				</c:choose>
			</table>
		</form>
	</div>
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
	
	function deleteComment(boardSeq, commentSeq){
		let check = confirm('댓글을 삭제하시겠습니까?');
		if(check==true){//예 누르면 삭제 실행
			location.href="/comment/delete/"+boardSeq+"/"+commentSeq;
			alert("삭제되었습니다.");
		}
	}
</script>
</body>
</html>
