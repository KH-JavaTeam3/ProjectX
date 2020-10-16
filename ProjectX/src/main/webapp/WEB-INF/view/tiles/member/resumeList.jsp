<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="height: 50px;"></div>
	<h1>이력서 목록</h1>
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