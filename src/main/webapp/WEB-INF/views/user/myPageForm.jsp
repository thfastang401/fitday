<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>${currentUser.getNickname()}님의 회원정보 수정</title>
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
                    <div class="row">
                    	<div class="col-lg">
                    	<div class="p-5">
							<div class="text-center">
								<h3> 회원 정보 수정 </h3>
								<br>
							</div>
					
						<form class="user" action="/user/mypage/form" method="post">
							<div class="form-group">
								<label for="email">가입 이메일</label>		
								<h4><sec:authentication property="principal.Username" /></h4> 
							</div>
									<label for="nickname">닉네임</label>	
							<div class="form-group row">
								<div class="col-sm-6 mb-3 mb-sm-0">
									<input type="text"  class="form-control form-control-user" id="nickname" name="nickname" value="<sec:authentication property="principal.Nickname" />"> 
									<br><span id="checkResult"></span>
								</div>
								 <div class="col-sm-6">
									<label for="nickname">   </label>	
									<button type="button" onclick="nicknameCheck()" class="btn btn-primary btn-user"> 중복확인 </button>
								</div>
							</div>
							<div class="form-group">
								<label for="password">비밀번호</label>	
								<button type="button" onclick="location.href='/user/mypage/modifyPw'" id="pwBtn" class="btn btn-primary btn-user">비밀번호 변경</button> 
							</div>
							<div class="form-group">
								<label for="fitType">관심 운동</label>	
								<select id="fitType" name="fitType" class="form-control">
						            <option value="테니스" <c:if test="${currentUser.getFitType() eq '테니스'}">selected</c:if>>테니스</option>
						            <option value="헬스" <c:if test="${currentUser.getFitType() eq '헬스'}">selected</c:if>>헬스</option>
						            <option value="러닝" <c:if test="${currentUser.getFitType() eq '러닝'}">selected</c:if>>러닝</option>
						            <option value="필라테스" <c:if test="${currentUser.getFitType() eq '필라테스'}">selected</c:if>>필라테스</option>
						            <option value="기타" <c:if test="${currentUser.getFitType() eq '기타'}">selected</c:if>>기타</option>
						        </select>
							</div>
							<div class="form-group">
								<label for="goal">목표</label>
								<input type="text" class="form-control form-control-user"id="goal" name="goal" value="<sec:authentication property="principal.Goal" />"> 	
							</div>
							<div>
						      	<button type="submit" onclick="memberUpdate()" id="infoBtn" class="btn btn-primary btn-user btn-block" disabled="disabled">수정 완료</button>
								<br><span id="nicknmaeDoubleCheck" style="color:red;" class="row justify-content-center">닉네임 중복확인이 필요합니다.</span>
							</div>
						</form>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	

<jsp:include page="../footer.jsp"/>


</body>
<script src="/js/mypage/userInfo.js"></script>
</html>