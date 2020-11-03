<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 이력서 상세보기페이지 -->
<link rel="stylesheet" href="resources/css/writeResume.css">
<style type="text/css">
table {
	width: 100%;
}
.div{
	 border-top: 2px solid gray;
	 position: relative;
	 bottom: 24px;
	 right: 16px;
	 width: 1520px;
}
</style>
</head>
<body>
<div style="height: 30px;"></div>

<div align="center">
	<!-- 이력서 제목 -->
	<div class="row" style="border :3px solid #f1f3f9; width: 100%;" >
		<div class="col-md-12" align="left">
			<span style="font-size: 27px; color: #222; font-weight: bold;">${memResume.resumeName }</span>
		</div>
	</div>
	<br>
	<div class="row" style="border-bottom : 3px solid #f1f3f9; border-top : 3px solid #f1f3f9; width: 100%;" >
		<div class="col-md-12" style="padding-top: 20px; padding-left: 0px; padding-right: 0px; background: #fcfcfc;" align="left">
			<div class="row">
				<!-- 개인정보 -->
				<div class="col-md-9">
						<span style="font-size: 23px; font-weight: bold;">개인정보</span>&nbsp;&nbsp;<input type="button" class="btn btn-primary" onClick="location.href='memUpdateForm.me';" value="수정" style="background: #ABC2E8; border-color: #ABC2E8; margin-bottom: 5px;"/>
					<div class="row" style="width: 100%; margin-top: 10px;margin-left:0px; margin-right:0px;" >
						<div class="col-md-6" style="padding-bottom: 5px; padding-top: 20px;"align="left">
							<table>
								<tr>
									<td style="width: 100px; color: gray;">이름</td>
									<td style="font-size: 14px;">${sessionScope.memLogin.memName }</td>
								</tr>
								<tr>
									<td style="color: gray;">이메일</td>
									<td style="font-size: 14px;">${sessionScope.memLogin.memEmail }</td>
								</tr>
								<tr>
									<td style="color: gray;">생년월일</td>
									<td style="font-size: 14px;">${sessionScope.memLogin.memBirth }</td>
								</tr>
							</table>
						</div>
						<div class="col-md-6" style="margin-left: -40px; padding-bottom: 20px; padding-top: 20px;"align="left">
							<table>
								<tr>
									<td style="width: 100px; color: gray;">성별</td>
									<td style="font-size: 14px;">
										<c:if test="${sessionScope.memLogin.memGender eq 'M' }">남성</c:if>
										<c:if test="${sessionScope.memLogin.memGender eq 'W' }">여성</c:if>
									</td>
								</tr>
								<tr>
									<td style="color: gray;">연락처</td>
									<td style="font-size: 14px;">${sessionScope.memLogin.memTel1 }</td>
								</tr>
								<tr>
									<td style="color: gray;">주소</td>
									<td style="font-size: 14px;">${sessionScope.memLogin.memAddr }</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<!-- 사진 -->
				<div class="col-md-3">
					<div class="col-md-6 form-group">
						<div class="form-group files uploader offset-md-5">
							<label for="memImage"></label>
							<input type="file" class="form-control"  id="memImage" name="memImage" disabled>
							<img id="preview" src="resources/images/memberProfile/${sessionScope.memLogin.memImage }" onerror="this.src='resources/images/profile.png'">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 학력사항 -->
