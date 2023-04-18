<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성</title>
</head>
<body>
	<div>
		<form action="">
			<div>
				<table>
					<tr>
						<td>
							<select name="type">
							<!-- 컨트롤러에서 불러오기. if로 talk면 커뮤니티, excercise면 운동으로 -->
								<option value="talk">커뮤니티</option>
								<option value="excercise">인증</option>
							</select>
						</td>
					</tr>
					<tr>
						<td><input type="text" placeholder="제목을 입력하세요."></td>
					</tr>
					<tr>
						<td><textarea rows="20" cols="70" placeholder="내용을 입력하세요."></textarea> </td>
					</tr>
					<tr>
						<td>
							<input type="button" value="취소" onclick="cancelForm()">
							<input type="submit" value="등록">
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
<script type="text/javascript">
	function cancelForm(){
		let check = confirm('글작성을 취소하시겠습니까?');
		if(check==true){
			location.href="/board/list";
		}
	}
</script>
</body>
</html>