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
			<h2>개인회원 로그인</h2>
		</div>
		<div style="height: 15px;"></div>
		<div align="center">
			<form action="memberLogin.do" method="post" id="loginForm">
				<div class="form-group">
					<label for="memEmail">이메일</label> <input type="email"
						class="form-control" id="memEmail" name="memEmail" required>
				</div>
				<div class="form-group">
					<label for="memPass">비밀번호</label> <input type="password"
						class="form-control" id="memPass" name="memPass" required>
				</div>
				 <div class="form-group form-check">
				    <input type="checkbox" class="form-check-input" id="keepLogin" name="keepLogin" value="on">
				    <label class="form-check-label" for="keepLogin">Check me out</label>
				  </div>
				<input type="submit" class="btn btn-primary"
					style="width: 200px; height: 40px;" value="Submit">
			</form>
		</div>
	</div>
<!-- 유효성 검사 자바스크립트 -->
<script src="resources/js/jquery.validate.js"></script>
<script type="text/javascript">
(function($){
	
	 


});
</script>
</body>
</html>