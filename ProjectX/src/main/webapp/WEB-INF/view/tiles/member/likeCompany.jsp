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
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv2 Gothic Bold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
.NEXON{
font-family: 'NEXON Lv2 Gothic Bold';
}
</style>
</head>
<body>
<div style="height: 30px;"></div>
<span style="font-family: MyLotteBold; font-size: 30px; color: #0F4C81; position: relative; left: 133px;">관심기업</span>
<div style="height: 10px;"></div>
<div align="center">
<div class="row col-md-10" style="border: 5px solid #658DC6; border-radius: 10px;">
	<table class="table">
	<colgroup>
		<col width="30%">
		<col width="10%">
		<col width="15%">
		<col width="10%">
		<col width="20%">
	</colgroup>
		<tr onclick="location.href='companyDetail.do?comNum=${likeRecruit.comNum}&announceNum=${likeRecruit.announceNum }'">
				<td align="center" class="NEXON">기업명</td>
				<td align="center" class="NEXON">직종</td>
				<td align="center" class="NEXON">기업 이메일</td>
				<td align="center" class="NEXON">기업 번호</td>
				<td align="center" class="NEXON">주소</td>
			</tr>
		<c:forEach items="${likeCompanyList }" var="likeCompany">
			<tr onclick="location.href='comList.do#${likeCompany.comName }'">
				<td align="center">${likeCompany.comName }</td>
				<td align="center">${likeCompany.comType }</td>
				<td align="center">${likeCompany.comEmail }</td>
				<td align="center">${likeCompany.comTel }</td>
				<td align="center">${likeCompany.comLoc }</td>
			</tr>
		</c:forEach>
	</table>
</div>
</div>
</body>
</html>