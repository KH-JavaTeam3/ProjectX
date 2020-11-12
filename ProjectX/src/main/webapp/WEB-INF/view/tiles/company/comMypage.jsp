<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@font-face { font-family: 'MyLotteBold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.0/MyLotteBold.woff') format('woff'); font-weight: normal; font-style: normal; }
.memberInfo{
	padding: 100px; 
}

#myInfoTitle{
	position: relative;
    left: 132px;
}

svg{
	position: relative;
	right: -1074px;
	color: #658DC6;
	font-weight: bold;
}

.editMyInfo{
	position: relative;
	right: -1078px;
	color: #658DC6;
	font-weight: bold;
}

 .editMyInfo:hover{ 
 	text-decoration: none; 
 	font-weight: bolder; 
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
    font-size: 0px;
}

.files input:focus{     outline: 2px dashed #7896CF;  outline-offset: -5px;
    -webkit-transition: outline-offset .15s ease-in-out, background-color .15s linear;
    transition: outline-offset .15s ease-in-out, background-color .15s linear; border:1px solid #92b0b3;
 }

.files{ 
	position:relative
}
.color input{ background-color:#f1f1f1;}

#preview{
	pointer-events: none;
    position: absolute;
    top: 25px;
    left: 9px;
    width: 162px;
    right: 0;
    height: 231px;
    content: "";
  /*    background-image: url(https://image.flaticon.com/icons/png/128/109/109612.png); */
    display: block;
    margin: 0 auto;
    background-size: 100%;
    background-repeat: no-repeat;
}
.infoTable {
	width: 900px;
	margin: 20px;
 	height: 250px;
	text-align: center;
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
}

.infoTable td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    border-top: 1px solid #ccc;
}

</style>
</head>
<body>
<div style="height: 100px;"></div>
<span style="font-weight: bold; font-size: 30px; font-family:'MyLotteBold'; color: #0F4C81;" id="myInfoTitle">My Company</span>
<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-gear" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M8.837 1.626c-.246-.835-1.428-.835-1.674 0l-.094.319A1.873 1.873 0 0 1 4.377 3.06l-.292-.16c-.764-.415-1.6.42-1.184 1.185l.159.292a1.873 1.873 0 0 1-1.115 2.692l-.319.094c-.835.246-.835 1.428 0 1.674l.319.094a1.873 1.873 0 0 1 1.115 2.693l-.16.291c-.415.764.42 1.6 1.185 1.184l.292-.159a1.873 1.873 0 0 1 2.692 1.116l.094.318c.246.835 1.428.835 1.674 0l.094-.319a1.873 1.873 0 0 1 2.693-1.115l.291.16c.764.415 1.6-.42 1.184-1.185l-.159-.291a1.873 1.873 0 0 1 1.116-2.693l.318-.094c.835-.246.835-1.428 0-1.674l-.319-.094a1.873 1.873 0 0 1-1.115-2.692l.16-.292c.415-.764-.42-1.6-1.185-1.184l-.291.159A1.873 1.873 0 0 1 8.93 1.945l-.094-.319zm-2.633-.283c.527-1.79 3.065-1.79 3.592 0l.094.319a.873.873 0 0 0 1.255.52l.292-.16c1.64-.892 3.434.901 2.54 2.541l-.159.292a.873.873 0 0 0 .52 1.255l.319.094c1.79.527 1.79 3.065 0 3.592l-.319.094a.873.873 0 0 0-.52 1.255l.16.292c.893 1.64-.902 3.434-2.541 2.54l-.292-.159a.873.873 0 0 0-1.255.52l-.094.319c-.527 1.79-3.065 1.79-3.592 0l-.094-.319a.873.873 0 0 0-1.255-.52l-.292.16c-1.64.893-3.433-.902-2.54-2.541l.159-.292a.873.873 0 0 0-.52-1.255l-.319-.094c-1.79-.527-1.79-3.065 0-3.592l.319-.094a.873.873 0 0 0 .52-1.255l-.16-.292c-.892-1.64.902-3.433 2.541-2.54l.292.159a.873.873 0 0 0 1.255-.52l.094-.319z"/>
  <path fill-rule="evenodd" d="M8 5.754a2.246 2.246 0 1 0 0 4.492 2.246 2.246 0 0 0 0-4.492zM4.754 8a3.246 3.246 0 1 1 6.492 0 3.246 3.246 0 0 1-6.492 0z"/>
</svg><a href="myComUpdateForm.co" class="editMyInfo" style="font-size: 17px;">기업정보 수정</a>
      <div class="panel-body">
      	<div align="center">
			<div class="row col-md-10" style="border: 5px solid #658DC6; border-radius: 10px;">
				<div class="col-md-7">
					<div class="form-row">
						<table class="infoTable">
							<colgroup>
								<col width="20%">
								<col width="30%">
								<col width="20%">
								<col width="*%">
							</colgroup>
							<tr>
								<td><strong>기업명</strong></td>
								<td>${sessionScope.comLogin.comName }</td>
								<td><strong>대표자</strong></td>
								<td>${sessionScope.comLogin.comCeo }</td>
							</tr>
							<tr>
								<td><strong>기업 이메일</strong></td>
								<td>${sessionScope.comLogin.comEmail }</td>
								<td><strong>직종</strong></td>
								<td>${sessionScope.comLogin.comType }</td>
							</tr>
							<tr>
								<td><strong>본사 주소</strong></td>
								<td>${sessionScope.comLogin.comLoc }</td>
								<td><strong>나머지 주소</strong></td>
								<td colspan="3">${sessionScope.comLogin.comLocDetail }</td>
							</tr>
						</table>
					</div>
				</div>
				
				<!-- 사진 시작 -->
				<div class="offset-md-2	 col-md-1">
					<div class="container">
						<div class="row">
							<div class="col-md-6 form-group">
								<div class="form-group files uploader offset-md-5">
								<div style="height: 15px;"></div>
									<input type="file" class="form-control"  id="comImage" name="comImage" disabled>
									<img id="preview" src="https://findream.s3.ap-northeast-2.amazonaws.com/images/${sessionScope.comLogin.comImage }" onerror="this.src='resources/images/profile.png'">
								</div>
							</div>
						</div>
					</div>
				</div><!-- 사진 끝 -->
			
			</div>
		</div>
      </div>
</body>
</html>