<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl 사용을 위한 taglib -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- sample.css 파일 사용을 위한 태그 -->
<link rel="stylesheet" type="text/css"
	href="resources/css/main.css?ver=2" />
</head>
<body>

<div id="topMain">
	<div class="row text-center"  style="border: 1px solid blue;">
		<div class="col-md-4"><!-- 	캐러셀 시작 -->
	<div id="carousel-example-generic" class="carousel slide"
		data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0"
				class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
		</ol>

		<!-- Wrapper for slides -->
		<div class="carousel-inner" role="listbox">
			<div class="item active">
				<img src="resources/images/3.jpg">
				<div class="carousel-caption">
					<span>사진 3</span>
				</div>
			</div>
			<div class="item">
				<img src="resources/images/4.jpg">
				<div class="carousel-caption">
					<span>사진 4</span>
				</div>
			</div>
			

		</div>

		<!-- Controls -->
		<a class="left carousel-control" href="#carousel-example-generic"
			role="button" data-slide="prev"> <span
			class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="right carousel-control" href="#carousel-example-generic"
			role="button" data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
<!-- 캐러셀 끝 -->
</div>
		<div class="col-md-4">
			<table>
				<tr>
					<td>기업</td>
				</tr>
				<tr>
					<td>기업</td>
				</tr>
				<tr>
					<td>기업</td>
				</tr>
				<tr>
					<td>기업</td>
				</tr>
				<tr>
					<td>기업</td>
				</tr>
				<tr>
					<td>기업</td>
				</tr>
				<tr>
					<td>기업</td>
				</tr>
				<tr>
					<td>기업</td>
				</tr>
			</table>
		</div>
		<div class="col-md-4">로그인 화면</div>
	</div>
	
</div>
<div class="space" style="height: 150px;"></div>

<script src="resources/js/main.js?ver=3"></script>
</body>
</html>




<!-- 	캐러셀 시작 -->
<!-- 	<div id="carousel-example-generic" class="carousel slide" -->
<!-- 		data-ride="carousel"> -->
		<!-- Indicators -->
<!-- 		<ol class="carousel-indicators"> -->
<!-- 			<li data-target="#carousel-example-generic" data-slide-to="0" -->
<!-- 				class="active"></li> -->
<!-- 			<li data-target="#carousel-example-generic" data-slide-to="1"></li> -->
<!-- 		</ol> -->

		<!-- Wrapper for slides -->
<!-- 		<div class="carousel-inner" role="listbox"> -->
<!-- 			<div class="item active"> -->
<!-- 				<img src="resources/images/3.jpg"> -->
<!-- 				<div class="carousel-caption"> -->
<!-- 					<span>사진 3</span> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="item"> -->
<!-- 				<img src="resources/images/4.jpg"> -->
<!-- 				<div class="carousel-caption"> -->
<!-- 					<span>사진 4</span> -->
<!-- 				</div> -->
<!-- 			</div> -->
			

<!-- 		</div> -->

		<!-- Controls -->
<!-- 		<a class="left carousel-control" href="#carousel-example-generic" -->
<!-- 			role="button" data-slide="prev"> <span -->
<!-- 			class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span -->
<!-- 			class="sr-only">Previous</span> -->
<!-- 		</a> <a class="right carousel-control" href="#carousel-example-generic" -->
<!-- 			role="button" data-slide="next"> <span -->
<!-- 			class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> -->
<!-- 			<span class="sr-only">Next</span> -->
<!-- 		</a> -->
<!-- 	</div> -->
<!-- 캐러셀 끝 -->