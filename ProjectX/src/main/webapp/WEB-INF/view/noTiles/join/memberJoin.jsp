<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Findream</title>
<!-- 최신 부트스트랩CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- 유효성 검사 자바스크립트 -->
<!-- <script src="resources/js/jquery.validate.js"></script> -->


<style type="text/css">
input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

label.error {
	color: red;
	font-size: 12px;
	display: block;
}
</style>
</head>
<body style="background: #f4f5f7;">
	<div class="mx-auto" style="width: 30%;">
		<a href="memberJoin.do">개인 회원가입</a> <a href="companyJoin.do">기업
			회원가입</a>
		<h1>개인 회원가입</h1>
		<form action="initMemberJoin.do" method="post" id="loginForm">
			<div class="form-group">
				<label for="memEmail">이메일(아이디)</label> 
				<input type="button"
					class="btn btn-outline-primary"
					value="중복확인" id="emailChk">
				<input type="email"
					class="form-control" id="memEmail" name="memEmail" required>
			</div>
			<div class="form-group">
				<label for="memPass">비밀번호</label> <input type="password"
					class="form-control" id="memPass" name="memPass" required>
			</div>
			<div class="form-group">
				<label for="memPassChk">비밀번호 확인</label> <input type="password"
					class="form-control" id="memPassChk" required>
			</div>
			<div class="form-group">
				<label for="memName">이름</label> <input type="text"
					class="form-control" id="memName" name="memName" required>
			</div>
			<div class="form-group">
				<label for="memAge">나이</label> <input type="number"
					class="form-control" id="memAge" name="memAge" required>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" style="padding-left: 0px;" for="memBirth">생년월일</label>
				<input type="text" class="form-control"  name="memBirth" id="memBirth" required autocomplete="off">
			</div>
			<div class="form-group">
				<label>성별</label><br>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="memGender"
						id="radio1" value="M"> <label
						class="form-check-label" for="radio1" >남</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="memGender"
						id="radio2" value="W"> <label
						class="form-check-label" for="radio2" >여</label>
				</div>
			</div>
			<div class="form-group">
				<label for="memTel1">연락처</label> <input type="text"
					class="form-control" id="memTel1" name="memTel1" required>
			</div>
			<div class="form-group">
				<label>주소</label> 
				<input type="button" class="btn btn-outline-primary offset-md-9" id="findAddr" value="주소찾기"> 
				<input type="text" class="form-control" id="address" name="memAddr" style="width: 99%;">
			</div>


			<input type="button" class="btn btn-outline-primary" id="formBtn" value="회원가입">
		</form>
	</div>
<!-- Jquey -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 최신 부트스트랩JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="resources/js/memberJoin.js?ver=4"></script>
</body>
</html>