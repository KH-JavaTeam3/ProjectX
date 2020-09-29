<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
input[id="menuicon"]{display: none;}

/* 헤더 */
header {width:100%;background: white;  padding-left: 0px;}
header > div {position: relative;widows: 1200px;margin:0 auto;}
header > div ul.navi {font-size: 0; padding: 15px;}
header > div ul.navi >li {font-size: 12px;display: inline-block;vertical-align: middle;}
header > div ul.navi >li > a{display:blocck;width:auto;padding:20px;}
header > div ul.navi >li.logo > a{padding:20px 50px; font-size: 20px;font-weight: 900;}
/* 각영역별 라벨(중앙정렬) */
.area_desc {position: absolute;top: 50%;left: 50%; transform:translate(-50%,-50%)}
/* 메뉴버튼 */
.menubtn { display:block;width:50px;height: 50px;position: absolute;top: 50%;right: 10px;transform:translateY(-50%);cursor: pointer;}
.menubtn span {display:block;position: absolute;width: 80%;height: 5px;border-radius: 30px;background: #222;transition:all.35s;}
.menubtn span:nth-child(1){top:20%;left: 50%;transform:translateX(-50%);}
.menubtn span:nth-child(2){top:50%;left: 50%;transform:translate(-50%,-50%);}
.menubtn span:nth-child(3){bottom: 20%;left:50%;transform:translateX(-50%)}
/* 컨텐츠영역 */
.container {width: 100%; position: relative;} 
.container .contents { width: 1200px;margin: 0 auto;min-height: 700px;border: 1px solid #eee;background: #f1f1f1;} 
.container .sidebar{position: fixed;top:-800px;left:10%; right: 10%;width: 80%;height: 800px;background: #666;border: 1px solid #eee; z-index: 30; transition:.35s;} 

input[id="menuicon"]:checked ~ div header .menubtn {z-index: 31;}
input[id="menuicon"]:checked ~ div header .menubtn span:nth-child(1) {top:50%;left: 50%;transform:translate(-50%,-50%) rotate(135deg);}
input[id="menuicon"]:checked ~ div header .menubtn span:nth-child(2) {left:50%,transform:translate(-50%,-50%) scale(2); opacity: 0;}
input[id="menuicon"]:checked ~ div header .menubtn span:nth-child(3) {bottom: 50%;left:50%;transform:translate(-50%,50%) rotate(-135deg);}
input[id="menuicon"]:checked ~ .container .sidebar {top: 0;}

.navi li a {
	font-size: medium;
	font-weight: bold;
}
 a:link { color: red; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: underline;}



</style>
</head>
<body>
<input type="checkbox"id="menuicon">
<div align="center">
<header style="width: 80%">
	<div style="background-color: gray" align="left">
		<ul class="navi">
			<li><a href="#">지역별</a></li>
			<li><a href="#">직업별</a></li>
			<li><a href="#">헤드헌팅</a></li>
			<li><a href="#">HOT100</a></li>
			<li><a href="#">공채</a></li>			
		</ul>
		<label for="menuicon" class ="menubtn">
			<span></span>
			<span></span>
			<span></span>
		</label>
	</div>
</header>
</div>


<div class="container">
<div class="sidebar">
	<div class="area_desc" style="width: 100%; height: 100%">
		<div style="display: inline-block; width: 50%;  background: red; height: 50%; float: left;">111</div>
		<div style="display: inline-block; width: 50%; background: yellow; height: 100%; float: left;" >111</div>
	</div>
</div>
</div>

</body>
</html>