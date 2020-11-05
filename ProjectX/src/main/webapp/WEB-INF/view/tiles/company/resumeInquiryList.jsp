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
<span style="font-weight: bold; font-size: 24px;">이력서 조회</span>
   <div style="height: 20px;"></div>
   <c:if test="${empty resumeInquiryList }">
   <div class="col-md-12" style="border: 5px solid #ABC2E8; border-radius: 10px;" align="center">
		<table class="type09">
			<tr>
				<td><span>받은 이력서가 없습니다..</span> </td>
			</tr>
		</table>
		</div>
   </c:if>
		    <c:forEach items="${resumeInquiryList }" var="resumeInquiry" varStatus="num">
	<div class="col-md-12" style="border: 5px solid #ABC2E8; border-radius: 10px; margin-bottom: 10px;" align="center">
		<input type="hidden" name="announceNum" value="${resumeInquiry.announceNum }">
		<table class="type09">
		    <thead>
		    <tr>
		        <th colspan="9">${resumeInquiry.memEmail }의 이력서</th>
		    </tr>
		    </thead>
		    	<tr>
		    		<td>제목</td>
		    		<td>학력</td>
		    		<td colspan="2">학교</td>
		    		<td>전공</td>
		    		<td>학과</td>
		    		<td>졸업여부</td>
		    		<td></td>

		    	</tr>
	<tbody>
		    <tr>
		        <td>${resumeInquiry.resumeName }</td>
		        <td>${resumeInquiry.eduGrade }</td>
		        <td colspan="2">${resumeInquiry.eduSchool }</td>
		        <td>${resumeInquiry.eduType }</td>
		        <td>${resumeInquiry.eduMajor }</td>
		        <td>${resumeInquiry.eduIsOver }</td>
		        <td></td>
		        
		    </tr>
		    <tr style="border-top: 3px solid #ABC2E8;">
	    		<td>지역</td>
	    		<td>경력 기간</td>
	    		<td>경력 직종</td>
	    		<td colspan="2">희망 급여</td>
	    		<td></td>
	    		<td></td>
	    		<td></td>
		    </tr>
		    <tr>
		    	<td>${resumeInquiry.eduLoc }</td>
		        <td>${resumeInquiry.carCareer }</td>
		        <td>${resumeInquiry.carType }</td>
		        <td colspan="2">${resumeInquiry.hopeSal }</td>
		        <td></td>
		        <td></td>
		        <td></td>
		    </tr>
	</tbody>
		    
		</table>
		<c:if test="${resumeInquiry.resumeResult == 'N' }"><samp style="font-size: 14px; font-weight: bold; color: red;">불합격</samp></c:if>
		<c:if test="${resumeInquiry.resumeResult == 'Y' }"><samp style="font-size: 14px; font-weight: bold; color: blue;">합격</samp></c:if>
			<div class="action col-md-12" align="center" style="margin: 10px;">
					<input type="button" style="background: #ABC2E8; border: 1px solid; color: white; width: 120px; height: 30px;"  value="상세보기" onclick=" location.href='comMoveToResumeDetail.me?resumeNum=${resumeInquiry.resumeNum}&memEmail=${resumeInquiry.memEmail }&comMypageNum=${resumeInquiry.comMypageNum }&announceNum=${resumeInquiry.announceNum }'">
					<input type="button" style="background: #ABC2E8; border: 1px solid; color: white; width: 120px; height: 30px;"  value="취소" onclick=" location.href='comMypage.co'">
			</div>
		</div>
		    </c:forEach>
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