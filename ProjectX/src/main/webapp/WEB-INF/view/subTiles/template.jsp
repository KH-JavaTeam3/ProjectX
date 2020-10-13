<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title" /></title>
<link rel="stylesheet" type="text/css"
	href="resources/css/reset.css?ver=2" />
<!-- 옛날 부트스트랩 CSS -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> -->
<!-- 옛날 부트스트랩 CSS 테마 -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css"> -->
<!-- 옛날 부트스트랩 JS -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->

<!-- noTiles폴더에 부트스트랩&제이쿼리 쓰려면 복사 -->
<!-- 최신 부트스트랩CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<!-- Jquey -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 최신 부트스트랩JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<!-- 여기까지 복사!!!!!!!!!! -->

<!-- 유효성 검사 자바스크립트 -->
<script src="resources/js/jquery.validate.js"></script>
<style type="text/css">
label.error {
	color: red;
	font-size: 12px;
	display: block;
}

.myContainer {
	margin-right: auto;
	margin-left: auto;
	width: 80%;
}
</style>
<script type="text/javascript">
	//validate에 정규식 사용하게 설정
	$.validator.addMethod('regx', function(value, element, regexpr) {
		return regexpr.test(value);
	});
</script>
</head>
<body>
	<div class="container-fluid">
		<header>
			<tiles:insertAttribute name="menu" />
		</header>
		<div class="myContainer">
			<tiles:insertAttribute name="body" />
		</div>
<!-- 		<footer> -->
<%-- 			<tiles:insertAttribute name="foot" /> --%>
<!-- 		</footer> -->
	</div>
</body>
</html>
















