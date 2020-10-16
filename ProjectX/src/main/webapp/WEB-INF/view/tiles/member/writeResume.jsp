<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/writeResume.css">
<style type="text/css">
#preview{
	width: 162px;
	height: 231px;
}
</style>
</head>
<body>
<form action="regResume.me" method="post" >
	<div style="height: 50px;"></div>
	<!-- 이력서 제목 -->
	<input type="text" name="resumeName" style="font-size: 35px; font-weight: bold;" placeholder="제목을 입력해주세요.">
	<div style="height: 20px;"></div>
	<!-- 개인_기본정보 -->
	<span style="font-weight: bold; font-size: 24px;">개인 정보</span><input type="button" class="btn btn-primary" onClick="location.href='memUpdateForm.me';" value="개인정보수정" style="background: #ABC2E8; border-color: #ABC2E8;" />
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
							<img id="preview" src="resources/images/memberProfile/${sessionScope.memLogin.memImage }">
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
						<option value="">선택하세요</option>
						<option>고등학교</option>
						<option>대학교(2,3년제)</option>
						<option>대학교(4년제)</option>
					</select>
				</div>
				<div class="form-group col-md-6">
					<label for="eduSchool">학교명</label>
					<input type="text" class="form-control" id="eduSchool" name="eduSchool">
				</div>
				<div class="form-group col-md-6">
					<label for="eduLoc">지역</label>
					<input type="button" class="btn btn-primary" onClick="openDaumZipAddress2();" value="주소찾기" style="background: #ABC2E8; border-color: #ABC2E8;" />
					<input type="text" class="form-control" id="eduLoc" name="eduLoc">
				</div>
				<div class="form-group col-md-6">
					<div class="row">
						<div class="col-md-9">
							<label for="eduType">전공</label>
							<div class="row">
								<div class="col-md-5">
									<select style="height: 35px;" id="eduType" name="eduType">
										<option value="">전공계열 선택</option>
										<option>어문계열</option>
										<option>인문과학계열</option>
										<option>사회과학계열</option>
										<option>예/체능계열</option>
										<option>공학계열</option>
										<option>정보통신계열</option>
										<option>의학계열</option>
									</select>
								</div>
								<div class="col-md-6">
									<input type="text" class="form-control" id="eduMajor" name="eduMajor" placeholder="전공학과">
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<label for="eduScore">학점</label>
					  		<input type="number" class="form-control" id="eduScore" name="eduScore" max="4.5" min="0" step="0.1">
						</div>
												
												
					</div>
				</div>
				<div class="form-group col-md-6">
					<label for="eduBeginDate">입학일</label>
					<input type="date" class="form-control" id="eduBeginDate" name="eduBeginDate">
				</div>
				<div class="form-group col-md-6">
					<label for="eduEndDate">졸업일</label>
					<div class="row col-md-12">
						<input type="date" class="form-control col-md-11" id="eduEndDate" name="eduEndDate">
						<div class="col-md-1" style="padding:2px;">
							<select style="height: 40px;" id="eduIsOver" name="eduIsOver">
					  			<option value="">선택하세요</option>
					  			<option>졸업예정</option>
					  			<option>졸업</option>
					  			<option>휴학</option>
					  			<option>중퇴</option>
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
	<svg width="40px" height="40px" viewBox="0 0 16 16" class="bi bi-plus offset-md-11" fill="currentColor" xmlns="http://www.w3.org/2000/svg" id="addCertifi">
	  <path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
	</svg>
<!-- <input type="button" value="버튼" id="addBtn"> -->
	<div class="row col-md-12" style="border: 5px solid #ABC2E8; border-radius: 10px;">
		<div class="col-md-12" id="licenseDiv">
			<div class="form-row">
			   <div class="form-group col-md-12" >
				  <label for="licName">자격증 이름</label>
				  <input type="text" class="form-control" id="licName" name="licName">
				</div>
			  <div class="form-group col-md-6">
			    <label for="licLoc">발행처/기관</label>
			    <input type="text" class="form-control" id="licLoc" name="licLoc">
			  </div>
			  <div class="form-group col-md-6">
			    <label for="licGrade">점수</label>
			    <input type="text" class="form-control" id="licGrade" name="licGrade">
			    <small>※점수가 없는 시험의 경우, 합격/불합격으로 적어주세요.</small>
			  </div>
			  <div class="form-group col-md-12">
				  <label for="licDate">취득일</label>
				  <input type="date" class="form-control" id="licDate" name="licDate"> <!-- 예전에 했던 toDate 적용 -->
			  </div>
			</div>
		</div>
	</div>

