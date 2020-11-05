<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="resources/css/writeResume.css?ver=2">
<style type="text/css">
svg{
	cursor: pointer;
}
#eduLoc-error{
	margin-top: 0.4rem;
}
#resumeName-error{
	margin-top: 0.8rem;
}
</style>
</head>
<body>
<form action="regResume.me" method="post" id="writeResumeForm">
	<div style="height: 50px;"></div>
	<!-- 이력서 제목 -->
	<div id="reNameDiv">
		<input type="text" name="resumeName" style="font-size: 35px; font-weight: bold;" placeholder="제목을 입력해주세요." id="resumeName">
	</div>
	<div style="height: 20px;"></div>
	<!-- 개인_기본정보 -->
	<span style="font-weight: bold; font-size: 24px; color: #0F4C81;">개인 정보</span><input type="button" class="btn btn-primary" onClick="location.href='memUpdateForm.me';" value="개인정보수정" style="background: #658DC6; border-color: #658DC6; margin-bottom: 6px;
    margin-left: 5px;"/>
	<div class="row col-md-12" style="border: 5px solid #658DC6; border-radius: 10px;">
		<div class="col-md-9">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="memReName">이름</label>
					<input type="text" class="form-control" id="memReName" name="memName" value="${sessionScope.memLogin.memName }" disabled>
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
					<label for="memReTel1">연락처</label>
					<input type="text" class="form-control" id="memReTel1" name="memTel1" value="${sessionScope.memLogin.memTel1 }" disabled>
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
							<img id="preview" src="resources/images/memberProfile/${sessionScope.memLogin.memImage }" onerror="this.src='resources/images/profile.png'">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<!-- 개인_학력사항 -->	
	<div style="height: 20px;"></div>
	<span style="font-weight: bold; font-size: 24px;color: #0F4C81;">학력 사항</span><!-- 학교 정보에 대한 DB 필요 -->
	<div class="row col-md-12" style="border: 5px solid #658DC6; border-radius: 10px;">
		<div class="row col-md-12" style="margin-top:10px;">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="eduGrade">학력구분</label>
					<select class="form-control" id="eduGrade" name="eduGrade" style="height: 35px;">
						<option>선택하세요</option>
						<option>고등학교</option>
						<option>대학교(2,3년제)</option>
						<option>대학교(4년제)</option>
					</select>
				</div>
				<div class="form-group col-md-6">
					<label for="eduSchool">학교명</label>
					<input type="text" class="form-control" id="eduSchool" name="eduSchool">
				</div>
				<div class="form-group col-md-6" id="locDiv">
					<label for="eduLoc">지역</label>
					<input type="button" class="btn btn-primary" id="openAddr" value="주소찾기" style="background: #658DC6; border-color: #658DC6; margin: 5px;"/>
					<input type="text" class="form-control" id="eduLoc" name="eduLoc">
				</div>
				<div class="form-group col-md-6">
					<div class="row">
						<div class="col-md-9" style="top: 14px;">
							<label for="eduType">전공</label>
							<div class="row">
								<div class="col-md-4">
									<select style="height: 40px;width: 200px; " id="eduType" name="eduType" >
										<option>전공계열 선택</option>
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
									<input style="height: 40px; margin-left: 30px;" type="text" class="form-control" id="eduMajor" name="eduMajor" placeholder="전공학과">
								</div>
							</div>
						</div>
						<div class="col-md-3" style="top: 14px; left: -80px;">
							<label for="eduScore">학점</label>
					  		<input type="number" class="form-control" id="eduScore" name="eduScore" max="4.5" min="0" step="0.01" value="0.00" style="height: 40px;">
						</div>
					</div>
				</div>
				<div class="form-group col-md-6">
					<label for="eduBeginDate">입학일</label>
					<input type="text" class="form-control" id="eduBeginDate" name="eduBeginDate" autocomplete="off">
				</div>
				<div class="form-group col-md-6">
					<label for="eduEndDate">졸업일</label>
					<div class="row col-md-12">
						<input type="text" class="form-control col-md-11" id="eduEndDate" name="eduEndDate" autocomplete="off">
						<div class="col-md-1" style="padding:2px; top:-3px;">
							<select  style="height: 40px;" id="eduIsOver" name="eduIsOver">
					  			<option>선택하세요</option>
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
	<span style="font-weight: bold; font-size: 24px;color: #0F4C81;">자격증</span>
	<svg width="2em" height="2em" viewBox="0 0 16 16" class="offset-md-11 bi bi-plus" fill="currentColor" xmlns="http://www.w3.org/2000/svg" id="addCertifi">
	  <path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
	</svg>
	<div class="row col-md-12" style="border: 5px solid #658DC6; border-radius: 10px;">
	
		<div class="col-md-12" id="licenseDiv">
			<div class="form-row">
			   <div class="form-group col-md-12" style="padding-left: 20px;">
				  <label for="licName">자격증 이름</label>
				  <input type="text" class="form-control" id="licName" name="licName">
				</div>
			  <div class="form-group col-md-6" style="padding-left: 20px;">
			    <label for="licLoc">발행처/기관</label>
			    <input type="text" class="form-control" id="licLoc" name="licLoc">
			  </div>
			  <div class="form-group col-md-6">
			    <label for="licGrade">점수</label>
			    <input type="text" class="form-control" id="licGrade" name="licGrade">
			    <small>※점수가 없는 경우, 합격/불합격으로 작성해주세요.</small>
			  </div>
			  <div class="form-group col-md-12" style="padding-left: 20px;">
				  <label for="licDate">취득일</label>
				  <input type="text" class="form-control licDate" id="licDate" name="licDate" autocomplete="off"> 
			  </div>
			</div>
		</div>
		
	</div>

