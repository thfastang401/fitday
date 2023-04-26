function checkEnter(e){
	if (e.keyCode === 13) { // Enter key
      e.preventDefault(); // prevent form submission
     const confirmCheck = confirm("수정하시겠습니까?");
        if (confirmCheck) {
      		document.getElementById("modifyPwd").click(); // click the button
            return true; // form이 제출됩니다.
        } else {
            return false; // form이 제출되지 않습니다.
        }
    
    }
}


function newPw(){
	const password = $('#password').val();
	const newPassword = $('#newPw').val();
	const pattern = /^(?=.*[a-zA-Z])(?=.*[0-9]).{6,12}$/; //6자 이상 12자 이하/ 1개의 문자,숫자 포함
	if(password==newPassword){
		checkNewPw.style.color = "red";
		checkNewPw.innerHTML ="현재 비밀번호와 같습니다.";
		return false;
	}
	else if (pattern.test(newPassword)==false){
		checkNewPw.style.color = "red";
		checkNewPw.innerHTML ="1개의 문자,숫자 포함한 6자 이상 12자 이하의 비밀번호만 가능합니다.";
		return false;
	}
	else {
		checkNewPw.style.color = "green";
		checkNewPw.innerHTML ="가능한 비밀번호";
		return true;
	}
}

function newPwSameCheck(){
	const newPassword = $('#newPw').val();
	const newPwCheck = $('#newPwCheck').val();
	if (newPassword != newPwCheck){
		checkResult.style.color = "red";
		checkResult.innerHTML ="비밀번호가 일치하지 않습니다.";
		return false;
	}
	else {
		checkResult.style.color = "green";
		checkResult.innerHTML ="일치";
		return true;
	}
}



$('#modifyPwd').click(function(){
	const password = $('#password').val();
	const newPassword = $('#newPw').val();
	const newPwCheck = $('#newPwCheck').val();
	
	$.ajax({
                type: 'post',
                url: '/user/check',
                data: {'checkPassword': password},
                datatype: "text"
            }).done(function(result){
                /*console.log(result);*/
                if(result){
					
					if(!password || password.trim() === "" || !newPassword || newPassword.trim() === "" || !newPwCheck || newPwCheck.trim() === ""){
           				 alert("비밀번호를 입력하세요.");
    				} else if (!newPw() || !newPwSameCheck()) {
						alert ("비밀번호를 변경할 수 없습니다.");
					} else {
						$.ajax({
							type : 'post',
							url : '/user/mypage/modifyPw',
							data : {'password' : newPwCheck},
							datatype: "text"
						}).done(function(result){
							if(result){
								alert("변경되었습니다.");
								window.location.href="/user/mypage";
							}
						}).fail(function(){
							alert("오류가 발생했습니다.");
						})
						
					}
					
                } else if(!result){
                   /*  console.log("비밀번호 틀림"); */
                    // 비밀번호가 일치하지 않으면
                    alert("비밀번호가 맞지 않습니다.");
                    window.location.reload();
                }
            }).fail(function(error){
                alert(JSON.stringify(error));
            })

})