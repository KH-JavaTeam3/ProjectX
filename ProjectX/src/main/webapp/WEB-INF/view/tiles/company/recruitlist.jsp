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
<div style="height: 30px;"></div>
	<div class="col-md-12" style="border: 5px solid #ABC2E8; border-radius: 10px;" align="center">
		<table class="type09">
		    <thead>
		    <tr>
		        <th colspan="8">공고 리스트</th>
		    </tr>
		    </thead>
		    	<tr>
		    		<td>No.</td>
		    		<td>제목</td>
		    		<td>근무시간</td>
		    		<td>직종</td>
		    		<td>분류</td>
		    		<td>지역</td>
		    		<td>모집종료</td>
		    	</tr>
		    <tbody>
		    <c:forEach items="${recruitlist }" var="recruit" varStatus="num">
		    <tr onclick="location.href='recruitDeleteForm.co?announceNum=${recruit.announceNum }'">
		        <td scope="row" onclick="location.href='recruitDeleteForm.co?announceNum=${recruit.announceNum }'">${num.count }</td>
		        <td>${recruit.announceTitle }</td>
		        <td> ${recruit.worktime }</td>
		        <td> ${recruit.jobtype }</td>
		        <td> ${recruit.workType }</td>
		        <td> ${recruit.area }</td>
		        <td> ${recruit.uptoHiredate }</td>
		    </tr>
		    </c:forEach>
		    </tbody>
		</table>
			<div class="action col-md-12" align="center" style="margin: 10px;">
			<br>
			</div>
		</div>
</body>
</html>