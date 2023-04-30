<%--
  Created by IntelliJ IDEA.
  User: sojeong
  Date: 2023/04/18
  Time: 4:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>
    <link href="/css/sb-admin-2.css" rel="stylesheet">
</head>
<body>
<jsp:include page="header.jsp"/>
<div>
<div  class="text-center">
    <h2>회원 가입</h2>
</div>
     <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block"><img src="<%=request.getContextPath()%>/images/human.jpg"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                            </div>
                            <form class="user" id ="form" action="<%=request.getContextPath()%>/register" method="post">
                                <div class="form-group">
                                    <label for="email">이메일</label>
                                    <input type="email" class="form-control form-control-user" name="email" required id="email"
                                        placeholder="Email Address">
                                </div>
                                <div class="form-group">
                                    <!-- <div class="col-sm-6 mb-3 mb-sm-0"> -->
                                      	<label for="password">비밀번호</label>
                                        <input type="password" class="form-control form-control-user"
                                            id="password" name="password" required placeholder="Password">
                                   <!--  </div> -->
                                   <!--  <div class="col-sm-6">
                                   		<label for="password">비밀번호 확인</label>
                                        <input type="password" class="form-control form-control-user"
                                            id="password" name="password" required placeholder="Repeat Password">
                                    </div> -->
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    	<label for="nickname">닉네임</label>
                                        <input type="text" class="form-control form-control-user" name="nickname" required id="nickname"
                                            placeholder="Nick Name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="fitType">관심운동</label>
	                                    <select id="fitType" name="fitType" class="form-control" style="border-radius: 10rem;">
							                <option value="테니스">테니스</option>
							                <option value="헬스">헬스</option>
							                <option value="러닝">러닝</option>
							                <option value="필라테스">필라테스</option>
							                <option value="기타">기타</option>
							            </select>
							   </div>
							   <div class="form-group">
							            <label for="goal">목표</label>
                                        <input type="text" class="form-control form-control-user" name="goal" id="goal"
                                            placeholder="Goal">
                                    
                                </div>
                                <button type="submit" class="btn btn-primary btn-user btn-block">
                                    Register Account
                                </button>
                                <hr>
                              <!--   <a href="index.html" class="btn btn-google btn-user btn-block">
                                    <i class="fab fa-google fa-fw"></i> Register with Google
                                </a> -->
                               
                            </form>
                            <hr>
                           <!--  <div class="text-center">
                                <a class="small" href="forgot-password.html">Forgot Password?</a>
                            </div> -->
                            <div class="text-center">
                                <a class="small" href="user/login">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    
    
   <%--  <form id ="form" action="<%=request.getContextPath()%>/register" method="post">
        <div>
            <label for="email">이메일</label>
            <input type="email" id="email" name="email" required class="form-control">
        </div>
        <div>
            <label for="password">비밀번호</label>
            <input type="password" id="password" name="password" required class="form-control">
        </div>
        <div>
            <label for="nickname">닉네임</label>
            <input type="text" id="nickname" name="nickname" required class="form-control">
        </div>
        <div>
            <label for="fitType">관심운동</label>
            <select id="fitType" name="fitType" class="form-control">
                <option value="테니스">테니스</option>
                <option value="헬스">헬스</option>
                <option value="러닝">러닝</option>
                <option value="필라테스">필라테스</option>
                <option value="기타">기타</option>
            </select>
        </div>
        <div>
            <label for="goal">목표</label>
            <input type="text" id="goal" name="goal" class="form-control">
        </div>

        <br>
        <button type="submit">회원 가입</button>
        <button onclick="location.href='user/login'"
                        type="button">로그인</button>

    </form> --%>
    
    
 <jsp:include page="footer.jsp"/>
</div>
</body>
</html>
