<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 검색엔진 소스 -->
<script type="text/javascript">/* 드롭다운 속도조절  */
$(document).on('click', '.topMenu span', function() {
    $('.dept01').slideDown(20);
    $('.dept02').slideUp(1);   
});
$(document).on('click', '.topMenu2 span', function() {
    $('.dept02').slideDown(20);
    $('.dept01').slideUp(1);
});
//검색창 바탕클릭시 검색창 히든
$('body').click(function(e){
    if( !$('.dept01').has(e.target).length ) $('.dept01').hide();
}); 
$('body').click(function(e){
    if( !$('.dept02').has(e.target).length ) $('.dept02').hide();
}); 
//검색창 검색어 클릭 이벤트
$(document).on('click', '.dept01nop', function() {
    var dept01 = $(this).text();
    $('.sc2').val(dept01);
    $('.dept01').hide();
});
$(document).on('click', '.dept02nop', function() {
    var dept02 = $(this).text();
    $('.sc3').val(dept02);
    $('.dept02').hide();
});

</script>

<!-- 아이콘을 띄우기 위한 소스 -->
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<style type="text/css">
input[id="menuicon"]{display: none;}

/* 헤더 */
header {width:100%;background: white;  padding-left: 0px;}
header > div {position: relative;widows: 1200px;margin:0 auto;}
header > div ul.navi {font-size: 0; padding: 15px;}
header > div ul.navi >li {font-size: 12px;display: inline-block;vertical-align: middle;}
header > div ul.navi >li > a{display:blocck;width:auto;padding:5px;}
header > div ul.navi >li.logo > a{padding:20px 50px; font-size: 20px;font-weight: 900;}
/* 각영역별 라벨(중앙정렬) */
.area_desc {position: absolute;top: 50%;left: 50%; transform:translate(-50%,-50%)}
/* 메뉴버튼 */
.menubtn { display:block;width:30px;height: 34px;position: absolute;top: 50%;/* 메뉴버튼 위치 right: 10px; */transform:translateY(-50%);cursor: pointer;}
.menubtn span {display:block;position: absolute;width: 80%;height: 5px;border-radius: 30px;background: #222;transition:all.35s;}
.menubtn span:nth-child(1){top:20%;left: 50%;transform:translateX(-50%);}
.menubtn span:nth-child(2){top:50%;left: 50%;transform:translate(-50%,-50%);}
.menubtn span:nth-child(3){bottom: 20%;left:50%;transform:translateX(-50%)}
/* 컨텐츠영역 */
.container {width: 100%; position: relative;} 
.container .contents { width: 1200px;margin: 0 auto;min-height: 700px;border: 1px solid #eee;background: #f1f1f1;} 
.container .sidebar{position: fixed;top:-500px;left:11%; right: 11%;width: 80%;height: 500px;background: white;border: 1px solid #eee; z-index: 30; transition:.35s;} 

input[id="menuicon"]:checked ~ div header .menubtn {z-index: 31;}
input[id="menuicon"]:checked ~ div header .menubtn span:nth-child(1) {top:0%;left: 4900%;transform:translate(-50%,-50%) rotate(135deg);} /* rotate(135deg 회전각)*/
input[id="menuicon"]:checked ~ div header .menubtn span:nth-child(2) {left:50%,transform:translate(-50%,-50%) scale(2); opacity: 0;}
input[id="menuicon"]:checked ~ div header .menubtn span:nth-child(3) {bottom: 100%;left:4900%;transform:translate(-50%,50%) rotate(-135deg);}
input[id="menuicon"]:checked ~ .container .sidebar {top: 0;}

.navi li a {
	font-size: medium;
	font-weight: bold;
}
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}
.liMenu {
	font-size: 8px;
	font-weight: 
}
tr td {
	padding: 10px;
}
#loginMeue ul {
	display: inline-block;
	padding: 2px;
}
#loginMeue li{
	position: relative;
}

