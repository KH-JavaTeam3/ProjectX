<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta charset="UTF-8">
<head>
<!-- 지도  -->
<title>Insert title here</title>
<style type="text/css">
.divtop > div {
	padding: 5px;
	display: inline-block;
}
 .textarea{
 	outline: none;
 }
 .input {
	border: none;
	outline: none;
	text-align: center;
}
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
#HourCountdown{
	display: inline;
	color: black;
	font-weight: bold;
}
</style>
</head>
<body>
	<div style="height: 30px;"></div>
	<div align="center">
		<div class="row" style="border-bottom : 3px solid #f1f3f9;border-top : 3px solid #f1f3f9; width: 80%;" >
			<div class="col-md-6" style="padding-bottom: 20px; padding-top: 20px;" align="left">
				<table>
					<tr>
						<td colspan="2"> <span style="font-size: 20px;">${recruitDeteil.comName }</span> <input type="text" value="모집 인원 ${recruitDeteil.hireNum }" style="margin-left:20px;width: 80px;height: 30px;font-size: 10px; text-align: center;background: white;border: 3px solid #f1f3f9;" disabled></td>
					</tr>
					<tr>
						<td style="font-size: 30px; font-weight: bold;">${recruitDeteil.announceTitle }</td>
					</tr>
				</table>
			</div>
			<div class="col-md-6" align="right" style="margin-top: 26px;margin-left: -40px; padding-bottom: 20px; padding-top: 20px;">
					<input type="button" style="background: #ff8d5a;    border: 1px solid;    color: white;    width: 140px;    height: 50px;    font-size: 20px;    font-weight: bolder; outline: none;" value="지원" <c:if test="${not empty sessionScope.memLogin }">id="applyBtn"</c:if> data-comNum="${recruitDeteil.comNum }" data-announceNum="${recruitDeteil.announceNum }" >
					<i class="fas fa-backspace" onclick="history.back();" style="width: 50px;height: 50px;color: #f1f3f9;position: relative;right: -104px;top: -72px;"></i>			
			</div>
		</div>
		<div class="row" style="border-bottom : 3px solid #f1f3f9;border-top : 3px solid #f1f3f9; width: 80%; margin-top: -3px;" >
			<div class="col-md-6" style="padding-bottom: 5px; padding-top: 20px;"align="left">
				<table>
					<tr>
						<td style="width: 100px; color: gray;">경력</td>
						<td style="color: #4c78ea; font-size: 14px;">${recruitDeteil.academicBackground }</td>
					</tr>
					<tr>
						<td style="color: gray;">학력</td>
						<td style="color: #4c78ea; font-size: 14px;">${recruitDeteil.career }</td>
					</tr>
					<tr>
						<td style="color: gray;">고용형태</td>
						<td style="color: #4c78ea; font-size: 14px;">${recruitDeteil.workType }</td>
					</tr>
				</table>
			</div>
			<div class="col-md-6" style="margin-left: -40px; padding-bottom: 20px; padding-top: 20px;"align="left">
				<table>
					<tr>
						<td style="width: 100px; color: gray;">연봉</td>
						<td style="font-size: 14px;">${recruitDeteil.anniSal } 만원</td>
					</tr>
					<tr>
						<td style="color: gray;">근무지역</td>
						<td style="font-size: 14px;">${recruitDeteil.area }</td>
					</tr>
					<tr>
						<td style="color: gray;">근무형태</td>
						<td style="font-size: 14px;">
							<c:if test="${recruitDeteil.worktime == '주간'}"> <span>주간</span> </c:if> 
	        				<c:if test="${recruitDeteil.worktime == '야간'}"> <span>야간</span> </c:if>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<div align="right" style="width: 80%; padding-bottom: 10px;">
 		<img src="resources/images/eye.png" style="width: 15px; height: 15px;"> 
			<span style="font-size: 11px;font-weight: normal;">${recruitDeteil.recruitViews }</span>
		</div>
		<div class="col-md-12" align="center" style="width: 80%;padding-bottom: 20px;">
