<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<div>
	<div class="">
			<div class="">
				<label class="">비밀번호 확인</label>
				<input type="password" id="password" name="password" class="">
			</div>
	</div>
</div>
<button class="" id="checkPwd"> 비밀번호 확인</button>




</body>
<script>
    $('#checkPwd').click(function() {
        const checkPassword = $('#password').val();
        if(!checkPassword || checkPassword.trim() === ""){
            alert("비밀번호를 입력하세요.");
        } else{
            $.ajax({
                type: 'post',
                url: '/user/check',
                data: {'checkPassword': checkPassword},
                datatype: "text"
            }).done(function(result){
                console.log(result);
                if(result){
                   /*  console.log("비밀번호 일치"); */
                    window.location.href="/user/mypage/form";
                } else if(!result){
                   /*  console.log("비밀번호 틀림"); */
                    // 비밀번호가 일치하지 않으면
                    alert("비밀번호가 맞지 않습니다.");
                    window.location.reload();
                }
            }).fail(function(error){
                alert(JSON.stringify(error));
            })
        }
    });
</script>
</html>