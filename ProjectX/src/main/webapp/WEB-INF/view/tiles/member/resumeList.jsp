<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@font-face {
	font-family: 'MyLotteBold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.0/MyLotteBold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'NEXON Lv2 Gothic Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv2 Gothic Bold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.moveToResumeTd:hover {
	cursor: pointer;
}
</style>
</head>
<body>
	<div style="height: 30px;"></div>
	<div align="center">
		<span style="font-weight: bold; font-size: 30px; font-family: 'MyLotteBold'; color: #0F4C81; position: relative; right: 555px;">이력서 LIST</span>
		<div style="height: 10px;"></div>
		<div class="col-md-10" style="border: 5px solid #658DC6; border-radius: 10px;">
			<div style="height: 10px;"></div>
			<div class="col-md-12">
				<table style="width: 100%; height: 300px;">
					<colgroup>
						<col width="3%" />
						<col width="10%" />
						<col width="8%" />
						<col width="10%" />
						<col width="10%" />
						<col width="5%" />
					</colgroup>
					<tr>
						<td style="cursor: default;"></td>
						<td style="cursor: default;"><div style="font-family: 'NEXON Lv2 Gothic Bold'; padding-left: 40px;">제목</div></td>
						<td style="cursor: default;"><div style="font-family: 'NEXON Lv2 Gothic Bold'; padding-right: 10px;">희망 지역</div></td>
						<td style="cursor: default;"><div style="font-family: 'NEXON Lv2 Gothic Bold'; padding-left: 40px;">이메일</div></td>
						<td style="cursor: default;"><div style="font-family: 'NEXON Lv2 Gothic Bold'; padding-left: 52px;">작성일</div></td>
						<td style="cursor: default;"></td>
					</tr>
					<c:forEach items="${resumeList }" var="re" varStatus="status">
						<tr data-attr="${re.resumeNum }">
							<td class="moveToResumeTd">
								<div class="col-md-2">
									<svg width="3em" height="3em" viewBox="0 0 16 16" class="bi bi-file-text" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
							  			<path fill-rule="evenodd" d="M4 0h8a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2zm0 1a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H4z" />
							  			<path fill-rule="evenodd" d="M4.5 10.5A.5.5 0 0 1 5 10h3a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5zm0-2A.5.5 0 0 1 5 8h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5zm0-2A.5.5 0 0 1 5 6h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5zm0-2A.5.5 0 0 1 5 4h6a.5.5 0 0 1 0 1H5a.5.5 0 0 1-.5-.5z" />
									</svg>
								</div>
							</td>
							<td class="moveToResumeTd">${re.resumeName }</td>
							<td class="moveToResumeTd">${re.hopeLoc }</td>
							<td class="moveToResumeTd">${re.memEmail }</td>
							<td class="moveToResumeTd">${re.resumeDate }</td>
							<td><a class="deleteResumeBtn" style="text-decoration: none; font-weight: bold;">삭제</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			$(document).on('click', '.moveToResumeTd', function() {
				var resumeNum = $(this).parent().attr('data-attr');
				location.href = "moveToResumeDetail.me?resumeNum=" + resumeNum;
			});
		});
	</script>
	<script src="resources/js/resumeList.js?ver=12"></script>
</body>
</html>