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
	left: 0;
	bottom: 0;
	width: 100%;
	height: 100%;
	text-align: center;
	color: white;
	height: 100px;
}

.button {
    color: gray;
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
#submit{
	position: absolute; 
	right: 11.6%;
	top: 75.1%;
}
textarea {
  outline-color: #4876ef;
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
					style=" display: inline-block;background: #4876ef; color: white;  text-align: center; border: 3px solid #f1f3f9; border-bottom: none; height: 50px; line-height: 50px; margin-left: 9px; left: -27px;">
					자유게시판</div>
				<div onclick="location.href='qaBoardList.bo'" class="a button col-md-2"
					style="display: inline-block; text-align: center; border: 3px solid #f1f3f9; border-bottom: none; height: 50px; line-height: 50px; left: -27px;">
					Q.A게시판</div>
			</div>
		</div>
	</div>
	
	<div style="height: 20px;"></div>
	
	<table class="table table-bordered mx-auto" style="width: 96% ">
  <thead>
  	<tr>
  		<th style="border-bottom: 1px solid white;"><small style="color:#4876ef; ">자유게시판</small></th>
  	</tr>
    <tr style="height:20px;font-weight: 400;">
      <th colspan="4" style="border-bottom: 1px solid white;"><label style="font-size: 30px;">${detail.boardTitle}</label></th>
    </tr>
  </thead>
  <tbody>
    <tr style="height:300px;">
      <th colspan="4" style="border-bottom: 1px solid white; font-size: 17px;"><p style="font-family: sans-serif;">${detail.boardContent}</p></th>
    </tr>
    <tr>
      <th colspan="4" style="color: gray;">${detail.boardWriterName}* ㅣ${detail.boardDate} ㅣ<img id="preview" src="resources/images/eye.png" style=" width:17px; padding-bottom: 3px;"> ${detail.boardViews}</th>
    </tr> 
  </tbody>
</table>
<form action="insertBoardComent.bo" method="post" style="margin-bottom: -66px;">
<input type="hidden" value="${detail.boardNum }" name="boardNum"> 
<c:if test="${not empty sessionScope.memLogin }">
<input type="hidden" value="${sessionScope.memLogin.memName }" name="boardComentWriter"> 
<input type="hidden" value="${sessionScope.memLogin.memEmail }" name="boardComentEmail">
</c:if> 
<c:if test="${not empty sessionScope.comLogin }">
<input type="hidden" value="${sessionScope.comLogin.comCeo }" name="boardComentWriter"> 
<input type="hidden" value="${sessionScope.comLogin.comEmail }" name="boardComentEmail">
</c:if> 
<%-- <input type="hidden" value="${detail.boardWriterName }" name="boardComentWriter"> 
<input type="hidden" value="${detail.boardWriter }" name="boardComentEmail"> --%> 

    <div align="center">
    	<textarea class="mx-auto" rows="3" style="width: 96%;" placeholder="COMMENT" name="boardComentContent"></textarea>
    </div>
    <input type="submit"  id="submit" value="등록" style="height: 78px; background: #4876ef; color: white; border: none; ">
</form>


<div align="center" style="margin-top: 70px;">
<table class="table mx-outo" style="width: 96%;">
  <tbody>
	  <c:forEach items="${boardComent }" var="coment">
	    <tr>
	      <td style="width: 130px; color: gray;">${coment.boardComentWriter }*</td>
	      <td style="word-break:break-all">${coment.boardComentContent }
	   	   <a id="deleteComentBtn" data-attr="${coment.boardComentNum }" style="color: red;">x</a>
	      </td>
	      <td style="width: 175px; color: gray;">${coment.boardComentDate }</td>
	    </tr>
	</c:forEach>
  </tbody>
</table>
</div>
	<div style="height: 180px;" class="footer1 button">		
		<input type="button" value="뒤로가기" class="button col-md-1" id="backBtn"
			style="display: inline-block; background: #4876ef; color: white; text-align: center; border: 3px solid #f1f3f9; border-bottom: none; height: 50px; line-height: 50px; left: -27px;">					
	
		<input type="button" value="수정하기" class="button col-md-1" id="updateBtn"
			style="display: inline-block; background: #4876ef; color: white; text-align: center; border: 3px solid #f1f3f9; border-bottom: none; height: 50px; line-height: 50px; left: -27px;">					
		
		<input type="button" value="삭제하기" class="button col-md-1" id="deleteBtn"
			style="display: inline-block; background: #4876ef; color: white; text-align: center; border: 3px solid #f1f3f9; border-bottom: none; height: 50px; line-height: 50px; left: -27px;">	
	</div>	
</body>

<script type="text/javascript">
$(document).ready(function(){
	
	const comName = '${sessionScope.comLogin.comName}';
	const memName = '${sessionScope.memLogin.memName}';
	const memEmail = '${sessionScope.memLogin.memEmail}';
	const boardWriterName = '${detail.boardWriterName }';
	const boardRealWriterName = '${detail.boardRealWriterName }';
	const boardNum = '${detail.boardNum }';
	const category = 'free';
	const boardWriter = '${detail.boardWriter}';
	
	
	//뒤로 가기
	$(document).on('click', '#backBtn', function() {
		history.back();
	});
	
	//삭제 버튼
	$(document).on('click', '#deleteBtn', function() {
		
	 	if(comName == '' && memName == ''){
			alert('로그인이 필요한 서비스 입니다.');
		}else{
			if(boardRealWriterName == memName){
				var result = confirm("게시글을 삭제하시겠습니까?");
				if(result){
					location.href="deleteBoard.bo?boardNum=" + boardNum + "&boardWriter=" + boardWriter + "&category=" + category;
				}		
			}
			else{
				alert('자신의 게시글만 삭제할수 있습니다.');
			}
		} 
	});
	//게시글 댓글삭제 버튼
	$(document).on('click', '#deleteComentBtn', function() {
		var boardComentNum = $(this).attr('data-attr');
		
	 	if(comName == '' && memName == ''){
			alert('로그인이 필요한 서비스 입니다.');
			
		}else{
			if(boardRealWriterName == memName){
			
				var result = confirm("댓글을 삭제하시겠습니까?");
				if(result){
					location.href="deleteBoardComent.bo?boardComentNum=" + boardComentNum + "&boardComentEmail=" + boardWriter + "&category=" + category + "&boardNum=" + boardNum;
				}		
			}
			else{
				
				alert('자신의 댓글만 삭제할수 있습니다.');
			}
		} 
	});
		
	//수정 버튼
	$(document).on('click', '#updateBtn', function() {
		
		if(comName == '' && memName == ''){
			alert('로그인이 필요한 서비스 입니다.');
		}
		else{
			if(boardWriter == memEmail){		
				location.href="updateBoard.bo?boardNum=" + boardNum + "&category=" + category;
			}
			else{
				alert('자신의 게시글만 수정할수 있습니다.');
			}
		} 		 		 	
	});
	
});


</script>

</html>