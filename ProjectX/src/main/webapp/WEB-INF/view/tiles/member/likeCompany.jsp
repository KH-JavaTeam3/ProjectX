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
<span style="font-family: MyLotteBold; font-size: 30px;">관심기업</span>
<div class="row col-md-12" style="border: 5px solid #ABC2E8; border-radius: 10px;">
	<table>
<!-- 		<tr> -->
<%-- 			<c:forEach items="${likeCompanyList }" var="likeCompany"> --%>
<!-- 				<td> -->
<%-- 					<a href="companyDetail.do">${likeCompanyList.comImage }</a> --%>
<!-- 				</td> -->
<%-- 			</c:forEach> --%>
<!-- 		</tr> -->
		<tr>
			<c:forEach items="${likeCompanyList }" var="likeCompany">
				<td style="border: 1px solid black;">
					${likeCompany.comName }
				</td>
			</c:forEach>
		</tr>
	</table>
</div>
</body>
</html>