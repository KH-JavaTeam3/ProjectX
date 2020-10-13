<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 최신 부트스트랩CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<!-- Jquey -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 최신 부트스트랩JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<!-- 여기까지 복사!!!!!!!!!! -->

<style type="text/css">
.topTable{
	border-bottom: 1px solid lightgray;
	width: 1000px;
}
.topMenu > li{
	display: inline;
	list-style-type: none;
	padding: 20px 20px 20px 20px;
}

a{
	color: black;
	text-decoration: none;
	font-weight: bold;
}

a:hover{
	color: #7896CF;
	text-decoration: none;
}

.profileTable > tr > td{
	padding: 10px;
	margin: 5px;
}
.memberInfo{
	padding: 100px; 
/* 	margin: 200px; */
}

.files input {
    outline: 2px dashed #7896CF;
    outline-offset: -10px;
    -webkit-transition: outline-offset .15s ease-in-out, background-color .15s linear;
    transition: outline-offset .15s ease-in-out, background-color .15s linear;
    padding: 160px 120px 85px 20%; 
    text-align: center;
    margin: 10px;
  /*   width: 160px;
    height: 120px; */
}
.files input:focus{     outline: 2px dashed #7896CF;  outline-offset: -10px;
    -webkit-transition: outline-offset .15s ease-in-out, background-color .15s linear;
    transition: outline-offset .15s ease-in-out, background-color .15s linear; border:1px solid #92b0b3;
 }