<div style="height: 10px;"></div>
<div align="center">
	<div class="row" style="border-bottom : 3px solid #f1f3f9;border-top : 3px solid #f1f3f9; width: 100%; " >
		<div class="col-md-12" style="padding-top: 20px; padding-left: 0px; padding-right: 0px; background: #fcfcfc;" align="left">
					<span style="font-size: 23px; font-weight: bold;">학력사항</span>
				<div class="row" style="width: 100%; margin-top: 10px;margin-left:0px; margin-right:0px; " >
					<div class="col-md-6" style="padding-bottom: 5px; padding-top: 20px;"align="left">
						<table>
							<tr>
								<td style="width: 100px; color: gray;">학력구분</td>
								<td style="color: #4c78ea; font-size: 14px;">${memResume.eduGrade }</td>
							</tr>
							<tr>
								<td style="color: gray;">지역</td>
								<td style="color: #4c78ea; font-size: 14px;">${memResume.eduLoc }</td>
							</tr>
							<tr>
								<td style="color: gray;">입학일</td>
								<td style="color: #4c78ea; font-size: 14px;">${memResume.eduBeginDate }</td>
							</tr>
						</table>
					</div>
					<div class="col-md-6" style="margin-left: -237px; padding-bottom: 20px; padding-top: 20px;"align="left">
						<table>
						<colgroup>
							<col width="15%">
							<col width="17%">
							<col width="10%">
							<col width="17%">
							<col width="6%">
						</colgroup>
							<tr>
								<td style="color: gray;">학교명</td>
								<td style="color: #4c78ea; font-size: 14px;">${memResume.eduSchool }</td>
							</tr>
							<tr>
								<td style="color: gray;">전공계열</td>
								<td style="font-size: 14px; color: #4c78ea;">${memResume.eduType}</td>
								<td style="color: gray;">전공학과</td>
								<td style="font-size: 14px; color: #4c78ea;">${memResume.eduMajor }</td>
								<td style="color: gray;">학점</td>
								<td style="font-size: 14px; color: #4c78ea;">${memResume.eduScore }점</td>
							</tr>
							<tr>
								<td style="color: gray;">졸업일</td>
								<td style="color: #4c78ea; font-size: 14px;">${memResume.eduEndDate }</td>
							</tr>
						</table>
					</div>
				</div>
		</div>
	</div>
</div>

<!-- 자격증 -->
<div style="height: 10px;"></div>
<div align="center">
	<div class="row" style="border-bottom : 3px solid #f1f3f9;border-top : 3px solid #f1f3f9; width: 100%; " >
		<div class="col-md-12" style="padding-top: 20px; padding-left: 0px; padding-right: 0px; background: #fcfcfc;" align="left">
		<span style="font-size: 23px; font-weight: bold;">자격증</span>
			<c:forEach items="${memResume.licenseList }" var="lic" varStatus="status">
				<div class="row" style="width: 100%; margin-top: 10px; margin-left:0px; margin-right:0px; " >
					<div class="col-md-6" style="padding-bottom: 5px; padding-top: 20px;"align="left">
							<c:if test="${status.index ge 1 }">
								<div class="div"></div>
							</c:if>
								<table>
										<tr>
											<td style="width: 100px; color: gray;">자격증명</td>
											<td style="color: #4c78ea; font-size: 14px;">${lic.licName }</td>
										</tr>
										
										<tr>
											<td style="color: gray;">점수</td>
											<td style="color: #4c78ea; font-size: 14px;">${lic.licGrade }</td>
										</tr>
									</table>
								</div>
								<div class="col-md-6" style="margin-left: -237px; padding-bottom: 20px; padding-top: 20px;"align="left">
									<table>
									<colgroup>
										<col width="15%">
										<col width="80%">
									</colgroup>
										<tr>
											<td style="color: gray;">발행처/기관</td>
											<td style="color: #4c78ea; font-size: 14px;">${lic.licLoc }</td>
										</tr>
										<tr>
											<td style="color: gray;">취득일</td>
											<td style="color: #4c78ea; font-size: 14px;">${lic.licDate }</td>
										</tr>
								</table>
							</div>
						</div>
					</c:forEach>
				</div>
		</div>
</div>

<!-- 자기소개 -->
<div style="height: 10px;"></div>
<div align="center">
	<div class="row" style="border-bottom : 3px solid #f1f3f9;border-top : 3px solid #f1f3f9; width: 100%; " >
		<div class="col-md-12" style="padding-top: 20px; padding-left: 0px; padding-right: 0px; background: #fcfcfc;" align="left">
		<span style="font-size: 23px; font-weight: bold;">자기소개</span>
			<c:forEach items="${memResume.profilesList }" var="pro" varStatus="status">
				<div class="row" style="width: 100%; margin-top: 10px; margin-left:0px; margin-right:0px; " >
					<div class="col-md-6" style="padding-bottom: 5px; padding-top: 20px;"align="left">
						<c:if test="${status.index ge 1 }">
							<div class="div"></div>
						</c:if>
								<table>
									<colgroup>
										<col width="20%">
										<col width="80%">
									</colgroup>
										<tr>
											<td style="color: #4c78ea; font-size: 16px;">${pro.proTitle }</td>
										</tr>
										<tr>
											<td style="color: #4c78ea; font-size: 14px;"><pre>${pro.proContent }</pre></td>
										</tr>
									</table>
								</div>
						</div>
					</c:forEach>
				</div>
		</div>
