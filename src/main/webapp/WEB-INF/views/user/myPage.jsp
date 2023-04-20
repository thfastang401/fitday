<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${currentUser.getNickname()}님의 MYPAGE</title>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div>
   <div>
	  가입 이메일 : <sec:authentication property="principal.Username" />
   </div>
   <div>
	   닉네임 : <sec:authentication property="principal.Nickname" />
   </div>
   <div>
	   비밀번호 : <sec:authentication property="principal.Password" />
   </div>
   <div>
	   선호 운동 : <sec:authentication property="principal.FitType" />
   </div>
   <div>
	   목표 : <sec:authentication property="principal.Goal" />
   </div>
   
   
</div>





</body>
</html>