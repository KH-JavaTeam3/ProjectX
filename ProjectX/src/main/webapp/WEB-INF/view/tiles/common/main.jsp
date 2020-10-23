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
		<div class="col-md-12" style="margin-top: 30px;">
			<div id="carouselExampleCaptions" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleCaptions" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
					<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img
							src="https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80"
							class="d-block w-100" style="height: 750px;">
						<div class="carousel-caption d-none d-md-block">
							<h5>구인 구직 사이트 파인드림</h5>
							<p>///</p>
						</div>
					</div>
					<div class="carousel-item">
						<img
							src="https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1352&q=80"
							class="d-block w-100" style="height: 750px;">
						<div class="carousel-caption d-none d-md-block">
							<h5>구인 구직 사이트 파인드림</h5>
							<p>///</p>
						</div>
					</div>
					<div class="carousel-item">
						<img
							src="https://images.unsplash.com/photo-1549923746-9507eec27243?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80"
							class="d-block w-100" style="height: 750px;">
						<div class="carousel-caption d-none d-md-block">
							<h5>구인 구직 사이트 파인드림</h5>
							<p>///</p>
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


		<div class="space" style="height: 150px;"></div>





	</div>
	<script src="resources/js/main.js?ver=3"></script>

</body>
</html>