<!-- 개인_자기소개 -->
	<div style="height: 20px;"></div>
	<span style="font-weight: bold; font-size: 24px;color: #0F4C81;">자기소개</span>
	<svg style="margin-left: 89.8%;" width="2em" height="2em" viewBox="0 0 16 16" class="offset-md-10 bi bi-plus" fill="currentColor" xmlns="http://www.w3.org/2000/svg" id="addProfile">
	  <path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
	</svg>
	<div class="row col-md-12" style="border: 5px solid #658DC6; border-radius: 10px;">
		<div class="col-md-12" id="profileDiv" style="margin-top:10px;">
		   <div class="form-group col-md-12">
			  <label for="proTitle">자기소개서 이름</label>
			  <input type="text" class="form-control" id="proTitle" name="proTitle">
			</div>
		   <div class="form-group col-md-12">
			  <label for="proContent">자기소개서 내용</label>
			  	<textarea rows="10" cols="60" class="form-control" id="proContent" name="proContent" wrap="hard"></textarea>
			</div>
		</div>
	</div>

<!-- 개인_경력사항 -->
	<div style="height: 20px;"></div>
	<span style="font-weight: bold; font-size: 24px;color: #0F4C81;">경력 사항</span>
	<svg style="margin-left: 89.8%;" width="2em" height="2em" viewBox="0 0 16 16" class="offset-md-10 bi bi-plus" fill="currentColor" xmlns="http://www.w3.org/2000/svg" id="addCareer">
	  <path fill-rule="evenodd" d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z"/>
	</svg>
	<div class="row col-md-12" style="border: 5px solid #658DC6; border-radius: 10px;">
		<div class="col-md-12" id="careerDiv" style="margin-top:10px;">
		 <div class="form-row" style="padding: 0px 15px;">
		   <div class="form-group col-md-6">
		     <label for="carCompany">회사명</label>
		     <input type="text" class="form-control" id="carCompany" name="carCompany">
		   </div>
		   <div class="form-group col-md-6">
		     <label for="carCareer">경력</label>
		     <div class="row col-md-12">
		     	<input type="number" class="form-control" id="carCareer" name="carCareer" placeholder="년차를 입력해주세요">
		   	 </div>
		   </div>
		   <div class="form-group col-md-6">
		     <label for="carType">직종</label>
		     <input type="text" class="form-control" id="carType" name="carType">
		   </div>
		   <div class="form-group col-md-6">
		     <label for="carPosition">직책</label>
		     <input type="text" class="form-control" id="carPosition" name="carPosition">
		   </div>
		 </div>
		</div>
	</div>

