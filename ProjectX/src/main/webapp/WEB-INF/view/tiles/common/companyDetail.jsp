<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<meta charset="UTF-8">

<title>Insert title here</title>
<style type="text/css">
.divtop > div {
	padding: 5px;
	display: inline-block;
}
#recruit > tr,td{
	border: 1px solid lightgray;
}

 .submitBut{
 	border-radius: 5px;
 	font-weight: bold;
 	background: white;
 	color: black;
 }
 .submitBut:hover{
 	border-radius: 5px;
 	font-weight: bold;
 	background: #00FF80;
 	color: black;
 }
 .submitBut2{
 	border-radius: 5px;
 	font-weight: bold;
 	background: white;
 	color: black;
 }
 .submitBut2:hover{
 	border-radius: 5px;
 	font-weight: bold;
 	background: #FA5858;
 	color: black;
 }
 .textarea{
 	outline: none;
 }
 .input {
	border: none;
	outline: none;
	text-align: center;
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
</style>
</head>
<body>

<input type="hidden" value="${recruitDeteil.comNum }" name="comNum">
<input type="hidden" value="${recruitDeteil.announceNum }" name="announceNum">
<div class="row col-md-12" style="border: 5px solid #ABC2E8; border-radius: 10px;" >
	<div class="col-md-12" align="center"><span style="font-size: 24px; font-weight: bold;"> ${recruitDeteil.comName } </span></div>
<div class="row" align="center" style="padding-top: 20px; margin-left: 0px; width: 100%">
		<div class="col-md-3" style="text-align: center;">
			<div class="input-group flex-nowrap">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="addon-wrapping" style="background-color:#ABC2E8;">제목</span>
			  </div>
 				<input type="text" name="announceTitle" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping" value="${recruitDeteil.announceTitle }" >
			</div>
		</div>
		<div class="col-md-3">
			<div class="input-group flex-nowrap">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="addon-wrapping"style="background-color:#ABC2E8;">고용형태</span>
			  </div>
 				<input type="text" name="workType" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping" value="${recruitDeteil.workType }" >
			</div>
		</div>
		<div class="col-md-3">
			<div class="input-group flex-nowrap">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="addon-wrapping"style="background-color:#ABC2E8;">모집기간</span>
			  </div>
 				<input type="date" name="uptoHiredate" style="border: 1px solid lightgray; width: 266px;"value="${recruitDeteil.uptoHiredate }">
			</div>
		</div>
		<div class="col-md-3">
			<div class="input-group flex-nowrap">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="addon-wrapping"style="background-color:#ABC2E8;">구인직종</span>
			  </div>
 				<input type="text" name="jobtype" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping" value="${recruitDeteil.jobtype }">
			</div>
		</div>
		</div>
		<div class="col-md-12" style="margin-bottom: 20px; margin-top: 20px;">
			<table id="recruit" style="text-align: center; width: 100%;">
				<tr>
					<td style="background-color:#ABC2E8">근무형태</td>
					<td style="background-color:#ABC2E8">연봉</td>
					<td style="background-color:#ABC2E8">모집인원</td>
					<td style="background-color:#ABC2E8">지원자격</td>
					<td style="background-color:#ABC2E8">우대사항</td>
				</tr>
				<tr>
					<td>
        				<c:if test="${recruitDeteil.worktime == '주간'}"> <span>주간</span> </c:if> 
        				<c:if test="${recruitDeteil.worktime == '야간'}"> <span>야간</span> </c:if>
					</td>
					<td><input class="input" type="number" name="anniSal" value="${recruitDeteil.anniSal }"> </td>
					<td><input class="input" type="number" name="hireNum" min="0" value="${recruitDeteil.hireNum }"></td>
					<td><input class="input" type="text" name="qualification" value="${recruitDeteil.qualification }"></td>
					<td><input class="input" type="text" name="benefit" value="${recruitDeteil.benefit }"></td>
				</tr>
			</table>
		</div>
			<div class="col-md-12" style="margin-bottom: 20px; margin-top: 20px;">
			<table style="width: 100%;"> 
				<tr>
					<td align="center" style="background-color:#ABC2E8">학력</td>
					<td align="center" style="background-color:#ABC2E8">경력</td>
					<td align="center" style="background-color:#ABC2E8">지역</td>
				</tr>
				<tr>
					<td align="center">
						${recruitDeteil.career }
					</td>
					<td align="center">
						${recruitDeteil.academicBackground }
					</td>
					<td align="center">
						${recruitDeteil.area }
					</td>
				</tr>
			</table>
		</div>
			
			
			<div class="col-md-12" align="center" >
					<img id="preview" src="resources/images/comProfile/${recruitDeteil.registImage } " style=" width:100%; margin-top: 10px; margin-bottom: 10px;">
			</div>
			
			<div class="col-md-12">
			<table style="width: 100%;">
				<tr>
					<td align="center" style="background-color:#ABC2E8">내용</td>
				</tr>
				<tr>
					<td align="center">
						<textarea class="textarea" name="announceContent" rows="7" cols="15" style="width: 100%; border: none;" disabled="disabled">${recruitDeteil.announceContent }</textarea>
					</td>
				</tr>
			</table>
			<br>
			
			</div>
			<div class="col-md-12" align="right" style="margin-bottom : 5px;">
				<input type="button" style="background: #ABC2E8; border: 1px solid; color: white; width: 120px; height: 30px;" value="지원" onclick="location.href='resumeApplication.me?comNum=${recruitDeteil.comNum }&announceNum=${recruitDeteil.announceNum }'">
					<input type="button" style="background: #ABC2E8; border: 1px solid; color: white; width: 120px; height: 30px;" id="" value="취소" onclick="history.back();">
			</div>
		</div>


<script type="text/javascript">
$(document).on('change', '#validatedCustomFile', function() {
	var image = $('#validatedCustomFile').val();
	$('#registImage').text(image);
	$('#registImageHidden').val(image);
});
</script>
<script src="resources/js/comWriteResume.js?ver=0"></script>
</body>
</html>