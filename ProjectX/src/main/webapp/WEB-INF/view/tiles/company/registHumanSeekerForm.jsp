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
<div style="height: 50px;" ></div>
<form action="registHumanSeeker.co" method="post" enctype="multipart/form-data">
<div class="row col-md-12" style="border: 5px solid #ABC2E8; border-radius: 10px;">
<input type="hidden" value="${sessionScope.comLogin.comNum }" name="comNum">
<div class="row" align="center" style="padding-top: 50px; margin-left: 0px; width: 100%;">
		<div class="col-md-3" style="text-align: center;">
			<div class="input-group flex-nowrap">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="addon-wrapping">제목</span>
			  </div>
 				<input type="text" name="announceTitle" class="form-control" aria-label="Username" aria-describedby="addon-wrapping">
			</div>
		</div>
		<div class="col-md-3">
			<div class="input-group flex-nowrap">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="addon-wrapping">고용형태</span>
			  </div>
 				<input type="text" name="workType" class="form-control" aria-label="Username" aria-describedby="addon-wrapping">
			</div>
		</div>
		<div class="col-md-3">
			<div class="input-group flex-nowrap">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="addon-wrapping">모집기간</span>
			  </div>
 				<input type="date" name="uptoHiredate" style="border: 1px solid lightgray; width: 266px;">
			</div>
		</div>
		<div class="col-md-3">
			<div class="input-group flex-nowrap">
			  <div class="input-group-prepend">
			    <span class="input-group-text" id="addon-wrapping">구인직종</span>
			  </div>
 				<!-- <input type="text" name="jobtype" class="form-control" aria-label="Username" aria-describedby="addon-wrapping"> -->
				  <select class="custom-select" id="inputGroupSelect01" name="jobtype">
				    <option selected>Choose...</option>
				    <option>경영.사무</option>
				    <option>전문직</option>
				    <option>미디어</option>
				    <option>영업.고객상담</option>
				    <option>의료</option>
				    <option>특수계층.공공</option>
				    <option>IT.인터넷</option>
				    <option>건설</option>
				    <option>디자인</option>
				    <option>교육</option>
				    <option>서비스</option>
				    <option>생산.제조</option>
				  </select>
			</div>
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
        				<input type="radio" name="worktime" value="주간" checked>주간
        				<input type="radio" name="worktime" value="야간">야간
					</td>
					<td><input class="input" type="number" name="anniSal"> </td>
					<td><input class="input" type="number" name="hireNum" min="0"></td>
					<td><input class="input" type="text" name="qualification"></td>
					<td><input class="input" type="text" name="benefit"></td>
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
						    <option selected>Choose...</option>
						    <option value="고졸">고졸</option>
						    <option value="대졸(2,3년제)">대졸(2,3년제)</option>
						    <option value="대졸(4 년제)">대졸(4 년제)</option>
						</select>
					</td>
					<td>
						<select class="custom-select" id="inputGroupSelect02" name="academicBackground">
						    <option selected>Choose...</option>
						    <option value="신입">신입</option>
						    <option value="경력">경력</option>
						    <option value="경력 5년">경력 5년</option>
						</select>
					</td>
					<td>
						<select class="custom-select" id="inputGroupSelect03" name="area">
						    <option selected>Choose...</option>
						    <option value="전국">전국</option>
						    <option value="서울">서울</option>
						    <option value="대구">대구</option>
						    <option value="세종">세종</option>
						    <option value="전남">전남</option>
						    <option value="제주">제주</option>
						    <option value="경기">경기</option>
						    <option value="대전">대전</option>
						    <option value="강원">강원</option>
						    <option value="전북">전북</option>
						    <option value="해외">해외</option>
						    <option value="인천">인천</option>
						    <option value="광주">광주</option>
						    <option value="경남">경남</option>
						    <option value="부산">부산</option>
						    <option value="울산">울산</option>
						    <option value="경북">경북</option>
						    <option value="충북">충북</option>
						</select>
					</td>
				</tr>
			</table>
		</div>
			<div class="col-md-12">
				<div class="custom-file mb-3">
				    <input type="file" class="custom-file-input" id="validatedCustomFile" name="file1" required>
				    <label class="custom-file-label" for="validatedCustomFile" id="registImage">대표 이미지...</label>
		     	</div>
			</div>
			<div class="col-md-12">
			<table style="width: 100%;">
				<tr>
					<td align="center">내용</td>
				</tr>
				<tr>
					<td align="center">
						<textarea class="textarea" name="announceContent" rows="7" cols="15" style="width: 100%; border: none;"></textarea>
					</td>
				</tr>
			</table>
			<br>
			<div align="right" style="margin: 5px;">
			<button type="submit" class="submitBut">작성</button> <button  class="submitBut2" onclick="history.back();">취소</button>
			<br>
			</div>
			</div>
		</div>
</form>

<script type="text/javascript">
$(document).on('change', '#validatedCustomFile', function() {
	var image = $('#validatedCustomFile').val();
	$('#registImage').text(image);
});
</script>
</body>
</html>