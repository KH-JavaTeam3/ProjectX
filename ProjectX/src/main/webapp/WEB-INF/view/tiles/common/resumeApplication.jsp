<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.listTr:hover {
	cursor: pointer;
	background-color: #f8f9fa;
}
#boldTr > th{
	font-family: 'NEXON Lv2 Gothic Bold';
}
</style>
</head>
<body>
	<input type="hidden" value="${resumeList.comNum }"
		class="resumeAppcomNum">
	<input type="hidden" value="${resumeList.announceNum }"
		class="resumeAppannounceNum">
	<div style="height: 30px;"></div>
	<div align="center">
		<span
			style="font-weight: bold; font-size: 30px; font-family: 'MyLotteBold'; color: #0F4C81; position: relative; right: 604px;">이력서
			LIST</span>
		<div style="height: 10px;"></div>
		<div class="col-md-10"
			style="border: 5px solid #4876ef; border-radius: 10px;">
			<div style="height: 10px;"></div>
			<div class="col-md-12">
				<table style="width: 100%; height: 300px;">
					<colgroup>
						<col width="3%" />
						<col width="3%" />
						<col width="10%" />
						<col width="8%" />
						<col width="10%" />
						<col width="10%" />
					</colgroup>
					<tr id="boldTr">
						<th></th>
						<th></th>
						<th><div style="padding-left: 40px;">제목</div></th>
						<th><div style="padding-right: 10px;">희망지역</div></th>
						<th><div style="padding-left: 40px;">이메일</div></th>
						<th><div style="padding-left: 52px;">작성일</div></th>
					</tr>
					<c:forEach items="${resumeList.resumeList }" var="re"
						varStatus="status">
						<tr data-attr="${re.resumeNum }" class="table listTr">
							<td><input type="checkbox" class="chk"
								value="${re.resumeNum }"></td>
							<td class="moveToResumeTd">
								<div class="col-md-2">
									<svg width="3em" height="3em" viewBox="0 0 16 16"
										class="bi bi-file-text" fill="currentColor"
										xmlns="http://www.w3.org/2000/svg">
							  			<path fill-rule="evenodd"
											d="M4 0h8a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2zm0 1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H4z" />
							  			<path fill-rule="evenodd"
											d="M4.5 10.5A.5.5 0 0 1 5 10h3a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5zm0-2A.5.5 0 0 1 5 8h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5zm0-2A.5.5 0 0 1 5 6h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5zm0-2A.5.5 0 0 1 5 4h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5z" />
									</svg>
								</div>
							</td>
							<td class="moveToResumeTd">${re.resumeName }</td>
							<td class="moveToResumeTd">${re.hopeLoc }</td>
							<td class="moveToResumeTd">${re.memEmail }</td>
							<td class="moveToResumeTd">${re.resumeDate }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div align="center" style="margin-top: 15px;">
			<input type="button" class="btn btn-primary"
				style="background: #4876ef; border: 1px solid; color: white; width: 120px; height: 35px;"
				id="resumeAppBut" value="확인"> <input type="button" class="btn btn-primary"
				style="background: #4876ef; border: 1px solid; color: white; width: 120px; height: 35px;"
				id="cartBuyPage" value="취소" onclick="history.back();">
		</div>
	</div>



	<script src="resources/js/resumeApplication.js?ver=20"></script>
</body>
</html>