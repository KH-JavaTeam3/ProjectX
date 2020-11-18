<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

/* 스크롤바 */
#row {
	height: 121px;
    overflow-y: auto;
    overflow-x: auto;
}

#row .items:first-child {
    margin-left: 0;
}

#row .items p {
    margin-bottom: 8px;
    text-indent: 7px;
}

#row .items ul {
    border-radius: 3px;
    border-top: 3px solid #f1f3f9;
    border-bottom: 3px solid #f1f3f9;
    padding: 3px 3px 8px;
    margin-bottom: -3px;
}

#row .items li{
	display: inline-block;
}
.button{
	font-size: 18px;
    font-weight: bold;
     color: gray;
     background: white;
}
.button:hover{
	background: #4876ef;
	cursor:pointer;
	color: white;
}
.btn_like {
  position: absolute;
  margin: 0px;
  right: 15px;
  top: 13px;
  width: 34px;
  height: 34px;
  border: 1px solid #e8e8e8;
  border-radius: 44px;
  font-family: notokr-bold,sans-serif;
  font-size: 14px;
  line-height: 16px;
  background-color: #fff;
  color: #DD5D54;
  box-shadow: 0 2px 2px 0 rgba(0,0,0,0.03);
  transition: border .2s ease-out,box-shadow .1s ease-out,background-color .4s ease-out;
  cursor: pointer;
  outline: none;
}

.btn_like:hover {
  outline: none;
  border: 1px solid rgba(228,89,89,0.3);
  background-color: rgba(228,89,89,0.02);
  box-shadow: 0 2px 4px 0 rgba(228,89,89,0.2);
}


