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
</style>
</head>
<body>
	<div style="height: 50px;"></div>
	<div align="left">
		<div class="row"
			style="border-bottom: 3px solid #4876ef; width: 1473px; margin-left: 33px;">
			<div class="col-md-12">
				<div onclick="location.href='freeBoardList.bo'"
					class="button col-md-2"
					style="display: inline-block; text-align: center; border: 3px solid #f1f3f9; border-bottom: none; height: 50px; line-height: 50px; margin-left: 9px; left: -27px; color: gray;">
					자유게시판</div>
				<div onclick="location.href='qaBoardList.bo'"
					class="button col-md-2"
					style="display: inline-block; background: #4876ef; color: white; text-align: center; border: 3px solid #f1f3f9; border-bottom: none; height: 50px; line-height: 50px; left: -27px;">
					Q.A게시판</div>
			</div>
		</div>
	</div>
	<div style="margin-left: 1412px;">
		<select id="cntPerPage" name="sel" onchange="selChange()">
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


				<c:forEach items="${boardList }" var="board">
					<tr class="detailBtn" data-attr="${board.board2Num }">
						<td>${board.board2Count}</td>
						<td>${board.board2Title }</td>
						<td>${board.board2WriterName }*</td>
						<td>${board.board2Date }</td>
						<td>${board.board2Views }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<nav aria-label="...">
		<ul class="pagination">
			<c:if test="${paging.nowPage>5 }">
				<li class="page-item"><a class="page-link"
					href="boardList2.bo?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">Previous</a></li>
			</c:if>
			<c:if test="${paging.nowPage<=5 }">
				<li class="page-item disabled"><a class="page-link"
					href="boardList2.bo?nowPage=${paging.startPage }&cntPerPage=${paging.cntPerPage}">Previous</a></li>
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
							href="boardList2.bo?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a></li>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:choose>
				<c:when test="${paging.isNext}">
					<li class="page-item"><a class="page-link"
						href="boardList2.bo?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">next</a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item disabled"><a class="page-link"
						href="boardList2.bo?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">next</a></li>
				</c:otherwise>
			</c:choose>

		</ul>
	</nav>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							function selChange() {
								var sel = document.getElementById('cntPerPage').value;
								location.href = "boardList2.bo?nowPage=${paging.nowPage}&cntPerPage="
										+ sel;
							}
							//클릭 이벤트
							var a = '${sessionScope.comLogin.comName}';
							var b = '${sessionScope.memLogin.memName}';
							var category = 'qa';
							$(document)
									.on(
											'click',
											'.detailBtn',
											function() {
												var boardNum = $(this).attr(
														'data-attr');
												if (a == '' && b == '') {
													alert('로그인이 필요한 서비스 입니다.');
												} else {
													location.href = "boardDetail.bo?boardNum="
															+ boardNum
															+ "&category="
															+ category;
												}
											});
							$(document)
									.on(
											'click',
											'#writeBtn1',
											function() {
												if (a == '' && b == '') {
													alert('로그인이 필요한 서비스 입니다.');
												} else {
													location.href = "boardWrite.bo?category="
															+ category;
												}
											});
						});
	</script>
</body>
</html>