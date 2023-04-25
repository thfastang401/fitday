<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div>
	<div class="">
			<div class="">
			<table>
			<tr>
				<th><label class="">현재 비밀번호</label></th>
				<td><input type="password" placeholder="현재 비밀번호" id="password" name="password"></td>
			</tr>
			<tr>
				<th><label class="">새 비밀번호</label></th>
				<td>
					<input type="password" placeholder="새 비밀번호 " id="newPw" name="newPw" class="pw" onblur="newPw()">
					<br><span id="checkNewPw"></span>
				</td>
			</tr>
			<tr>
				<th><label class="">새 비밀번호 확인</label></th>
				<td>
					<input type="password" placeholder="새 비밀번호 확인" id="newPwCheck" name="newPwCheck" class="pw" onblur="newPwSameCheck()" onkeydown="checkEnter(event)">
					<br><span id="checkResult"></span>
				</td>
				
			</tr>	
						
			</table>
			</div>
	</div>
</div>
<button class="" id="modifyPwd"> 비밀번호 변경 </button>
<button class="" id="" onclick="location.href='/user/mypage'"> 취소 </button>

</body>
<script src="/js/mypage/modifyPw.js"></script>
</html>