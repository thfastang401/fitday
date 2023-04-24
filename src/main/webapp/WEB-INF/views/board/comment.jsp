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
</head>
<body>
<strong>comments</strong> 
	<div>
<!-- 		<!-- 댓글창 -->
		<form id="commentForm">
		<div>
			<table>
				<tr>
					<td>
						<input type="text" placeholder="댓글을 입력하세요." name="content" id="content">&nbsp;
						<input type="button" value="등록" onclick="insertCommentAjax(${board.boardSeq})">
						<input type="hidden" value=1 name="userSeq" id="userSeq"><!-- 임시 댓글 유저 번호 -->
						<input type="hidden" value="${board.boardSeq}" name="boardSeq" id="boardSeq">
						<input type="hidden" value="${nickName}" name="nickName" id="nickName">
					</td>
				</tr>
				
				<div id="commentArea">
<%-- 					<c:forEach items="${commentList }" var="comment" varStatus="commentStatus"> --%>
<%-- 							<c:set var="nickName" value="${commentNick[commentStatus.index]}"/> --%>
<!-- 								<tr> -->
<%-- 									<td>${nickName}&nbsp;&nbsp;${comment.date }&nbsp; --%>
<%-- 									<input type="button" value="삭제" onclick="deleteCommentAjax(${board.boardSeq}, ${comment.commentSeq})"> --%>
<!-- 									</td> -->
<!-- 								</tr> -->
<!-- 								<tr> -->
<%-- 									<td>${comment.content}<br><br></td> --%>
<!-- 								</tr> -->
<%-- 					</c:forEach> --%>
				<tr><td>
				<div id="commentArea2">
				
				</div></td></tr>
			</table>
			</div>
		</form>
	</div>
<script type="text/javascript">
const boardSeq = $("#boardSeq").val();

window.onload = function(){
	commentList(boardSeq);
}

	//댓글 등록
	function insertCommentAjax(boardSeq) {
		const userSeq = $("#userSeq").val();
		const content = $("#content").val();
		if(content.trim().length === 0){
			alert("내용을 입력하세요.");
		}else{
			$.ajax({
				url:"/comment/insert",
				type: "post",
				data:JSON.stringify({
					"boardSeq": boardSeq,
					"userSeq": userSeq,
					"content": content
				}),
				contentType: "application/json",
				success: function(data){
					alert("댓글이 등록되었습니다.");
					$('#content').val('');
					commentList(boardSeq);
	// 				location.reload();
				},
				error: function(request, status, error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}
	}
	
	//댓글 리스트
	function commentList(boardSeq) {
		const nickName = $("#nickName").val();
	  $.ajax({
	    url: "/comment/list/" + boardSeq,
	    type: "GET",
	    dataType: "json",
	    success: function(data) {
	    // 서버에서 받아온 데이터를 이용하여 댓글 목록을 생성하고 화면에 출력하는 코드
	    	var comments =data; // JSON 형태의 데이터를 JavaScript 객체로 변환
	    	var commentList = $("#commentArea2"); // 댓글 목록이 출력될 HTML 요소 선택
	    	commentList.empty(); // 댓글 목록 초기화
	    	if(comments.length==0){
	    		commentList.append("<tr><td>댓글이 없습니다.</td></tr>");
	    	}else{
		    	for(var i=0; i<comments.length; i++) {
		    	  var comment = comments[i];
		    	  var html = "<tr><td>" + nickName + "&nbsp;" + comment.date + "&nbsp;&nbsp;"+
		    	  "<input type='button' value='수정' id='updateAjaxBtn' onclick='updateCommentAjax(" + boardSeq + ",\"" + comment.content + "\"," +comment.commentSeq + ")'>&nbsp;"  + 
		    	  "<input type='button' value='삭제' onclick='deleteCommentAjax(" + boardSeq + "," + comment.commentSeq + ")'>"  + 
		    	  			"</td></tr>" + 
		    	             "<tr><td id='contentArea"+ comment.commentSeq +"'>" + comment.content + "</td></tr>";
		    	  commentList.append(html); // 댓글 목록에 댓글 HTML 추가
		    	}	    		
	    	}
	    },
	    error: function(xhr, status, error) {
	     	alert("댓글 목록을 불러오는 중 오류가 발생했습니다.");
	    }
	  });
	}
	
	//댓글 수정
	function updateCommentAjax(boardSeq, content, commentSeq){
		var inputBox = $('<input type="text" name="updateContent" value="' + content + '">'); //content내용을 담고있는 input 박스만들기
		var updateBtn = $('<input type="button" value="수정하기">');
		var cancleBtn = $('<input type="button" value="수정취소">'); 
		
		$('#contentArea'+commentSeq).empty().append(inputBox).append(updateBtn).append(cancleBtn);
		
// 		cancleBtn.on('click',function)(){
			
// 		}
		
		//수정하기 버튼 클릭했을때
		updateBtn.on('click', function(){
			var updateContent = inputBox.val();
			if(updateContent.trim().length === 0){
				alert('수정할 내용을 입력해주세요.');
				return;
			}
			var check = confirm('댓글을 수정하시겠습니까?');
			
			if(check==true){
				$.ajax({
					url : "/comment/update",
					type : "post",
					data:JSON.stringify({
						"boardSeq": boardSeq,
						"commentSeq" : commentSeq,
						"content": updateContent //수정한 내용을 사용
					}),
					contentType: "application/json",
					success : function(data){
						alert('댓글이 수정되었습니다.');
						commentList(boardSeq);
					},
					error : function(request,status,error){//request,status,error는 서버에서 보내준 에러 정보
				        alert('댓글 수정 오류 발생');
				        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				      }
				});
			}
		});
		
	}
	
	//댓글 삭제
	function deleteCommentAjax(boardSeq, commentSeq){
	  let check = confirm('댓글을 삭제하시겠습니까?');
	  if(check==true){
	    $.ajax({
	      url : "/comment/delete/"+boardSeq+"/"+commentSeq,
	      type : "post", // 변경된 부분
	      dataType : "text", //응답 데이터 타입을 text로 지정
	      success : function(data) { //성공시 실행되는 함수. data는 서버에서 보내준 응답 데이터
	        alert("댓글이 삭제되었습니다.");
	        commentList(boardSeq);//페이지 새로고침
	      },
	      error : function(request,status,error){//request,status,error는 서버에서 보내준 에러 정보
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	        console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	      }
	    });
	  }
	}


	
</script>
</body>
</html>