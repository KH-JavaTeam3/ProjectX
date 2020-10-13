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
    	<th><input type="checkbox" id="checkAll" checked></th>
        <th scope="cols">공고 리스트</th>
        <th scope="cols"></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${recruitlist }" var="recruit" varStatus="num">
    <tr>
    	<th><input type="checkbox" class="chk" value="${recruit.announceNum }" checked></th>
        <td scope="row" onclick="location.href='recruitDeleteForm.co?announceNum=${recruit.announceNum }'">${num.count }</td>
        <td onclick="location.href='recruitDeleteForm.co?announceNum=${recruit.announceNum }'">${recruit.announceTitle }</td>
    </tr>
    </c:forEach>
    </tbody>
</table>
	<div class="action" align="center">
			<input type="button" style="background: skyblue; border: 1px solid; color: white; width: 120px; height: 30px;" id="deleteCartBtu" value="삭제">
			<input type="button" style="background: skyblue; border: 1px solid; color: white; width: 120px; height: 30px;" id="cartBuyPage" value="구매">
	</div>
	</div>
</body>
  <!-- smaple.js를 사용하기 위한 태그 -->
<script src="resources/js/recruitDeleteList.js?ver=1"></script>
</html>