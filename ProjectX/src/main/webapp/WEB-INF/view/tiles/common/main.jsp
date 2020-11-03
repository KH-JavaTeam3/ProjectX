<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl 사용을 위한 taglib -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="resources/css/main.css?ver=3" />
</head>
<body>
	<div class="row" style="margin-top: 30px;">
		<div class="col-md-6">
			<div id="carouselExampleCaptions" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleCaptions" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
					<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img
							src="resources/images/crsA1.png"
							style="width: 744px; height: 446.391px;">
						<div class="carousel-caption d-none d-md-block">
						</div>
					</div>
					<div class="carousel-item">
						<img
							src="resources/images/crsA2.png"
							style="width: 744px; height: 446.391px;">
						<div class="carousel-caption d-none d-md-block">
						</div>
					</div>
					<div class="carousel-item">
						<img
							src="resources/images/crsA3.png"
							style="width: 744px; height: 446.391px;">
						<div class="carousel-caption d-none d-md-block">
						</div>
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleCaptions"
					role="button" data-slide="prev"> <span
					class="carousel-control-prev-icon" aria-hidden="true"></span> <span
					class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleCaptions"
					role="button" data-slide="next"> <span
					class="carousel-control-next-icon" aria-hidden="true"></span> <span
					class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<div class="col-md-5" style="padding-top: 30px;">
			<table class="table table-hover" style="border: 3px solid #f1f3f9;">
				<thead>
					<tr>
						<td colspan="5"><h3 style="font-size: 20px; font-weight: bold;">금주의 인기 공고</h3></td>
					</tr>
					<tr style="border: none;">
						<th scope="col" style="border: none;"></th>
						<th scope="col" style="border: none;">기업</th>
						<th scope="col" style="border: none;">공고제목</th>
						<th scope="col" style="border: none;">마감일</th>
						<th scope="col" style="border: none;">조회수</th>
					</tr>
					</thead>
				<tbody>
				<c:forEach items="${selectViewsList }" var="views" varStatus="count">
					<c:if test="${count.index+1 < 6 }">
						<tr onclick="location.href='companyDetail.do?comNum=${views.comNum}&announceNum=${views.announceNum}'">
							<c:if test="${count.index+1 == 1}">
							<th scope="row" style="border: none;"><img src="resources/images/금메달.png" style="width: 35px;"> </th>
							</c:if>
							<c:if test="${count.index+1 == 2}">
							<th scope="row" style="border: none;"><img src="resources/images/은메달.png" style="width: 35px;"></th>
							</c:if>
							<c:if test="${count.index+1 == 3}">
							<th scope="row" style="border: none;"><img src="resources/images/동메달.png" style="width: 35px;"></th>
							</c:if>
							<c:if test="${count.index+1 == 4}">
							<th scope="row" style="padding-left: 23px; border: none;">${count.index+1 }</th>
							</c:if>
							<c:if test="${count.index+1 == 5}">
							<th scope="row"  style="padding-left: 23px; border: none;">${count.index+1 }</th>
							</c:if>
							<td style="border: none;">${views.comName }</td>
							<td style="border: none;">${views.announceTitle }</td>
							<td style="border: none;">${views.uptoHiredate }</td>
							<td style="border: none;" align="center">${views.recruitViews }</td>
						</tr>
					</c:if>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<!-- <div class="row">
		<div>
    <div class="container mainpage-intro clearfix noleftpadding norightpadding toppadding-lg bottommargin-lg mobile-allpadding-xxs center">
        <div class="row bottommargin-sm">
            <div class="col-md-12">
                <h2 class="bottommargin-xxs color-black t600 lh13">채용공고 그 이상</h2>
                <p>대학생 취업에 필요한 모든 과정을 함께 합니다</p>
            </div>
        </div>
	       <div class="row tleft">
	            <div class="col-md-6">
	                <img class="full-width" src="https://d32gkk464bsqbe.cloudfront.net/assets/img/general/main_2.png?v=0.0">
	            </div>
	            <div class="col-md-6 tleft full-height">
	                <div class="topmargin-md">
	                    <div class="topmargin-xxs" style="line-height: 24px;margin-bottom: 15px;">
	                        <div class="bgcolor-black color-white" style="border-radius: 50%;width:24px;height:24px;text-align: center;float:left;margin-right:10px;">1</div>
	                        현직 실무자들을 통한 커리어 교육
	                    </div>
	                    <div style="line-height: 24px;margin-bottom: 15px;">
	                        <div class="bgcolor-black color-white" style="border-radius: 50%;width:24px;height:24px;text-align: center;float:left;margin-right:10px;">2</div>
	                        포브스1000대 기업과 협업을 통한 채용의 기회 제공
	                    </div>
	                    <div style="line-height: 24px;margin-bottom: 15px;">
	                        <div class="bgcolor-black color-white" style="border-radius: 50%;width:24px;height:24px;text-align: center;float:left;margin-right:10px;">3</div>
	                        대학생에 최적화된 인턴 및 신입 채용공고 
	                    </div>
	                    <div style="line-height: 24px;margin-bottom: 15px;">
	                        <div class="bgcolor-black color-white" style="border-radius: 50%;width:24px;height:24px;text-align: center;float:left;margin-right:10px;">4</div>
	                        <font class="mobile-hidden">자신이 원하는 경력을 갖춘 </font>선배 또는 멘토를 통한 커리어 조언
	                    </div>
	                </div>
	            </div>
	        </div>
    	</div>
	</div>
</div> -->
	
	
	<script src="resources/js/main.js?ver=3"></script>
</body>
</html>