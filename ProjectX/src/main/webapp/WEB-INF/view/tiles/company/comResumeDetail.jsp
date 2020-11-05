<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/writeResume.css">
</head>
<body>
<div style="height: 50px;"></div>
	<div style="height: 50px;"></div>
	<!-- 이력서 제목 -->
	<input type="text" name="resumeName" style="font-size: 35px; font-weight: bold;" readonly value="${memResume.resumeName }">
					<input type="hidden" class="form-control" id="memEmail" value="${memResume.memInfoVO.memEmail }">
					<input type="hidden" class="form-control" id="comName" value="${memResume.comName }">
	<div style="height: 20px;"></div>
	<!-- 개인_기본정보 -->
	<div class="row col-md-12" style="border: 5px solid #ABC2E8; border-radius: 10px;">
		<div class="col-md-9">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="memName">이름</label>
					<input type="text" class="form-control" name="memName" value="${memResume.memInfoVO.memName }" disabled>
				</div>
				<div class="form-group col-md-6">
					<label for="memEmail">이메일</label>
					<input type="email" class="form-control" name="memEmail" value="${memResume.memInfoVO.memEmail }" readonly>
				</div>
				<div class="form-group col-md-6">
					<label class="col-md-3 control-label" style="padding-left: 0px;">생년월일</label>
					<input type="date" class="form-control"  name="memBirth" value="${memResume.memInfoVO.memBirth }" disabled>
				</div>
				<div class="form-group col-md-6">
					<label for="memGender">성별</label>
				  	<div class="col-md-12" style="padding: 0px;">
				  		<c:if test="${memResume.memInfoVO.memGender eq 'M' }">
							<input type="text" name="memGender" class="form-control" id="memGender" value="남성"  disabled> 
						</c:if>
						<c:if test="${memResume.memInfoVO.memGender eq 'W' }">
				  			<input type="text" name="memGender" class="form-control" id="memGender" value="여성"  disabled>
					  	</c:if>
					</div>
				</div>
				<div class="form-group col-md-6">
					<label for="memTel1">연락처</label>
					<input type="text" class="form-control" id="memTel1" name="memTel1" value="${memResume.memInfoVO.memTel1 }" disabled>
				</div>
				<div class="form-group col-md-6">
					<div class="col-md-12" style="padding: 0px;">
						<label for="memAddr">주소</label>
						<input type="text" id="memAddr"  class="form-control" value="${memResume.memInfoVO.memAddr }" name="memAddr" disabled/>
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
							<img id="preview" src="resources/images/memberProfile/${memResume.memInfoVO.memImage }">
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
					<input type="text" class="form-control" id="eduSchool" name="eduSchool" value="${memResume.eduGrade }" disabled="disabled" style="background: white;">
				</div>
				<div class="form-group col-md-6">
					<label for="eduSchool">학교명</label>
					<input type="text" class="form-control" id="eduSchool" name="eduSchool" value="${memResume.eduSchool }" disabled="disabled" style="background: white;">
				</div>
				<div class="form-group col-md-6">
					<label for="eduLoc">지역</label>
					<input type="text" class="form-control" id="eduLoc" name="eduLoc" value="${memResume.eduLoc }" disabled="disabled" style="background: white;">
				</div>
				<div class="form-group col-md-6">
					<div class="row">
						<div class="col-md-9">
							<label for="eduType">전공</label>
							<div class="row">
								<div class="col-md-5">
									<select style="height: 35px;" id="eduType" name="eduType">
										<option>전공계열 선택</option>
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
									<input type="text" class="form-control" id="eduMajor" name="eduMajor" placeholder="전공학과" value="${memResume.eduMajor }" disabled="disabled" style="background: white;">
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<label for="eduScore">학점</label>
					  		<input type="number" class="form-control" id="eduScore" name="eduScore" max="4.5" min="0" step="0.1" value="${memResume.eduScore }" disabled="disabled" style="background: white;">
						</div>
												
												
					</div>
				</div>
				<div class="form-group col-md-6">
					<label for="eduBeginDate">입학일</label>
					<input type="date" class="form-control" id="eduBeginDate" name="eduBeginDate" value="${memResume.eduBeginDate }" disabled="disabled" style="background: white;">
				</div>
				<div class="form-group col-md-6">
					<label for="eduEndDate">졸업일</label>
					<div class="row col-md-12">
						<input type="date" class="form-control col-md-11" id="eduEndDate" name="eduEndDate" value="${memResume.eduEndDate }" disabled="disabled" style="background: white; ">
						<div class="col-md-1" style="padding:0px;">
					  		<input type="text" class="form-control" id="eduMajor" name="eduMajor" placeholder="전공학과" value="${memResume.eduIsOver }" disabled="disabled" style="background: white;margin-left: 5px;">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
   
