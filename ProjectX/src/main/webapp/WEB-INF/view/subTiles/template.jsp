<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:insertAttribute name="title" /></title>
<link rel="shortcut icon" href="resources/images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="resources/css/reset.css?ver=2" />
<!-- 최신 부트스트랩CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<!-- jquery-ui.css -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- Jquey -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- 폰트모음 -->
<link rel="stylesheet" type="text/css" href="resources/css/font.css?ver=1" />
<!-- 최신 부트스트랩JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>

<!-- 카카오 js -->
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- jquery-ui.js -->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- 유효성 검사 자바스크립트 -->
<script src="resources/js/jquery.validate.js?ver=2"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style type="text/css">
label.error {
    position:absolute;
    max-width: 100%;
    padding: .25rem .5rem;
    margin-left: 0.3rem;
    margin-top : -0.2rem;
    font-size: .875rem;
    line-height: 1.5;
    color: #fff;
    background-color: rgba(220,53,69,.9);
    border-radius: .25rem;
}

.myContainer {
	margin-left : auto;
	margin-right : auto;
	width: 80%;
}
.backColor{
	
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
	<div class="container-fluid" style="padding-left: 0px; padding-right: 0px;">
		<div class="myContainer" style="margin-top: 10px;">
			<tiles:insertAttribute name="menu" />
		</div>
		<div style="background: #4876ef;">
			<tiles:insertAttribute name="submenu"/>
		</div>
		<div class="backColor">
			<div>
				<tiles:insertAttribute name="submenu2"/>
			</div>
			<div class="myContainer">
				<tiles:insertAttribute name="body" />
			</div>
		</div>
		<div>
		<footer>
			<tiles:insertAttribute name="foot" />
		</footer>
		</div>
	</div>
</body>
</html>
















