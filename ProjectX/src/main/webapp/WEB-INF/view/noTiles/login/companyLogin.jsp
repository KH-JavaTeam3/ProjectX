<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</head>
<body style="background: #f4f5f7;">
	<div style="height: 40px;"></div>
	<div class="mx-auto" id="loginContainer" style="width: 30%;">
		<div align="center">
			<a href="memberLoginForm.do">개인회원 로그인</a> <a href="companyLoginForm.do">기업회원 로그인</a>
			<h2>기업회원 로그인</h2>
		</div>
		<div style="height: 15px;"></div>
		<div align="center">
			<form action="companyLogin.do" method="post">
				<div class="form-group">
					<label for="comNum">사업자번호</label> <input type="text"
						class="form-control" id="comNum" name="comNum" required>
				</div>
				<div class="form-group">
					<label for="comPass">비밀번호</label> <input type="password"
						class="form-control" id="comPass" name="comPass" required>
				</div>
				<div class="form-group form-check">
				    <input type="checkbox" class="form-check-input" id="keepLogin" name="keepLogin" value="on">
				    <label class="form-check-label" for="keepLogin">Check me out</label>
				  </div>
				<button type="submit" class="btn btn-primary"
					style="width: 200px; height: 40px;">Submit</button>
			</form>
		</div>
	</div>
</body>
</html>