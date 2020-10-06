<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Findream</title>
<!-- 최신 부트스트랩CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<!-- Jquey -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 최신 부트스트랩JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
	<!-- 유효성 검사 자바스크립트 -->
<!-- <script src="resources/js/jquery.validate.js"></script> -->



<style type="text/css">
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
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
	<a href="memberJoin.do">개인 회원가입</a>
	<a href="companyJoin.do">기업 회원가입</a>
	<h1>개인 회원가입</h1>
	<form action="initMemberJoin.do" method="post">
		<div class="form-group">
				<label for="memEmail">이메일(아이디)</label> <input type="email"
					class="form-control" id="memEmail" name="memEmail">
			</div>
			<div class="form-group">
				<label for="memPass">비밀번호</label> <input type="password"
					class="form-control" id="memPass" name="memPass">
			</div>
			<div class="form-group">
				<label for="memPassChk">비밀번호 확인</label> <input type="password"
					class="form-control" id="memPassChk">
			</div>
			<div class="form-group">
				<label for="memName">이름</label> <input type="text"
					class="form-control" id="memName" name="memName">
			</div>
			<div class="form-group">
				<label for="memAge">나이</label> <input type="number"
					class="form-control" id="memAge" name="memAge">
			</div>
			<div class="form-group">
				<label for="memTel1">연락처</label> <input type="number"
					class="form-control" id="memTel1" name="memTel1">
			</div>
			<div class="form-group">
				<label for="memAddr">주소</label> <input type="text"
					class="form-control" id="memAddr" name="memAddr">
			</div>
		
		
		<button type="submit" class="btn btn-primary">회원가입</button>
	</form>
</div>
</body>
</html>