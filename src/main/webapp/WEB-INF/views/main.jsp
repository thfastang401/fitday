<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FIT DAY</title>
<jsp:include page="header.jsp"/>
</head>
<body>
<h3>메인페이지 입니다.</h3>
<%-- 	<c:choose>
		<c:when test="${not empty loginId}"> --%>
		<sec:authorize access="isAuthenticated()"> 
			<div>
				로그인 이메일 : ${loginId } : ${currentUser.getUsername()}
			</div>
			<div>
				역할 : ${loginRoles }
			</div>
			<div>
				닉네임 : ${loginNickname }
			</div>
			<div>
	        	<button onclick="location.href='/logout'" class="btn btn-primary">로그 아웃</button>
			</div>  
		<%-- </c:when> --%>
		</sec:authorize>
<%-- 		<c:otherwise> --%>
		<sec:authorize access="isAnonymous()">
			<div>
	        	<button onclick="location.href='/user/login'" class="btn btn-primary">로그인</button>
			</div> 
		</sec:authorize>
	<%-- 	</c:otherwise> 
	</c:choose> --%>
</body>
</html>