<%--  			<img id="preview" src="resources/images/comProfile/${recruitDeteil.registImage}" style=" width:100%;">  --%>
			<c:if test="${not empty recruitDeteil.registImage}">
	 			<img id="preview" src="https://findream.s3.ap-northeast-2.amazonaws.com/images/${recruitDeteil.registImage}"> 
			</c:if>
		</div>
		<div align="left" style="width: 80%;">
			<span style="font-weight: bolder;font-size: 20px; padding-bottom: 10px;">접수기간 및 방법</span>
		</div>
		<div class="row" style="border : 3px solid #f1f3f9;border-top: 1px solid; width: 80%;" >
			<div class="col-md-4" style="padding-bottom: 20px; padding-top: 45px; width: 80%;" align="center">
				<p style="font-size: 15px; color: #4c78ea; margin: 0px;">남은 기간</p>
				<!-- 카운트 다운 -->
				<p id="HourCountdown" style="font-size: 20px; color: #4c78ea; font-weight: bolder; margin: 0px;"></p>
				<p style="margin: 5px;"><span style="border:1px solid #4876ef; color:#4876ef;border-radius : 15px; padding: 3px;margin-right: 5px; ">마감일</span><span style="color:#4876ef;">${recruitDeteil.uptoHiredate } 23:59</span> </p>
			</div>
			<div class="col-md-4" style="padding-bottom: 20px; padding-top: 20px; width: 80%; background: #f8f9fa;" align="left">
				<p style="margin: 0px;padding-left: 20px;"><span style="color: #888;" >지원방법 : </span><span style="color:#444;"> 홈페이지 지원</span></p>
				<p style="margin: 0px;padding-left: 20px;"><span style="color: #888;" >본사주소 : </span><span style="color:#444;"> ${recruitDeteil.comLoc }</span></p>
				<p style="margin: 0px;padding-left: 20px;"><span style="color: #888;" >이메일 : </span><span style="color:#444;"> ${recruitDeteil.comEmail }</span></p>
				<p style="margin: 0px;padding-left: 20px;"><span style="color: #888;" >연락처 : </span><span style="color:#444;"> ${recruitDeteil.comTel }</span></p>
			</div>
			<div class="col-md-4" style="padding-bottom: 20px; padding-top: 20px; width: 80%; background: #f8f9fa;" align="left">
				<!--지도  -->
				<div id="map" style="width:200px;height:150px;" align="left"></div>
			</div>
		</div>
		<div align="left" style="width: 80%;">
			<span style="color:gray; font-size: 10px; padding-left: 20px;"><i class="fas fa-exclamation-circle"></i>마감일은 기업의 사정, 조기마감 등으로 변경될 수 있습니다.</span>
			<br>
			<br>
		</div>
		<c:if test="${non == 0 }">
			<div class="row" style="border-bottom : 3px solid #f1f3f9;border-top : 3px solid #f1f3f9; width: 80%;" >
			<!-- 데이터 값 처리. -->
			<div class="col-md-12" align="left" style="padding-bottom: 10px; padding-top: 10px;margin-left: 10px; ">
				<span style="font-weight: bolder;font-size: 20px;">지원 통계</span>
			</div>
				<div class="col-md-4" style="padding-bottom: 20px; padding-top: 20px;">
					<!-- 막대형그래프  -->
					<div class="container" align="left"><canvas id="myChart" width="100px;" height="50px;"></canvas></div>
				</div>
				<div class="col-md-4" style="padding-bottom: 20px; padding-top: 20px;">
						<!-- 원형그래프  -->
					<div class="card-body" align="left"><canvas id="myChart1" width="100px;" height="50px;"></canvas></div>
				</div>
			</div>
		</c:if>
	</div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c18d5b75b8ce7472bc049b59b3a7f5f9&libraries=services"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			
			//지도api
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
	    		center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    		level: 3 // 지도의 확대 레벨
			};  
	
			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
	
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch('${recruitDeteil.comLoc}', function(result, status) {
	
	    		// 정상적으로 검색이 완료됐으면 
	     		if (status === kakao.maps.services.Status.OK) {
	
	       		var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        	// 결과값으로 받은 위치를 마커로 표시합니다
	        	var marker = new kakao.maps.Marker({
	           		map: map,
	            	position: coords
	        	});
	
	        	// 인포윈도우로 장소에 대한 설명을 표시합니다
	        	var infowindow = new kakao.maps.InfoWindow({
	            	content: '<div style="width:200px;  text-align:center;padding:6px 0;">'+'<span style="font-size:8px;">'+'${recruitDeteil.comLoc}'+'</span></div>'
	        	});
	        	infowindow.open(map, marker);
	
	        	// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        	map.setCenter(coords);
	   			} 
			});    
			
		});
	</script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	<script>
		window.onload = function(){
			
			// 	막대형 차트
			var ctx = document.getElementById('myChart');
			var myChart = new Chart(ctx,
					{
						type : 'bar',
						data : {
							labels : [ '20대', '30대', '40대', '50대', '60대이상'],
							datasets : [ {
								label : '지원자 수',
								data : [ ${age20}, ${age30}, ${age40}, ${age50}, ${age60}]
								,backgroundColor:[ 'rgba(54, 162, 235, 0.2)',
										'rgba(54, 162, 235, 0.2)',
										'rgba(54, 162, 235, 0.2)',
										'rgba(54, 162, 235, 0.2)',
										'rgba(54, 162, 235, 0.2)',
										'rgba(54, 162, 235, 0.2)' ],
								borderColor : [ 'rgba(54, 162, 235, 1)',
										'rgba(54, 162, 235, 1)',
										'rgba(54, 162, 235, 1)',
										'rgba(54, 162, 235, 1)',
										'rgba(54, 162, 235, 1)',
										'rgba(54, 162, 235, 1)'],
								borderWidth : 1
							}]
						},
						options : {
							scales : {
								yAxes : [ {
									ticks : {
										beginAtZero : true
									}
								} ]
							}
						}
					});
		
			//원형차트
			data = { datasets: [{ backgroundColor: ['rgba(255, 99, 132, 0.6)','rgba(54, 162, 235, 0.6)'],
					 data: [${genderW},${genderM}] }],labels: ['여자','남자'] }; 
			var ctx1 = document.getElementById("myChart1"); var myPieChart = new Chart(ctx1, { type: 'pie', data: data, options: {} }); 
		
			//카운트다운
			CountDownTimer( '${hireDate} 00:00 AM', 'HourCountdown');

			function CountDownTimer(dt, id) {
    			var end = new Date(dt);
    			var _second = 1000;
    			var _minute = _second * 60;
   				var _hour = _minute * 60;
    			var _day = _hour * 24;
    			var timer;

    		function showRemaining() {
        		var now = new Date();
        		var distance = end - now;

	        	// 시간 종료 시 뜨는 문구
	        	if (distance < 0) {
	            	clearInterval(timer);
	            	document.getElementById(id).innerHTML = '마감되었습니다.';
	            	return;
	       	 	}
	        	var days = Math.floor(distance / _day);
		        var hours = Math.floor((distance % _day) / _hour);
		        var minutes = Math.floor((distance % _hour) / _minute);
		        var seconds = Math.floor((distance % _minute) / _second);
	
		        document.getElementById(id).innerHTML = days + '일 ';
		        document.getElementById(id).innerHTML += hours + '시간 ';
		        document.getElementById(id).innerHTML += minutes + '분 ';
		        document.getElementById(id).innerHTML += seconds + '초';
    		}
    		timer = setInterval(showRemaining, 1000);
			}
		}
	</script>
	<script src="resources/js/companyDetail.js?ver=11"></script>
</body>
</html>