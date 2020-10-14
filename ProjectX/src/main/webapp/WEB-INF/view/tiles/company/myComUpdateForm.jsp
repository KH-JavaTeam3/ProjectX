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
input[type="button"] {
   position: relative;
   left: 527px;
}
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
    <a class="nav-link" href="#" >공고 조회</a>
  </li>
  <li class="nav-item" role="presentation">
    <a class="nav-link" href="recruitDeleteList.co">공고 삭제</a>
  </li>
</ul>
</div>

<form action="myComUpdate.co" method="post">
<input type="hidden" name="comNum" value="${sessionScope.comLogin.comNum }">
<div style="height: 50px;"></div>
<span style="font-weight: bold; font-size: 24px;">정보 수정</span>
   <div style="height: 20px;"></div>
   <div class="row col-md-12" style="border: 5px solid #ABC2E8; border-radius: 10px; height: 400px;">
      <div class="col-md-12" style="margin: 0px; padding: 0px;">
         <div class="form-row">
            <div class="form-group col-md-6" style="padding: 30px 50px 0px 30px;">
               <label for="comEmail">이메일</label>
               <input type="email" class="form-control" id="comEmail" name="comEmail" value="${sessionScope.comLogin.comEmail }">
            </div>
            <div class="form-group col-md-6" style="padding: 30px 50px 0px 30px;">
               <label for="comName">법인명</label>
               <input type="text" class="form-control" id="comName" name="comName" value="${sessionScope.comLogin.comName}">
            </div>
            <div class="form-group col-md-6" style="padding: 30px 50px 0px 30px;">
               <label for="comCeo">대표자명</label>
               <input type="text" class="form-control" id="comCeo" name="comCeo" value="${sessionScope.comLogin.comCeo}">
            </div>
            <div class="form-group col-md-6" style="padding: 30px 50px 0px 30px;">
               <label for="comType">산업군</label>
               <input type="text" class="form-control" id="comType" name="comType" value="${sessionScope.comLogin.comType}">
            </div>
            <div class="form-group col-md-6"  style="padding: 30px 50px 0px 30px;">
               <label for="comLoc">본사 주소</label>
                  <input type="button" class="btn btn-primary" onClick="openDaumZipAddress();" value="주소찾기" style="background: #ABC2E8; border-color: #ABC2E8;" /><br/>
                  <input type="text" id="comLoc"  style="width: 99%;" value="${sessionScope.comLogin.comLoc }" name="comLoc"/>
            </div>
            <div class="form-group col-md-6" style="padding: 30px 50px 0px 30px;">
               <label for="comTel">연락처</label>
               <input type="text" class="form-control" id="comTel" name=comTel value="${sessionScope.comLogin.comTel}">
            </div>
         </div>
      </div>
   </div>
   <div style="height: 30px;"></div>
   <div align="center">
  <button type="submit" class="btn btn-primary">수정</button>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<button class="btn btn-danger" type="button" onClick="location.href='comMypage.co'">취소</button>
  </div>
<script type="text/JavaScript"    src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

   function openDaumZipAddress() {
      new daum.Postcode({
         oncomplete : function(data) {
            jQuery("#comLoc").val(data.address);
            jQuery("#comLoc").focus();
         }
      }).open();
   }
   function openDaumZipAddress2() {
      new daum.Postcode({
         oncomplete : function(data) {
            jQuery("#comLoc").val(data.address);
            jQuery("#comLoc").focus();
         }
      }).open();
   }
</script> 
</form>
</body>
</html>