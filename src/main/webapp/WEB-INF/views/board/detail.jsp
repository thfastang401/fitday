<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FITDAY 커뮤니티 게시판</title>
<style type="text/css">
	#goListBtn{
		width:80px;
		margin-left: 50%;
	}
	
	#commentArea{
		width:50%;
		height: 100px;
	}
	
	#commentSubmit{
		width:77px;
		height: 100px;
	}
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
				<td><input type="button" value="목록" id="goListBtn" onclick="goList()"></td>
			</tr>
			<tr>
				<td>
	<!-- 			로그인 상태&본인 게시글인 경우 수정, 삭제 버튼 활성화 필요 --> <hr>
				</td>
			</tr>
		</table>
		<!-- 댓글창 -->
		<form action="">
			<input type="text" placeholder="댓글을 입력하세요." id="commentArea">&nbsp;<input type="submit" value="등록" id="commentSubmit">
		</form>
		<!-- 댓글이 있을경우엔 댓글 리스트 출력/없으면 "댓글이 없습니다" 출력 -->
	</div>
<script type="text/javascript">
	function goList(){
		locaion.href="${pageContext.request.contextPath}/board/list";
	}
</script>
</body>
</html>










