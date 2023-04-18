<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
    <form action="/user/login" method="post">
        <div>
        	<% if (request.getParameter("error") != null) { %>
            	<div class="alert alert-danger">
                	사용자ID 또는 비밀번호를 확인해 주세요.
            	</div>
        	<% } %> 
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">사용자ID</label>
            <input type="text" name="email" id="email" class="form-control">
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">비밀번호</label>
            <input type="password" name="password" id="password" class="form-control">
        </div>
        <button type="submit" class="btn btn-primary">로그인</button>
    </form>
		<div>
        	<button onclick="location.href=''" class="btn btn-primary">회원 가입</button>
		</div>    
</div>





</body>
</html>