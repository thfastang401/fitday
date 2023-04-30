<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<script src="/js/mypage/userDelete.js"></script>
<meta charset="UTF-8">
<title>${currentUser.getNickname()}님의 MYPAGE</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="/css/sb-admin-2.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../header.jsp"/>

<div class="container">
       <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12 col-md-9">
             <div class="card o-hidden border-0 shadow-lg my-5">
             <div class="card-body p-0">
                    	<div class="col-lg">
                    	<div class="p-5">
							<div class="text-center">
								<h3> 회원 정보 </h3>

								<h4>${currentUser.getNickname()}님 환영합니다.</h4>
							</div>
							<div class="col-lg-auto">
								<div class="form-group">
									<label for="email">가입 이메일</label>		
									<h4><sec:authentication property="principal.Username" /></h4> 
								</div>
								<div class="form-group">
									<label for="nickname">닉네임</label>	
									<h4><sec:authentication property="principal.Nickname" /></h4> 
								</div>
								<div class="form-group">
									<label for="fitType">관심 운동</label>	
									<h4><sec:authentication property="principal.FitType" /></h4> 
								</div>
								<div class="form-group">
									<label for="goal">목표</label>
									<h4><sec:authentication property="principal.Goal" /> </h4> 
								</div>
							</div>
							<br><br>
							<div>
								<button onclick="location.href='/user/check'" class="btn btn-primary btn-user btn-block">회원 정보 수정</button>
							</div>
							<div><br></div>
							<div>
	      						<button onclick="userDelete()"  class="btn btn-primary btn-user btn-block">회원 탈퇴</button>
      						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
							
							
							

<%-- <table>
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
      	
      	
      	<div>
	      	<button onclick="userDelete()"  class="btn btn-primary">회원 탈퇴</button>
      	</div>

    --%>



<jsp:include page="../footer.jsp"/>
</body>
</html>