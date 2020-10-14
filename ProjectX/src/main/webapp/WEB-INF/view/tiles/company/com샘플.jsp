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
@font-face { font-family: 'MyLotteBold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.0/MyLotteBold.woff') format('woff'); font-weight: normal; font-style: normal; }
</style>
</head>

<body>
<div style="height: 60px;"></div>
<div>
	<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item" role="presentation">
    <a class="nav-link" href="comMypage.co">홈</a>
  </li>
  <li class="nav-item" role="presentation">
    <a class="nav-link" href="editMyInfo.me">사업자 정보 수정</a>
  </li>
  <li class="nav-item" role="presentation">
    <a class="nav-link" href="writeResume.me">이력서 등록</a>
  </li>
  <li class="nav-item" role="presentation">
    <a class="nav-link" href="resumeCollection.me">이력서 관리</a>
  </li>
  <li class="nav-item" role="presentation">
    <a class="nav-link" href="#" >공고 조회</a>
  </li>
  <li class="nav-item" role="presentation">
    <a class="nav-link" href="recruitDeleteList.co">공고 삭제</a>
  </li>
</ul>
</div>

<div style="height: 30px;"></div>
<div>
	<table>
		<tr>
			<td>사진</td>
		</tr>
		<tr>
			<td>이름</td>
		</tr>
	</table>
</div>
</body>
</html>