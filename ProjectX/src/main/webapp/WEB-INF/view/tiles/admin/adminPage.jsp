<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container-fluid" style="margin-top: 100px; border: 5px solid #ABC2E8; border-radius: 10px; height: 450px;">
		<div class="row">
			<div class="col-md-3">
				<div class="list-group" id="adminSide">
					<button class="list-group-item list-group-item-action active" id="companyListBtn">
						기업목록</button> 
					<button class="list-group-item list-group-item-action" id="memberListBtn">
						개인목록</button> 
				</div>
			</div>
			<div class="col-md-3" id="listDiv">
			</div>
			<div class="col-md-5" id="detailDiv">
			</div>
		</div>
	</div>





<script src="resources/js/adminPage.js?ver=3"></script>
</body>

</html>