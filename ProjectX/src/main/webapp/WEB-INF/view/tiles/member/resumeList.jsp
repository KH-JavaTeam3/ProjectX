<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@font-face { font-family: 'MyLotteBold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.0/MyLotteBold.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face {
    font-family: 'NEXON Lv2 Gothic Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv2 Gothic Bold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.moveToResumeTd:hover{
	cursor: pointer;
}
</style>
</head>
<body>
<div style="height: 100px;"></div>
	<div align="center">
		<span style="font-weight: bold; font-size: 30px; font-family:'MyLotteBold'; color: #0F4C81; position: relative; right: 289px;">이력서 LIST</span>
		<div style="height: 10px;"></div>
			<div class="col-md-6" style="border: 5px solid #658DC6; border-radius: 10px; ">
				<table class="table table-hover">
				<colgroup>
				<col width="20%">
				<col width="*">
				</colgroup>
					<c:forEach items="${resumeList }" var="re">
					<tr>
						<td  class="moveToResumeTd" data-attr="${re.resumeNum }" style=" font-family:'NEXON Lv2 Gothic Bold'; ">${re.resumeName }</td>
						<td>
							<input type="button" value="삭제" class="deleteResumeBtn">
						</td>
					</tr>
					</c:forEach>
				</table>
			</div>	
	</div>
<script type="text/javascript">
$(document).ready(function(){
	$(document).on('click', '.moveToResumeTd', function(){
		var resumeNum = $(this).attr('data-attr');
		location.href="moveToResumeDetail.me?resumeNum=" + resumeNum;
	});
});
</script>
<script src="resources/js/resumeList.js?ver=4"></script>
</body>
</html>