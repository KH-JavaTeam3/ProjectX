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
		<a href="join.do">개인 회원가입</a> <a href="join2.do">기업 회원가입</a>
		<h1>기업 회원가입</h1>
		<form action="join2Act.do" method="post" id="join2Form">
			<div class="form-group">
				<label for="inputEmail">이메일(아이디)</label> <input type="email"
					class="form-control" id="inputEmail" name="inputEmail">
			</div>
			<div class="form-group">
				<label for="inputPassword">비밀번호</label> <input type="password"
					class="form-control" id="inputPassword" name="inputPassword">
			</div>
			<div class="form-group">
				<label for="inputPasswordCheck">비밀번호 확인</label> <input type="password"
					class="form-control" id="inputPasswordCheck" name="inputPasswordCheck">
			</div>
			<div class="form-group">
				<label for="inputPasswordHint">비밀번호 힌트</label> <input type="text"
					class="form-control" id="inputPasswordHint" name="inputPasswordHint">
			</div>
			<div class="form-group">
				<label for="inputComName">기업명</label> <input type="text"
					class="form-control" id="inputComName" name="inputComName">
			</div>
			<div class="form-group">
				<label for="inputComNum">사업자 등록번호</label> <input type="number"
					class="form-control" id="inputComNum" name="inputComNum">
			</div>
			<div class="form-group">
				<label for="inputTel">연락처</label> <input type="number"
					class="form-control" id="inputTel" name="inputTel">
			</div>

			<button type="submit" class="btn btn-primary">회원가입</button>
		</form>
	</div>
<!-- 유효성 검사 자바스크립트 -->
<script src="resources/js/jquery.validate.js"></script>	
<script type="text/javascript">
	//validate에 정규식 사용하게 설정
	$.validator.addMethod('regx', function(value, element, regexpr) {
		return regexpr.test(value);
	});
</script>
<script src="resources/js/join2.js?ver=5"></script>
</body>
</html>