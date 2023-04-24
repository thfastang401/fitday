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
				<label class="">비밀번호 확인</label>
				<input type="password" id="password" name="password" onkeydown="checkEnter(event)">
			</div>
	</div>
</div>
<button class="" id="checkPwd"> 비밀번호 확인</button>

</body>
<script src="/js/checkPw.js"></script>
</html>