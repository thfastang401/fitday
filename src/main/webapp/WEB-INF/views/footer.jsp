<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link href="resources/css/header.css" rel="stylesheet"> -->
<style type="text/css">
#footer{
background-color: #FFF59D;
width: 100%;
height: 190px;
margin-top:270px;
}
</style>
</head>
<body>
<div id="footer">
<%-- 	<h1><a href="<%=request.getContextPath()%>/">FITDAY</a></h1> --%>
<!-- 	<p> -->
<%-- 		<a href="<%=request.getContextPath()%>/board/list/1">커뮤니티</a> --%>
<%-- 		<a href="<%=request.getContextPath()%>/board/mission/list">오운완 인증</a> --%>
<!-- 	</p> -->
<%-- 	<%-- <c:choose> --%>
<%-- 		<c:when test="${not empty currentUser}"> --%> 
<%-- 		<sec:authorize access="isAuthenticated()">  --%>
<!-- 			<div> -->
<%-- 				<p><sec:authentication property="principal.Nickname" />님 안녕하세요!</p>  --%>
<!-- 			</div> -->
<%-- 		<%-- 	<div> --%>
<%-- 				로그인 이메일 : ${currentUser.getUsername()} ${principle.customUser } --%>
<%-- 			</div> --%>
<%-- 			<div> --%>
<%-- 				역할 : ${currentUser.getAuthorities()} --%>
<%-- 			</div> --%>
<%-- 			<div> --%>
<%-- 				닉네임 : ${currentUser.getNickname()} --%>
<%-- 			</div> --%> 
<!-- 			<div> -->
<!-- 	        	<button onclick="location.href='/logout'" class="btn btn-primary">로그 아웃</button> -->
<!-- 			</div>   -->
<%-- 		</sec:authorize> --%>
<%-- 		<%-- </c:when> --%>
<%-- 		<c:otherwise> --%> 
<%-- 		<sec:authorize access="isAnonymous()"> --%>
<!-- 			<div> -->
<!-- 	        	<button onclick="location.href='/user/login'" class="btn btn-primary">로그인</button> -->
<!-- 			</div>  -->
<%-- 		</sec:authorize> --%>
		
<%-- 		<%-- </c:otherwise>  --%>
<%-- 	</c:choose> --%> 
<%-- 		<sec:authorize access="hasAnyAuthority('USER')"> --%>
<!-- 		<div> -->
<!--         	<button onclick="location.href='/user/mypage'" class="btn btn-primary">마이페이지</button> -->
<!-- 		</div> -->
<%-- 		</sec:authorize> --%>
<%-- 		<sec:authorize access="hasAuthority('ADMIN')"> --%>
<!--         	<button onclick="location.href='/admin'" class="btn btn-primary">관리자 페이지</button> -->
<%-- 		</sec:authorize> --%>

</div>
</body>
</html>