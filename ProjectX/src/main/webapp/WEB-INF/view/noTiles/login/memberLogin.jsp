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
			<h2>개인회원 로그인</h2>
		</div>
		<div style="height: 15px;"></div>
		<div align="center">
			<form action="memberLogin.do" method="post">
				<div class="form-group">
					<label for="memEmail">이메일</label> <input type="email"
						class="form-control" id="memEmail" name="memEmail">
				</div>
				<div class="form-group">
					<label for="memPass">비밀번호</label> <input type="password"
						class="form-control" id="memPass" name="memPass">
				</div>
				<br>
				<button type="submit" class="btn btn-primary"
					style="width: 200px; height: 40px;">Submit</button>
			</form>
		</div>
	</div>

</body>
</html>