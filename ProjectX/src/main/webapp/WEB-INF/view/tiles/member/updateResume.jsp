<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="resources/css/writeResume.css">
<style type="text/css">
svg{
	cursor: pointer;
}

table{
	width: 100%;
}

input[type="submit"]{
	background-color: #0F4C81;
	border: 0px;
	color: white;
	margin-top: 6px;
	border-radius: 5px;
	height: 30px;
}
</style>
</head>
<body>
<!-- 이력서 수정 페이지 -->
<form action="updateResume.me" method="post">
<input type="hidden" value="${memResume.resumeNum }" name="resumeNum">
<div style="height: 30px;"></div>
	<!-- 이력서 제목 -->
	<input type="text" name="resumeName" style="font-size: 35px; font-weight: bold;" value="${memResume.resumeName }">
	<div style="height: 20px;"></div>
	<!-- 개인_기본정보 -->
	<span style="font-weight: bold; font-size: 24px;">개인 정보</span><input type="button" class="btn btn-primary" onClick="location.href='memUpdateForm.me';" value="개인정보수정" style="background: #ABC2E8; border-color: #ABC2E8; margin-bottom: 5px;"/>
	<div class="row col-md-12" style="border: 5px solid #ABC2E8; border-radius: 10px;">
		<div class="col-md-9">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="memName">이름</label>
					<input type="text" class="form-control" id="memName" name="memName" value="${sessionScope.memLogin.memName }" disabled>
				</div>
				<div class="form-group col-md-6">
					<label for="memEmail">이메일</label>
					<input type="email" class="form-control" id="memEmail" name="memEmail" value="${sessionScope.memLogin.memEmail }" readonly>
				</div>
				<div class="form-group col-md-6">
					<label class="col-md-3 control-label" style="padding-left: 0px;">생년월일</label>
					<input type="date" class="form-control"  name="memBirth" value="${sessionScope.memLogin.memBirth }" disabled>
				</div>
				<div class="form-group col-md-6">
					<label for="memGender">성별</label>
				  	<div class="col-md-12" style="padding: 0px;">
				  		<c:if test="${sessionScope.memLogin.memGender eq 'M' }">
							<input type="text" name="memGender" class="form-control" id="memGender" value="남성"  disabled> 
						</c:if>
						<c:if test="${sessionScope.memLogin.memGender eq 'W' }">
				  			<input type="text" name="memGender" class="form-control" id="memGender" value="여성"  disabled>
					  	</c:if>
					</div>
				</div>
				<div class="form-group col-md-6">
					<label for="memTel1">연락처</label>
					<input type="text" class="form-control" id="memTel1" name="memTel1" value="${sessionScope.memLogin.memTel1 }" disabled>
				</div>
				<div class="form-group col-md-6">
					<div class="col-md-12" style="padding: 0px;">
						<label for="memAddr">주소</label>
						<input type="text" id="memAddr"  class="form-control" value="${sessionScope.memLogin.memAddr }" name="memAddr" disabled/>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-3">
			<div class="container">
				<div class="row">
					<div class="col-md-6 form-group">
						<div class="form-group files uploader offset-md-5">
							<label for="memImage">사진</label>
							<input type="file" class="form-control"  id="memImage" name="memImage" disabled>
