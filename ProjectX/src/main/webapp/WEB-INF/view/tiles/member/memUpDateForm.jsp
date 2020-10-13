<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.memberInfo{
   padding: 100px; 
/*    margin: 200px; */
}

.files input {
    outline: 2px dashed #7896CF;
    outline-offset: -10px;
    -webkit-transition: outline-offset .15s ease-in-out, background-color .15s linear;
    transition: outline-offset .15s ease-in-out, background-color .15s linear;
    padding: 120px 0px 85px 35%;
    text-align: center;
    margin: 0;
    width: 300px;
}
.files input:focus{     outline: 2px dashed #7896CF;  outline-offset: -10px;
    -webkit-transition: outline-offset .15s ease-in-out, background-color .15s linear;
    transition: outline-offset .15s ease-in-out, background-color .15s linear; border:1px solid #92b0b3;
 }
.files{ position:relative}
.files:after {  pointer-events: none;
    position: absolute;
    top: 60px;
    left: 0;
    width: 50px;
    right: 0;
    height: 56px;
    content: "";
    background-image: url(https://image.flaticon.com/icons/png/128/109/109612.png);
    display: block;
    margin: 0 auto;
    background-size: 100%;
    background-repeat: no-repeat;
}
.color input{ background-color:#f1f1f1;}
.files:before {
    position: absolute;
    bottom: 5px;
    left: 0;  pointer-events: none;
    width: 300px;
    right: 10;
    height: 60px;
    content: "or drag here";
    display: block;
/*     margin: 100px; */
    padding: 55px;
    color: #7896CF;
    font-weight: 600;
    text-transform: capitalize;
    text-align: center;
}
</style>
</head>
<body>
<form action="memUpdate.do" method="post">
<div class="col-md-12 memberInfo" style="border: silver;">
   <h5>내 정보수정</h5>
   <input type="hidden" name="memEmail" value="${sessionScope.memLogin.memEmail }" > 
  <div class="form-row">
    <div class="form-group col-md-4">
      <label for="memName">이름</label>
      <input type="text" class="form-control" name="memName" style="width: 300px;" value="${sessionScope.memlogin.memName }">
    </div>
    <div class="form-group col-md-4">
      <label for="inputPassword4">PASS</label>
      <input type="password" name="memPass" class="form-control" id="inputPassword4" style="width: 300px;"value="${sessionScope.memLogin.memPass }">
    </div>
    <div class="form-group col-md-4">
      <label>생일</label>
      <input type="text" class="form-control" name="memBirth" style="width: 300px;" value="${sessionScope.memLogin.memBirth }">
    </div>
    <div class="form-group col-md-4">
      <label>나이</label>
	  <input type="text" class="form-control" name="memAge" style="width: 300px;" value="${sessionScope.memLogin.memAge }">
    </div>
    <div class="form-group col-md-4">
      <label>성별</label>
		남자<input type="radio" name="memGender" <c:if test="${sessionScope.memLogin.memGender == 'm' }"> checked </c:if> value="m">
		여자<input type="radio" name="memGender" value="w" <c:if test="${sessionScope.memLogin.memGender == 'w' }"> checked </c:if>> 
    </div>
    <div class="form-group col-md-4">
      <label>연락처</label>
	  <input type="text" class="form-control" name="memTel1" value="${sessionScope.memLogin.memTel1 }"> 
    </div>
    <div class="form-group col-md-4">
      <label>비상연락처</label>
	  <input type="text" class="form-control" name="memTel2" value="${sessionScope.memLogin.memTel2 }"> 
    </div>
    <div class="form-group col-md-4">
      <label>주소</label>
	  <input type="text" class="form-control" name="memAddr" value="${sessionScope.memLogin.memAddr }"> 
    </div>
    <div class="form-group col-md-4">
      <label>결혼여부</label>
	  기혼<input type="radio" name="memMerry" value="Y" <c:if test="${sessionScope.memLogin.memMerry == 'Y' }"> checked </c:if>>
	  미혼<input type="radio" name="memMerry" value="N" <c:if test="${sessionScope.memLogin.memMerry == 'N' or 'null'}"> checked </c:if>> 
    </div>
    </div>
  </div>
   
  <button type="submit" class="btn btn-primary">수정</button>&nbsp;<button class="btn btn-danger" type="button" onClick="location.href='main.do'">취소</button>
</form>
</body>
</html>

