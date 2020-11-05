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
<input type="hidden" value="${resumeList.comNum }" class="resumeAppcomNum">
<input type="hidden" value="${resumeList.announceNum }" class="resumeAppannounceNum">
<div style="height: 50px;"></div>
	<table class="table table-hover">
		<c:forEach items="${resumeList.resumeList }" var="re">
		<tr>
			<td><input type="checkbox" class="chk" value="${re.resumeNum }"></td>
			<td id="moveToResumeTd">${re.resumeName }</td>
		</tr>
		</c:forEach>
	</table>
	<div align="center">
		<input type="button" style="background: #ABC2E8; border: 1px solid; color: white; width: 120px; height: 30px;" id="resumeAppBut" value="확인">
		<input type="button" style="background: #ABC2E8; border: 1px solid; color: white; width: 120px; height: 30px;" id="cartBuyPage" value="취소" onclick="history.back();">
	</div>
<script src="resources/js/resumeApplication.js?ver=10"></script>
</body>
</html>