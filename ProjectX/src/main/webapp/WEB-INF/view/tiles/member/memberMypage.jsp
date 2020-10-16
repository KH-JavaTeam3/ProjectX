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
/* .files:before { */
/*     position: absolute; */
/*     bottom: -3px; */
/*     left: -201px;  pointer-events: none; */
/*     width: 600px; */
/*     right: 10; */
/*     height: 60px; */
/*     content: "or drag here"; */
/*     display: block; */
/* /*     margin: 100px; */ */
/*     /* padding: 55px; */ */
/*     padding-bottom: 140px; */
/*     padding-right:20px; */
/*     color: #7896CF; */
/*     font-weight: 600; */
/*     text-transform: capitalize; */
/*     text-align: center; */
/* } */

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
</style>
</head>
<body>
<div style="height: 30px;"></div>
<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          <span style="font-weight: bold; font-size: 24px; font-family: 'MyLotteBold'">My Info</span>
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
      	<div align="center">
			<div class="row col-md-12" style="border: 5px solid #ABC2E8; border-radius: 10px;">
				<div class="col-md-9">
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="memName">이름</label>
							${sessionScope.memLogin.memName }
						</div>
						<div class="form-group col-md-6">
							<label for="memEmail">이메일</label>
							${sessionScope.memLogin.memEmail }
						</div>
						<div class="form-group col-md-6">
							<label class="col-md-3 control-label" style="padding-left: 0px;">생년월일</label>
							${sessionScope.memLogin.memBirth }
						</div>
						<div class="form-group col-md-6">
							<label for="memGender">성별</label>
						  	<div class="col-md-12" style="padding: 0px;">
						  		<c:if test="${sessionScope.memLogin.memGender eq 'M' }">
									${sessionScope.memLogin.memGender }
								</c:if>
								<c:if test="${sessionScope.memLogin.memGender eq 'W' }">
									${sessionScope.memLogin.memGender }
							  	</c:if>
							</div>
						</div>
						<div class="form-group col-md-6">
							<label for="memTel1">연락처</label>
							${sessionScope.memLogin.memTel1 }
						</div>
						<div class="form-group col-md-6">
							<div class="col-md-12" style="padding: 0px;">
								<label for="memAddr">주소</label>
								${sessionScope.memLogin.memAddr }
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="container">
						<div class="row">
							<div class="col-md-6 form-group">
								<div class="form-group files uploader offset-md-5">
									<div style="height: 10px;"></div>
									<img id="preview" src="resources/images/memberProfile/${sessionScope.memLogin.memImage }" style="width: 200px;">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
      </div>
    </div>
  </div>
</div>
</body>
</html>