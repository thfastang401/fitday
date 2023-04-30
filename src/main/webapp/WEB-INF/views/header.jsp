<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Insert title here</title>
<link href="/css/font.css" rel="stylesheet">
<link href="/css/sb-admin-2.css" rel="stylesheet">
<!-- <link href="resources/css/header.css" rel="stylesheet"> -->
<style type="text/css">
#header{
background-color: grey;
width: 100%;
height: 190px;
font-family: 'BMJUA';
font-size: 20px;
}

</style>
</head>
<body>

<div class="container" style="">
    <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
      <h2><a href="/" class="d-flex align-items-center col-md-3 mb-2 mb-md-0 text-dark text-decoration-none">
        <!-- <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg> -->
        FITDAY
      </a></h2>

      <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0 text-decoration-none">
        <li><a href="/" class="nav-link px-2 link-secondary">홈</a></li>
        <li><a href="<%=request.getContextPath()%>/board/list/1" class="nav-link px-2 link-dark">커뮤니티</a></li>
        <li><a href="<%=request.getContextPath()%>/board/mission/list" class="nav-link px-2 link-dark">인증 게시판</a></li>
       <!--  <li><a href="#" class="nav-link px-2 link-dark">FAQs</a></li>
        <li><a href="#" class="nav-link px-2 link-dark">About</a></li> -->
      </ul>

      <div class="col-md-3 text-center">
      
      <sec:authorize access="isAuthenticated()"> 
     	 <sec:authentication property="principal.Nickname" />님 안녕하세요! <br>
	     	 <sec:authorize access="hasAnyAuthority('USER')">
	        	<button onclick="location.href='/user/mypage'" class="btn btn-primary">마이페이지</button>
			</sec:authorize>
			<sec:authorize access="hasAuthority('ADMIN')">
	        	<button onclick="location.href='/admin'" class="btn btn-primary">관리자 페이지</button>
			</sec:authorize>
     	 	<button onclick="location.href='/logout'" class="btn btn-primary">로그 아웃</button>
     	 </sec:authorize>
     	 
      <sec:authorize access="isAnonymous()">
        <button type="button" onclick="location.href='/user/login'" class="btn btn-outline-primary me-2">로그인</button>
        <button type="button" onclick="location.href='/register'" class="btn btn-primary">회원가입</button>
      </sec:authorize>
      </div>
    </header>
  </div>



<%-- <div id="header">
	<h1><a href="<%=request.getContextPath()%>/">FITDAY</a></h1>
	<p>
		<a href="<%=request.getContextPath()%>/board/list/1">커뮤니티</a>
		<a href="<%=request.getContextPath()%>/board/mission/list">오운완 인증</a>
	</p>
		<sec:authorize access="isAuthenticated()"> 
			<div>
				<h3><sec:authentication property="principal.Nickname" />님 안녕하세요!</h3> 
			</div>
	        	<button onclick="location.href='/logout'" class="btn btn-primary">로그 아웃</button>
		</sec:authorize>
		
		<sec:authorize access="isAnonymous()">
	        	<button onclick="location.href='/user/login'" class="btn btn-primary">로그인</button>
		</sec:authorize>
		
		
		
		<sec:authorize access="hasAnyAuthority('USER')">
        	<button onclick="location.href='/user/mypage'" class="btn btn-primary">마이페이지</button>
		</sec:authorize>
		<sec:authorize access="hasAuthority('ADMIN')">
        	<button onclick="location.href='/admin'" class="btn btn-primary">관리자 페이지</button>
		</sec:authorize> --%>

</body>
</html>