<!-- 개인_자기소개 -->
	<div style="height: 20px;"></div>
	<span style="font-weight: bold; font-size: 24px;">자기소개</span>
	<svg width="40px" height="40px" viewBox="0 0 16 16" class="bi bi-plus offset-md-10" fill="currentColor" xmlns="http://www.w3.org/2000/svg" id="addProfile">
	  <path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
	</svg>
<!-- <input type="button" value="버튼" id="addBtn"> -->
	<div class="row col-md-12" style="border: 5px solid #ABC2E8; border-radius: 10px;">
		<div class="col-md-12" id="profileDiv">
		   <div class="form-group col-md-12">
			  <label for="proTitle">자기소개서 이름</label>
			  <input type="text" class="form-control" id="proTitle" name="proTitle">
			</div>
		   <div class="form-group col-md-12">
			  <label for="proContent">자기소개서 내용</label>
			  <textarea rows="10" cols="60" class="form-control" id="proContent" name="proContent"></textarea>
			</div>
		</div>
	</div>

<!-- 개인_경력사항 -->
	<div style="height: 20px;"></div>
	<span style="font-weight: bold; font-size: 24px;">경력 사항</span>
	<div class="row col-md-12" style="border: 5px solid #ABC2E8; border-radius: 10px;">
		<div class="col-md-12">
		 <div class="form-row">
		   <div class="form-group col-md-6">
		     <label for="beCompany">회사명</label>
		     <input type="text" class="form-control" id="beCompany" name="beCompany">
		   </div>
		   <div class="form-group col-md-6">
		     <label for="beCareer">경력</label>
		     <input type="number" class="form-control" id="beCareer" name="beCareer">년
		   </div>
		   <div class="form-group col-md-6">
		     <label for="beType">직종</label>
		     <input type="text" class="form-control" id="beType" name="beType">
		   </div>
		   <div class="form-group col-md-6">
		     <label for="bePosition">직책</label>
		     <input type="text" class="form-control" id="bePosition" name="bePosition">
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
					<input type="text" class="form-control" id="hopeType" name="hopeType">
				</div>
				<div class="form-group col-md-6">
					<label for="hopeSal">희망 연봉(단위: 만원)</label>
					<input type="number" class="form-control" id="hopeSal" name="hopeSal" min="0" value="2500">
				</div>
				<div class="form-group col-md-6">
					<label for="hopeLoc">희망 지역</label>
					<input type="text" class="form-control" id="hopeLoc" name="hopeLoc">
				</div>
				<div class="form-group col-md-6">
					<label for="hopeTime">희망 근무시간</label>
					<input type="text" class="form-control" id="hopeTime" name="hopeTime">
				</div>
				
			</div>
		</div>
	</div>
<!-- 이력서 정보 끝 -->

	<div style="height: 20px;"></div>	
	<div align="center">	
		<input type="submit" class="btn btn-primary" style="background: #ABC2E8; border-color: #ABC2E8; margin-bottom: 15px;" value="등록하기">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;	
		<button type="button" class="btn btn-primary" style="background: #ABC2E8; border-color: #ABC2E8; margin-bottom: 15px;" onclick="location.href='memberMypage.me'">뒤로 가기</button>	
	</div>
</form>	

<script type="text/JavaScript"    src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
   function openDaumZipAddress() {
      new daum.Postcode({
         oncomplete : function(data) {
        	 jQuery("#address").val(data.address);
				jQuery("#address").focus();
         }
      }).open();
   }
   function openDaumZipAddress2() {
      new daum.Postcode({
         oncomplete : function(data) {
        	 jQuery("#eduLoc").val(data.address);
				jQuery("#eduLoc").focus();
         }
      }).open();
   }
</script>
<script src="resources/js/writeResume.js?ver=4"></script>
</body>
</html>