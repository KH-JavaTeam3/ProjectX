<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.footer1 {
	position: absolute;
	left: 0;
	bottom: 0;
	width: 100%;
	height: 100%;
	text-align: center;
	color: white;
	height: 100px;
}

.button {
	font-size: 18px;
	font-weight: bold;
}

.a:hover {
	background: #4876ef;
	cursor: pointer;
	color: white;
}
select:invalid {
	color: gray;
}
</style>
</head>	
<body>
<div style="height: 50px;"></div>
	<div align="left">
		<div class="row"
			style="border-bottom: 3px solid #4876ef; width: 1473px; margin-left: 33px;">
			<div class="col-md-12">
				<div onclick="location.href='freeBoardList.bo'" class="a button col-md-2"
					style="background: #4876ef; color: white; display: inline-block;  text-align: center; border: 3px solid #f1f3f9; border-bottom: none; height: 50px; line-height: 50px; margin-left: 9px; left: -27px;">
					자유게시판</div>
				<div onclick="location.href='qaBoardList.bo'" class="a button col-md-2"
					style="display: inline-block; text-align: center; border: 3px solid #f1f3f9; border-bottom: none; height: 50px; line-height: 50px; left: -27px;">
					Q.A게시판</div>
			</div>
		</div>
	</div>
	<div style="height: 50px;"></div>
<form action="updateBoard.bo" method="post" id="formAbc">
<input type="hidden" name="boardNum" value="${detail.boardNum }">
<input type="hidden"  name="category" value="free">
<c:if test="${not empty sessionScope.memLogin }">
<input type="hidden" name="boardWriter"value="${sessionScope.memLogin.memEmail }">
<input type="hidden" name="boardWriterName"value="${sessionScope.memLogin.memName }">
</c:if>
<c:if test="${not empty sessionScope.comLogin }">
<input type="hidden" name="boardWriter"value="${sessionScope.comLogin.comNum }">
<input type="hidden" name="boardWriterName"value="${sessionScope.comLogin.comName }">
</c:if>
		<div style="width: 80%; height: 80%" class="mx-auto">
			<div class="form-row mx-auto">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="제목" style="width: 1227px;"name="boardTitle" required value="${detail.boardTitle }">
				</div>
			</div>
			
			<div class="form-group">
				<textarea class="form-control" rows="15" placeholder="내용" name="boardContent" required>${detail.boardContent}</textarea>
			</div>
		</div>
	<div style="height: 180px;" class="footer1 button">		
		<input type="button" value="뒤로가기" class="button col-md-1" id="backBtn"
			style="display: inline-block; background: #4876ef; color: white; text-align: center; border: 3px solid #f1f3f9; border-bottom: none; height: 50px; line-height: 50px; left: -27px;">					
	
		<input type="button" value="수정하기" class="button col-md-1" id="updateBtn"
			style="display: inline-block; background: #4876ef; color: white; text-align: center; border: 3px solid #f1f3f9; border-bottom: none; height: 50px; line-height: 50px; left: -27px;">					
	
	</div>	
</form>
<script type="text/javascript">
$(document).on('click', '#backBtn', function() {
	var boardNum = $('#boardNum').val();	
	var result = confirm("입력한 글이 사라집니다. 그래도 이동하시겠습니까?");
	if(result){
		location.href="boardDetail.bo?boardNum="+boardNum;
	}
});
$(document).on('click', '#updateBtn', function() {
	var result = confirm("수정하시겠습니까?");
	if(result){
		$('#formAbc').submit();
	}
});		
</script>
</body>
</html>