<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table.type09 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;

}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}
table.type09 tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table.type09 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
</style>
</head>
<body>
	<div align="center">
		<table class="type09">
    <thead>
    <tr>
        <th scope="cols">공고 리스트</th>
        <th scope="cols"></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${recruitlist }" var="recruit" varStatus="num">
    <tr onclick="location.href='registHumanSeekerUpdateForm.co?announceNum=${recruit.announceNum }'">
        <th scope="row">${num.count }</th>
        <td>${recruit.announceTitle }</td>
    </tr>
    </c:forEach>
    </tbody>
</table>
	</div>
</body>
</html>