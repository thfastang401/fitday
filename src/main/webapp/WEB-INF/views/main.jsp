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
<jsp:include page="header.jsp"/>
<h3>메인페이지 입니다.</h3>
	<c:choose>
		<c:when test="${not empty loginId}">
			<div>
				로그인 이메일 : ${loginId }
			</div>
			<div>
				역할 : ${loginRoles }
			</div>
			<div>
	        	<button onclick="location.href='/logout'" class="btn btn-primary">로그 아웃</button>
			</div>  
		</c:when>
		<c:otherwise>
			<div>
	        	<button onclick="location.href='/user/login'" class="btn btn-primary">로그인</button>
			</div> 
		</c:otherwise> 
	</c:choose>
</body>
</html>