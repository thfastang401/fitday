<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                    <div class="p-5">
                    	<div class="text-center">
                    		<h3> 비밀번호 확인</h3>
                    	</div>
                    		<div><br></div>
                   			<div class="user">
                   			<div class="form-group row">
                   				<div class="col-sm-2 mb-3 mb-sm-0">
								<label for="password"></label>
                   				</div>
                   				 <div class="col-sm-6">
								<input type="password" class="form-control" id="password" name="password" onkeydown="checkEnter(event)">
                   				</div>
                   				<div class="col-sm-3">
								<button class="btn btn-primary btn-user" id="checkPwd"> 비밀번호 확인</button>
                   				</div>
                   			</div>
							</div>
							<div><br></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="../footer.jsp"/>
</body>
<script src="/js/mypage/checkPw.js"></script>
</html>