#loginMeue ul ul{
	display: none;
	position: absolute;
	top:100%;
	width:300px;
	left: -60px;
}
#loginMeue li:hover > ul{
	display: block;
	border: 1px solid lightgray;
	font-size:12px;
	background:white;
	z-index: 30;
}
#loginMeue:hover li > ul{
	display: block;
	border: 1px solid lightgray;
	font-size:12px;
	background:white;
	z-index: 30;
}
.dept01nop {list-style: none; text-align: center;}
.dept02nop {list-style: none; text-align: center;}
.body {font-family: 'Nanum Gothic', sans-serif; width: 1200px; margin: 0 auto; }
            
.logo {margin: 50px 0; font-size: 30px; text-align: center; font-family: 'Nanum Brush Script', cursive; }
            
.1 {width: 100%; margin-bottom: 20px; text-align: center; height: 40px; }
.1:after {content: ""; display: block; clear: both; }
.top>li {float: left; width: 30%; line-height: 80px; }
.top span {font-size: 20px; font-weight: bold; }
            
.dept01 {
			cursor:pointer;z-index:31; position:fixed; display: none; padding: 20px 0; 
			border-bottom: 1px solid lightgray;border-lift: 1px solid lightgray; 
			border-right: 1px solid lightgray; background: white; width: 250px;top: 64px;
		}
.dept02 {
			cursor:pointer;z-index:31; position:fixed; display: none; padding: 20px 0; 
			border-bottom: 1px solid lightgray;border-lift: 1px solid lightgray; border-right: 1px solid lightgray;
			 background: white; width: 250px;top: 64px;
		}
            
.none:after {content: ""; display: block; clear: both; }
   
/* 검색단추 */
#button{
   width: 500px;
}
#searchStyle{
   position: absolute;
   top : 53%;
   left: 71%;
   transform : translate(-50%,-50%);
   z-index: 25;
}
#searchStyleCircle{
   position: absolute;
   top : 53%;
   left: 71%;
   transform : translate(-50%,-50%);
   z-index: 24;
}   
.sc1:focus{
	outline:none;
}
.sc2:focus{
	outline:none;
}
.sc3:focus{
	outline:none;
}
#logout:hover {
	cursor: pointer;
}
.hamburgerLocationTr li{
	cursor: pointer;
	padding: 5px;
}

</style>
</head>

<!-- <c:if test="${not empty sessionScope.memLogin }"><li>${sessionScope.memLogin.memName }님 로그인 되었습니다.<li></c:if> -->


