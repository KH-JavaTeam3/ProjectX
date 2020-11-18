<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jstl 사용을 위한 taglib -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#foot-bann {clear:both; position:relative; width:1200px; margin:0 auto; padding:0; overflow:hidden;}
#foot-bann p {float:left; width:23px; margin:10px 0 0; padding:0; overflow:hidden;}
#foot-bann p.prev {padding-left:3px;}
#foot-bann p.next {text-align:right; padding-right:3px;}
#foot-bann .foot-bann {float:left; position:relative; width:1147px; height:50px; margin:10px 0 0; padding:0; overflow:hidden;}
#foot-bann .foot-bann ul {position:absolute; top:0; left:0; width:99999em; height:50px; margin:0; padding:0; overflow:hidden;}
#foot-bann .foot-bann ul li {float:left; margin:0; padding:0 4px; line-height:0; overflow:hidden;}
#foot-bann .foot-bann ul li a {display:block; margin:0; padding:0;}
</style>
<link rel="stylesheet" type="text/css" href="resources/css/main.css?ver=7" />
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
		<div class="col-md-6">
			<table class="table table-hover text-center" style="border: 3px solid #f1f3f9;" id="rankingTable">
				<thead>
					<tr>
						<td colspan="5"><h3 style="font-family: Wemakeprice-Bold;">금주의 인기 공고</h3></td>
					</tr>
					<tr>
						<th></th>
						<th>기업</th>
						<th>공고제목</th>
						<th>마감일</th>
						<th>조회수</th>
					</tr>
					</thead>
				<tbody  id="rankingBody">
				<c:forEach items="${selectViewsList }" var="views" varStatus="count">
					<c:if test="${count.index+1 < 6 }">
						<tr onclick="location.href='companyDetail.do?comNum=${views.comNum}&announceNum=${views.announceNum}'">
							<c:if test="${count.index+1 == 1}">
							<th scope="row" style=""><img src="resources/images/금메달.png" style="width: 35px;"> </th>
							</c:if>
							<c:if test="${count.index+1 == 2}">
							<th scope="row" style=""><img src="resources/images/은메달.png" style="width: 35px;"></th>
							</c:if>
							<c:if test="${count.index+1 == 3}">
							<th scope="row" style=""><img src="resources/images/동메달.png" style="width: 35px;"></th>
							</c:if>
							<c:if test="${count.index+1 == 4}">
							<th scope="row" style="padding-left: 23px;">${count.index+1 }</th>
							</c:if>
							<c:if test="${count.index+1 == 5}">
							<th scope="row"  style="padding-left: 23px;">${count.index+1 }</th>
							</c:if>
							<td>${views.comName }</td>
							<td>${views.announceTitle }</td>
							<td>${views.uptoHiredate }</td>
							<td align="center">${views.recruitViews }</td>
						</tr>
					</c:if>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	
<!-- 	<div style="margin:0px 0 -10px;"> -->
<!-- 		<div id="foot-bann"> -->
<!-- 		<p class="prev"><a href="javascript:jFootRotatePrev();"><img src="resources/images/leftArrow.gif" alt="이전"></a></p> -->
<!-- 		<div class="foot-bann"> -->
<!-- 			<ul style="left: 0px;"> -->
<!-- 				<li><a href="http://www.rndjob.or.kr/" target="_blank" title="이공계인력중개센터"><img src="http://www.ulsankh.com/data/banner/fsPxDYZtMR5C667tUUtU_1433928759.jpg" width="150" height="50" alt="이공계인력중개센터"></a></li> -->
<!-- 				<li><a href="http://www.worldjob.or.kr/" target="_blank" title="월드잡"><img src="http://www.ulsankh.com/data/banner/QzgXNzfPL9prtiTZAbMN_1433928972.jpg" width="150" height="50" alt="월드잡"></a></li> -->
<!-- 				<li><a href="http://www.hrd.go.kr/" target="_blank" title="HRD-net"><img src="http://www.ulsankh.com/data/banner/T3ZlXhhKTcfEdcUBDig0_1433928485.jpg" width="150" height="50" alt="HRD-net"></a></li> -->
<!-- 				<li><a href="http://www.moel.go.kr/" target="_blank" title="고용노동부"><img src="http://www.ulsankh.com/data/banner/sZloMJtZmHhNpZnR9e58_1433928575.jpg" width="150" height="50" alt="고용노동부"></a></li> -->
<!-- 				<li><a href="http://www.work.go.kr/" target="_blank" title="워크넷"><img src="http://www.ulsankh.com/data/banner/YupnHmXim5ZANE2xvWyd_1433928872.jpg" width="150" height="50" alt="워크넷"></a></li> -->
<!-- 				<li><a href="http://www.hrdkorea.or.kr/" target="_blank" title="한국산업인력공단"><img src="http://www.ulsankh.com/data/banner/45CZqmPDph66UyhQebE7_1433929344.jpg" width="150" height="50" alt="한국산업인력공단"></a></li> -->
<!-- 				<li><a href="http://www.q-net.or.kr/" target="_blank" title="큐넷"><img src="http://www.ulsankh.com/data/banner/DK3NODPFPiedtIPRNTVm_1433929319.jpg" width="150" height="50" alt="큐넷"></a></li> -->
<!-- 				<li><a href="http://www.keis.or.kr/" target="_blank" title="한국고용정보원"><img src="http://www.ulsankh.com/data/banner/89GDNpiQHscWKyV5ibsC_1433929580.jpg" width="150" height="50" alt="한국고용정보원"></a></li></ul> -->
<!-- 		</div> -->
<!-- 		<p class="next"><a href="javascript:jFootRotateNext();"><img src="resources/images/rightArrow.gif" alt="다음"></a></p> -->
<!-- 	</div> -->
<!-- 	<script type="text/javascript"> -->
<!-- // 	$(document).ready(function() { -->
		
