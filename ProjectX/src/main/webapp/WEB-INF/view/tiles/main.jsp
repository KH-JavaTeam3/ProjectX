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
		<div class="col-md-12">
			<div id="carouselExampleCaptions" class="carousel slide"data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleCaptions" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
					<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="assets/img/portfolio/thumbnails/1.jpg" class="d-block w-100" alt="..." style="height: 540px;">
						<div class="carousel-caption d-none d-md-block">
							<h5>슬라이드 메뉴 1</h5>
							<p>슬라이드 메뉴 1 에 대한설명</p>
						</div>
					</div>
					<div class="carousel-item">
						<img src="assets/img/portfolio/thumbnails/2.jpg" class="d-block w-100" alt="..." style="height: 540px;">
						<div class="carousel-caption d-none d-md-block">
							<h5>슬라이드 메뉴 2</h5>
							<p>슬라이드 메뉴 2 에 대한설명</p>
						</div>
					</div>
					<div class="carousel-item">
						<img src="assets/img/portfolio/thumbnails/3.jpg" class="d-block w-100" alt="..." style="height: 540px;">
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
		<div class="col-md-6">
			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">First</th>
						<th scope="col">Last</th>
						<th scope="col">Handle</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td>좋아요를 가장 많이 받은 회사목록</td>
						<td>Otto</td>
						<td>@mdo</td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>Jacob</td>
						<td>Thornton</td>
						<td>@fat</td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td colspan="2">Larry the Bird</td>
						<td>@twitter</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-md-6">
			<div id="loginBtnDiv" class="" align="center">
			<br><br>
				<a href="memberLogin.do" class="loginBtn">개인 로그인</a> 
				<a href="companyLogin.do" class="loginBtn">기업	로그인</a>
			</div>
			<div id="loginSubdiv" class="" align="center">
				<a class="findMember">로그인/비번찾기</a> <a href="join.do" class="join">회원가입</a>
			</div>
		</div>

		<div class="space" style="height: 150px;"></div>





	</div>
	<script src="resources/js/main.js?ver=3"></script>

</body>
</html>