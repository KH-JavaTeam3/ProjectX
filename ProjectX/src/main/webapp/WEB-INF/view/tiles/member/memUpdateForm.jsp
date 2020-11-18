<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@font-face { 
	font-family: 'MyLotteBold'; 
	src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.0/MyLotteBold.woff') format('woff'); 
	font-weight: normal; font-style: normal; 
}

.memberInfo{
   padding: 100px; 
/*    margin: 200px; */
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
    height: 100%;
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

select {
   border-color: lightgray;
   border-radius: 5px;
}

input[type="button"]{
	background-color: #4876ef;
	border: 0px;
	color: white;
}

input[type="submit"]{
	background-color: #4876ef;
	border: 0px;
	color: white;
}

input[type="submit"]:hover{
	background-color: #0F4C81;
	border: 0px;
	color: white;
}

button[type="button"] {
	background-color: #658DC6;
	border: 0px;
	color: white;
}

button[type="button"]:hover {
	background-color: #658DC6;
	border: 0px;
	color: white;
}

</style>
</head>
<body>
<form action="updateMemInfo.me" method="post" enctype="multipart/form-data">
<div style="height: 100px;"></div>
<span style="font-weight: bold; font-size: 30px; font-family:'MyLotteBold'; color: #0F4C81;">개인정보 수정</span>
<div class="row col-md-12" style="border: 5px solid #4876ef; border-radius: 10px;">
      <div class="col-md-9">
         <div class="form-row">
            <div class="form-group col-md-6" style="padding: 30px 30px 0px 0px;">
               <label for="memEmail">이메일</label>
               <input type="email" class="form-control" id="memEmail" name="memEmail" value="${sessionScope.memLogin.memEmail }" readonly>
            </div>
            <div class="form-group col-md-6" style="padding: 30px 30px 0px 0px;">
               <label for="memPass">비밀번호</label>
               <input type="password" class="form-control" id="memPass" name="memPass" value="${sessionScope.memLogin.memPass }">
            </div>
            <div class="form-group col-md-6" style="padding: 30px 30px 0px 0px;">
               <label for="upMemName">이름</label>
               <input type="text" class="form-control" id="upMemName" name="memName" value="${sessionScope.memLogin.memName }" autocomplete="off">
            </div>
            <div class="form-group col-md-6" style="padding: 30px 30px 0px 0px;">
               <label class="col-md-3 control-label" style="padding-left: 0px;">생년월일</label>
               <input type="date" class="form-control"  name="memBirth" value="${sessionScope.memLogin.memBirth }" disabled>
            </div>
            <div class="form-group col-md-6" style="padding: 30px 30px 0px 0px;">
               <label for="memGender">성별</label>
                 <div class="col-md-12" style="padding: 0px;">
                    <c:if test="${sessionScope.memLogin.memGender eq 'M' }">
                     <input type="text" name="memGender" class="form-control" id="memGender" value="남성" readonly> 
                  </c:if>
                  <c:if test="${sessionScope.memLogin.memGender eq 'W' }">
                       <input type="text" name="memGender" class="form-control" id="memGender" value="여성" readonly>
                    </c:if>
               </div>
            </div>
            <div class="form-group col-md-6" style="padding: 30px 30px 0px 0px;">
               <label for="upMemTel1">휴대전화</label>
               <input type="text" class="form-control" id="upMemTel1" name="memTel1" value="${sessionScope.memLogin.memTel1 }" autocomplete="off">
            </div>
            <div class="form-group col-md-6" style="padding: 30px 30px 0px 0px;">
               <label for="memTel2">비상 연락처</label>
               <input type="text" class="form-control" id="memTel2" name="memTel2" value="${sessionScope.memLogin.memTel2 }" autocomplete="off">
            </div>
            <div class="form-group col-md-6" style="padding: 30px 30px 0px 0px;">
               <div class="col-md-12" style="padding: 0px;">
                  <label for="memAddr">주소</label>
                  <input type="button" class="btn btn-primary offset-md-9" id="findAddr" value="주소찾기" style="margin-bottom: 5px; background-color: #4876ef;">
                  <input type="text" id="memAddr"  class="form-control" value="${sessionScope.memLogin.memAddr }" name="memAddr" autocomplete="off"/>
               </div>
            </div>
         </div>
      </div>
      <div class="col-md-3">
         <div class="container">
            <div class="row">
            <div class="form-group col-md-3" style="padding: 30px 30px 0px 0px;">
                  <div class="form-group files uploader offset-md-5">
                     <label for="memImage">사진</label>
                     <input type="file" class="form-control"  id="memImage" name="file1">
                     <img id="preview" src="resources/images/memberProfile/${sessionScope.memLogin.memImage }">
					<c:if test="${not empty sessionScope.memLogin.memImage }">
                     <img id="preview" src="https://findream.s3.ap-northeast-2.amazonaws.com/images/${sessionScope.memLogin.memImage }">
					</c:if>
                     <img id="preview">
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <div style="height: 30px;"></div>
   <div align="center">
        <input type="submit" class="btn btn-primary" value="수정">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
        <button class="btn btn-primary" type="button" onClick="history.back()">취소</button>
     </div>
<script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="resources/js/memUpdateForm.js?ver=4"></script>
</form>
</body>
</html>