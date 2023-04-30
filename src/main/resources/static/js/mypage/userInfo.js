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
		const nicknmaeDoubleCheck = document.getElementById("nicknmaeDoubleCheck");
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
						nicknmaeDoubleCheck.style.color = "red";
						checkResult.innerHTML ="공백 또는 입력하지 않은 부분이 있습니다.";
						nicknmaeDoubleCheck.innerHTML ="닉네임 중복확인이 필요합니다.";
			            document.getElementById("infoBtn").disabled = true;
			        }
					 else if(!/^[가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9]{2,10}$/.test(nickname)){
						 checkResult.style.color = "red";
						 nicknmaeDoubleCheck.style.color = "red";
						 checkResult.innerHTML = "닉네임은 특수문자를 포함하지 않은 2~10자리여야 합니다.";
						 nicknmaeDoubleCheck.innerHTML ="닉네임 중복확인이 필요합니다.";
				         document.getElementById("infoBtn").disabled = true;
				    }
					 else{
						checkResult.style.color = "green";
						checkResult.innerHTML = "사용 가능한 닉네임입니다.";
						nicknmaeDoubleCheck.innerHTML ="";
						document.getElementById("infoBtn").disabled = false;
					 }
				}
				else if  (res == "notchange"){
					checkResult.innerHTML = "";
					nicknmaeDoubleCheck.innerHTML ="";
					document.getElementById("infoBtn").disabled = false;
				}
				else{
					checkResult.style.color = "red";
					nicknmaeDoubleCheck.style.color = "red";
					checkResult.innerHTML = "이미 사용중인 닉네임입니다.";
					nicknmaeDoubleCheck.innerHTML ="닉네임 중복확인이 필요합니다.";
					document.getElementById("infoBtn").disabled = true;
				}
			},
			error: function(err) {
				console.log("에러", err);
			}
		});
		
	}
	
	
	
	 