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
}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #ABC2E8;
}
table.type09 tbody th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table.type09 td {
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
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
		        <th colspan="8">공고 리스트</th>
		    </tr>
		    </thead>
		    	<tr>
		    		<th><input type="checkbox" id="checkAll" checked></th>
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
		    <tr>
		    	<th><input type="checkbox" class="chk" value="${recruit.announceNum }" checked></th>
		        <td scope="row" onclick="location.href='recruitDeleteForm.co?announceNum=${recruit.announceNum }'">${num.count }</td>
		        <td onclick="location.href='recruitDeleteForm.co?announceNum=${recruit.announceNum }'"> ${recruit.announceTitle }</td>
		        <td onclick="location.href='recruitDeleteForm.co?announceNum=${recruit.announceNum }'"> ${recruit.worktime }</td>
		        <td onclick="location.href='recruitDeleteForm.co?announceNum=${recruit.announceNum }'"> ${recruit.jobtype }</td>
		        <td onclick="location.href='recruitDeleteForm.co?announceNum=${recruit.announceNum }'"> ${recruit.workType }</td>
		        <td onclick="location.href='recruitDeleteForm.co?announceNum=${recruit.announceNum }'"> ${recruit.area }</td>
		        <td onclick="location.href='recruitDeleteForm.co?announceNum=${recruit.announceNum }'"> ${recruit.uptoHiredate }</td>
		    </tr>
		    </c:forEach>
		    </tbody>
		</table>
			<div class="action col-md-12" align="center" style="margin: 10px;">
					<input type="button" style="background: #ABC2E8; border: 1px solid; color: white; width: 120px; height: 30px;" id="deleteCartBtu" value="삭제">
					<input type="button" style="background: #ABC2E8; border: 1px solid; color: white; width: 120px; height: 30px;" id="cartBuyPage" value="취소" onclick=" location.href='comMypage.co'">
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
<script src="resources/js/recruitDeleteList.js?ver=1"></script>
</html>