<%-- 							<img id="preview" src="resources/images/memberProfile/${sessionScope.memLogin.memImage }" onerror="this.src='resources/images/profile.png'"> --%>
							<img id="preview" src="https://findream.s3.ap-northeast-2.amazonaws.com/images/${sessionScope.memLogin.memImage }" onerror="this.src='resources/images/profile.png'">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<!-- 개인_학력사항 -->	
	<div style="height: 20px;"></div>
	<span style="font-weight: bold; font-size: 24px;">학력 사항</span><!-- 학교 정보에 대한 DB 필요 -->
	<div class="row col-md-12" style="border: 5px solid #ABC2E8; border-radius: 10px;">
		<div class="row col-md-12">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="eduGrade">학력구분</label>
					<select class="form-control" id="eduGrade" name="eduGrade" style="height: 35px;">
						<option>선택하세요</option>
						<option <c:if test="${memResume.eduGrade eq '고등학교' }">selected</c:if> >고등학교</option>
						<option <c:if test="${memResume.eduGrade eq '대학교(2,3년제)' }">selected</c:if> >대학교(2,3년제)</option>
						<option <c:if test="${memResume.eduGrade eq '대학교(4년제)' }">selected</c:if> >대학교(4년제)</option>
					</select>
				</div>
				<div class="form-group col-md-6">
					<label for="eduSchool">학교명</label>
					<input type="text" class="form-control" id="eduSchool" name="eduSchool" value="${memResume.eduSchool }">
				</div>
				<div class="form-group col-md-6">
					<label for="eduLoc">지역</label>
					<input type="button" class="btn btn-primary" onClick="openDaumZipAddress2();" value="주소찾기" style="background: #ABC2E8; border-color: #ABC2E8; margin: 5px;"/>
					<input type="text" class="form-control" id="eduLoc" name="eduLoc" value="${memResume.eduLoc }">
				</div>
				<div class="form-group col-md-6">
					<div class="row">
						<div class="col-md-9" style="top: 14px;">
							<label for="eduType">전공</label>
							<div class="row">
								<div class="col-md-4">
									<select style="height: 40px;width: 200px; " id="eduType" name="eduType" >
										<option <c:if test="${memResume.eduType eq '어문계열' }">selected</c:if> >어문계열</option>
										<option <c:if test="${memResume.eduType eq '인문과학계열' }">selected</c:if> >인문과학계열</option>
										<option <c:if test="${memResume.eduType eq '사회과학계열' }">selected</c:if> >사회과학계열</option>
										<option <c:if test="${memResume.eduType eq '예/체능계열' }">selected</c:if> >예/체능계열</option>
										<option <c:if test="${memResume.eduType eq '공학계열' }">selected</c:if> >공학계열</option>
										<option <c:if test="${memResume.eduType eq '정보통신계열' }">selected</c:if> >정보통신계열</option>
										<option <c:if test="${memResume.eduType eq '의학계열' }">selected</c:if> >의학계열</option>
									</select>
								</div>
								<div class="col-md-6">
									<input style="height: 40px; margin-left: 30px;" type="text" class="form-control" id="eduMajor" name="eduMajor" placeholder="전공학과" value="${memResume.eduMajor }">
								</div>
							</div>
						</div>
						<div class="col-md-3" style="top: 14px; left: -80px;">
							<label for="eduScore">학점</label>
					  		<input type="number" class="form-control" id="eduScore" name="eduScore" max="4.5" min="0" step="0.01" value="0.00" style="height: 40px;" value="${memResume.eduScore }">
						</div>
					</div>
				</div>
				<div class="form-group col-md-6">
					<label for="eduBeginDate">입학일</label>
					<input type="text" class="form-control" id="eduBeginDate" name="eduBeginDate" value="${memResume.eduBeginDate }" autocomplete="off">
				</div>
				<div class="form-group col-md-6">
					<label for="eduEndDate">졸업일</label>
					<div class="row col-md-12">
						<input type="text" class="form-control col-md-11" id="eduEndDate" name="eduEndDate" value="${memResume.eduEndDate }" autocomplete="off">
						<div class="col-md-1" style="padding:2px; top:-3px;">
							<select style="height: 40px;" id="eduIsOver" name="eduIsOver">
					  			<option>선택하세요</option>
					  			<option <c:if test="${memResume.eduIsOver eq '졸업예정' }">selected</c:if> >졸업예정</option>
					  			<option <c:if test="${memResume.eduIsOver eq '졸업' }">selected</c:if> >졸업</option>
					  			<option <c:if test="${memResume.eduIsOver eq '휴학' }">selected</c:if> >휴학</option>
					  			<option <c:if test="${memResume.eduIsOver eq '중퇴' }">selected</c:if> >중퇴</option>
					  		</select>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
   
<!-- 개인_자격증 -->
	<div style="height: 20px;"></div>
	<span style="font-weight: bold; font-size: 24px;">자격증</span>
	<svg width="2em" height="2em" viewBox="0 0 16 16" class="offset-md-11 bi bi-plus" id="addCertifi" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	  <path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
	</svg>
	<div class="row col-md-12" style="border: 5px solid #ABC2E8; border-radius: 10px; padding-left: 15px;" id="licenseFather">
		<c:forEach items="${memResume.licenseList }" var="lic" varStatus="status">
			<c:if test="${status.index ge 1 }">
				<div style="border-top: 2px solid lightgray;"></div>
			</c:if>
			<div class="col-md-12" class="licenseDiv">
				<div class="form-row">
				   <div class="form-group col-md-12" >
				   <input type="hidden" name="licNum" value="${lic.licNum }" >
					  <label for="licName">자격증 이름</label>
					  <!-- 삭제버튼 -->
					  <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-trash licDeleteBtn" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
						<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
						<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
					   </svg>
					  <input type="text" class="form-control licName" name="licName" value="${lic.licName }">
					</div>
				  <div class="form-group col-md-6">
				    <label for="licLoc">발행처/기관</label>
				    <input type="text" class="form-control licLoc" name="licLoc" value="${lic.licLoc }">
				  </div>
				  <div class="form-group col-md-6">
				    <label for="licGrade">점수</label>
				    <input type="text" class="form-control licGrade" name="licGrade" value="${lic.licGrade }">
				  </div>
				  <div class="form-group col-md-12">
					  <label for="licDate">취득일</label>
					  <input type="text" class="form-control licDate" name="licDate" value="${lic.licDate }" autocomplete="off"> 
				  </div>
				</div>
			</div>
		</c:forEach>
	</div>

