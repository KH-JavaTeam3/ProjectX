<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/JavaScript"    src="http://code.jquery.com/jquery-1.7.min.js"></script>
<script type="text/JavaScript"    src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
   function openDaumZipAddress() {
      new daum.Postcode({
         oncomplete : function(data) {
            jQuery("#postcode1").val(data.postcode1);
            jQuery("#postcode2").val(data.postcode2);
            jQuery("#zonecode").val(data.zonecode);
            jQuery("#address").val(data.address);
            jQuery("#address_etc").focus();
            console.log(data);
         }
      }).open();
   }
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.memberInfo{
	padding: 100px; 
/* 	margin: 200px; */
}

.files input {
    outline: 2px dashed #7896CF;
    outline-offset: -10px;
    -webkit-transition: outline-offset .15s ease-in-out, background-color .15s linear;
    transition: outline-offset .15s ease-in-out, background-color .15s linear;
	/* padding: 160px 100px 10px 15%; */
	padding-top:210px;
	padding-left:20px; 
    text-align: center;
    margin: 0px;
	width: 180px;
    height: 250px;
    font-size: 10px;
}
.files input:focus{     outline: 2px dashed #7896CF;  outline-offset: -5px;
    -webkit-transition: outline-offset .15s ease-in-out, background-color .15s linear;
    transition: outline-offset .15s ease-in-out, background-color .15s linear; border:1px solid #92b0b3;
 }
.files{ position:relative}
.files:after {  pointer-events: none;
    position: absolute;
    top: 50px;
    left: 50px;
    width: 50px;
    right: 0;
    height: 56px;
    content: "";
  /*    background-image: url(https://image.flaticon.com/icons/png/128/109/109612.png); */
    display: block;
    margin: 0 auto;
    background-size: 100%;
    background-repeat: no-repeat;
}
.color input{ background-color:#f1f1f1;}
.files:before {
    position: absolute;
    bottom: -3px;
    left: -201px;  pointer-events: none;
    width: 600px;
    right: 10;
    height: 60px;
    content: "or drag here";
    display: block;
/*     margin: 100px; */
    /* padding: 55px; */
    padding-bottom: 140px;
    padding-right:20px;
    color: #7896CF;
    font-weight: 600;
    text-transform: capitalize;
    text-align: center;
}

#preview{
	pointer-events: none;
    position: absolute;
    top: 41px;
    left: 9px;
    width: 162px;
    right: 0;
    height: 200px;
    content: "";
    display: block;
    margin: 0 auto;
    background-size: 100%;
    background-repeat: no-repeat;
	
}

.radio{
	display: inline;
}

