<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
input[id="menuicon"] {display:none;}
input[id="menuicon"] +label {display:block;margin: 30px;width: 40px;height: 35px; position: relative;cursor: pointer;}
input[id="menuicon"] +label span {display:block;position:absolute;width:100%;height: 5px; border-radius: 30px;background: #000;transition:all . 35s;}
input[id="menuicon"] +label span:nth-child(1) {top:0;}
input[id="menuicon"] +label span:nth-child(2) {top:50%; transform:translateY(-50%); width: 30px;}
input[id="menuicon"] +label span:nth-child(3) {bottom:0;}
 
input[id="menuicon"]:checked + label {z-index: 20;}
input[id="menuicon"]:checked + label span {background: #fff;}
input[id="menuicon"]:checked + label span:nth-child(1) {top: 50%;transform:translateY(-50%) rotate(45deg);}
input[id="menuicon"]:checked + label span:nth-child(2) {opacity:0;}
input[id="menuicon"]:checked + label span:nth-child(3) {bottom: 50%;transform:translateY(50%) rotate(-45deg);} 

div[class="sidebar"]{width: 100%;height: 500px;background: #222;position:fixed; top: -500px;left:-0px; ;transition:all.35s;z-index: 19;opacity: 0.5;}
input[id="menuicon"]:checked + label + div {top:0;}


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
	</div>
	
	
	
	
	
</body>
</html>