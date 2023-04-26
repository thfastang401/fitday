function userDelete(){
	const confirmCheck = confirm("탈퇴하시겠습니까? \n\n모든 글,댓글 정보가 삭제됩니다.");
        if (confirmCheck) {
            $.ajax({
				type:"get",
				url:"/user/mypage/deactivate",
				
				
			}).done(function(result){
				alert("회원 탈퇴되었습니다.");
				window.location.href="/";
				
			}).fail(function(error){
				alert("오류가 발생했습니다.");
			})
        } else {
            alert("회원 탈퇴가 취소되었습니다.");
        }
}