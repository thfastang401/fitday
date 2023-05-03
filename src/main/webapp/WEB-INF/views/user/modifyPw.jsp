<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <link href="/css/sb-admin-2.css" rel="stylesheet"> -->
</head>
<body>
<jsp:include page="../header.jsp"/>
	<div class="container">
        <div class="row justify-content-center">
            <div class="col-xl-10 col-lg-12 col-md-9">
           		<div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                    	<div class="col-auto">
                    		<div class="p-5">
                    			<div class="text-center ">
                    				<h3>비밀번호 변경</h3>
                    				<br>
                    			</div>
                    			
                    			<div class="user">
                               		 <div class="form-group">
                                 		<div class="col-sm-12 mb-3 mb-sm-0">
											<label for="password">현재 비밀번호</label>
											<input type="password" placeholder="현재 비밀번호" id="password" name="password" class="form-control form-control-user">
											<br>
										</div>
									</div>
									
									<div class="form-group">
                                		<div class="col-sm-12 mb-3 mb-sm-0">
											<label for="newPw">새 비밀번호</label>
											<input type="password" placeholder="새 비밀번호 " id="newPw" name="newPw" onblur="newPw()" class="form-control form-control-user">
											<br><span id="checkNewPw"></span>
										</div>
									</div>
				
									<div class="form-group">
                                 		<div class="col-sm-12 mb-3 mb-sm-0">
											<label for="newPwCheck">새 비밀번호 확인</label>
											<input type="password" placeholder="새 비밀번호 확인" id="newPwCheck" name="newPwCheck" onblur="newPwSameCheck()" onkeydown="checkEnter(event)"class="form-control form-control-user">
											<br><span id="checkResult"></span>
										</div>
									</div>
									
									<button class="btn btn-primary btn-user btn-block" id="modifyPwd"> 비밀번호 변경 </button>
									<button class="btn btn-primary btn-user btn-block" id="" onclick="location.href='/user/mypage'"> 취소 </button>
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
<script src="/js/mypage/modifyPw.js"></script>
</html>