<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
@font-face { font-family: 'MyLotteBold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.0/MyLotteBold.woff') format('woff'); font-weight: normal; font-style: normal; }
@font-face {
	font-family: 'NEXON Lv2 Gothic Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv2 Gothic Bold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
table {
	width: 80%;
	text-align: center;
}
a{
	color: black;
}
a:hover {
	text-decoration: none;
	color: #1061e3;
}

</style>
<title>Insert title here</title>
</head>
<body>
<div style="height: 30px;"></div>
<span style="font-family: MyLotteBold; font-size: 30px; color: #0F4C81; position: relative; left: 133px;">관심공고</span>
<div style="height: 10px;"></div>
<div align="center">
<div class="row col-md-10" style="border: 5px solid #658DC6; border-radius: 10px;">
	<table class="table">
	<colgroup>
		<col width="30%">
		<col width="15%">
		<col width="15%">
		<col width="10%">
		<col width="10%">
		<col width="10%">
	</colgroup>
		<tr style="cursor: default;">
			<td align="center" style="font-family: 'NEXON Lv2 Gothic Bold';">공고 이름</td>
			<td align="center" style="font-family: 'NEXON Lv2 Gothic Bold';">마감 날짜</td>
			<td align="center" style="font-family: 'NEXON Lv2 Gothic Bold';">모집 직종</td>
			<td align="center" style="font-family: 'NEXON Lv2 Gothic Bold';">지원 자격</td>
			<td align="center" style="font-family: 'NEXON Lv2 Gothic Bold';">모집 경력</td>
			<td align="center" style="font-family: 'NEXON Lv2 Gothic Bold';">모집 지역</td>
		</tr>
		<c:forEach items="${likeRecruitList }" var="likeRecruit">
			<tr onclick="location.href='companyDetail.do?comNum=${likeRecruit.comNum}&announceNum=${likeRecruit.announceNum }'" style="cursor: pointer;">
				<td align="center">${likeRecruit.announceTitle }</td>
				<td>~${likeRecruit.uptoHiredate }</td>
				<td>${likeRecruit.workType }</td>
				<td>${likeRecruit.career }↑</td>
				<td>${likeRecruit.academicBackground }</td>
				<td>${likeRecruit.area }</td>
			</tr>
		</c:forEach>
	</table>
</div>
</div>
</body>
</html>