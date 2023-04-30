<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FITDAY 커뮤니티 게시판</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="/css/font.css" rel="stylesheet">
<style type="text/css">
a{
color:black;
}

#allDiv{
margin-top:40px;
height: 600px;
width: 100%;
font-family: 'BMJUA';
font-size: 15px;
}

#writeTbl{
width: 80%;
margin:auto;
text-align: center;
}

textarea{
width: 650px;
height: 500px;
resize: none;
margin:auto;
text-align: left;
border-color: grey;
outline-color: #E1BEE7;
} 

#lock{
width:20px;
height: 20px;
}

#typeDiv{
width:650px;
margin: auto;
text-align: left;
} 

#boardType, #category{
display:inline;
height: 30px;
width:80px;
margin-bottom: 8px;
}

#title{
width: 650px; 
height: 30px;
margin:auto auto 20px;
text-align: left;
outline-color: #E1BEE7;
}

.form-control{
width:100px;
display: inline;
}
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
	<div id="allDiv"> 
	<form action="<%=request.getContextPath()%>/board/update/${board.boardSeq}" method="post">
		<table id="writeTbl">
			<tr>
				<td>
				<div id="typeDiv">
					<select name="boardType" id="boardType" class="form-control">
						<option value="talk">커뮤니티</option>
						<option value="mission">인증</option>
					</select>
					<div id="hideDiv" style="display: inline;">
						<select name="category" id="category" class="form-control">
							<option value="공유">공유</option>
							<option value="추천">추천</option>
							<option value="잡담">잡담</option>
						</select>
					</div>
					<input type="checkbox" value="${board.secret}" id="secretCheck">비밀글 
				</div>
				</td>
			</tr>
			<tr>
				<td><input type="text" value="${board.title}" name="title" id="title"></td>
			</tr>
			<tr>
				<td><br>
				<textarea rows="20" cols="70" id="content" name="content">${board.content}</textarea><br><br></td>
			</tr>
			<tr>
<!-- 			로그인 상태&본인 게시글인 경우 수정, 삭제 버튼 활성화 필요 -->
				<td>
					<div id="fileDiv" style="display: none"><input type="file" name="file" id="file"></div>		
					<input type="hidden" id="secret" name="secret" value=0>
					<input type="hidden" value="${board.boardSeq}" id="boardSeq" name="boardSeq">
					<input type="button" value="뒤로가기" id="goBackBtn" onclick="goBack(${board.boardSeq})" class="btn btn-primary btn-ghost">
					<input type="submit" value="등록하기" id="submitBtn" class="btn btn-primary btn-ghost">
				</td>
			</tr>
		</table>
	</form>
	</div>
<script type="text/javascript">
	var secret = $("#secretCheck").val();
	if(secret == "1"){
		$("#secretCheck").prop("checked",true);
	}

	$("#boardType").on("change", function() {
	  if($(this).val() == 'talk'){
	    $("#hideDiv").show();
	    $("#fileDiv").hide();
	  }else{
	    $("#hideDiv").hide();
	    $("#fileDiv").show();
	    $("#f").attr("enctype", "multipart/form-data");
	  }
	});

	//목록버튼
	function goBack(boardSeq){
		location.href="${pageContext.request.contextPath}/board/detail/"+boardSeq;
	}
	
	$("#submitBtn").click(function(e){
		var title = $("#title").val();
		var boardSeq = $("#boardSeq").val();
// 		var content = $("#content").val();
// 		content = content.replace(/(?:\r\n|\r|\n)/g, '<br>');
// 		content = content.replace(/(?:\s)/g, '&nbsp;');//공백일 경우 &nbsp;로 치환
// 		$("#content").val(content);
		var content = $("#content").val();
		$("#content").html(content);
		if ($('#secretCheck').is(":checked")) {//체크박스 값 가져오기
			$("#secret").val(parseInt("1")); //hidden 태그에 1 넣어주기. 그냥 넣으면 String이라 형변환 필요
		}
		//공백 검색
		if(title.trim().length === 0 ||content.trim().length === 0){
			alert('내용을 입력하세요');
			e.preventDefault();
		}
		
	});
</script>
</body>
</html>
