<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"/>

	<!-- 	<div class="position-absolute start-0 end-0 start-0 bottom-0 w-100 h-100">
            <svg xmlns='http://www.w3.org/2000/svg' width='100%' height='100%' viewBox='0 0 800 800'>
                <g fill-opacity='0.11'>
                    <circle style="fill: rgba(var(--ct-primary-rgb), 0.1);" cx='400' cy='400' r='600'/>
                    <circle style="fill: rgba(var(--ct-primary-rgb), 0.2);" cx='400' cy='400' r='500'/>
                    <circle style="fill: rgba(var(--ct-primary-rgb), 0.3);" cx='400' cy='400' r='300'/>
                    <circle style="fill: rgba(var(--ct-primary-rgb), 0.4);" cx='400' cy='400' r='200'/>
                    <circle style="fill: rgba(var(--ct-primary-rgb), 0.5);" cx='400' cy='400' r='100'/>
                </g>
            </svg>
        </div> -->

<div class="container" style="background-color:#ffe579">
	<div class="card o-hidden border-0 shadow-lg my-5">
		<div class="card-body p-3">
			<div class="p-5">
				<div class="text-center">
					<h1>잘못된 접근입니다.</h1>
				</div>
				<div class="text-center" style="padding:1.5rem">
					<button class="btn btn-primary btn-user"onclick="location.href='/'">메인페이지로 돌아가기</button>
				</div>
 			</div>
 		</div>
 	</div>
</div>

<jsp:include page="footer.jsp"/>
</body>
</html>