</div>

<!-- 개인_경력사항 -->
<div style="height: 10px;"></div>
<div align="center">
	<div class="row" style="border-bottom : 3px solid #f1f3f9;border-top : 3px solid #f1f3f9; width: 100%; " >
		<div class="col-md-12" style="padding-top: 20px; padding-left: 0px; padding-right: 0px; background: #fcfcfc;" align="left">
		<span style="font-size: 23px; font-weight: bold;">경력사항</span>
			<c:forEach items="${memResume.careerList }" var="car" varStatus="status">
				<div class="row" style="width: 100%; margin-top: 10px; margin-left:0px; margin-right:0px; " >
					<div class="col-md-6" style="padding-bottom: 5px; padding-top: 20px;"align="left">
						<c:if test="${status.index ge 1 }">
							<div class="div"></div>
						</c:if>
								<table>
										<tr>
											<td style="width: 100px; color: gray;">회사명</td>
											<td style="color: #4c78ea; font-size: 14px;">${car.carCompany }</td>
										</tr>
										
										<tr>
											<td style="color: gray;">직종</td>
											<td style="color: #4c78ea; font-size: 14px;">${car.carType }</td>
										</tr>
									</table>
								</div>
								<div class="col-md-6" style="margin-left: -237px; padding-bottom: 20px; padding-top: 20px;"align="left">
									<table>
									<colgroup>
										<col width="15%">
										<col width="80%">
									</colgroup>
										<tr>
											<td style="color: gray;">경력</td>
											<td style="color: #4c78ea; font-size: 14px;">${car.carCareer}년</td>
										</tr>
										<tr>
											<td style="color: gray;">직책</td>
											<td style="color: #4c78ea; font-size: 14px;">${car.carPosition }</td>
										</tr>
								</table>
								</div>
						</div>
					</c:forEach>
				</div>
		</div>
</div>

<!-- 희망 근무 조건 -->
<div style="height: 10px;"></div>
<div align="center">
	<div class="row" style="border-bottom : 3px solid #f1f3f9;border-top : 3px solid #f1f3f9; width: 100%; " >
		<div class="col-md-12" style="padding-top: 20px; padding-left: 0px; padding-right: 0px; background: #fcfcfc;" align="left">
		<span style="font-size: 23px; font-weight: bold;">희망조건</span>
			<div class="row" style="width: 100%; margin-top: 10px; margin-left:0px; margin-right:0px; " >
				<div class="col-md-6" style="padding-bottom: 5px; padding-top: 20px;"align="left">
					<table>
							<tr>
								<td style="width: 100px; color: gray;">희망직종</td>
								<td style="color: #4c78ea; font-size: 14px;">${memResume.hopeType }</td>
							</tr>
							
							<tr>
								<td style="color: gray;">희망지역</td>
								<td style="color: #4c78ea; font-size: 14px;">${memResume.hopeLoc }</td>
							</tr>
						</table>
					</div>
					<div class="col-md-6" style="margin-left: -237px; padding-bottom: 20px; padding-top: 20px;"align="left">
						<table>
						<colgroup>
							<col width="15%">
							<col width="80%">
						</colgroup>
							<tr>
								<td style="color: gray;">희망연봉</td>
								<td style="color: #4c78ea; font-size: 14px;">
									<fmt:formatNumber pattern="###,###,###" value="${memResume.hopeSal }"/>만원
								</td>
							</tr>
							<tr>
								<td style="color: gray;">희망 근무시간</td>
								<td style="color: #4c78ea; font-size: 14px;">${memResume.hopeTime }</td>
							</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 이력서 끝 -->
<div align="center">
	<input type="button" value="이력서 수정하고 싶어요." onclick="location.href='updateResume.me?resumeNum=${memResume.resumeNum}'" style="margin: 10px;">
</div>
</body>
</html>