<!-- 희망 근무 조건 -->
	<div style="height: 20px;"></div>
	<span style="font-weight: bold; font-size: 24px;color: #0F4C81;">희망 조건</span>
	<div class="row col-md-12" style="border: 5px solid #658DC6; border-radius: 10px;">
		<div class="col-md-12" style="margin-top:10px;">
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="hopeType">희망 직종</label>
					<select class="form-control" id="hopeType" name="hopeType">
						<option>기타</option>
						<option>경영.사무</option>
						<option>영업.고객상담</option>
						<option>IT.인터넷</option>
						<option>디자인</option>
						<option>서비스</option>
						<option>전문직</option>
						<option>의료</option>
						<option>건설</option>
						<option>교육</option>
						<option>생산.제조</option>
						<option>미디어</option>
						<option>특수계층.공공</option>
					</select>
				</div>
				<div class="form-group col-md-6">
					<label for="hopeSal">희망 연봉</label>
					<div class="row col-md-12">
						<input type="number" class="form-control col-md-10" id="hopeSal" name="hopeSal" min="0" value="2500">
						<span class="col-md-2" style="left: -13px; top: 7px; font-size: 17.5px;">만원</span>
					</div>
				</div>
				<div class="form-group col-md-6">
					<label for="hopeLoc">희망 지역</label>
					<select id="hopeLoc" name="hopeLoc" class="form-control">
						<option>전국</option>
						<option>경기</option>
						<option>인천</option>
						<option>울산</option>
						<option>대구</option>
						<option>경남</option>
						<option>서울</option>
						<option>광주</option>
						<option>경북</option>
						<option>세종</option>
						<option>강원</option>
						<option>충남</option>
						<option>전남</option>
						<option>전북</option>
						<option>대전</option>
						<option>부산</option>
						<option>충북</option>
						<option>제주</option>
					</select>   
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
		<input type="submit" class="btn btn-primary" style="background:#0F4C81; border-color: #0F4C81; margin-bottom: 15px;" value="등록하기">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;	
		<button type="button" class="btn btn-primary" style="background: #658DC6; border-color: #658DC6; margin-bottom: 15px;" onclick="location.href='memberMypage.me'">뒤로 가기</button>	
	</div>
</form>	

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="resources/js/writeResume.js?ver=118"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#writeResumeForm").validate({
	     debug : false,
	     onfocusin : false,
	     onkeyup : false,
	     onfocusout : function(element) { 
	    	 $(element).valid(); 
	     },
	     rules : {
			resumeName : {
				required : true
			},
			eduSchool : {
				required : true
			},
			eduLoc : {
				required : true
			},
			eduMajor : {
				required : true
			},
			eduScore : {
				required : true
			},
			eduIsOver : {
				required : true
			},
			hopeType : {
				required : true
			},
			hopeSal : {
				required : true
			},
			hopeLoc : {
				required : true
			},
			hopeTime : {
				required : true
			}
	     },
	     //검사를 충족하지 못할 경우 표시될 메시지의 나열                                                         
	     messages : {
	     }, 
	     //실패한 요소에 대해서
	     highlight: function(element) {
	     },
	     //성공한 요소에 대해서
	     unhighlight: function(element) {
	     },
	     //유효성 검사 실패 시 메세지의 출력 방식을 설정
	     errorPlacement: function(error, element){
	    	 
    		 if($(element).is('#resumeName')){
				error.insertAfter($(element));
    		 }else if($(element).is('#eduEndDate') || $(element).is('#hopeSal')){
	    		 error.insertAfter($(element).parent().prev());
    		 }else if($(element).is('#eduMajor')){
				error.insertAfter($(element).parent().parent().parent().children().eq(0));
    		 }else{
    		 	error.insertAfter($(element).prev());
    		 }
	     },
       //유효성 검사 완료(성공) 후 실행할 코드 
	     submitHandler: function(form) {
	    	 form.submit();
	     }
	});
	
	
});
</script>
</body>
</html>