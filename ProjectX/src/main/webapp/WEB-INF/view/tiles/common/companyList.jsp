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
 .eachCompany:hover{ 
 	background : #ABC2E8;
 }	
.btn_like {
  position: absolute;
  margin: 0px;
  left: 435px;
  top:70px;
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
}
.button:hover{
	background: #4876ef;
	cursor:pointer;
	color: white;
}
.comList{
	color: black;
	text-decoration: none;
}
.comList:hover{
	color: black;
	text-decoration: none;
}
</style>
</head>
<body>
<div style="height: 50px;"></div>
<div align="left">
	<div class="row" style="border-bottom : 3px solid #4876ef; width: 1495px; margin-left: 8px; ">
		<div class="col-md-12">
				<div onclick="location.href='companyList.do'" class="button col-md-2" style="background: #4876ef; color: white; display: inline-block; text-align: center; border: 3px solid #f1f3f9; border-bottom: none; height: 50px; line-height: 50px; margin-left: 9px; left: -27px;">
					채용 검색
				</div>
				<div onclick="location.href='comList.do'" class="button col-md-2" style="display: inline-block; text-align: center; border: 3px solid #f1f3f9; border-bottom: none; height: 50px; line-height: 50px; left: -27px;">
					기업 검색
				</div>
		</div>
	</div>
</div>
<!-- 	<div class="list-group">
		<div class="d-flex w-100 justify-content-between">
			<button  class="list-group-item list-group-item-action active" >
				<h6 class="mb-1">번호</h6>
				<h5 class="mb-1">(주)삼성전자</h5>
				<small>3 days ago</small>	
				<p class="mb-1">홈페이지 이동</p> <small>신입ㅣ학력무관ㅣ고용형태ㅣ지역</small>
			</button>
		</div>
	</div> -->
<div style="height: 30px;"></div>
<div class="row col-md-12">
<input type="hidden" name="memEmail" value="${sessionScope.memLogin.memEmail }" id="companyListmemEmail">
<c:forEach items="${companyList }" var="company">
<div class="col-md-4" style="padding: 5px;">
<div class="list-group-item list-group-item-action eachCompany" style="border: 1px solid lighgray ;">
  <a class="comList" href="companyDetail.do?comNum=${company.comNum}&announceNum=${company.announceNum}">
    <div class="d-flex w-100 justify-content-between">
       <h5 class="mb-12" id="comName" style="font-weight: bold;" >${company.comName}</h5>
      <small>~${company.uptoHiredate}</small>
    </div>
    <p class="mb-1">${company.announceTitle}</p>
    <small>${company.career}ㅣ${company.academicBackground}ㅣ${company.workType}ㅣ${company.area}</small></a>
	<c:if test="${company.isLike eq false}">
		<button type="button" class="btn_like" data-attr="${company.comNum}" data-name="${company.announceNum }" style="outline: none;">
		  <span class="img_emoti">좋아요</span>
		  <span class="ani_heart_m"></span>
		</button>
	</c:if>
	<c:if test="${company.isLike eq true}">
		<button type="button" class="btn_like" data-attr="${company.comNum}" data-name="${company.announceNum }" style="outline: none;">
		  <span class="img_emoti2">좋아요</span>
		  <span class="ani_heart_m"></span>
		</button>
	</c:if>
</div>
</div>
</c:forEach>
</div>
<script src="resources/js/companyList.js?ver=5"></script>
</body>
</html>