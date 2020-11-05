<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.submenuBtn:hover{
		cursor:pointer;
		background-color: rgba( 255, 255, 255, 0.3 );
	}
	.noLogin:hover{
		cursor:pointer;
		background-color: rgba( 255, 255, 255, 0.3 );
	}
	.non:hover{
		cursor:pointer;
		background-color: rgba( 255, 255, 255, 0.3 );
	}
</style>
</head>

<body>
<!-- 비로그인 -->
<c:if test="${empty sessionScope.comLogin && empty sessionScope.memLogin}">
<div style="height: 46px;">
		<div class="col-md-12" align="center" style="line-height: 45px; padding: 0px;">
			<div class="submenuBtn col-md-1" style="display: inline-block;" onclick="location.href='main.do'">
				<span style="font-size: 15px; color: white; font-weight: bold;">HOME</span>
			</div>'
			<div class="submenuBtn col-md-1" style="display: inline-block;" onclick="location.href='companyList.do'">
				<span style="font-size: 13px; color: white; font-weight: bold;">채용공고</span>
			</div>
			<div class="submenuBtn col-md-1" style="display: inline-block;" onclick="location.href='comList.do'">
				<span style="font-size: 13px; color: white; font-weight: bold;">기업목록</span>
			</div>
			<div class="noLogin col-md-1" style="display: inline-block;">
				<span style="font-size: 13px; color: white; font-weight: bold;">관심공고</span>
			</div>
			<div class="noLogin col-md-1" style="display: inline-block;">
				<span style="font-size: 13px; color: white; font-weight: bold;">관심기업</span>
			</div>
			<div class="non col-md-1" style="display: inline-block;" onclick="location.href='freeBoardList.bo'">
				<span style="font-size: 13px; color: white; font-weight: bold;">커뮤니티</span>
			</div>
		</div>
</div>
</c:if>
<!-- 개인 로그인 -->
<c:if test="${not empty sessionScope.memLogin}">
<div style="height: 46px;">
		<div class="col-md-12" align="center" style="line-height: 45px; padding: 0px;">
			<div class="submenuBtn col-md-1" style="display: inline-block;"onclick="location.href='main.do'">
				<span style="font-size: 15px; color: white; font-weight: bold;">HOME</span>
			</div>
			<div class="submenuBtn col-md-1" style="display: inline-block;" onclick="location.href='companyList.do'">
				<span style="font-size: 13px; color: white; font-weight: bold;">채용공고</span>
			</div>
			<div class="submenuBtn col-md-1" style="display: inline-block;" onclick="location.href='comList.do'">
				<span style="font-size: 13px; color: white; font-weight: bold;">기업목록</span>
			</div>
			<div class="submenuBtn col-md-1" style="display: inline-block;" onclick="location.href='memberMypage.me'">
				<span style="font-size: 13px; color: white; font-weight: bold;">개인정보 관리</span>
			</div>
			<div class="submenuBtn col-md-1" style="display: inline-block;" onclick="location.href='writeResume.me'">
				<span style="font-size: 13px; color: white; font-weight: bold;">이력서등록</span>
			</div>
			<div class="submenuBtn col-md-1" style="display: inline-block;" onclick="location.href='resumeList.me'">
				<span style="font-size: 13px; color: white; font-weight: bold;">이력서관리</span>
			</div>
			<div class="submenuBtn col-md-1" style="display: inline-block;" onclick="location.href='likeRecruit.me'">
				<span style="font-size: 13px; color: white; font-weight: bold;">관심공고</span>
			</div>
			<div class="submenuBtn col-md-1" style="display: inline-block;" onclick="location.href='likeCompany.me'">
				<span style="font-size: 13px; color: white; font-weight: bold;">관심기업</span>
			</div>
			<div class="non col-md-1" style="display: inline-block;" onclick="location.href='freeBoardList.bo'">
				<span style="font-size: 13px; color: white; font-weight: bold;">커뮤니티</span>
			</div>
			<c:if test="${sessionScope.memLogin.isAdmin == 'Y' }">
				<div class="non col-md-1" style="display: inline-block;" onclick="location.href='adminPage.ad'">
					<span style="font-size: 13px; color: white; font-weight: bold;">관리자 페이지</span>
				</div>
			</c:if>
		</div>
	</div>
</c:if>

<!-- 기업 로그인 -->
<c:if test="${not empty sessionScope.comLogin}">
<div style="height: 46px;">
		<div class="pointer col-md-12" align="center" style="line-height: 45px; padding: 0px;">
			<div class="submenuBtn col-md-1" style="display: inline-block;" onclick="location.href='companyHome.do'">
				<span style="font-size: 15px; color: white; font-weight: bold;">HOME</span>
			</div>
			<div class="submenuBtn col-md-1" style="display: inline-block;">
				<span style="font-size: 13px; color: white; font-weight: bold;"></span>
			</div>
			<div class="submenuBtn col-md-1" style="display: inline-block;">
				<span style="font-size: 13px; color: white; font-weight: bold;"></span>
			</div>
			<div class="submenuBtn col-md-1" style="display: inline-block;">
				<span style="font-size: 13px; color: white; font-weight: bold;"></span>
			</div>
			<div class="submenuBtn col-md-1" style="display: inline-block;">
				<span style="font-size: 13px; color: white; font-weight: bold;"></span>
			</div>
			<div class="submenuBtn col-md-1" style="display: inline-block;" onclick="location.href='resumeInquiry.co'">
				<span style="font-size: 13px; color: white; font-weight: bold;">공고 이력서 조회</span>
			</div>
			<div class="submenuBtn col-md-1" style="display: inline-block;" onclick="location.href='recruitDeleteList.co'">
				<span style="font-size: 13px; color: white; font-weight: bold;">공고 관리</span>
			</div>
			<div class="submenuBtn col-md-1" style="display: inline-block;" onclick="location.href='myComUpdateForm.co'">
				<span style="font-size: 13px; color: white; font-weight: bold;">기업정보</span>
			</div>
			<div class="non col-md-1" style="display: inline-block;" onclick="location.href='freeBoardList.bo'">
				<span style="font-size: 13px; color: white; font-weight: bold;">커뮤니티</span>
			</div>
		</div>
</div>
</c:if>
</body>


<script type="text/javascript">
$(document).on('click', '.noLogin', function(){
	alert('로그인이 필요한 메뉴 입니다.');
});
</script>
</html>