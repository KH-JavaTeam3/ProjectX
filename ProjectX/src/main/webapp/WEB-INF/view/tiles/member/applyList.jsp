<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@font-face { 
	font-family: 'MyLotteBold'; 
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.0/MyLotteBold.woff') format('woff'); 
	font-weight: normal; font-style: normal; 
}
@font-face {
	font-family: 'NEXON Lv2 Gothic Bold';
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv2 Gothic Bold.woff') format('woff');
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

input[type="button"] {
	background-color: #658DC6;
	border: 0px;
	color: white;
	margin-bottom: 6px;
	margin-top: 6px;
	border-radius: 5px;
}

input[type="button"]:hover {
	background-color: #658DC6;
	border: 0px;
	color: white;
}
</style>
</head>
<body>
<div style="height: 30px;"></div>
	<div align="center">
		<span style="font-weight: bold; font-size: 30px; font-family: 'MyLotteBold'; color: #0F4C81; position: relative; right: 546px;">지원 공고 목록</span>
		<div style="height: 10px;"></div>
		<div class="col-md-10" style="border: 5px solid #4876ef; border-radius: 10px;">
			<div style="height: 10px;"></div>
			<div class="col-md-12">
				<table style="width: 100%; height: 300px;">
					<colgroup>
						<col width="10%" />
						<col width="30%" />
						<col width="20%" />
						<col width="20%" />
						<col width="15%" />
					</colgroup>
					<tr>
						<td style="font-family: 'NEXON Lv2 Gothic Bold'; ">기업명</td>
						<td style="font-family: 'NEXON Lv2 Gothic Bold'; ">공고명</td>
						<td style="font-family: 'NEXON Lv2 Gothic Bold'; ">지원날짜</td>
						<td style="font-family: 'NEXON Lv2 Gothic Bold'; ">결과</td>
						<td style="font-family: 'NEXON Lv2 Gothic Bold'; ">삭제</td>
					</tr>
					<c:forEach items="${applyList }" var="ap">
						<tr class="table">
							<td>${ap.comName }</td>
							<td>${ap.announceTitle }</td>
							<td>${ap.applyDate }</td>
								<c:if test="${ap.resumeResult == '결과 대기' }">
									<td><samp style="color: green; font-weight: bold;">${ap.resumeResult }</samp></td>
								</c:if>
								<c:if test="${ap.resumeResult == '불합격' }">
									<td><samp style="color: red; font-weight: bold;">${ap.resumeResult }</samp></td>
								</c:if>
								<c:if test="${ap.resumeResult == '합격' }">
									<td><samp style="color: blue; font-weight: bold;">${ap.resumeResult }</samp></td>
								</c:if>
							<td class="deleteTd"><input type="button" class="btn btn-primary" value="삭제" onclick="location.href='deleteApply.me?applyNum=${ap.applyNum }'"></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>