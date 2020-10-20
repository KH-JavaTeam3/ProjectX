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
table {
	width: 700px;
}
</style>
</head>
<body>
<div style="height: 30px;"></div>
<span style="font-weight: bold; font-size: 30px; font-family:'MyLotteBold';">관심 기업</span>
<div class="row col-md-12" style="border: 5px solid #ABC2E8; border-radius: 10px;">
	<table class="favoriteCompanyTable">
		<tr>
			<td>
				<a href="#"><img src="resources/images/kakao.jpg" style="width: 200px;"></a>
				<a href="#"><img src="resources/images/kakao.jpg" style="width: 200px;"></a>
				<a href="#"><img src="resources/images/kakao.jpg" style="width: 200px;"></a>
			</td>
		</tr>
		<tr>
			<td>
				<a href="#" style="font-size: 15px;">카카오</a>
				<a href="#" style="font-size: 15px;">카카오</a>
				<a href="#" style="font-size: 15px;">카카오</a>
			</td>
		</tr>
	</table>
</div>
</body>
</html>