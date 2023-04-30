<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FITDAY 커뮤니티 게시판</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="/css/font.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style type="text/css">
/* #listTbl {
	border: 1px solid black;
	width:80%;
	margin: auto;
	vertical-align: middle;
}
a{
color:black;
}

#paging{
width:30%;
	margin: auto;
	vertical-align: middle;
}
#formBtn, #backBtn{
float: right;
}

#seachTd{
padding:50px;
text-align: center;
font-size: 20px; 
}

#allDiv{
height: 600px;
font-family: 'BMJUA';
} */

#listTbl {
	border: 1px solid black;
	width:80%;
	margin: auto;
	vertical-align: middle;
}

a{
color:black;
}

#paging{
width:30%;
	margin: auto;
	vertical-align: middle;
}
#formBtn{
float: right;
}

#backBtn{
margin-right: 10px;
}

#lock{
width:20px;
height: 20px;
} 

#allDiv{
margin-top:40px;
height: 600px;
font-family: 'BMJUA';
font-size: 15px;
}

.title{
	width:80%;
	margin: auto;
	vertical-align: middle;
}

#writeDiv{
width:80%;
margin:20px auto 0;
text-align: right;
}

#search, #paging{
  width:80%;
  margin:20px auto 0;
  text-align: center;
}

#keyword{ 
width:280px;
height:40px;
border-radius: 20px;
outline-color: #E1BEE7;
}
#seachTd{
padding:50px;
text-align: center;
font-size: 30px; 
}
strong{
text-align:center;
color:grey;
}
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div id="allDiv">
	<div class="title">
		<h2>"${keyword}" 검색 결과 총 ${searchCnt}건</h2>
	</div>
	<div class="title">질문|추천|공유</div>
	<div id="list">
	<form action="<%=request.getContextPath()%>/board/searchResult/1">
		<table id="listTbl" class="table table-bordered">
			<tr>
				<th>No.</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			
				<c:if test="${empty searchList}">
					<tr><td colspan="5" id="seachTd"><strong>검색 결과가 없습니다.</strong></td></tr>
				</c:if>
			
			<c:forEach items="${searchList}" var="list" varStatus="nickStatus">
			<c:set var="nickName" value="${searchNickNameList[nickStatus.index]}"/>
			<c:set var="i" value="${i+1}" />
			<c:set var="c" value="${searchCnt}" />
			
				<tr>
					<td>${c+1-((page-1)*10 + i)}&nbsp;</td>
					<td>[${list.category}]&nbsp;<a href="<%=request.getContextPath()%>/board/detail/${list.boardSeq}">${list.title}</a></td>						
					<td>&nbsp;&nbsp;${nickName}&nbsp;&nbsp;</td>
					<td>${list.date}&nbsp;&nbsp;</td>
					<td>${list.viewCount}</td>
				</tr>
			</c:forEach>
			
		</table>
		<div id="search">
			<input type="text" placeholder=" 검색어를 입력하세요." name="keyword" id="keyword">
			<input type="submit" value="검색" id="serchBtn" class="btn btn-primary btn-ghost">
		</div>
		</form>
		<!-- 페이징 -->
		<div id="testArea"></div>
		<c:if test="${Integer.parseInt(searchCnt) != 0}">
			<div id="paging">
		          <% int totalCnt = (int) request.getAttribute("searchCnt");
		              int totalPage = 0; 
		              if (totalCnt % 10 == 0) { 
		                  totalPage = totalCnt / 10; 
		             } else { 
		                  totalPage = totalCnt / 10 + 1; 
		              } 
		              int pageCnt = 10; 
		              int pageNum = 1; 
		              %>  
					<c:set var="totalPage" value="<%=totalPage %>"/>
					<c:choose>
						<c:when test="${page!=1}">
						    <a href="${page-1}" class="prev_link">이전</a>				
						</c:when>
						<c:otherwise>
							<a href="#" class="prev_link">이전</a>	
						</c:otherwise>
					</c:choose>
					
				    <c:forEach var="page" begin="1" end="${totalPage}">
				        <a href="<%=request.getContextPath()%>/board/searchResult/${page}?keyword=${keyword}" class="page_link">${page}</a>
				    </c:forEach>
				    
				    <c:choose>
						<c:when test="${page!=totalPage}">
						    <a href="${page+1}" class="next_link">다음</a>				
						</c:when>
						<c:otherwise>
							<a href="#" class="next_link">다음</a>	
						</c:otherwise>
					</c:choose>
		    	</div>
			</c:if>
		<div id="writeDiv"> 
		<input type="button" value="글작성" onclick="location.href='/board/form'" id="formBtn" class="btn btn-primary btn-ghost">
		<input type="button" value="글목록" onclick="location.href='/board/list/1'" id="backBtn" class="btn btn-primary btn-ghost">
		</div>
	</div>
</div>
	<jsp:include page="../footer.jsp"/>
<script type="text/javascript">


// $(document).ready(function(){
// 	var pageCount = ${totalPage};
	
// 	//초기 페이지 로드
// 	loadPage(1);//1페이지
	
// 	//페이지 링크 클릭 이벤트 처리
// 	$(document).on('click','.page_link', function(){
// 		event.preventDefault();
// 		var page = $(this).attr('id');
// 		loadPage(page);
// 	});
	
// 	//이전 페이지 링크 클릭 이벤트 처리
// 	$(document).on('click', '.prev_link',function(){
// 		event.preventDefault();
// 		var page = parseInt($('.page_link.active').attr('id'))-1;
// 		if(page < 1){
// 			page = 1;
// 		}
// 		loadPage(page);
// 	});
	
// 	//다음 페이지 링크 클릭 이벤트 처리
// 	$(document).on('click', '.next_link',function(){
// 		event.preventDefault();
// 		var page = parseInt($('.page_link.active').attr('id')) + 1;
//         if (page > ${totalPage}) {
//             page = ${totalPage};
//         }
//         loadPage(page);
// 	});
	
// 	//ajax
// 	function loadPage(page){
// 		$.ajax({
// 			url : 'board/list/'+page,
// 			method : 'get',
// 			success : function(data){
// 				$('#testArea').html(data.html);
// 				$('.page_link').removeClass('active');
// 				$('.page_link#'+page).addClass('active');
// 			}
// 		});
		
// 		<c:forEach items="${boardList}" var="list" varStatus="nickStatus">
// 		<c:set var="nickName" value="${nickNameList[nickStatus.index]}"/>
// 		<c:set var="i" value="${i+1}" />
// 			<tr>
// 				<td>${i}&nbsp;</td>
// 				<td>[${list.category}]
<%-- 					<a href="<%=request.getContextPath()%>/board/detail/${list.boardSeq}">${list.title}</a></td> --%>
// 				<td>&nbsp;&nbsp;${nickName}&nbsp;&nbsp;</td>
// 				<td>${list.date}&nbsp;&nbsp;</td>
// 				<td>${list.viewCount}</td>
// 			</tr>
// 		</c:forEach>
// 	}
	
	
// });

</script>	
</body>
</html>