<body>
<input type="checkbox"id="menuicon">
<div align="center">
<header style="width: 80%"> <!-- 상단 메뉴바 크기 -->
	<div style="background-color: white;" align="left">
		<ul class="navi" style="margin-bottom: 0px;">
			<li><a href="main.do"><img alt="..." src="resources/images/logo.jpg" style="width: 150px; left: -180px;top: 10px; position: absolute;" ></a></li>
			<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="boardList.bo">게시판</a></li>
			<li>
				<div id="body" style="display: inline-block;display: flex; height: 50px;">
   		<div class="logo" style="background-color: black;">
            <span class="logo"></span>
        </div>
        <div class="1" style="margin-top: -17px; padding-left: 195px;;">
            <ul class="top">
             <li class="li" style="margin-left: -7px;"><span><input class="sc1" type="text" id="keywordSearch" placeholder="검색어 입력" autocomplete="off" style="width: 300px;font-size: 12px; height: 45px; "  ></span>
                    <ul class="dept01">
                        <li class="dept01nop">전국</li>
                        <li class="dept01nop">경기</li>
                        <li class="dept01nop">인천</li>
                        <li class="dept01nop">울산</li>
                        <li class="dept01nop">대구</li>
                        <li class="dept01nop">경남</li>
                    </ul>
                    <ul class="dept02">
                        <li class="dept02nop">경영.사무</li>
                        <li class="dept02nop">영업.고객상담</li>
                        <li class="dept02nop">IT.인터넷</li>
                        <li class="dept02nop">디자인</li>
                        <li class="dept02nop">서비스</li>
                    </ul>
                </li>
                 <li class="topMenu" style="margin-left: -7px;"><span><input class="sc2" type="text" id="areaSearch" placeholder="지역명 입력" autocomplete="off" style="width: 300px;font-size: 12px; height: 45px;  left:225px;" ></span>
                    <ul class="dept01" id="b">
                        <li class="dept01nop">서울</li>
                        <li class="dept01nop">광주</li>
                        <li class="dept01nop">경북</li>
                        <li class="dept01nop">세종</li>
                        <li class="dept01nop">강원</li>
                        <li class="dept01nop">충남</li>
                    </ul>
                    <ul class="dept02">
                        <li class="dept02nop">전문직</li>
                        <li class="dept02nop">의료</li>
                        <li class="dept02nop">건설</li>
                        <li class="dept02nop">교육</li>
                        <li class="dept02nop">생산.제조</li>
                    </ul>
                </li>
               <li class="topMenu2" style="margin-left: -7px;"><span><input class="sc3" type="text"  id="jobSearch" placeholder="직업(직종명) 입력" autocomplete="off" style="width: 250px; font-size: 12px; height: 45px;"></span>
           
                    <ul class="dept01">
                        <li class="dept01nop">전남</li>
                        <li class="dept01nop">전북</li>
                        <li class="dept01nop">제주</li>
                        <li class="dept01nop">대전</li>
                        <li class="dept01nop">부산</li>
                        <li class="dept01nop">충북</li>
                    </ul>
                    <ul class="dept02">
                        <li class="dept02nop">미디어</li>
                        <li class="dept02nop">특수계층.공공</li>
                        <li class="dept02nop">&nbsp;</li>
                        <li class="dept02nop">&nbsp;</li>
                        <li class="dept02nop">&nbsp;</li>
                    </ul>
                </li>               
            </ul>
        </div>
	</div>
			</li>
			<li class="liMenu" id="loginMeue" style="right: 118px; top: 32px;position: absolute;" >
				<c:if test="${empty sessionScope.comLogin }" ><a href="#" style="padding-right: 0px;">로그인</a></c:if>
				<c:if test="${not empty sessionScope.comLogin }"><span style="font-weight: bold; font-size: 14px;">${sessionScope.comLogin.comCeo }님</span></c:if>
				<ul>
					<li><i class="fas fa-angle-down"></i>
					<ul>
						<li>
							<table id="loginMeueTable">
								<tr>
									<c:if test="${empty sessionScope.comLogin }" ><td style="background: #ABC2E8;width:150px;"><a href="companyLoginForm.do"><span style="font-weight: bold; font-size: 14px;">기업</span><span style="font-size: 13px; font-weight: normal;">로그인</span></a></td></c:if>
									<c:if test="${not empty sessionScope.comLogin }" ><td style="background: #ABC2E8;width:150px;"><span style="font-weight: bold; font-size: 14px;">환영 합니다.</span></td></c:if>
								</tr>
								<tr>
									<td><a href="registHumanSeekerForm.co"><span style="font-size: 12px; font-weight: normal;">공고 등록</span></a></td>
								</tr>
								<tr>
									<td><a href="#"><span style="font-size: 12px; font-weight: normal;">공고 이력서 조회</span></a></td>
								</tr>
