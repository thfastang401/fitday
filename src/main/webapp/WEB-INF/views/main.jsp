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
<title>FIT DAY</title>
</head>
<body>
<jsp:include page="header.jsp"/>
	<div class="container">
 		<div class="row justify-content-center">
 			<div class="col-xl-10 col-lg-12 col-md-9">
				<h3>메인페이지 입니다.</h3>
		<sec:authorize access="isAuthenticated()"> 
			<%-- <div>
				로그인 이메일 : ${loginId } : ${currentUser.getUsername()}
			</div>
			<div>
				역할 : ${loginRoles }
			</div>
			<div>
				닉네임 : ${loginNickname }
			</div> --%>
			<div>
	        	<button onclick="location.href='/logout'" class="btn btn-primary">로그 아웃</button>
			</div>  
		</sec:authorize>
		<sec:authorize access="isAnonymous()">
			<div>
	        	<button onclick="location.href='/user/login'" class="btn btn-primary">로그인</button>
			</div> 
		</sec:authorize>
		</div>
	</div>
	</div>
<jsp:include page="footer.jsp"/>
</body>
</html>