<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FITDAY 커뮤니티 게시판</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
#listTbl {
	border: 1px solid black;
}
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
	<div id="title">
		<h2>커뮤니티 게시판</h2>
	</div>
	<div>질문|추천|공유</div>
	<div id="list">
		<table id="listTbl">
			<tr>
				<th>No.</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:forEach items="${boardList}" var="list" varStatus="nickStatus">
			<c:set var="nickName" value="${nickNameList[nickStatus.index]}"/>
			<c:set var="i" value="${i+1}" />
				<tr>
					<td>${boardCnt+1-((page-1)*10 + i)} &nbsp;</td>
					<td>[${list.category}]
						<a href="<%=request.getContextPath()%>/board/detail/${list.boardSeq}">${list.title}</a></td>
					<td>&nbsp;&nbsp;${nickName}&nbsp;&nbsp;</td>
					<td>${list.date}&nbsp;&nbsp;</td>
					<td>${list.viewCount}</td>
				</tr>
			</c:forEach>
		</table>
		<!-- 페이징 -->
		<div id="testArea"></div>
		<div id="paging">
          <% int totalCnt = (int) request.getAttribute("boardCnt");
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
		        <a href="<%=request.getContextPath()%>/board/list/${page}" class="page_link">${page}</a>
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
		<input type="button" value="글작성" onclick="location.href='/board/form'" id="formBtn">
	</div>
	
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