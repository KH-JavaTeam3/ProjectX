<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl 사용을 위한 taglib -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.main2Btn:hover {
	cursor: pointer;
	opacity: 0.9;
}
</style>
<!-- sample.css 파일 사용을 위한 태그 -->
<link rel="stylesheet" type="text/css"
	href="resources/css/main.css?ver=3" />
</head>
<body>
<div style="height: 120px;">
</div>
	<div class="row" style="height: 700px;">
			<div class="col-md-3">
				<img class="main2Btn" alt="" src="resources/images/main2_A1.jpg" style="width: 100%; height: 100%;" onclick="location.href='registHumanSeekerForm.co'" >
			</div>
			<div class="col-md-3">
				<img class="main2Btn" alt="" src="resources/images/main2_A2.jpg" style="width: 100%; height: 100%;" onclick="location.href='recruitlist.co'" >
			</div>
			<div class="col-md-3" >
				<img class="main2Btn" alt="" src="resources/images/main2_A3.jpg" style="width: 100%; height: 100%;" onclick="location.href='comMypage.co'">
			</div>
			<div class="col-md-3" >
				<img class="main2Btn" alt="" src="resources/images/main2_A4.jpg" style="width: 100%; height: 100%;" onclick="location.href='resumeInquiry.co'">
			</div>
	</div>
	<script src="resources/js/main.js?ver=3"></script>

</body>
</html>