<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FITDAY 커뮤니티 게시판</title>
<link href="/css/font.css" rel="stylesheet">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<style type="text/css">

#allDiv{
margin:auto;
height: auto;
/* width: 100%; */
max-width: 1140px;
font-family: 'BMJUA';
font-size: 15px;
}

#detailTbl{
width: 80%;
margin:auto;
text-align: center;
}

#d{

white-space: pre-wrap;
}
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
	<div id="allDiv">
<!-- 	<h2>게시글 상세화면</h2> -->
	<form action="<%=request.getContextPath()%>/board/updateForm/${board.boardSeq}" method="post">
		<table id="detailTbl">
			<tr>
				<td><h2>[${board.category}]${board.title}</h2></td>
			</tr>
			<tr>
				<td>${nickName}&nbsp;|&nbsp;커뮤니티&nbsp;|&nbsp;${board.date}&nbsp;|&nbsp;조회수${board.viewCount}</td>
			</tr>
			<tr>
				<td><div id="d"><hr><br>${board.content}<br><br></div></td>
			</tr>
			<tr>
<!-- 			로그인 상태&본인 게시글인 경우 수정, 삭제 버튼 활성화 필요 -->
				<td>
					<input type="hidden" value="${board.boardSeq}" name="boardSeq">
					<c:if test="${currentUser.getUserSeq() == board.userSeq}">
						<input type="submit" value="수정" id="updateBtn" class="btn btn-primary btn-ghost">
						<input type="button" value="삭제" id="deleteBtn" onclick="deleteBoard(${board.boardSeq})" class="btn btn-primary btn-ghost">					
					</c:if>
					<input type="button" value="목록" id="goListBtn" onclick="goList()" class="btn btn-primary btn-ghost">
				</td>
			</tr>
			<tr>
				<td>
	 				<hr>
				</td>
			</tr>
		</table>
	</form>
	<!-- 댓글 불러오기 -->
	<%@ include file="../board/comment.jsp" %>
	</div>
<jsp:include page="../footer.jsp"/>
<script type="text/javascript">
// 	$("#updateBtn").click(function(){
// 		 // 글 제목과 내용 가져오기
// 		  var title = $("#title").val();
// 		  var content = $("#content").val();

// 		  // 1. &lt;br&gt; 제거, &amp;nbsp;를 스페이스바로 치환
// 		  content = content.replace(/&lt;br&gt;/g, '');
// 		  content = content.replace(/&amp;nbsp;/g, ' ');
// 		  $("#content").val(content);
// 	});

	//목록버튼
	function goList(){
		location.href="${pageContext.request.contextPath}/board/list/1";
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