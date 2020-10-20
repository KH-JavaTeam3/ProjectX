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
</style>
</head>
<body>
<div style="height: 30px;"></div>
	<span style="font-weight: bold; font-size: 30px; font-family:'MyLotteBold';">이력서 모음</span>
	<table class="table table-hover">
		<c:forEach items="${resumeList }" var="re">
		<tr>
			<td id="moveToResumeTd" data-attr="${re.resumeNum }">${re.resumeName }</td>
		</tr>
		</c:forEach>
	</table>
<script type="text/javascript">
	const move = document.querySelector('#moveToResumeTd');
	const resumeNum = move.getAttribute('data-attr');
	move.addEventListener('click', function() {
		location.href="moveToResumeDetail.me?resumeNum=" + resumeNum;
	});
</script>
</body>
</html>