<!-- 								<tr>
									<td><a href="recruitlist.co"><span style="font-size: 12px; font-weight: normal;">공고 수정</span></a></td>
								</tr> -->
								<tr>
									<td><a href="recruitDeleteList.co"><span style="font-size: 12px; font-weight: normal;">공고 삭제 및 수정</span></a></td>
								</tr>
								<tr>
									<td><a href="comMypage.co"><span style="font-size: 12px; font-weight: normal;">마이 페이지</span></a></td>
								</tr>
								<tr>
									<c:if test="${empty sessionScope.comLogin}"><td colspan="2" align="center" style="background: #ABC2E8; width: 300px; "><a href="memberJoin.do"><span style="font-size: 12px; font-weight: normal;">회원가입</span></a></td></c:if>
									<c:if test="${not empty sessionScope.comLogin}"><td colspan="2" align="center" style="background: #ABC2E8; width: 300px; "><span style="font-size: 12px; font-weight: normal;" id="logout">로그아웃</span></td></c:if>
								</tr>
							</table>
						</li>
					</ul>
					</li>
				</ul>
			</li>
		</ul>
		
		<label for="menuicon" class ="menubtn"> 
			<span></span>
			<span></span>
			<span></span>
		</label>
		         
     <a><input id="searchStyle" type="button" class="fas fa-search search" style="width: 25px; height: 25px; color: white;">
      <input class="fas fa-circle search" type="button" id="searchStyleCircle"style="width: 40px;height: 40px;color: black;"></a>
</div>
</header>
</div>


<div class="container">
	<div class="sidebar row" style="padding: 35px; margin-top: 0px; margin-left: auto; height: 300px;">
		<div class="col-md-4" style="display: inline-block;margin-right: -2px; margin-left: -2px">
			<table>
				<tr>
					<td colspan="3">
						<span style="font-size: 20px; font-weight: bold;">지역별</span> <i class="fas fa-angle-right" style="color: lightgray;"></i>
					</td>
				</tr>
				<tr class="hamburgerLocationTr">
					<td>
						<ul>
							<li class="place">전국</li>
							<li class="place">서울</li>
							<li class="place">세종</li>
							<li class="place">전남</li>
							<li class="place">제주</li>
						</ul>
					</td>
					<td>
						<ul>
							<li class="place">경기</li>
							<li class="place">대전</li>
							<li class="place">강원</li>
							<li class="place">전북</li>
							<li class="place">대구</li>
						</ul>
					</td>
					<td>
						<ul>
							<li class="place">인천</li>
							<li class="place">광주</li>
							<li class="place">경남</li>
							<li class="place">충남</li>
							<li class="place">부산</li>
						</ul>
					</td>
					<td>
						<ul>
							<li class="place">울산</li>
							<li class="place">경북</li>
							<li class="place">충북</li>
						</ul>
					</td>
				</tr>
			</table>
		</div>
	<div class="col-md-4" style="display: inline-block;">
		<table>
			<tr>
				<td>
					<span style="font-size: 20px; font-weight: bold;">직업별(직종)</span> <i class="fas fa-angle-right" style="color: lightgray;"></i>
				</td>
			</tr>
			<tr class="hamburgerLocationTr">
				<td colspan="2">
					<ul>
						<li class="jobtype">경영.사무</li>
						<li class="jobtype">IT.인터넷</li>
						<li class="jobtype">서비스</li>
						<li class="jobtype">의료</li>
						<li class="jobtype">건설</li>
						<li class="jobtype">미디어</li>
					</ul>
				</td>
				<td>
					<ul>
						<li class="jobtype">영업.고객상담</li>
						<li class="jobtype">디자인</li>
						<li class="jobtype">전문직</li>
						<li class="jobtype">생산.제조</li>
						<li class="jobtype">교육</li>
						<li class="jobtype">특수계층.공공</li>
					</ul>
				</td>
			</tr>
		</table>
	</div>
	<div class="col-md-4" style="display: inline-block;">
		<table>
			<tr class="hamburgerLocationTr">
				<td colspan="5">
					<span style="font-size: 20px; font-weight: bold;">게시판</span> <i class="fas fa-angle-right" style="color: lightgray;"></i>
				</td>
			</tr>
			<tr>
				<td>
					<ul>
						<li><a href="#">고객센터 문의</a></li>
						<li><a href="#">추천 기업</a></li>
						<li><a href="#">합격자 게시판</a></li>
						<li><a href="#">TOP10 기업</a></li>
						<li><a href="#">합격 이력서 조회</a></li>
					</ul>
				</td>
			</tr>
		</table>
	</div>
</div>
</div>
</body>
<script src="resources/js/menu.js?ver=5"></script>
</html>