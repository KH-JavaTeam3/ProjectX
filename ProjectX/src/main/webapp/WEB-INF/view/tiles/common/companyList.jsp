<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 .eachCompany:hover{ 
 	background : #ABC2E8;
 }	
</style>
</head>
<body>

<!-- 	<div class="list-group">
		<div class="d-flex w-100 justify-content-between">
			<button  class="list-group-item list-group-item-action active" >
				<h6 class="mb-1">번호</h6>
				<h5 class="mb-1">(주)삼성전자</h5>
				<small>3 days ago</small>	
				<p class="mb-1">홈페이지 이동</p> <small>신입ㅣ학력무관ㅣ고용형태ㅣ지역</small>
			</button>
		</div>
	</div> -->

<c:forEach items="${companyList }" var="company">
  <a href="companyDetail.do?comNum=${company.comNum}&announceNum=${company.announceNum}" class="list-group-item list-group-item-action eachCompany" >
    <div class="d-flex w-100 justify-content-between">
      <h5 class="mb-1">${company.comName}</h5>
      <small>~${company.uptoHiredate}</small>
    </div>
    <p class="mb-1">${company.announceTitle}</p>
    <small>${company.career}ㅣ${company.academicBackground}ㅣ${company.workType}ㅣ${company.area}</small>
  </a>
</c:forEach>

</body>
</html>