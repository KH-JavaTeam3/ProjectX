<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.button {
	font-size: 18px;
	font-weight: bold;
	color: gray;
}

.button:hover {
	background: #4876ef;
	cursor: pointer;
	color: white;
}

.detailBtn:hover {
	cursor: pointer;
	background-color: #edf2fc;
}
#Myboard:hover{
	cursor: pointer;
	background-color: #edf2fc;
	text-decoration: none;
	color: black;
	
	
}
#cntPerPage:hover{
	cursor: pointer;
	background-color: #edf2fc;
}
.button1 {
	font-size: 18px;
	font-weight: bold;
}

.button1:hover {
	background: #4876ef;
	cursor: pointer;
	opacity: 0.8;
}
html,
body {
    margin:0;
    padding:0;
    height:100%;
}
#wrapper {
	position:relative;
    min-height:100%;
}
#header {
	height:70px;
    background:#ccc;
}
#container {
    padding:20px;
}
#footer {
    bottom:0;
    width:100%;
}
</style>
</head>
<body>


<div style="height: 50px;"></div>
	<div align="left">
		<div class="row"
			style="border-bottom: 3px solid #4876ef; width: 1473px; margin-left: 33px;">
			<div class="col-md-12">
				<div onclick="location.href='freeBoardList.bo'" class="button col-md-2"
					style="display: inline-block; background: #4876ef; color: white; text-align: center; border: 3px solid #f1f3f9; border-bottom: none; height: 50px; line-height: 50px; margin-left: 9px; left: -27px;">
					자유게시판</div>
				<div onclick="location.href='qaBoardList.bo'" class="button col-md-2"
					style="display: inline-block; text-align: center; border: 3px solid #f1f3f9; border-bottom: none; height: 50px; line-height: 50px; left: -27px;">
					Q.A게시판</div>
			</div>
		</div>
	</div>
	
	
	
	<div class="form-group" style="width: 8%;float: right; margin-bottom: 0px; margin-right: 29px;">
		 <select class="form-control" id="cntPerPage" name="sel">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄
				보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄
				보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄
				보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄
				보기</option>
		</select>
	</div>

	
	
	<c:if test="${not empty sessionScope.memLogin or not empty sessionScope.comLogin.comName}">
		<a  href="selectMyFreeBoardList.bo?memName=${sessionScope.memLogin.memName}&comName=${sessionScope.comLogin.comName}" class="form-control" style="width: 9%; float: right; m" id="Myboard">내가 쓴 글보기</a>
	</c:if>

	<div class="row mx-auto" style="width: 96%;">
		<table class="table  text-center">
			<colgroup>
				<col width="10%">
				<col width="*">
				<col width="12%">
				<col width="12%">
				<col width="12%">
			</colgroup>
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody class="table">


				<c:forEach items="${boardList }" var="board" >
					<tr class="detailBtn" data-attr="${board.boardNum }">
						<td>${board.boardNum}</td>
						<td>${board.boardTitle }</td>
						<td>${board.boardWriterName}*</td>
						<td>${board.boardDate }</td>
						<td>${board.boardViews }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
<c:if test="${paging.nowPage != 0 }">
	<div align="center">
		<nav aria-label="..." style="display: inline-flex;">
			<ul class="pagination">
				<c:if test="${paging.nowPage>5 }">
					<li class="page-item"><a class="page-link"
						href="freeBoardList.bo?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">Previous</a></li>
				</c:if>
				<c:if test="${paging.nowPage<=5 }">
					<li class="page-item disabled"><a class="page-link"
						href="freeBoardList.bo?nowPage=${paging.startPage }&cntPerPage=${paging.cntPerPage}">Previous</a></li>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
					var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<li class="page-item active"><a class="page-link">${p }</a></li>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<li class="page-item" aria-current="page"><a
								class="page-link"
								href="freeBoardList.bo?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:choose>
					<c:when test="${paging.isNext}">
						<li class="page-item"><a class="page-link"
							href="freeBoardList.bo?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">next</a></li>
					</c:when>
					<c:otherwise>
						<li class="page-item disabled"><a class="page-link"
							href="freeBoardList.bo?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">next</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
	</div>
</c:if>
<div id="footer">
	<div class="col-md-12" align="center">
		<div class="button1 col-md-1" id="writeBtn" style="background: #4876ef; color: white; text-align: center; border: 3px solid #f1f3f9; border-bottom: none; height: 50px; line-height: 50px; margin : 15px;">
			글쓰기
		</div>
	</div> 
	<div>
		<div class="row col-md-12">
			<div class="col-md-6 offset-md-2">
				
				<form action="freeBoardList.bo" method="post" class="form-group">
					<div class="form-row">
						<div class="col-md-3"></div>
						<div class="col-md-3">
							<select class="form-control" name="select">
								<option>전체</option>
								<option value="boARD_CONTENT">내용</option>
								<option value="boARD_TITLE">제목</option>
								<option value="boARD_WRITER_NAME">작성자</option>							
							</select>
						</div>
						<div class="col-md-4">
							<input type="text" class="form-control" name="search">
						</div>
						<div class="col-md-2" align="left">
							<input type="submit" class="btn btn-outline-primary" value="검색" style="width: 130px;">
						</div>
					</div>
				</form>
				
			</div>
		</div>
	</div>
</div>
	<script type="text/javascript">
	$(document).ready(function(){
		
		var comName = '${sessionScope.comLogin.comName}';
		var memName = '${sessionScope.memLogin.memName}';
		var category = 'free';
		var nowPage = '${paging.nowPage}';
				
	
		$(document).on('change','#cntPerPage',function() {				
			var cntPerPage = $(this).val();
			
			location.href = "freeBoardList.bo?nowPage=" + nowPage +"&cntPerPage="+ cntPerPage; 
		});
		
		
		$(document).on('click','.detailBtn',function() {
			var boardNum = $(this).attr('data-attr');
			if (comName == '' && memName == '') {
				alert('로그인이 필요한 서비스 입니다.');
			} else {
				location.href = "boardDetail.bo?boardNum=" + boardNum + "&category=" + category;
			}
		});
		$(document).on('click', '#writeBtn', function() {
			if (comName == '' && memName == '') {
				alert('로그인이 필요한 서비스 입니다.');
			} else {
				location.href = "boardWrite.bo?category=" + category;
			}
		});
	
		
	});
	</script>
</body>
</html>