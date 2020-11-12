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
	top: 601px;
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
					style=" display: inline-block;  text-align: center; border: 3px solid #f1f3f9; border-bottom: none; height: 50px; line-height: 50px; margin-left: 9px; left: -27px;">
					자유게시판</div>
				<div onclick="location.href='qaBoardList.bo'" class="a button col-md-2"
					style="display: inline-block; background: #4876ef; color: white; text-align: center; border: 3px solid #f1f3f9; border-bottom: none; height: 50px; line-height: 50px; left: -27px;">
					Q.A게시판</div>
			</div>
		</div>
	</div>
	
	<div style="height: 50px;"></div>
	
	<table class="table table-bordered mx-auto" style="width: 96%">
  <thead>
    <tr style="height:20px;font-size: 20px;font-weight: 400;">
      <th colspan="4">${detail.board2Title}</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th colspan="4">${detail.board2WriterName}*ㅣ${detail.board2Date} ㅣ<img id="preview" src="resources/images/eye.png" style=" width:17px; padding-bottom: 3px;"> ${detail.board2Views}</th>
    </tr> 
    <tr style="height:200px;">
      <th colspan="4">${detail.board2Content}</th>
    </tr>
  </tbody>
</table>
<form action="insertBoard2Coment.bo" method="post">
<input type="hidden" value="${detail.board2Num }" name="board2Num"> 
<input type="hidden" value="${detail.board2WriterName }" name="board2ComentWriter">
<input type="hidden" value="${detail.board2Writer }" name="board2ComentEmail"> 
    <div align="center">
    	<textarea class="mx-auto" rows="3" style="width: 96%;" placeholder="COMMENT" name="board2ComentContent"></textarea>
    </div>
    <input type="submit"  id="submit" value="등록" style="height: 78px; background: #4876ef; color: white; border: none; ">
</form>
<div align="center">
<table class="table mx-outo" style="width: 96%;">
  <tbody>
  <c:forEach items="${board2Coment }" var="Coment">
    <tr>     
      <td style="width: 130px;">${Coment.board2ComentWriter }*</td>
      <td style="word-break:break-all">${Coment.board2ComentContent }
      	<a id="delete2ComentBtn" data-attr="${Coment.board2ComentNum }" style="color: red;">x</a>
      </td>
      <td style="width: 130px;">${Coment.board2ComentDate }</td>
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
	const board2WriterName = '${detail.board2WriterName }';
	const board2RealWriterName = '${detail.board2RealWriterName }';
	const board2Num = '${detail.board2Num }';
	const category = 'qa';
	const board2Writer = '${detail.board2Writer}';
	
	//뒤로 가기
	$(document).on('click', '#backBtn', function() {
		history.back();
	});
	
	//삭제 버튼
	$(document).on('click', '#deleteBtn', function() {
	
	 	if(comName == '' && memName == ''){
			alert('로그인이 필요한 서비스 입니다.');
		}else{
			if(board2RealWriterName == memName){
				var result = confirm("게시글을 삭제하시겠습니까?");
				if(result){
					location.href="deleteBoard.bo?boardNum=" + board2Num + "&boardWriter=" + board2Writer + "&category=" + category;
				}		
			}
			else{
				alert('자신의 게시글만 삭제할수 있습니다.');
			}
		} 
	});		
	//게시글 댓글삭제 버튼
	$(document).on('click', '#delete2ComentBtn', function() {

		var board2ComentNum = $(this).attr('data-attr');
	 	if(comName == '' && memName == ''){
			alert('로그인이 필요한 서비스 입니다.');
			
		}else{

			if(board2Writer == memEmail){
			
				var result = confirm("게시글을 삭제하시겠습니까?");
				if(result){
					location.href="deleteBoard2Coment.bo?board2ComentNum=" + board2ComentNum + "&board2ComentEmail=" + board2Writer + "&category=" + category + "&board2Num=" + board2Num;
				}		
			}
			else{
				
				alert('자신의 게시글만 삭제할수 있습니다.');
			}
		} 
	});
	
	//수정 버튼
	$(document).on('click', '#updateBtn', function() {
		
		if(comName == '' && memName == ''){
			alert('로그인이 필요한 서비스 입니다.');
		}
		else{
			if(board2Writer == memEmail){		
				 location.href="updateBoard.bo?boardNum=" + board2Num + "&category=" + category; 
			}
			else{
				alert('자신의 게시글만 수정할수 있습니다.');
			}
		} 		 		 	
	});
	
});


</script>

</html>