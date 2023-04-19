<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/header.css" rel="stylesheet">
<style type="text/css">
#header{
background-color: grey;
width: 100%;
height: 190px;
}
</style>
</head>
<body>
<div id="header">
	<h1><a href="<%=request.getContextPath()%>/board/list">FITDAY</a></h1>
	<c:choose>
  <c:when test="${not empty pageContext.request}">
    <div>로그인 유저 : ${pageContext.request.userPrincipal.name}</div>
  </c:when>
  <c:otherwise>
    <div>로그인 유저 : </div>
  </c:otherwise>
</c:choose>
	

</div>
</body>
</html>