.files{ position:relative}
.files:after {  pointer-events: none;
    position: absolute;
    top: 100px;
    left: -3px;
    width: 50px;
    right: 0;
    height: 56px;
    content: "";
    background-image: url(https://image.flaticon.com/icons/png/128/109/109612.png);
    display: block;
    margin: 0 auto;
    background-size: 100%;
    background-repeat: no-repeat;
}
.color input{ background-color:#f1f1f1;}
.files:before {
    position: absolute;
    bottom: 5px;
    left: -60px;  pointer-events: none;
    width: 300px;
    right: 10;
    height: 60px;
    content: "or drag here";
    display: block;
/*     margin: 100px; */
    padding: 55px;
    color: #7896CF;
    font-weight: 600;
    text-transform: capitalize;
    text-align: center;
}

.radio{
	display: inline;
}

input[type="file"]{
	position: relative;
}
@font-face { font-family: 'MyLotteBold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.0/MyLotteBold.woff') format('woff'); font-weight: normal; font-style: normal; }
</style>
</head>

<body>
<div style="height: 60px;"></div>
<!-- 마이페이지 탭 메뉴 -->
<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item" role="presentation">
    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">홈</a>
  </li>
  <li class="nav-item" role="presentation">
    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">이력서 관리</a>
  </li>
  <li class="nav-item" role="presentation">
    <a class="nav-link" id="searchJob-tab" data-toggle="tab" href="#searchJob" role="tab" aria-controls="searchJob" aria-selected="false">직종 검색</a>
  </li>
  <li class="nav-item" role="presentation">
    <a class="nav-link" id="recentlyfound-tab" data-toggle="tab" href="#recentlyfound" role="tab" aria-controls="recentlyfound" aria-selected="false">최근 본 공고</a>
  </li>
  <li class="nav-item" role="presentation">
    <a class="nav-link" id="myCompany-tab" data-toggle="tab" href="#myCompany" role="tab" aria-controls="myCompany" aria-selected="false">내가 선호하는 기업</a>
  </li>
</ul>
<div class="tab-content" id="myTabContent">
	<div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
		 <div class="row col-md-12">
			<div style="height: 20px;"></div>
				<div class="col-md-4">
					<div style="height: 30px;"></div>
						<table style="border: 1px solid black; height: 100px; width: 400px;" class="profileTable">
								<tr>
									<td>
										<img src="resources/images/profile.png" class="img-thumbnail" style="width: 100px; height: 100px; border-radius: 5px;">&nbsp;&nbsp;&nbsp;
										<span><b>[이름]</b> 님</span>
									</td>
								</tr>
								<tr>
									<td>
										<a href="#">
											<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-gear-wide-connected" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
												<path fill-rule="evenodd" d="M8.932.727c-.243-.97-1.62-.97-1.864 0l-.071.286a.96.96 0 0 1-1.622.434l-.205-.211c-.695-.719-1.888-.03-1.613.931l.08.284a.96.96 0 0 1-1.186 1.187l-.284-.081c-.96-.275-1.65.918-.931 1.613l.211.205a.96.96 0 0 1-.434 1.622l-.286.071c-.97.243-.97 1.62 0 1.864l.286.071a.96.96 0 0 1 .434 1.622l-.211.205c-.719.695-.03 1.888.931 1.613l.284-.08a.96.96 0 0 1 1.187 1.187l-.081.283c-.275.96.918 1.65 1.613.931l.205-.211a.96.96 0 0 1 1.622.434l.071.286c.243.97 1.62.97 1.864 0l.071-.286a.96.96 0 0 1 1.622-.434l.205.211c.695.719 1.888.03 1.613-.931l-.08-.284a.96.96 0 0 1 1.187-1.187l.283.081c.96.275 1.65-.918.931-1.613l-.211-.205a.96.96 0 0 1 .434-1.622l.286-.071c.97-.243.97-1.62 0-1.864l-.286-.071a.96.96 0 0 1-.434-1.622l.211-.205c.719-.695.03-1.888-.931-1.613l-.284.08a.96.96 0 0 1-1.187-1.186l.081-.284c.275-.96-.918-1.65-1.613-.931l-.205.211a.96.96 0 0 1-1.622-.434L8.932.727zM8 12.997a4.998 4.998 0 1 0 0-9.995 4.998 4.998 0 0 0 0 9.996z"/>
												<path fill-rule="evenodd" d="M7.375 8L4.602 4.302l.8-.6L8.25 7.5h4.748v1H8.25L5.4 12.298l-.8-.6L7.376 8z"/>
											</svg> 개인정보 수정</a>
									</td>
								</tr>
						</table>
				</div>
				<div class="col-md-8" style="text-align: center;">
					<div style="height: 30px;"></div>
						<table style="border: 1px solid black; height: 100px; width: 400px;" class="">
								<tr>
									<td>
										<a href="writeResume.me">이력서 등록</a>
									</td>
									<td>
										<a href="#">내가 지원한 기업</a>
									</td>
									<td>
										<a href="#">최근 본 기업</a>
									</td>
								</tr>
						</table>
				</div>
		</div>
  	</div>
	<div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
		<div class="row">
		  <div class="col-3">
		    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
		    <div style="height: 50px;"></div>
		      <a class="nav-link active" id="v-pills-writeResume" data-toggle="pill" href="#v-pills-writeResume" role="tab" aria-controls="v-pills-writeResume" aria-selected="true">새로운 이력서 등록</a>
		      <a class="nav-link" id="v-pills-updateResume" data-toggle="pill" href="#v-pills-updateResume" role="tab" aria-controls="v-pills-updateResume" aria-selected="false">이력서 수정</a>
		      <a class="nav-link" id="v-pills-ListResume" data-toggle="pill" href="#v-pills-ListResume" role="tab" aria-controls="v-pills-ListResume" aria-selected="false">이력서 모음</a>
		    </div>
		  </div>
		  <div class="col-9">
		    <div class="tab-content" id="v-pills-tabContent">
		      <div class="tab-pane fade show active" id="v-pills-writeResume" role="tabpanel" aria-labelledby="v-pills-writeResume-tab">
		      	새로운 이력서 등록
		      </div>
		      <div class="tab-pane fade" id="v-pills-updateResume" role="tabpanel" aria-labelledby="v-pills-updateResume-tab">
		      	이력서 수정
		      </div>
		      <div class="tab-pane fade" id="v-pills-ListResume" role="tabpanel" aria-labelledby="v-pills-ListResume-tab">
		      	이력서 모음
		      </div>
		    </div>
		  </div>
		</div>
	</div>
	<div class="tab-pane fade" id="searchJob" role="tabpanel" aria-labelledby="searchJob-tab">
  	내가 찾은 직종이 여기에 쓰여집니다.
	</div>
	<div class="tab-pane fade" id="recentlyfound" role="tabpanel" aria-labelledby="recentlyfound-tab">
  	여긴 최근 찾은 기업이 여기에 있습니다.
	</div>
	<div class="tab-pane fade" id="myCompany" role="tabpanel" aria-labelledby="myCompany-tab">
  	여긴 내가 선호하는 기업을 보는 페이지입니다.
	</div>
</div>	
</body>
</html>