<!-- 개인_자격증 -->
	<div style="height: 20px;"></div>
	<span style="font-weight: bold; font-size: 24px;">자격증</span>
	<div class="row col-md-12" style="border: 5px solid #ABC2E8; border-radius: 10px;">
		<c:forEach items="${memResume.licenseList }" var="lic">
			<div class="col-md-12" id="licenseDiv">
				<div class="form-row">
				   <div class="form-group col-md-12" >
					  <label for="licName">자격증 이름</label>
					  <input type="text" class="form-control" id="licName" name="licName" value="${lic.licName }" disabled="disabled" style="background: white;">
					</div>
				  <div class="form-group col-md-6">
				    <label for="licLoc">발행처/기관</label>
				    <input type="text" class="form-control" id="licLoc" name="licLoc" value="${lic.licLoc }" disabled="disabled" style="background: white;">
				  </div>
				  <div class="form-group col-md-6">
				    <label for="licGrade">점수</label>
				    <input type="text" class="form-control" id="licGrade" name="licGrade" value="${lic.licGrade }" disabled="disabled" style="background: white;">
				  </div>
				  <div class="form-group col-md-12">
					  <label for="licDate">취득일</label>
					  <input type="date" class="form-control" id="licDate" name="licDate" value="${lic.licDate }" disabled="disabled" style="background: white;"> 
				  </div>
				</div>
			</div>
		</c:forEach>
	</div>

<!-- 개인_자기소개 -->
	<div style="height: 20px;"></div>
	<span style="font-weight: bold; font-size: 24px;">자기소개</span>
	<div class="row col-md-12" style="border: 5px solid #ABC2E8; border-radius: 10px;">
		<c:forEach items="${memResume.profilesList }" var="pro">
			<div class="col-md-12" id="profileDiv">
			   <div class="form-group col-md-12">
				  <label for="proTitle">자기소개서 이름</label>
				  <input type="text" class="form-control" id="proTitle" name="proTitle" value="${pro.proTitle }" disabled="disabled" style="background: white;">
				</div>
			   <div class="form-group col-md-12">
				  <label for="proContent">자기소개서 내용</label>
				  <textarea rows="10" cols="60" class="form-control" id="proContent" name="proContent" disabled="disabled" style="background: white;">${pro.proContent }</textarea>
				</div>
			</div>
		</c:forEach>
	</div>

<!-- 개인_경력사항 -->
	<div style="height: 20px;"></div>
	<span style="font-weight: bold; font-size: 24px;">경력 사항</span>
	<div class="row col-md-12" style="border: 5px solid #ABC2E8; border-radius: 10px;">
		<div class="col-md-12">
		 <div class="form-row">
		   <div class="form-group col-md-6">
		     <label for="beCompany">회사명</label>
		     <input type="text" class="form-control" id="carCompany" name="carCompany" value="${memResume.carCompany }" disabled="disabled" style="background: white;">
		   </div>
		   <div class="form-group col-md-6">
		     <label for="beCareer">경력</label>
		     <input type="text" class="form-control" id="carCareer" name="carCareer" value="${memResume.carCareer }년" disabled="disabled" style="background: white;">
		   </div>
		   <div class="form-group col-md-6">
		     <label for="beType">직종</label>
		     <input type="text" class="form-control" id="carType" name="carType" value="${memResume.carType }" disabled="disabled" style="background: white;">
		   </div>
		   <div class="form-group col-md-6">
		     <label for="bePosition">직책</label>
		     <input type="text" class="form-control" id="carPosition" name="bePosition" value="${memResume.carPosition }" disabled="disabled" style="background: white;">
		   </div>
		 </div>
		</div>
	</div>

<!-- 희망 근무 조건 -->
	<div style="height: 20px;"></div>
	<span style="font-weight: bold; font-size: 24px;">희망 조건</span>
	<div class="row col-md-12" style="border: 5px solid #ABC2E8; border-radius: 10px;">
		<div class="col-md-12">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="hopeType">희망 직종</label>
					<input type="text" class="form-control" id="hopeType" name="hopeType" value="${memResume.hopeType }" disabled="disabled" style="background: white;">
				</div>
				<div class="form-group col-md-6">
					<label for="hopeSal">희망 연봉(단위: 만원)</label>
					<input type="number" class="form-control" id="hopeSal" name="hopeSal" min="0" value="${memResume.hopeSal }" disabled="disabled" style="background: white;">
				</div>
				<div class="form-group col-md-6">
					<label for="hopeLoc">희망 지역</label>
					<input type="text" class="form-control" id="hopeLoc" name="hopeLoc" value="${memResume.hopeLoc }" disabled="disabled" style="background: white;">
				</div>
				<div class="form-group col-md-6">
					<label for="hopeTime">희망 근무시간</label>
					<input type="text" class="form-control" id="hopeTime" name="hopeTime" value="${memResume.hopeTime }" disabled="disabled" style="background: white;">
				</div>
			</div>
		</div>
	</div>
	<div style="height: 20px;"></div>
	<div class="col-md-12">
	<div align="center">
		<input type="hidden" value="${memResume.comMypageNum }" id="comMypageNum" name="comMypageNum">
		<input type="button" style="background: #ABC2E8; border: 1px solid; color: white; width: 120px; height: 30px;" id="acceptanceBtn"  value="합격">
		<input type="button" style="background: #ABC2E8; border: 1px solid; color: white; width: 120px; height: 30px;" id="rejectBtn" value="불합격">
		<input type="button" style="background: #ABC2E8; border: 1px solid; color: white; width: 120px; height: 30px;"  value="취소" onclick="history.back();">
	</div>
	</div>
	<div style="height: 40px;"></div>
</body>
<script src="resources/js/comResumeDetail.js?ver=10"></script>
</html>