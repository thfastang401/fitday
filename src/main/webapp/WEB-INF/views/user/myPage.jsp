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
<h3> 회원 정보 </h3>

<h4>${currentUser.getNickname()}님 환영합니다.</h4>


<table>
	<tr>
		<th> 가입 이메일 : </th>
		<td> <sec:authentication property="principal.Username" /> </td>
	</tr>
	<tr>
		<th> 닉네임 : </th>
		<td> <sec:authentication property="principal.Nickname" /> </td>
	</tr>
	<tr>
		<th> 선호 운동 : </th>
		<td> <sec:authentication property="principal.FitType" /> </td>
	</tr> 
	<tr>
		<th> 목표 : </th>
		<td> <sec:authentication property="principal.Goal" /> </td>
	</tr>
	   
</table>
      	<button onclick="location.href='/user/check'" class="btn btn-primary">회원 정보 수정</button>

   




</body>
</html>