<!-- 개인_자기소개 -->
	<div style="height: 20px;"></div>
	<span style="font-weight: bold; font-size: 24px;">자기소개</span>
	<svg style="margin-left: 89.8%;" id="addProfile" width="2em" height="2em" viewBox="0 0 16 16" class="offset-md-10 bi bi-plus" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	  <path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
	</svg>
	<div class="row col-md-12" style="border: 5px solid #ABC2E8; border-radius: 10px;" id="profilesFather">
		<c:forEach items="${memResume.profilesList }" var="pro" varStatus="status">
		<c:if test="${status.index ge 1 }">
			<div class="col" style="border-top: 2px solid lightgray;"></div>
		</c:if>
			<div class="col-md-12" id="profileDiv">
			  <div class="form-group col-md-12">
			   <input type="hidden" value="${pro.proNum }" name="proNum">
				  <label for="proTitle">자기소개서 이름</label>
				  <!-- 삭제버튼 -->
				  <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-trash proDeleteBtn" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
					<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
				   </svg>
				  <input type="text" class="form-control proTitle" name="proTitle" value="${pro.proTitle }">
				</div>
			   <div class="form-group col-md-12">
				  <label for="proContent">자기소개서 내용</label>
				  <textarea rows="10" cols="40" class="form-control proContent" name="proContent" style="word-wrap: break-word;white-space: pre-wrap;white-space: -moz-pre-wrap;white-space: -pre-wrap;white-space: -o-pre-wrap;word-break:break-all;">${pro.proContent }</textarea>
				</div>
			</div>
		</c:forEach>
	</div>

<!-- 개인_경력사항 -->
	<div style="height: 20px;"></div>
	<span style="font-weight: bold; font-size: 24px;">경력 사항</span>
	<svg style="margin-left: 89.8%;" id="addCareer" width="2em" height="2em" viewBox="0 0 16 16" class="offset-md-10 bi bi-plus" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	  <path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
	</svg>
	<div class="row col-md-12" style="border: 5px solid #ABC2E8; border-radius: 10px;" id="careerTotal">
	<c:forEach items="${memResume.careerList }" var="career" varStatus="status">
	<c:if test="${status.index ge 1 }">
		<div class="col" style="border-top: 2px solid lightgray;"></div>
	</c:if>
		<div class="col-md-12 careerDiv">
		 <div class="form-row">
		   <div class="form-group col-md-6">
		 	<input type="hidden" value="${career.carNum }" name="carNum">
		     <label for="carCompany">회사명</label>
		     <!-- 삭제버튼 -->
			  <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-trash careerDeleteBtn" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
				<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
			   </svg>
		     <input type="text" class="form-control carCompany" name="carCompany" value="${career.carCompany }">
		   </div>
		   <div class="form-group col-md-6">
		     <label for="carCareer">경력</label>
		     <div class="row col-md-12">
			     <input type="number" class="form-control col-md-11 carCareer" name="carCareer" value="${career.carCareer }" placeholder="년차를 입력해주세요" min="0" max="100">
				 <span class="col-md-1" style="left: -15px; bottom: -7px;">년</span>
			 </div>
		   </div>
		   <div class="form-group col-md-6">
		     <label for="carType">직종</label>
		     <input type="text" class="form-control carType" name="carType" value="${career.carType }">
		   </div>
		   <div class="form-group col-md-6">
		     <label for="carPosition">직책</label>
		     <input type="text" class="form-control carPosition" name="carPosition" value="${career.carPosition }">
		   </div>
		 </div>
		</div>
		</c:forEach>
	</div>

<!-- 희망 근무 조건 -->
	<div style="height: 20px;"></div>
	<span style="font-weight: bold; font-size: 24px;">희망 조건</span>
	<div class="row col-md-12" style="border: 5px solid #ABC2E8; border-radius: 10px;">
		<div class="col-md-12">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="hopeType">희망 직종</label>
					<input type="text" class="form-control" id="hopeType" name="hopeType" value="${memResume.hopeType }">
				</div>
				<div class="form-group col-md-6">
					<label for="hopeSal">희망 연봉</label>
					<div class="row col-md-12">
						<input type="number" class="form-control col-md-10" id="hopeSal" name="hopeSal" min="0" value="${memResume.hopeSal }">
						<span class="col-md-2" style="left: -13px; top: 7px;">만원</span>
					</div>
				</div>
				<div class="form-group col-md-6">
					<label for="hopeLoc">희망 지역</label>
					<input type="text" class="form-control" id="hopeLoc" name="hopeLoc" value="${memResume.hopeLoc }">
				</div>
				<div class="form-group col-md-6">
					<label for="hopeTime">희망 근무시간</label>
					<input type="text" class="form-control" id="hopeTime" name="hopeTime" value="${memResume.hopeTime }">
				</div>
				
			</div>
		</div>
	</div>
<div style="height: 10px;"></div>
<div align="center">
	<input type="submit" value="수정 완료하기" style="margin: 10px;">
</div>
</form>	
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="resources/js/updateResume.js?ver=13"></script>
</body>
</html>