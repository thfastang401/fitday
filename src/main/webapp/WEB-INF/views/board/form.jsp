<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="/css/font.css" rel="stylesheet">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<style type="text/css">
a{
color:black;
}

#allDiv{
margin-top:40px;
height: 600px;
width: 100%;
font-family: 'BMJUA';
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
width:110px;
margin-bottom: 8px;
font-size: 14px;
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
		<form action="<%=request.getContextPath()%>" method="post" id="f">
			<div>
				<table id="writeTbl">
					<tr>
						<td>
						<div id="typeDiv">
							<select name="boardType" id="boardType" class="form-control">
							<!-- 컨트롤러에서 불러오기. if로 talk면 커뮤니티, excercise면 운동으로 -->
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
							<input type="checkbox" value=1 id="secretCheck">비밀글<img src='/images/lock.png' alt='자물쇠' id='lock'>
						</div>
						</td>
					</tr>
					<tr>
						<td><input type="text" placeholder=" 제목을 입력하세요." name="title" id="title"></td>
					</tr>
					<tr>
						<td><textarea rows="20" cols="70" placeholder=" 내용을 입력하세요." name="content" id="content"></textarea> </td>
					</tr>
					<tr>
						<td>
							<div id="fileDiv" style="display: none"><input type="file" name="file" id="file"></div>
							<input type="hidden" id="secret" name="secret" value=0>
							<input type="hidden" name="userSeq" value="${currentUser.getUserSeq()}"><!-- 임시 회원번호 -->
							<input type="button" value="취소" onclick="cancelForm()" class="btn btn-primary btn-ghost">
							<input type="submit" value="등록" id="submitBtn" class="btn btn-primary btn-ghost">
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
<jsp:include page="../footer.jsp"/>
<script type="text/javascript">
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
	
	function cancelForm(){
		let check = confirm('글작성을 취소하시겠습니까?');
		if(check==true){
			location.href="/board/list/1";
		}
	}
	
	$("#submitBtn").click(function(e){
			var title = $("#title").val();
			var content = $("#content").val();
			var boardType = $("#boardType").val();
// 			content = content.replace(/(?:\r\n|\r|\n)/g, '<br>');//줄바꿈일 경우 <br>태그로 치환
// 			content = content.replace(/(?:\s)/g, '&nbsp;');//공백일 경우 &nbsp;로 치환
			$("#content").html(content);
			if ($('#secretCheck').is(":checked")) {//체크박스 값 가져오기
				$("#secret").val(parseInt("1")); //hidden 태그에 1 넣어주기. 그냥 넣으면 String이라 형변환 필요
			}
			//공백 검색
			if(title.trim().length === 0 ||content.trim().length === 0){
				alert('내용을 입력하세요');
				e.preventDefault();
			}else{
				if(boardType == 'mission'){
					$("form").attr("action","/board/mission/form");			
				}else{
					$("form").attr("action","/board/form");		
				}
			}					
		
	});

</script>
</body>
</html>