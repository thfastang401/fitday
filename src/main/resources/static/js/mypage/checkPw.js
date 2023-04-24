
function checkEnter(e) {
    if (e.keyCode === 13) { // Enter key
      e.preventDefault(); // prevent form submission
      document.getElementById("checkPwd").click(); // click the button
    }
  }

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
    
    
    
