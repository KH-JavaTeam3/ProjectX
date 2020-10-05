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
	href="resources/css/main.css?ver=3" />
</head>
<body>
	<div class="row">



		<div class="col-md-4">
		<!-- 케러셀 -->
			<div id="carouselExampleCaptions" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleCaptions" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
					<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
				</ol>
				[현재 모집중인 회사 중 인기 TOP3]
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="assets/img/portfolio/thumbnails/1.jpg" class="d-block w-100" alt="...">
						<div class="carousel-caption d-none d-md-block">
							<h5>슬라이드 메뉴 1</h5>
							<p>~2020.10.02</p>
						</div>
					</div>
					<div class="carousel-item">
						<img src="assets/img/portfolio/thumbnails/2.jpg" class="d-block w-100" alt="...">
						<div class="carousel-caption d-none d-md-block">
							<h5>슬라이드 메뉴 2</h5>
							<p>슬라이드 메뉴 2 에 대한설명</p>
						</div>
					</div>
					<div class="carousel-item">
						<img src="assets/img/portfolio/thumbnails/3.jpg" class="d-block w-100" alt="...">
						<div class="carousel-caption d-none d-md-block">
							<h5>슬라이드 메뉴 3</h5>
							<p>슬라이드 메뉴 3 에 대한설명</p>
						</div>
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleCaptions"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleCaptions"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<div class="col-md-4">
			<div class="col-md-4">
				<div style="font-weight: bold; font-size: 20px;" >[검색순위]</div>
			</div>
			<hr>
			<div class="col-md-8 searchLink">
				<table class="table">
				<colgroup>
					<col width="25%">
					<col width="*">
					<col width="35%">
					<tr>
						<td>순위</td>
						<td>회사명</td>
						<td>조회수</td>
					</tr>
					<tr>
						<td>1</td>
						<td>카카오</td>
						<td>123</td>
					</tr>
					<tr>
						<td>2</td>
						<td>삼성</td>
						<td>456</td>
					</tr>
					<tr>
						<td>3</td>
						<td>롯데</td>
						<td>789</td>
					</tr>
					<tr>
						<td>4</td>
						<td>엘지</td>
						<td>1234</td>
					</tr>
				</table>
<!-- 				<ol> -->
<!-- 					<li> -->
<!-- 						<em style="font-weight: bold;">1</em> -->
<!-- 						<span style="width: 50px;">회사1</span> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<em style="font-weight: bold;">2</em> -->
<!-- 						<span>회사2</span> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<em style="font-weight: bold;">3</em> -->
<!-- 						<span>회사3</span> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<em style="font-weight: bold;">4</em> -->
<!-- 						<span>회사4</span> -->
<!-- 					</li> -->
<!-- 					<li> -->
<!-- 						<em style="font-weight: bold;">5</em> -->
<!-- 						<span>회사5</span> -->
<!-- 					</li> -->
<!-- 				</ol> -->
			</div>
		</div>
		<div class="col-md-4">
			<div id="loginBtnDiv" class="row">
				<a href="memberLogin.do" class="loginBtn">개인 로그인</a> <a href="companyLogin.do" class="loginBtn">기업
					로그인</a>
			</div>
			<div id="loginSubdiv" class="row">
				<a class="findMember">로그인/비번찾기</a> <a href="join.do" class="join">회원가입</a>
			</div>
		</div>

		<div class="space" style="height: 150px;"></div>
	</div>
	<div class="row">
		<div>
			<table class="table table-hover" style="width: 500px;">
				<tr>
					<td>회사리스트</td>
					<td>dddd</td>
				</tr>
				<tr>
					<td>dddd</td>
					<td>dddd</td>
				</tr>
			</table>
		</div>
	</div>
	<script src="resources/js/main.js?ver=3"></script>

</body>
</html>