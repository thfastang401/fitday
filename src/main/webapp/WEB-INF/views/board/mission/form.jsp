<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>인증 게시글 작성</title>
    <style type="text/css">
        #allDiv{
            height: 600px;
            width: 80%;
            margin: auto;
            margin-top: 20px;
            display: flex;
            justify-content: center;
        }
        form {
            width: 80%;
        }

    </style>
</head>
<body>
<jsp:include page="../../header.jsp"/>
<div id="allDiv">
    <form action="form" method="post" enctype="multipart/form-data" class="mx-auto">
        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요.">
        </div>
        <div class="form-group">
            <label for="content">내용</label>
            <textarea class="form-control" id="content" name="content" rows="15"></textarea>
        </div>
        <div class="form-group">
            <label for="file">첨부파일</label>
            <input type="file" class="form-control-file" id="file" name="file">
        </div>
        <div>
            <button type="button" class="btn btn-primary" onclick="location.href='/board/mission/list'">취소</button>
            <button type="submit"  class="btn btn-primary" id="insertBtn">등록</button>
        </div>

        <input type="hidden" name="userSeq" value=${currentUser.getUserSeq()}>
    </form>

    <p>${message}</p>
</div>
<jsp:include page="../../footer.jsp"/>
<script>
    window.onload = function (){
      document.getElementById("insertBtn").onclick = function (e) {
          let fileInfo = document.getElementById("file").files;

          if(fileInfo.length == 0){
              alert("파일을 등록해주세요.");
              e.preventDefault();

          }
      };
    };
</script>
</body>
</html>
