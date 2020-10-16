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
	width: 1100px;
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
}
</style>
</head>
<body>
<div style="height: 30px;"></div>
<!-- MyInfo 시작점: 아코디언메뉴 시작 -->
<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          <span style="font-weight: bold; font-size: 30px; font-family:'MyLotteBold';">My Info</span>
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
      	<div align="center">
			<div class="row col-md-12" style="border: 5px solid #ABC2E8; border-radius: 10px;">
				<div class="col-md-9">
					<div class="form-row">
						<table class="infoTable">
							<colgroup>
								<col width="20%">
								<col width="30%">
								<col width="20%">
								<col width="*%">
							</colgroup>
							<tr>
								<td><strong>이름</strong></td>
								<td>${sessionScope.memLogin.memName }</td>
								<td><strong>이메일</strong></td>
								<td>${sessionScope.memLogin.memEmail }</td>
							</tr>
							<tr>
								<td><strong>생일</strong></td>
								<td>${sessionScope.memLogin.memBirth }</td>
								<td><strong>성별</strong></td>
								<td>
									<c:if test="${sessionScope.memLogin.memGender eq 'M' }">
										남성
									</c:if>
									<c:if test="${sessionScope.memLogin.memGender eq 'W' }">
										여성
								  	</c:if>
								</td>
							</tr>
							<tr>
								<td><strong>연락처</strong></td>
								<td>${sessionScope.memLogin.memTel1 }</td>
								<td><strong>비상 연락처</strong></td>
								<td>${sessionScope.memLogin.memTel2 }</td>
							</tr>
							<tr>
								<td><strong>주소</strong></td>
								<td colspan="3">${sessionScope.memLogin.memAddr }</td>
							</tr>
						</table>
					</div>
				</div>
				
				<!-- 사진 시작 -->
				<div class="col-md-3">
					<div class="container">
						<div class="row">
							<div class="col-md-6 form-group">
								<div class="form-group files uploader offset-md-5">
								<div style="height: 15px;"></div>
									<input type="file" class="form-control"  id="memImage" name="memImage" disabled>
									<img id="preview" src="resources/images/memberProfile/${sessionScope.memLogin.memImage }">
								</div>
							</div>
						</div>
					</div>
				</div><!-- 사진 끝 -->
			
			</div>
		</div>
      </div>
    </div>
  </div>
</div><!-- 아코디언 끝 -->

<!-- 아코디언 아래 메뉴 시작 -->
<div style="height: 20px;"></div>
<div>
	<table class="table">
		<tr>
			<td>테이블1</td>
			<td>테이블2</td>
		</tr>
		<tr>
			<td>테이블3</td>
			<td>테이블4</td>
		</tr>
	</table>
</div>

</body>
</html>