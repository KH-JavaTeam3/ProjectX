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
	width:90%;
	border-collapse: collapse;
	line-height: 1.5;
	text-align: center;
	margin-top: 21px;
}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border: 1px solid #ccc;
    background: #f3f6f7;
}
table.type09 tbody th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border: 1px solid #ccc;
    background: #f3f6f7;
}
table.type09 td {
    padding: 10px;
    vertical-align: top;
}
</style>
</head>
<body>
<div style="height: 50px;"></div>
<span style="font-weight: bold; font-size: 24px;">공고 리스트</span>
   <div style="height: 20px;"></div>
	<div class="col-md-12" style="border: 5px solid #ABC2E8; border-radius: 10px;" align="center">
		<table class="type09">
			<thead>
		    	<tr>
		    		<th><input type="checkbox" id="checkAll" checked></th>
		    		<th>No.</th>
		    		<th>제목</th>
		    		<th>근무시간</th>
		    		<th>직종</th>
		    		<th>분류</th>
		    		<th>지역</th>
		    		<th>모집종료</th>
		    		<th>수정</th>
		    	</tr>
		    </thead>
		    <tbody>
		    <c:forEach items="${recruitlist }" var="recruit" varStatus="num">
		    <tr>
		    	<td><input type="checkbox" class="chk" value="${recruit.announceNum }" checked></td>
		        <td scope="row">${num.count }</td>
		        <td> ${recruit.announceTitle }</td>
		        <td> ${recruit.worktime }</td>
		        <td> ${recruit.jobtype }</td>
		        <td> ${recruit.workType }</td>
		        <td> ${recruit.area }</td>
		        <td> ${recruit.uptoHiredate }</td>
		        <td><input type="button" value="수정" class="btn btn-outline-primary" onclick="location.href='recruitDeleteForm.co?announceNum=${recruit.announceNum }'"></td>
		    </tr>
		    </c:forEach>
		    </tbody>
		</table>
			<div class="action col-md-12" align="center" style="margin: 10px;">
					<input type="button" class="btn btn-primary" style="background: #ABC2E8; border: 1px solid; color: white; width: 120px; height: 35px;" id="deleteCartBtu" value="삭제">
					<input type="button"  class="btn btn-primary" style="background: #ABC2E8; border: 1px solid; color: white; width: 120px; height: 35px;" id="cartBuyPage" value="취소" onclick=" location.href='comMypage.co'">
			</div>
		</div>
</body>
<!-- <script type="text/javascript">
$(document).on('click', '.delete', function(){
	var num = $(this).parent().children().children().val();
	alert(num);
	location.href='recruitDeleteForm.co?announceNum=num';
});
</script> -->
  <!-- smaple.js를 사용하기 위한 태그 -->
<script src="resources/js/recruitDeleteList.js?ver=2"></script>
</html>