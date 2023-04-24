<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<script src="/js/userInfo.js"></script>
<meta charset="UTF-8">
<title>${currentUser.getNickname()}님의 회원정보 수정</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<jsp:include page="../header.jsp"/>
<h3> 회원 정보 수정 </h3>
<form action="/user/mypage/form" method="post">
<table>
	<tr>
		<th> 가입 이메일 : </th>
		<td> <sec:authentication property="principal.Username" /> </td>
	</tr>
	<tr>
		<th> 닉네임 : </th>
		<td> 
			<input type="text" id="nickname" name="nickname" onblur="nicknameCheck()" onkeydown="nicknameCheck()" value="<sec:authentication property="principal.Nickname" />"> 
			<br><span id="checkResult"></span>
		</td>
		
	</tr>
	<tr>
		<th> 비밀번호 : </th>
		<td> <button type="button" onclick="" id="pwBtn" class="">비밀번호 변경</button> </td>
	</tr>
	<tr>
		<th> 선호 운동 : </th>
		<td>
			<select id="fitType" name="fitType" class="form-control">
	            <option value="테니스" <c:if test="${currentUser.getFitType() eq '테니스'}">selected</c:if>>테니스</option>
	            <option value="헬스" <c:if test="${currentUser.getFitType() eq '헬스'}">selected</c:if>>헬스</option>
	            <option value="러닝" <c:if test="${currentUser.getFitType() eq '러닝'}">selected</c:if>>러닝</option>
	            <option value="필라테스" <c:if test="${currentUser.getFitType() eq '필라테스'}">selected</c:if>>필라테스</option>
	            <option value="기타" <c:if test="${currentUser.getFitType() eq '기타'}">selected</c:if>>기타</option>
	        </select>
        </td>
	</tr> 
	<tr>
		<th> 목표 : </th>
		<td> <input type="text" id="goal" name="goal" value="<sec:authentication property="principal.Goal" />"> </td>
	</tr>
	   
</table>
	      	<button type="submit" onclick="return memberUpdate()" id="infoBtn" class="">수정 완료</button>
</form>




</body>
</html>