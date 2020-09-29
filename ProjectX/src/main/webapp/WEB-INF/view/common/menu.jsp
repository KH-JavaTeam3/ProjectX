<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 아이콘을 띄우기 위한 소스 -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style type="text/css">
input[id="menuicon"] {display:none;}
input[id="menuicon"] +label {display:block;margin: 30px;width: 40px;height: 35px; position: relative;cursor: pointer;}
input[id="menuicon"] +label span {display:block;position:absolute;width:100%;height: 5px; border-radius: 30px;background: #000;transition:all . 35s;}
input[id="menuicon"] +label span:nth-child(1) {top:0;}
input[id="menuicon"] +label span:nth-child(2) {top:50%; transform:translateY(-50%); width: 30px;}
input[id="menuicon"] +label span:nth-child(3) {bottom:0;}
 
input[id="menuicon"]:checked + label {z-index: 25;}
input[id="menuicon"]:checked + label span {background: #fff;}
input[id="menuicon"]:checked + label span:nth-child(1) {top: 50%;transform:translateY(-50%) rotate(45deg);}
input[id="menuicon"]:checked + label span:nth-child(2) {opacity:0;}
input[id="menuicon"]:checked + label span:nth-child(3) {bottom: 50%;transform:translateY(50%) rotate(-45deg);} 

div[class="sidebar"]{width: 100%;height: 2500px;background: #222;position:fixed; top: -2500px;left:-0px; ;transition:all.35s;z-index: 19;opacity:0.5;}
input[id="menuicon"]:checked + label + div {top:0;}
div[class="sidebarmenu"]{z-index: 20;}
#menu {	height: 50px;}
.main {	width: 600px;	height: 100%;	margin: 0 auto;}
.main1>li {	float: left;	width: 25%;	line-height: 50px;	text-align: center;	position: relative;}
.main1>li:hover .main2{	left: 0;}
.main1>li a{	display: block;}
.main1>li a:hover {	color: #fff;	font-weight: bold;}
.main2 {	position: absolute;	top: 50px;	left: -9999px;		width: 100%;	}
.main2>li {	position: relative;}
.main2>li:hover .main3{	left: 100%;}
.main2>li a, .main3>li a {	border-radius: 10px;	margin: 10px;}
.main3{	position: absolute;	top: 0;width: 80%;	left: -9999px;}
.main3>li a:hover {color: #fff;}
a:hover {	color: #fff;	text-decoration: none;}
#search:focus {	outline:none;}
</style>
</head>
<body>
	<input type="checkbox" id="menuicon">
	<label for="menuicon" >	
		<span></span>
		<span></span>
		<span></span>
	</label>

	<div class="sidebar">
		<div id="menu" style="z-index: 18">
			<ul class="main1" style="z-index: 18">
				<li><a href="#">지역</a>
					<ul class="main2" style="z-index: 18">
						<li><a href="#">울산</a>
							<ul class="main3" style="z-index: 18">
								<li><a href="#">2단 소메뉴1</a>
								<li><a href="#">2단 소메뉴1</a>
								<li><a href="#">2단 소메뉴1</a>
							</ul>
						</li>
						<li><a href="#">서울</a>
							<ul class="main3" style="z-index: 18">
								<li><a href="#">2단 소메뉴1</a>
								<li><a href="#">2단 소메뉴1</a>
								<li><a href="#">2단 소메뉴1</a>
							</ul>
						</li>
					</ul>
				</li>
				<li><a href="#">2단소메뉴</a></li>
				<li><a href="#">2단소메뉴</a></li>
			</ul>
			<input id="search" type="text" style="background:none; margin-top: 8px;margin-left: 6px;border-left:1px solid none; border-top:1px white; border-right: white; border-bottom:3px solid #007bff ;color: black; opacity: 1;">
			<input type="submit" class="fas fa-search" style="width: 25px; z-index: 18; color: red;">
		</div>
	</div>
</body>
</html>