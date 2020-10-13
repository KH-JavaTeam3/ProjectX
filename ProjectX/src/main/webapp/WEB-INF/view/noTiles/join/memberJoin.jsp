<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Findream</title>
<!-- 최신 부트스트랩CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<!-- Jquey -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 최신 부트스트랩JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<!-- 유효성 검사 자바스크립트 -->
<!-- <script src="resources/js/jquery.validate.js"></script> -->



<style type="text/css">
input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

label.error {
	color: red;
	font-size: 12px;
	display: block;
}
</style>
</head>
<body style="background: #f4f5f7;">

	<div class="mx-auto" style="width: 30%;">
		<a href="memberJoin.do">개인 회원가입</a> <a href="companyJoin.do">기업
			회원가입</a>
		<h1>개인 회원가입</h1>
		<form action="initMemberJoin.do" method="post" id="loginForm">
			<div class="form-group">
				<label for="memEmail">이메일(아이디)</label> <input type="email"
					class="form-control" id="memEmail" name="memEmail">
			</div>
			<div class="form-group">
				<label for="memPass">비밀번호</label> <input type="password"
					class="form-control" id="memPass" name="memPass">
			</div>
			<div class="form-group">
				<label for="memPassChk">비밀번호 확인</label> <input type="password"
					class="form-control" id="memPassChk">
			</div>
			<div class="form-group">
				<label for="memName">이름</label> <input type="text"
					class="form-control" id="memName" name="memName">
			</div>
			<div class="form-group">
				<label for="memAge">나이</label> <input type="number"
					class="form-control" id="memAge" name="memAge">
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label" style="padding-left: 0px;">생년월일</label>
				<div class="row" style="margin-left: 70px;">
					<div class="col-md-3">
						<label class="sr-only">memBirthYear</label> <input
							type="number" class="form-control" 
							name="memBirthYear" placeholder="Year">
					</div>
					<div class="col-md-3">
						<label class="sr-only">memBirthMonth</label> <input
							type="number" class="form-control" 
							name="memBirthMonth" placeholder="Month">
					</div>
					<div class="col-md-3">
						<label class="sr-only">memBirthDay</label> <input
							type="number" class="form-control" 
							name="memBirthDay" placeholder="Day">
					</div>
				</div>
			</div>
			<div class="form-group">
				<label>성별</label><br>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="memGender"
						id="genderRadio1" value="M"> <label
						class="form-check-label" for="inlineRadio1">남</label>
				</div>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="memGender"
						id="genderRadio1" value="W"> <label
						class="form-check-label" for="inlineRadio2">여</label>
				</div>
			</div>
			<div class="form-group">
				<label for="memTel1">연락처</label> <input type="text"
					class="form-control" id="memTel1" name="memTel1">
			</div>
			<div class="form-group">
				<label for="zonecode">주소</label> <input type="button"
					class="btn btn-primary offset-md-9" onclick="openDaumZipAddress();"
					value="주소찾기"> <input type="text" class="form-control"
					id="address" name="memAddr" style="width: 99%;">
			</div>



			<button type="submit" class="btn btn-primary">회원가입</button>
		</form>
	</div>
	<script type="text/JavaScript"
		src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
		function openDaumZipAddress() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 					jQuery("#postcode1").val(data.postcode1);
					// 					jQuery("#postcode2").val(data.postcode2);
					// 					jQuery("#zonecode").val(data.zonecode);
					jQuery("#address").val(data.address);
					jQuery("#address").focus();
					console.log(data);
				}
			}).open();
		}
	</script>




	<!-- 		유효성 -->
	<!-- <form class="needs-validation" novalidate> -->
	<!--   <div class="form-row"> -->
	<!--     <div class="col-md-6 mb-3"> -->
	<!--       <label for="validationCustom01">First name</label> -->
	<!--       <input type="text" class="form-control" id="validationCustom01" value="Mark" required name="abc"> -->
	<!--       <div class="valid-feedback"> -->
	<!--         잘썼다 베이비 -->
	<!--       </div> -->
	<!--       <div class="invalid-feedback"> -->
	<!--         못썼다 베이비 -->
	<!--       </div> -->
	<!--     </div> -->
	<!--     <div class="col-md-6 mb-3"> -->
	<!--       <label for="validationCustom02">Last name</label> -->
	<!--       <input type="text" class="form-control" id="validationCustom02" value="Otto" required> -->
	<!--       <div class="valid-feedback"> -->
	<!--         Looks good! -->
	<!--       </div> -->
	<!--     </div> -->
	<!--   </div> -->
	<!--   <div class="form-row"> -->
	<!--     <div class="col-md-6 mb-3"> -->
	<!--       <label for="validationCustom03">City</label> -->
	<!--       <input type="text" class="form-control" id="validationCustom03" required> -->
	<!--       <div class="invalid-feedback"> -->
	<!--         Please provide a valid city. -->
	<!--       </div> -->
	<!--     </div> -->
	<!--     <div class="col-md-3 mb-3"> -->
	<!--       <label for="validationCustom04">State</label> -->
	<!--       <select class="custom-select" id="validationCustom04" required> -->
	<!--         <option selected disabled value="">Choose...</option> -->
	<!--         <option>...</option> -->
	<!--       </select> -->
	<!--       <div class="invalid-feedback"> -->
	<!--         Please select a valid state. -->
	<!--       </div> -->
	<!--     </div> -->
	<!--     <div class="col-md-3 mb-3"> -->
	<!--       <label for="validationCustom05">Zip</label> -->
	<!--       <input type="text" class="form-control" id="validationCustom05" required> -->
	<!--       <div class="invalid-feedback"> -->
	<!--         Please provide a valid zip. -->
	<!--       </div> -->
	<!--     </div> -->
	<!--   </div> -->
	<!--   <div class="form-group"> -->
	<!--     <div class="form-check"> -->
	<!--       <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required> -->
	<!--       <label class="form-check-label" for="invalidCheck"> -->
	<!--         Agree to terms and conditions -->
	<!--       </label> -->
	<!--       <div class="invalid-feedback"> -->
	<!--         You must agree before submitting. -->
	<!--       </div> -->
	<!--     </div> -->
	<!--   </div> -->
	<!--   <button class="btn btn-primary" type="submit">Submit form</button> -->
	<!-- </form> -->

	<!-- <script> -->
	<!-- // // Example starter JavaScript for disabling form submissions if there are invalid fields -->
	<!-- // (function() { -->
	<!-- //   'use strict'; -->
	<!-- //   window.addEventListener('load', function() { -->
	<!-- //     // Fetch all the forms we want to apply custom Bootstrap validation styles to -->
	<!-- //     var forms = document.getElementsByClassName('needs-validation'); -->
	<!-- //     // Loop over them and prevent submission -->
	<!-- //     var validation = Array.prototype.filter.call(forms, function(form) { -->
	<!-- //       form.addEventListener('submit', function(event) { -->
	<!-- //         if (form.checkValidity() === false) { -->
	<!-- //           event.preventDefault(); -->
	<!-- //           event.stopPropagation(); -->
	<!-- //         } -->
	<!-- //         form.classList.add('was-validated'); -->
	<!-- //       }, false); -->
	<!-- //     }); -->
	<!-- //   }, false); -->
	<!-- // })(); -->
	<!-- </script> -->
	<!-- <script src="resources/js/memberJoin.js?ver=4"></script> -->
</body>
</html>