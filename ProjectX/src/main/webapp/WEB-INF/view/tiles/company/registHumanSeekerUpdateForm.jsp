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
<form action="registHumanSeekerUpdate.co" method="post" enctype="multipart/form-data">
<input type="hidden" value="${sessionScope.comLogin.comNum }" name="comNum">
<input type="hidden" value="${recruitDeteil.announceNum }" name="announceNum">
<div class="row" align="center" style="padding-top: 50px;">
		<div class="col-md-3" style="text-align: center;">
			<div class="input-group flex-nowrap">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="addon-wrapping">제목</span>
			  </div>
 				<input type="text" name="announceTitle" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping" value="${recruitDeteil.announceTitle }">
			</div>
		</div>
		<div class="col-md-3">
			<div class="input-group flex-nowrap">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="addon-wrapping">고용형태</span>
			  </div>
 				<input type="text" name="workType" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping" value="${recruitDeteil.workType }">
			</div>
		</div>
		<div class="col-md-3">
			<div class="input-group flex-nowrap">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="addon-wrapping">모집기간</span>
			  </div>
 				<input type="date" name="uptoHiredate" style="border: 1px solid lightgray; width: 266px;"value="${recruitDeteil.uptoHiredate }">
			</div>
		</div>
		<div class="col-md-3">
			<div class="input-group flex-nowrap">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="addon-wrapping">구인직종</span>
			  </div>
 				<input type="text" name="jobtype" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="addon-wrapping" value="${recruitDeteil.jobtype }">
			</div>
		</div>
		<div class="col-md-12" style="margin-bottom: 20px; margin-top: 20px;">
			<table id="recruit" style="text-align: center; width: 100%;">
				<tr>
					<td>근무형태</td>
					<td>연봉</td>
					<td>모집인원</td>
					<td>지원자격</td>
					<td>우대사항</td>
				</tr>
				<tr>
					<td>
        				<input type="radio" name="worktime" value="주간" <c:if test="${recruitDeteil.worktime == '주간'}"> checked="checked" </c:if>>주간
        				<input type="radio" name="worktime" value="야간" <c:if test="${recruitDeteil.worktime == '야간'}"> checked="checked" </c:if>>야간
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
					<td align="center">학력</td>
					<td align="center">경력</td>
					<td align="center">지역</td>
				</tr>
				<tr>
					<td>
						<select class="custom-select" id="inputGroupSelect01" name="career">
						    <option>Choose...</option>
						    <option value="고졸" <c:if test="${recruitDeteil.career == '고졸' }">selected</c:if>>고졸</option>
						    <option value="대졸(2,3년제)" <c:if test="${recruitDeteil.career == '대졸(2,3년제)'}">selected</c:if>>대졸(2,3년제)</option>
						    <option value="대졸(4 년제)"<c:if test="${recruitDeteil.career == '대졸(4년제)'  }">selected</c:if>>대졸(4 년제)</option>
						</select>
					</td>
					<td>
						<select class="custom-select" id="inputGroupSelect02" name="academicBackground">
						    <option >Choose...</option>
						    <option value="신입"<c:if test="${recruitDeteil.academicBackground == '신입' }">selected</c:if>>신입</option>
						    <option value="경력" <c:if test="${recruitDeteil.academicBackground == '경력' }">selected</c:if>>경력</option>
						    <option value="경력 5년" <c:if test="${recruitDeteil.academicBackground == '경력 5년' }">selected</c:if>>경력 5년</option>
						</select>
					</td>
					<td>
						<select class="custom-select" id="inputGroupSelect03" name="area">
						    <option>Choose...</option>
						    <option value="전국" <c:if test="${recruitDeteil.area == '전국' }">selected</c:if>>전국</option>
						    <option value="서울" <c:if test="${recruitDeteil.area == '서울' }">selected</c:if>>서울</option>
						    <option value="대구" <c:if test="${recruitDeteil.area == '대구' }">selected</c:if>>대구</option>
						    <option value="세종" <c:if test="${recruitDeteil.area == '세종' }">selected</c:if>>세종</option>
						    <option value="전남" <c:if test="${recruitDeteil.area == '전남' }">selected</c:if>>전남</option>
						    <option value="제주" <c:if test="${recruitDeteil.area == '제주' }">selected</c:if>>제주</option>
						    <option value="경기" <c:if test="${recruitDeteil.area == '경기' }">selected</c:if>>경기</option>
						    <option value="대전" <c:if test="${recruitDeteil.area == '대전' }">selected</c:if>>대전</option>
						    <option value="강원" <c:if test="${recruitDeteil.area == '강원' }">selected</c:if>>강원</option>
						    <option value="전북" <c:if test="${recruitDeteil.area == '전북' }">selected</c:if>>전북</option>
						    <option value="해외" <c:if test="${recruitDeteil.area == '해외' }">selected</c:if>>해외</option>
						    <option value="인천" <c:if test="${recruitDeteil.area == '인천' }">selected</c:if>>인천</option>
						    <option value="광주" <c:if test="${recruitDeteil.area == '광주' }">selected</c:if>>광주</option>
						    <option value="경남" <c:if test="${recruitDeteil.area == '경남' }">selected</c:if>>경남</option>
						    <option value="부산" <c:if test="${recruitDeteil.area == '부산' }">selected</c:if>>부산</option>
						    <option value="울산" <c:if test="${recruitDeteil.area == '울산' }">selected</c:if>>울산</option>
						    <option value="경북" <c:if test="${recruitDeteil.area == '경북' }">selected</c:if>>경북</option>
						    <option value="충북" <c:if test="${recruitDeteil.area == '충북' }">selected</c:if>>충북</option>
						</select>
					</td>
				</tr>
			</table>
		</div>
			<div class="col-md-12">
				<div class="custom-file mb-3">
				    <input type="file" class="custom-file-input" id="validatedCustomFile" name="file1" value="${recruitDeteil.registImage }">
				    <label class="custom-file-label" for="validatedCustomFile" id="registImage">${recruitDeteil.registImage }</label>
		  </div>
			</div>
			<div class="col-md-12">
			<table style="width: 100%;">
				<tr>
					<td align="center">내용</td>
				</tr>
				<tr>
					<td align="center">
						<textarea class="textarea" name="announceContent" rows="7" cols="15" style="width: 100%; border: none;">${recruitDeteil.announceContent }</textarea>
					</td>
				</tr>
			</table>
			<br>
			<div align="right">
			<button type="submit" class="submitBut">수정</button> <button  class="submitBut2" onclick="history.back();">취소</button>
			</div>
			</div>
		</div>
</form>

<script type="text/javascript">
$(document).on('change', '#validatedCustomFile', function() {
	var image = $('#validatedCustomFile').val();
	$('#registImage').text(image);
	$('#registImageHidden').val(image);
});
</script>
</body>
</html>