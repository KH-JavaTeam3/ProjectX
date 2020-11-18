<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#searchStyle{
   position: relative;
   left: 409px;
   top: -16.9px;
   transform : translate(-50%,-50%);
   z-index: 25;
}
#searchStyleCircle{
   position: relative;
   left: 380px;
   top: -1px;
   transform : translate(-50%,-50%);
   z-index: 24;
}   
.sc{
	height: 39px; 
	width: 132%; 
	border-radius :14px; 
	border: none;
	text-align: center;
	background-color: rgba( 255, 255, 255, 0 );
}
.sc1{
	height: 39px; 
	width: 132%; 
	border-radius :14px; 
	border: none;
	text-align: center;
	background-color: rgba( 255, 255, 255, 0 );
}
.sc2{
	height: 39px; 
	width: 132%; 
	border-radius :14px; 
	border: none;
	text-align: center;
	background-color: rgba( 255, 255, 255, 0 );
}
.sc:focus{
	background-color: rgba( 199, 199, 199, 0.5 );
	outline:none;
}
.sc1:focus{
	background-color: rgba( 199, 199, 199, 0.5 );
	outline:none;
}
.sc2:focus{
	background-color: rgba( 199, 199, 199, 0.5 );
	outline:none;
}
.dept01nop {list-style: none; text-align: center;}
.dept02nop {list-style: none; text-align: center;}
            
.dept01 {
		cursor:pointer;z-index:23; position:fixed; display: none;
		border : 3px solid #f1f3f9;
		background: white;
		border-radius: 20px; 
		width: 40%;
	    top: 19%;
	    left: 30%;
}
.dept02 {
        cursor:pointer;z-index:23; position:fixed; display: none;
		border : 3px solid #f1f3f9;
		background: white;
		border-radius: 20px; 
		width: 40%;
	    top: 19%;
	    left: 30%;
}
            
.none:after {content: ""; display: block; clear: both; }
.dept01sc{
	padding: 20px;
    margin: 10px;
    font-size: 12px;
    display: inline-block;
}
.dept02sc{
	padding: 20px;
    margin: 10px;
    font-size: 12px;
    display: inline-block;
}
</style>
</head>
<body>
<div align="center" class="1 col">
	<div style="height: 30px;"></div>
	<div style="border:3px solid #4876ef;font-size: 12px; height: 45px; border-radius : 15px;width: 40%; padding: 0px;">
		<div style="display: inline-block;padding: 0px;" class="col-md-3">
				<input class="sc" id="keywordSearch" type="text" style="margin-left: -122px;" placeholder="검색어 입력">
		</div>
		<div style="display: inline-block;padding: 0px;" class="col-md-3">
			<ul class="topMenu">
				<li class="li">
					<input class="sc1" id="areaSearch" type="text" style="margin-left: -30px;"placeholder="지역명 입력">
						<ul class="dept01">
							<li class="dept01nop">
								<div align="center">
									<table>
										<tr>
											<td><span class="dept01sc">전국</span></td>
											<td><span class="dept01sc">경기</span></td>
											<td><span class="dept01sc">인천</span></td>
											<td><span class="dept01sc">울산</span></td>
											<td><span class="dept01sc">대구</span></td>
											<td><span class="dept01sc">경남</span></td>
										</tr>
										<tr>
											<td><span class="dept01sc">서울</span></td>
											<td><span class="dept01sc">광주</span></td>
											<td><span class="dept01sc">경북</span></td>
											<td><span class="dept01sc">세종</span></td>
											<td><span class="dept01sc">강원</span></td>
											<td><span class="dept01sc">충남</span></td>
										</tr>
										<tr>
											<td><span class="dept01sc">전남</span></td>
											<td><span class="dept01sc">전북</span></td>
											<td><span class="dept01sc">대전</span></td>
											<td><span class="dept01sc">부산</span></td>
											<td><span class="dept01sc">충북</span></td>
											<td><span class="dept01sc">제주</span></td>
										</tr>
									</table>
							</div>
						</ul>
				</li>
			</ul>
		</div>
		<div style="display: inline-block;padding: 0px;" class="col-md-3">
			<ul class="topMenu2">
				<li class="li">
					<input class="sc2" id="jobSearch" type="text" style="margin-left: 31px;"placeholder="직업(직종명) 입력">
						<ul class="dept02">
							<li class="dept02nop">
								<div align="center">
									<table>
										<tr>
											<td><span class="dept02sc">경영.사무</span></td>
											<td><span class="dept02sc">영업.고객상담</span></td>
											<td><span class="dept02sc">IT.인터넷</span></td>
											<td><span class="dept02sc">디자인</span></td>
											<td><span class="dept02sc">서비스</span></td>
											<td><span class="dept02sc">전문직</span></td>
										</tr>
										<tr>
											<td><span class="dept02sc">의료</span></td>
											<td><span class="dept02sc">건설</span></td>
											<td><span class="dept02sc">교육</span></td>
											<td><span class="dept02sc">생산.제조</span></td>
											<td><span class="dept02sc">미디어</span></td>
											<td><span class="dept02sc">특수계층.공공</span></td>
										</tr>
									</table>
							</div>
						</ul>
				</li>
			</ul>
		</div>
</div>
		<input id="searchStyle" type="button" class="fas fa-search search" style="width: 25px; height: 25px; color: white ;">
		<input class="fas fa-circle search" type="button" id="searchStyleCircle"style="width: 40px;height: 40px;color: #4876ef;">
</div>
<div style="width: 500px;"></div>
<!-- 검색엔진 소스 -->
<script type="text/javascript">/* 드롭다운 속도조절  */
$(document).ready(function(){
   $(document).on('click', '.topMenu', function() {
       $('.dept01').slideDown(20);
       $('.dept02').slideUp(1);   
   });
   $(document).on('click', '.topMenu2', function() {
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
   
   $(document).on('click', '.dept01sc', function() {
       var dept01 = $(this).text();
       $('.sc1').val(dept01);
       $('.dept01sc').hide();
       $('.dept01').css('border','none');
   });
   $(document).on('click', '.dept02sc', function() {
       var dept02 = $(this).text();
       $('.sc2').val(dept02);
       $('.dept02sc').hide();
       $('.dept02').css('border','none');
   });
});
</script>


      <!--   <div class="1" style="margin-top: -17px; padding-left: 195px;">
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
   </div> -->

</body>
<script src="resources/js/submenu2.js?ver=3"></script>
</html>