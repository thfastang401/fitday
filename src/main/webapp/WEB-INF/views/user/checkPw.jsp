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
                    	<div class="text-center">
                    		<div><br></div>
                   			<div class="">
								<label class="">비밀번호 확인</label>
								<input type="password" class="" id="password" name="password" onkeydown="checkEnter(event)">
								<button class="btn btn-primary btn-user" id="checkPwd"> 비밀번호 확인</button>
							</div>
							<div><br></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<script src="/js/mypage/checkPw.js"></script>
</html>