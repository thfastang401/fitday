function memberUpdate(){
        const confirmCheck = confirm("수정하시겠습니까?");
        if (confirmCheck) {
            return true; // form이 제출됩니다.
        } else {
            return false; // form이 제출되지 않습니다.
        }
	}

	const nicknameCheck = () => {
		const nickname = document.getElementById("nickname").value;
		const checkResult = document.getElementById("checkResult");
		/* console.log("입력값: ", nickname); */
		
		$.ajax({
			type: "post",
			url: "/user/mypage/nickname",
			data: {
				"nickname" : nickname
			},
			success: function(res) {
				/* console.log("성공", res); */
				if (res=="ok"){
					if(!nickname || nickname.trim() === ""){
						checkResult.style.color = "red";
						checkResult.innerHTML ="공백 또는 입력하지 않은 부분이 있습니다.";
			            document.getElementById("infoBtn").disabled = true;
			        }
					 else if(!/^[가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9]{2,10}$/.test(nickname)){
						 checkResult.style.color = "red";
						 checkResult.innerHTML = "닉네임은 특수문자를 포함하지 않은 2~10자리여야 합니다.";
				         document.getElementById("infoBtn").disabled = true;
				    }
					 else{
						checkResult.style.color = "green";
						checkResult.innerHTML = "사용 가능한 닉네임입니다.";
						document.getElementById("infoBtn").disabled = false;
					 }
				}
				else if  (res == "notchange"){
					checkResult.innerHTML = "";
					document.getElementById("infoBtn").disabled = false;
				}
				else{
					checkResult.style.color = "red";
					checkResult.innerHTML = "이미 사용중인 닉네임입니다.";
					alert("이미 사용중인 닉네임입니다.");
					document.getElementById("infoBtn").disabled = true;
				}
			},
			error: function(err) {
				console.log("에러", err);
			}
		});
		
	}
	
	
	
	 /*  function memberUpdate(){
        const data = {
            nickname: $('#nickname').val(),
            fitType: $('#fitType').val(),
            goal: $('#goal').val()
        };

        // 공백 및 빈 문자열 체크
        if(!data.nickname || data.nickname.trim() === ""){
            alert("공백 또는 입력하지 않은 부분이 있습니다.");
            return false;
        }
        // 유효성 검사
        else if(!/^[가-힣a-zA-Z0-9]{2,10}$/.test(data.nickname)){
            alert("닉네임은 특수문자를 포함하지 않은 2~10자리여야 합니다.");
            $('#nickname').focus();
            return false;
        }
     /*    else if(!/(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\W)(?=\S+$).{8,16}/.test(data.password)){
            alert("비밀번호는 8~16자리수여야 합니다. 영문 대소문자, 숫자, 특수문자를 1개 이상 포함해야 합니다.");
            $('#password').focus();
            return false;
        } */

       /*  const confirmCheck = confirm("수정하시겠습니까?");

        if(confirmCheck == true){
            $.ajax({
                type: 'PUT',
                url: '/rest/member',
                contentType: 'application/json; charset=utf-8',
                data: JSON.stringify(data)
            }).done(function(result){
                if(result){
                    alert("회원 수정이 완료되었습니다.");
                    window.location.href="/mypage";
                } else{
                    alert("이미 사용 중인 닉네임입니다. 다시 입력해주세요.");
                    $('#newNickname').focus();
                }
            }).fail(function(error){
                alert(JSON.stringify(error));
            });
        }
    } */ 