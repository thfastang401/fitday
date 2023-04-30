<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
<title>Insert title here</title>
<link href="/css/sb-admin-2.css" rel="stylesheet">
</head>
<%-- <body>
<jsp:include page="../header.jsp"/>
<div>
    <form action="/user/login" method="post">
        <div>
        	<% if (request.getParameter("error") != null) { %>
            	<div class="alert alert-danger">
                	사용자ID 또는 비밀번호를 확인해 주세요.
            	</div>
        	<% } %> 
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">사용자ID</label>
            <input type="text" name="email" id="email" class="form-control">
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">비밀번호</label>
            <input type="password" name="password" id="password" class="form-control">
        </div>
        <button type="submit" class="btn btn-primary">로그인</button>
    </form>
		<div>
        	<button onclick="location.href='/register'" class="btn btn-primary">회원 가입</button>
		</div>    
</div>
 --%>
<body class="">
<jsp:include page="../header.jsp"/>
    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                    </div>
                                    <form class="user" action="/user/login" method="post">
                                        <% if (request.getParameter("error") != null) { %>
            								<div class="alert alert-danger">
                								사용자ID 또는 비밀번호를 확인해 주세요.
            								</div>
        								<% } %> 
                                        <div class="form-group">
                                            <input type="email" class="form-control form-control-user"
                                                name="email" id="email" aria-describedby="emailHelp"
                                                placeholder="Enter Email Address...">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                name="password" id="password" placeholder="Password">
                                        </div>
                                        <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="rememberMe" name="rememberMe">
                                                <label class="custom-control-label" for="rememberMe">Remember
                                                    Me</label>
                                            </div>
                                        </div>
                                        <input type="submit" value="Login" class="btn btn-primary btn-user btn-block">
                                       <!--  <a href="index.html" class="btn btn-primary btn-user btn-block">
                                            Login
                                        </a> -->
                                        <hr>
                                        <a href="" class="btn btn-google btn-user btn-block">
                                            <i class="fab fa-google fa-fw"></i> Login with Google
                                        </a>
                                       
                                    </form>
                                    <hr>
                                  <!--   <div class="text-center">
                                        <a class="small" href="">Forgot Password?</a>
                                    </div> -->
                                    <div class="text-center">
                                        <a class="small" href="/register">Create an Account!</a>
                                    </div>
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
</html>