<!-- // 			jShowFootRotate(); -->
<!-- // 			$('#foot-bann').bind("mouseover", function() { -->
<!-- // 				jStopFootRotate(); -->
<!-- // 			}); -->
<!-- // 			$('#foot-bann').bind("mouseout", function() { -->
<!-- // 				jShowFootRotate(); -->
<!-- // 			}); -->
<!-- // 		}); -->
	
<!-- // 		var	_jf_item_cnt	=	$(".foot-bann > ul > li").length;	//	전체 탭 개수 -->
<!-- // 		var	_jf_rotate_sec	=	3;						//	로테이트 타임 (초) -->
<!-- // 		var _jf_now_idx		=	2;											//	값 변경하지 마세요. -->
<!-- // 		var _jf_get_idx		=	null; -->
		
		
<!-- // 		function showFootRotateTab() { -->
<!-- // 			if(_jf_now_idx > _jf_item_cnt) { -->
<!-- // 				_jf_now_idx = 1; -->
<!-- // 			} -->
<!-- // 			jFootRotateNext(); -->
<!-- // 			_jf_now_idx++; -->
<!-- // 		} -->
<!-- // 		function jShowFootRotate() { -->
<!-- // 			_jf_get_idx	=	setInterval(showFootRotateTab(), (_jf_rotate_sec * 1000)); -->
<!-- // 		} -->
<!-- // 		function jStopFootRotate() { -->
<!-- // 			window.clearInterval(_jf_get_idx); -->
<!-- // 			_jf_get_idx	=	null; -->
<!-- // 		} -->
<!-- // 		var	_jf_width_gap	=	154; -->
<!-- // 		var	_jf_get_left	=	0; -->
<!-- // 		var	_jf_fir_bann	=	0; -->
<!-- // 		function jFootRotatePrev() { -->
<!-- // 			if(_jf_fir_bann == 0) { -->
<!-- // 				_jf_fir_bann++; -->
<!-- // 				$(".foot-bann > ul").prepend('<li>' + $(".foot-bann > ul > li:last").html() + '</li>'); -->
<!-- // 				$(".foot-bann > ul").css({'left':-_jf_width_gap}); -->
<!-- // 				$(".foot-bann > ul").stop().animate({ -->
<!-- // 					left:0 -->
<!-- // 				}, 500, function() { -->
<!-- // 					$(".foot-bann > ul > li:last").remove(); -->
<!-- // 					_jf_fir_bann = 0; -->
<!-- // 				}); -->
<!-- // 			} -->
<!-- // 		} -->
	
<!-- // 		function jFootRotateNext() { -->
<!-- // 			if(_jf_fir_bann == 0) { -->
<!-- // 				_jf_fir_bann++; -->
<!-- // 				$(".foot-bann > ul").append('<li>' + $(".foot-bann > ul > li:first").html() + '</li>'); -->
<!-- // 				var	le = $(".foot-bann > ul").css('left'); -->
<!-- // 				_jf_get_left	=	isNo(le) - _jf_width_gap; -->
<!-- // 				$(".foot-bann > ul").stop().animate({ -->
<!-- // 					left:_jf_get_left -->
<!-- // 				}, 500, function() { -->
<!-- // 					$(".foot-bann > ul > li:first").remove(); -->
<!-- // 					$(".foot-bann > ul").css({"left":0}); -->
<!-- // 					_jf_fir_bann = 0; -->
<!-- // 				}); -->
<!-- // 			} -->
<!-- // 			function isNo(num) { -->
<!-- // 				var retxt	=	''; -->
<!-- // 				for(i=0; i < num.length; i++) { -->
<!-- // 					if(num.charAt(i) >= 0 || num.charAt(i) <= 9 || num.charAt(i) == "-") { -->
<!-- // 						retxt += num.charAt(i); -->
<!-- // 					} -->
<!-- // 				} -->
<!-- // 				return parseInt(retxt); -->
<!-- // 			} -->
			
			
<!-- // 	} -->
	
<!-- 	</script> -->
<!-- 	</div> -->


	<script src="resources/js/main.js?ver=3"></script>
</body>
</html>