.img_emoti {
    display: inline-block;
    overflow: hidden;
    font-size: 0;
    line-height: 0;
    background: url(https://mk.kakaocdn.net/dn/emoticon/static/images/webstore/img_emoti.png?v=20180410) no-repeat;
    text-indent: -9999px;
    vertical-align: top;
    width: 20px;
    height: 17px;
    margin-top: 1px;
    background-position: 0px -120px;
    text-indent: 0;
    outline: none;
}
.img_emoti2 {
    display: inline-block;
    overflow: hidden;
    font-size: 0;
    line-height: 0;
    background: url(https://mk.kakaocdn.net/dn/emoticon/static/images/webstore/img_emoti.png?v=20180410) no-repeat;
    text-indent: -9999px;
    vertical-align: top;
    width: 20px;
    height: 17px;
    margin-top: 1px;
    background-position: -30px -120px;
    text-indent: 0;
    outline: none;
}



.btn_like .ani_heart_m {
    margin: -63px 0 0 -63px;
}

.ani_heart_m {
    display: inline-block;
    position: absolute;
    top: 50%;
    left: 50%;
    width: 125px;
    height: 125px;
    margin: -63px 0 0 -63px;
    pointer-events: none;
}

.ani_heart_m.hi {
    background-image: url(https://mk.kakaocdn.net/dn/emoticon/static/images/webstore/retina/zzim_on_m.png);
    -webkit-background-size: 9000px 125px;
    background-size: 9000px 125px;
    animation: on_m 1.06s steps(72);
}

.ani_heart_m.bye {
    background-image: url(https://mk.kakaocdn.net/dn/emoticon/static/images/webstore/retina/zzim_off_m.png);
    -webkit-background-size: 8250px 125px;
    background-size: 8250px 125px;
    animation: off_m 1.06s steps(66);
}
@keyframes on_m {
  from { background-position: 0 }
  to { background-position: -9000px }
}

@keyframes off_m {
  from { background-position: 0 }
  to { background-position: -8250px }
}
.hovering:hover{
	cursor: pointer;
	background-color: #f8f9fa;
}
</style>
</head>
<body>
<div style="height: 50px;"></div>
<div align="left">
	<div class="row" style="border-bottom : 3px solid #4876ef; width: 1495px; margin-left: 8px; ">
		<div class="col-md-12">
				<div onclick="location.href='companyList.do'" class="button col-md-2" style="display: inline-block; text-align: center; border: 3px solid #f1f3f9; border-bottom: none; height: 50px; line-height: 50px; margin-left: 9px; left: -27px;">
					채용 검색
				</div>
				<div onclick="location.href='comList.do'" class="button col-md-2" style="display: inline-block; text-align: center; border: 3px solid #f1f3f9; border-bottom: none; height: 50px; line-height: 50px; right: -15px; color: white; background: #4876ef; left: -27px;">
					기업 검색
				</div>
		</div>
	</div>
</div>
<div style="height: 50px;"></div>
<div align="center">
	<div class="row" style="border :3px solid #f1f3f9; width: 100%;" >
		<div class="col-md-12" align="left">
			<span style="font-size: 20px; color: #222; font-weight: bold;">기업 정보</span>
		</div>
	</div>
	<c:forEach items="${comNameList }" var="comName">
	<div class="row" style="border-bottom : 3px solid #f1f3f9;border-top : 3px solid #f1f3f9; width: 100%; " id="${comName.comName }">
		<div class="col-md-12" style="padding-top: 20px; padding-left: 0px; padding-right: 0px;" align="left">
		<input type="hidden" value="${sessionScope.memLogin.memEmail }" id="companyListmemEmail">
					<h2 style="font-size: 20px; font-weight: bold;">${comName.comName }</h2>
					<c:if test="${comName.isLike eq false }">
					<!-- 하트 버튼 -->
					<button type="button" class="btn_like" data-attr="${comName.comNum}" style="outline: none;">
					  <span class="img_emoti">좋아요</span>
					  <span class="ani_heart_m"></span>
					</button>
					<!-- 하트버튼 끝 -->
					</c:if>
					<c:if test="${comName.isLike eq true }">
					<!-- 하트 버튼 -->
					<button type="button" class="btn_like" data-attr="${comName.comNum}" style="outline: none;">
					  <span class="img_emoti2">좋아요</span>
					  <span class="ani_heart_m"></span>
					</button>
					</c:if>
					<!-- 하트버튼 끝 -->
				<div class="row" style="border : 1px solid #eee; width: 100%; margin-top: 10px;margin-left:0px; margin-right:0px; background: #fcfcfc;" >
					<div class="col-md-6" style="padding-bottom: 5px; padding-top: 20px;"align="left">
						<table>
							<tr>
								<td style="width: 100px; color: gray;">대표자명</td>
								<td style="color: #4c78ea; font-size: 14px;">${comName.comCeo }</td>
							</tr>
							<tr>
								<td style="color: gray;">본사 주소</td>
								<td style="color: #4c78ea; font-size: 14px;">${comName.comLoc }</td>
							</tr>
							<tr>
								<td style="color: gray;">산업군</td>
								<td style="color: #4c78ea; font-size: 14px;">${comName.comType }</td>
							</tr>
						</table>
					</div>
					<div class="col-md-6" style="margin-left: -40px; padding-bottom: 20px; padding-top: 20px;"align="left">
						<table>
							<tr>
								<td style="width: 100px; color: gray;">연락처</td>
								<td style="font-size: 14px;">${comName.comTel }</td>
							</tr>
							<tr>
								<td style="color: gray;">이메일</td>
								<td style="font-size: 14px;">${comName.comEmail }</td>
							</tr>
							<tr>
								<td style="color: gray;"></td>
								<td style="font-size: 14px;"></td>
							</tr>
						</table>
					</div>
				</div>
			<div id="row">
			    <div class="items" align="center" >
				<c:forEach items="${comNameRList }" var="comNameR">
					<c:if test="${comNameR.comNum eq comName.comNum}">
				        <ul onclick="location.href='companyDetail.do?comNum=${comNameR.comNum }&announceNum=${comNameR.announceNum }'" class="text-center hovering">
				            <li style="width: 10%;"><span style="color: #4876ef;font-size: 13px;">채용중</span></li>
				            <li style="width: 30%;">${comNameR.announceTitle }</li>
				            <li style="width: 20%;">${comNameR.area }.${comNameR.career }.${comNameR.jobtype }</li>
				            <li style="width: 20%;">${comNameR.uptoHiredate }</li>
				            <li style="width: 15%;"></li>
				        </ul>
					</c:if>
				</c:forEach>
			    </div>
			</div>
			
		</div>
	</div>
	</c:forEach>
</div>
</body>
<script src="resources/js/company.js?ver=4"></script>
</html>