#addBtn{
	cursor: pointer;
}
</style>
</head>
<body>
<form method="post" enctype="" action="regResume.me">
<div style="height: 50px;"></div>
<!-- 이력서 제목 -->
<input type="text" name="resumeTitle" style="font-size: 35px; font-weight: bold;" placeholder="제목을 입력해주세요.">
<div style="height: 20px;"></div>
<!-- 개인_기본정보 -->
<span style="font-weight: bold; font-size: 24px;">기본 정보</span><span style="font-size: 19px;">★필수</span>
<div class="row col-md-12" style="border: 5px solid #ABC2E8; border-radius: 10px;">
	<div class="row col-md-9">
	 <div class="form-row">
	   <div class="form-group col-md-6">
	     <label for="memName">이름</label>
	     <input type="text" class="form-control" id="memName" name="memName">${sessionScope.memLogin.memName }
	   </div>
	   <div class="form-group col-md-6">
	     <label for="memEmail">이메일</label>
	     <input type="email" class="form-control" id="memEmail" name="memEmail">${sessionScope.memLogin.memEmail }
	   </div>
	   <div class="form-group col-md-6">
	     <label for="memBirth">생년월일</label>
	     <input type="date" class="form-control" id="memBirth" name="memBirth">${sessionScope.memLogin.memName }
	   </div>
	   <div class="form-group col-md-6">
	     <label for="memGender">성별</label>
	     	<div class="col-md-12" style="padding: 0px;">
		     	<label class="radio-inline">
				  <input type="radio" name="memGender" id="memGenderM" value="memGenderM"> 남성&emsp;&emsp;&emsp;
				</label>
				<label class="radio-inline">
				  <input type="radio" name="memGender" id="memGenderW" value="memGenderW"> 여성
				</label>
			</div>
	   </div>
	   <div class="form-group col-md-6">
	     <label for="memTel1">연락처</label>
	     <input type="text" class="form-control" id="memTel1" name="memTel1">${sessionScope.memLogin.memTel1 }
	   </div>
	   <div class="form-group col-md-6">
	     <label for="memAddr">주소</label>
	     	<div class="col-md-12" style="padding: 0px;">
				<input id="zonecode" type="text" value="" style="width: 70%;" readonly />
	             <input type="button" onClick="openDaumZipAddress();" value="주소찾기" /><br/>
	             <input type="text" id="address" value="" style="width: 99%;" readonly />
	             <input type="text" id="address_etc" value="" style="width: 99%;" placeholder="나머지 주소를 입력해주세요"/>
	        </div>
	   </div>
	 </div>
	</div>
	
	<div class="row col-md-3">
		<div class="container">
			<div class="row">
			  <div class="col-md-6 form-group">
		           <div class="form-group files uploader offset-md-5">
		             <label for="resumeImg">사진</label>
		             <input type="file" class="form-control" name="resumeImg" id="resumeImg">
		           <img id="preview" src="#">
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
     <label for="resumeAcademy">학력구분</label>
     	<select class="form-control" id="resumeAcademy" name="resumeAcademy" style="height: 35px;">
    		<option value="">선택하세요</option>
    		<option value="1">고등학교</option>
    		<option value="2">대학교(2,3년제)</option>
    		<option value="3">대학교(4년제)</option>
    	</select>
  </div>
  <div class="form-group col-md-6">
    <label for="schoolName">학교명</label>
    <input type="text" class="form-control" id="schoolName" name="schoolName">
  </div>
  <div class="form-group col-md-6">
    <label for="schoolRegion">지역</label>
    <input type="text" class="form-control" id="schoolRegion" name="schoolRegion">
  </div>
  <div class="form-group col-md-6">
    <label for="major">전공</label>
    	<div class="row col-md-12" style="width: 500px;">
     	<div class="row col-md-6">
     		<select style="height: 35px;">
     			<option value="">전공계열 선택</option>
     			<option value="1">어문계열</option>
     			<option value="2">인문과학계열</option>
     			<option value="3">사회과학계열</option>
     			<option value="4">예/체능계열</option>
     			<option value="5">공학계열</option>
     			<option value="6">전기/전자/정보통신계열</option>
     			<option value="7">의학계열</option>
     		</select>
     	</div>
     	<div class="row col-md-6">
     		<input type="text" placeholder="전공학과">
     	</div>
	</div>
  </div>
  <div class="form-group col-md-12">
    <label for="during">재학기간</label>	<!-- 날짜 데이터가 없음 -->
    <div class="row col-md-12">
    	<div class="col-md-6" style="padding: 0px;">
    		<input type="date" class="form-control" id="during" name="during">
    	</div>
    	<div class="col-md-5">
    		<input type="date" class="form-control" id="during" name="during">
    	</div>
    	<div class="col-md-1" style="padding:2px;">
    		<select style="height: 35px;">
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
	<div class="row col-md-12" id="divdiv">
		<div class="form-row">
		   <div class="form-group col-md-12">
			  <label for="certifiName">자격증 이름</label>
			  <input type="text" class="form-control" id="certifiName" name="certifiName">
			</div>
		  <div class="form-group col-md-6">
		    <label for="publisher">발행처/기관</label>
		    <input type="text" class="form-control" id="publisher" name="publisher">
		  </div>
		  <div class="form-group col-md-6">
		    <label for="score">점수</label>
		    <input type="text" class="form-control" id="score" name="score">
		    <small>※점수가 없는 시험의 경우, 합격/불합격으로 적어주세요.</small>
		  </div>
		  <div class="form-group col-md-12">
			  <label for="getDate">취득일</label>
			  <input type="date" class="form-control" id="getDate" name="getDate"> <!-- 예전에 했던 toDate 적용 -->
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
	<div class="row col-md-12" id="divdiv">
	   <div class="form-group col-md-12">
		  <label for="profileName">자기소개서 이름</label>
		  <input type="text" class="form-control" id="profileName" name="profileName">
		</div>
	   <div class="form-group col-md-12">
		  <label for="profileContent">자기소개서 내용</label>
		  <textarea rows="15" cols="60" class="form-control" id="profileContent" name="profileContent"></textarea>
		</div>
	</div>
</div>

<!-- 희망 근무 조건 -->
<div style="height: 20px;"></div>
<span style="font-weight: bold; font-size: 24px;">희망 조건</span>
<div class="row col-md-12" style="border: 5px solid #ABC2E8; border-radius: 10px;">
	<div class="row col-md-12">
	 <div class="form-row">
	   <div class="form-group col-md-6">
	     <label for="resumeCareer">경력사항</label><span style="font-size: 15px;">(인턴포함)</span>
	     <input type="text" class="form-control" id="resumeCareer" name="resumeCareer" placeholder="회사 이름을 입력해주세요">
	   </div>
	   <div class="form-group col-md-6">
	     <label for="resumeLoc">희망 근무처</label>
	     <input type="email" class="form-control" id="resumeLoc" name="resumeLoc">
	   </div>
	   <div class="form-group col-md-6">
	     <label for="resumeJob">희망 업직종</label>
	     <input type="text" class="form-control" id="resumeJob" name="resumeJob">
	   </div>
	   <div class="form-group col-md-6">
	     <label for="resumeTime">희망 근무시간</label>
	     <input type="text" class="form-control" id="resumeTime" name="resumeTime">
	   </div>
	   <div class="form-group col-md-12">
	     <label for="resumeDate">희망 근무기간</label>
	     <div class="row col-md-12">
    	<div class="col-md-6" style="padding: 0px;">
    		<input type="date" class="form-control" id="during" name="during">
    	</div>
    	<div class="col-md-6">
    		<input type="date" class="form-control" id="during" name="during">
    	</div>
	     </div>
	   </div>
	   <div class="form-group col-md-6">
	     <label for="resumeAnisal">희망 연봉(단위: 만원)</label>
	     <input type="number" class="form-control" id="resumeAnisal" name="resumeAnisal" min="100" value="100">
	   </div>
	   <div class="form-group col-md-6">
	     <label for="resumeWishJob">관심직종</label>
	     <input type="text" class="form-control" id="resumeWishJob" name="resumeWishJob">
	   </div>
	   
	   
	 </div>
	</div>
	
	
</div><!-- 이력서 정보 끝 -->

<div style="height: 20px;"></div>	
<div align="center">	
	<button type="submit" class="btn btn-primary" style="background: #4876ef;">등록하기</button>&emsp;&emsp;&emsp;	
	<button type="submit" class="btn btn-primary" style="background: #4876ef;" onclick="location.href='memberMypage.me'">뒤로 가기</button>	
</div>
</form>	

<script src="resources/js/writeResume.js?ver=15"></script>
</body>
</html>