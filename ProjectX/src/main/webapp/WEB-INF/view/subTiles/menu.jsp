<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a:hover {
	cursor: pointer;
}
.menuTap:hover {
	cursor: pointer;
}
.menuTap{
	color: #0F4181;
}
label{
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="row" style="margin-bottom: 10px;">
		<div class="col-md-6">
			<img alt="..." src="resources/images/logo2.jpg"
				style="width: 150px; cursor: pointer;"
				onclick="location.href='main.do'">
		</div>
		<div class="col-md-6">
			<div style="height: 30%;"></div>
			<ul class="nav justify-content-end">
				<c:if
					test="${empty sessionScope.memLogin && empty sessionScope.comLogin}">
					<li class="menuTap nav-item"><a class="menuTap nav-link" data-toggle="modal"
						data-target="#mLoginModal">회원가입/로그인</a></li>
					<li class="menuTap nav-item"><a class="menuTap nav-link" data-toggle="modal"
						data-target="#cLoginModal">기업 서비스</a></li>
				</c:if>
				<c:if test="${not empty sessionScope.memLogin }">
					<li class="menuTap nav-item"><a class="menuTap nav-link" href="memberMypage.me">환영합니다.
							${sessionScope.memLogin.memName }님</a></li>
					<li class="menuTap nav-item"><a class="menuTap nav-link" id="logBTS">로그아웃</a>
					</li>
				</c:if>
				<c:if test="${not empty sessionScope.comLogin }">
					<li class="menuTap nav-item"><span>환영합니다.
							${sessionScope.comLogin.comCeo }님</span></li>
					<li class="menuTap nav-item"><a class="menuTap nav-link" id="logBTS" style="padding: 0px; padding-left: 20px;">로그아웃</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>




	<!-- 개인 로그인 Modal -->
	<div class="modal fade" id="mLoginModal" tabindex="-1"
		aria-labelledby="mLoginModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" >
				<div class="modal-header">
					<h2 class="modal-title">개인회원 로그인</h2>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="memberLogin.do" method="post">
					<div class="modal-body">
							<div style="height: 15px;"></div>
							<div align="center">
								<div class="form-group">
									<label for="loginMemEmail">이메일</label> 
									<input type="email" class="form-control" id="loginMemEmail" name="memEmail" required autocomplete="off">
								</div>
								<div class="form-group">
									<label for="loginMemPass">비밀번호</label> 
									<input type="password" class="form-control" id="loginMemPass" name="memPass" required autocomplete="off">
								</div>
								<div class="form-group form-check">
									<input type="checkbox" class="form-check-input" value="on" id="memKeepLogin" name="keepLogin"> 
									<label class="form-check-label" for="memKeepLogin">자동 로그인</label>
								</div>
							</div>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-outline-secondary" value="회원가입" id="mJoinBtn"> 
						<input type="button" class="btn btn-outline-secondary" value="비밀번호 찾기" id="findMemPassBtn"> 
						<input type="submit" class="btn btn-outline-primary" value="시작하기">
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- 개인 회원가입 모달 -->
	<div class="modal fade" id="mJoinModal" tabindex="-1"
		aria-labelledby="mJoinModal" aria-hidden="true">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content" id="joinModalContent">
				<div class="modal-header">
					<h2 class="modal-title">개인 회원가입</h2>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="memberJoin.do" method="post" id="mJoinForm">
					<div class="modal-body">
							<div class="form-group">
								<label for="joinMemEmail">이메일(아이디)</label> 
								<input type="button" class="btn btn-outline-primary" id="emailChk" value="중복확인">
								<input type="email" class="form-control" id="joinMemEmail" name="memEmail" autocomplete="off">
							</div>
							<div class="form-group">
								<label for="joinMemPass">비밀번호</label> 
								<input type="password" class="form-control" id="joinMemPass" name="memPass" >
							</div>
							<div class="form-group">
								<label for="memPassChk">비밀번호 확인</label> 
								<input type="password" class="form-control" id="memPassChk" name="memPassChk">
							</div>
							<div class="form-group">
								<label for="memName">이름</label> 
								<input type="text" class="form-control" id="memName" name="memName" autocomplete="off">
							</div>
							<div class="form-group">
								<label for="memBirth">생년월일</label> 
								<input type="text" class="form-control" id="memBirth" name="memBirth"  autocomplete="off">
							</div>
							<div class="form-group">
								<div>
									<label>성별</label> 
								</div>
								<div class="form-check form-check-inline">
									<input type="radio" class="form-check-input" id="memRadio1" name="memGender" value="M"> 
									<label class="form-check-label" for="memRadio1">남</label>
								</div>
								<div class="form-check form-check-inline">
									<input type="radio" class="form-check-input" id="memRadio2" name="memGender" value="W"> 
									<label class="form-check-label" for="memRadio2">여</label>
								</div>
							</div>
							<div class="form-group">
								<label for="memTel1">연락처</label> 
								<input type="text" class="form-control" id="memTel1" name="memTel1" autocomplete="off">
							</div>
							<div class="form-group">
								<label for="findAddr1">거주지</label> 
								<input type="button" class="btn btn-outline-primary" id="findAddr1" value="주소찾기" autocomplete="off"> 
								<input type="text" class="form-control" id="address" name="memAddr" autocomplete="off">
							</div>
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-outline-primary" id="formBtn"
							value="회원가입">
					</div>
				</form>
			</div>
		</div>
	</div>

<!-- 개인 비밀번호찾기 모달 -->
<div class="modal fade" id="findMemModal" tabindex="-1"
		aria-labelledby="findMemModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title">비밀번호 찾기</h2>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
						<div style="height: 15px;"></div>
						<div align="center">
							<div class="form-group">
								<label for="findMemEmail">이메일</label> 
								<input type="email" class="form-control" id="findMemEmail" name="memEmail" required autocomplete="off">
							</div>
						</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-outline-primary" value="이메일 전송" id="findMemBtn" autocomplete="off"> 
				</div>
			</div>
		</div>
	</div>
	
<!-- 	개인 인증번호 모달 -->
<div class="modal fade" id="memCodeModal" tabindex="-1"
		aria-labelledby="memCodeModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" >
				<div class="modal-header">
					<h2 class="modal-title">비밀번호 찾기</h2>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
						<div style="height: 15px;"></div>
						<div align="center">
							<div class="form-group">
								<label for="memCode">인증번호</label> 
								<input type="text" class="form-control" id="memCode" required>
							</div>
						</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-outline-secondary" value="인증" id="memCodeBtn"> 
				</div>
			</div>
		</div>
	</div>
	
<!-- 	개인 비밀번호 변경 모달 -->
<div class="modal fade" id="updateMemPassModal" tabindex="-1" data-backdrop="static"
		aria-labelledby="updateMemPassModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title">비밀번호 찾기</h2>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="updateMemPass.do" method="post" id="updateMemPassForm">
				<div class="modal-body">
						<div style="height: 15px;"></div>
						<div class="form-group">
								<label for="findedMemEmail">이메일</label> 
								<input type="email" class="form-control" id="findedMemEmail" name="memEmail" readonly>
							</div>
						<div align="center">
							<div class="form-group">
								<label for="newMemPass">새 비밀번호</label> 
								<input type="password" class="form-control" id="newMemPass" name="memPass" required autocomplete="off">
							</div>
						</div>
						<div align="center">
							<div class="form-group">
								<label for="newMemPassChk">새 비밀번호 확인</label> 
								<input type="password" class="form-control" id="newMemPassChk"required autocomplete="off">
							</div>
						</div>
				</div>
				<div class="modal-footer">
					<input type="submit" class="btn btn-outline-primary" value="비밀번호 변경"> 
				</div>
				</form>
			</div>
		</div>
	</div>


<!-- ----------------------------------------------------------------------------------------------------------------------------------------------------- -->


	<!-- 기업 로그인 Modal -->
	<div class="modal fade" id="cLoginModal" tabindex="-1"
		aria-labelledby="cLoginModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title">기업회원 로그인</h2>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
					<form action="companyLogin.do" method="post">
				<div class="modal-body">
						<div align="center" style="margin-top: 15px;">
							<div class="form-group">
								<label for="loginComNum">사업자번호</label> 
								<input type="text" class="form-control" id="loginComNum" name="comNum" required>
							</div>
							<div class="form-group">
								<label for="loginComPass">비밀번호</label>
								<input type="password" class="form-control" id="loginComPass" name="comPass" required>
							</div>
							<div class="form-group form-check">
								<input type="checkbox" class="form-check-input" id="comKeepLogin" name="keepLogin" value="on"> 
								<label class="form-check-label" for="comKeepLogin">자동 로그인</label>
							</div>
						</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-outline-secondary" value="회원가입" id="cJoinBtn"> 
					<input type="button" class="btn btn-outline-secondary" value="비밀번호 찾기" id="findComPassBtn"> 
					<input type="submit" class="btn btn-outline-primary" value="시작하기">
				</div>
					</form>
			</div>
		</div>
	</div>

	<!-- 기업 회원가입 Modal -->
	<div class="modal fade" id="cJoinModal" tabindex="-1"
		aria-labelledby="cJoinModal" aria-hidden="true">
		<div class="modal-dialog  modal-dialog-scrollable">
			<div class="modal-content" id="joinModalContent">
				<div class="modal-header">
					<h2 class="modal-title">기업 회원가입</h2>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="companyJoin.do" method="post" id="cJoinForm">
					<div class="modal-body">
							<div class="form-group">
								<label for="joinComNum">사업자번호</label> 
								<input type="button" class="btn btn-outline-primary" id="comNumChk" value="중복확인">
								<input type="text" class="form-control" id="joinComNum" name="comNum" >
							</div>
							<div class="form-group">
								<label for="joinComPass">비밀번호</label> 
								<input type="password" class="form-control" id="joinComPass" name="comPass" >
							</div>
							<div class="form-group">
								<label for="comPassChk">비밀번호 확인</label> 
								<input type="password" class="form-control" id="comPassChk">
							</div>
							<div class="form-group">
								<label for="comEmail">이메일</label> 
								<input type="email" class="form-control" id="comEmail" name="comEmail" >
							</div>
							<div class="form-row">
							<div class="form-group col-md-6">
								<label for="comName">법인명</label> 
								<input type="text" class="form-control" id="comName" name="comName" >
							</div>
							<div class="form-group col-md-6">
								<label for="comCeo">대표자명</label> 
								<input type="text" class="form-control" id="comCeo" name="comCeo" >
							</div>
							</div>
							<div class="form-row">
							<div class="form-group col-md-6">
								<label for="address2">본사 주소</label> 
								<input type="button" class="btn btn-outline-primary" id="findAddr2" value="주소찾기"> 
								<input type="text" class="form-control" id="address2" name="comLoc">
							</div>
							<div class="form-group col-md-6" style="margin-top: 5.5px;">
								<label>상세주소</label> <input type="text"
									class="form-control" name="comLocDetail"
									required>
							</div>
							</div>
							<div class="form-group">
								<label>산업군</label> <input type="text"
									class="form-control" name="comType" required>
							</div>
							<div class="form-group">
								<label>연락처</label> <input type="text"
									class="form-control" name="comTel" required>
							</div>
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-outline-primary" id="formBtn2" value="회원가입">
					</div>
				</form>
			</div>
		</div>
	</div>

<!-- 기업 비밀번호찾기 모달 -->
<div class="modal fade" id="findComModal" tabindex="-1"
		aria-labelledby="findComModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title">비밀번호 찾기</h2>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
						<div style="height: 15px;"></div>
						<div align="center">
							<div class="form-group">
								<label for="findComEmail">이메일</label> 
								<input type="email" class="form-control" id="findComEmail" name="comEmail" required>
							</div>
						</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-outline-primary" value="이메일 전송" id="findComBtn"> 
				</div>
			</div>
		</div>
	</div>

<!-- 	기업 인증번호 모달 -->
<div class="modal fade" id="comCodeModal" tabindex="-1"
		aria-labelledby="comCodeModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" >
				<div class="modal-header">
					<h2 class="modal-title">비밀번호 찾기</h2>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
						<div style="height: 15px;"></div>
						<div align="center">
							<div class="form-group">
								<label for="comCode">인증번호</label> 
								<input type="text" class="form-control" id="comCode" required>
							</div>
						</div>
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-outline-secondary" value="인증" id="comCodeBtn"> 
				</div>
			</div>
		</div>
	</div>

<!-- 	기업 비밀번호 변경 모달 -->
<div class="modal fade" id="updateComPassModal" tabindex="-1"
		aria-labelledby="updateComPassModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title">비밀번호 찾기</h2>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form action="updateComPass.do" method="post">
				<div class="modal-body">
						<div style="height: 15px;"></div>
						<div class="form-group">
								<label for="findedComEmail">이메일</label> 
								<input type="email" class="form-control" id="findedComEmail" name="comEmail" readonly>
							</div>
						<div align="center">
							<div class="form-group">
								<label for="newComPass">새 비밀번호</label> 
								<input type="text" class="form-control" id="newComPass" name="comPass" required>
							</div>
						</div>
						<div align="center">
							<div class="form-group">
								<label for="newComPassChk">새 비밀번호 확인</label> 
								<input type="text" class="form-control" id="newComPassChk" required>
							</div>
						</div>
				</div>
				<div class="modal-footer">
					<input type="submit" class="btn btn-outline-primary" value="비밀번호 변경"> 
				</div>
				</form>
			</div>
		</div>
	</div>
	<script src="resources/js/menu.js?ver=15"></script>
</body>
</html>