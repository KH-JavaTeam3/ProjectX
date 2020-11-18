
/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	
	//데이트픽커 세팅
	$.datepicker.setDefaults($.datepicker.regional['ko']);
	
	//개인로그인모달에서 회원가입 모달 켜기
	$(document).on('click', '#mJoinBtn', function() {
		$('#mLoginModal').modal('hide');
		$('#mJoinModal').modal('show');
	});
	
	//기업로그인모달에서 회원가입 모달 켜기
	$(document).on('click', '#cJoinBtn', function() {
		$('#cLoginModal').modal('hide');
		$('#cJoinModal').modal('show');
	});
	
	//이메일 체크
	$(document).on('click', '#emailChk', function(){
		let memEmail = $('#joinMemEmail').val();
		if(memEmail != "" && memEmail != null){
			emailChkAjax(memEmail, true);
		}else{
			alert('이메일을 입력해주세요');
		}
	});
	
	//개인 회원가입시 주소
	$(document).on('click', '#findAddr1', function(){
		new daum.Postcode({
			oncomplete : function(data) {
				jQuery("#address").val(data.address);
				jQuery("#address").focus();
			}
		}).open();
	});
	
	//생년월일 자동완성
	$(document).on('keyup', '#memBirth', function(){
		$(this).val($(this).val().replace(/[^0-9]/g, "").replace(/([0-9]{4})([0-9]{2})([0-9]{2})/, "$1-$2-$3").replace(/^-/, ""));
	});
	
	//개인회원가입 데이트픽커
	$( "#memBirth" ).datepicker({
		changeYear: true, 
		changeMonth: true,
		yearRange: 'c-70:c+0',
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
		dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
		showMonthAfterYear: true,
		dateFormat: 'yy-mm-dd'
	});
	
	//기업 이메일 체크
	$(document).on('click', '#comNumChk', function(){
		let comNum = $('#joinComNum').val();
		if(comNum != "" && comNum != null){
			comNumChkAjax(comNum);
		}else{
			alert('사업자번호를 입력해주세요');
		}
	});
	
	//기업 주소 찾기
	$(document).on('click', '#findAddr2', function(){
		new daum.Postcode({
			oncomplete : function(data) {
				jQuery("#address2").val(data.address);
				jQuery("#address2").focus();
			}
		}).open();
	});
	
	//로그아웃
	$(document).on('click', '#logBTS', function(){
		let result = confirm("로그아웃하시겠습니까?");
		if(result){
			location.href='logout.do';
		}
	})
	
	//개인 회원가입 모달 열릴 때 유효성
	$(document).on('show.bs.modal', '#mJoinModal', function() {
		mJoinVali();
	});
	
	//개인 회원가입 모달 닫힐 때 유효성 제거
	$(document).on('hidden.bs.modal', '#mJoinModal', function() {
		//input 태그의 내용을 초기화
		$('#mJoinModal').find('form')[0].reset();
		//validate된 label내용 삭제
		$('#mJoinForm label.error').remove();
	});
	
	
	//기업 회원가입 모달 열릴 때 유효성
	$(document).on('show.bs.modal', '#cJoinModal', function() {
		cJoinVali();
	});
	//기업 회원가입 모달 닫힐 때 유효성 제거
	$(document).on('hidden.bs.modal', '#cJoinModal', function() {
		//input 태그의 내용을 초기화
		$('#cJoinModal').find('form')[0].reset();
		//validate된 label내용 삭제
		$('#cJoinForm label.error').remove();
	});
	
	//개인 비밀번호 찾기 모달
	$(document).on('click', '#findMemPassBtn', function(){
		$('#mLoginModal').modal('hide');
		$('#findMemModal').modal('show');
	});
	
	//개인 비밀번호 찾기 버튼
	$(document).on('click', '#findMemBtn', function(){
		var memEmail = $('#findMemEmail').val();
		var findMemPass = emailChkAjax(memEmail, false);
		if(findMemPass){
			if(memEmail != ''){
				alert('이메일을 전송했습니다. 잠시만 기다려주십시오.');
	       		$('#findMemModal').modal('hide');
	       		$('#memCodeModal').modal('show');
				$.ajax({
				      url: 'findMemPass.do', //요청경로
				      type: 'post',
				      data: {'memEmail' :  memEmail},
					 //요청경로로 던질 파라메터. '파라메터명':파라메터
				      success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
			       			$(document).on('click', '#memCodeBtn', function(){
					       		if(result == $('#memCode').val()){
					       			alert('인증되었습니다.');
					       			$('#memCodeModal').modal('hide');
					       			$('#updateMemPassModal').modal('show');
					       			$('#findedMemEmail').val(memEmail);
					       		}
			       			});
				      },
				      error: function(){ //ajax통신 실패 시 실행부분
				           alert('Ajax 실패');
				      }
				});
			}else{
				alert('이메일을 입력해주세요.');
			}
		}
	});
	//개인 비밀번호 변경 시 유효성
	$(document).on('show.bs.modal', '#updateMemPassModal', function() {
		updateMemPassVali();
	});
	//개인 회원가입 모달 닫힐 때 유효성 제거
	$(document).on('hidden.bs.modal', '#updateMemPassModal', function() {
		//input 태그의 내용을 초기화
		$('#updateMemPassModal').find('form')[0].reset();
		//validate된 label내용 삭제
		$('#updateMemPassForm label.error').remove();
	});
	
	
	//기업 비밀번호 찾기 모달
	$(document).on('click', '#findComPassBtn', function(){
		$('#cLoginModal').modal('hide');
		$('#findComModal').modal('show');
	});
	
	//기업 비밀번호 찾기 버튼
	$(document).on('click', '#findComBtn', function(){
		var comEmail = $('#findComEmail').val();
		if(comEmail != ''){
			alert('이메일을 전송했습니다. 잠시만 기다려주십시오.');
       		$('#findComModal').modal('hide');
       		$('#comCodeModal').modal('show');
			$.ajax({
			      url: 'findComPass.do', //요청경로
			      type: 'post',
			      data: {'comEmail' :  comEmail},
				 //요청경로로 던질 파라메터. '파라메터명':파라메터
			      success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
		       			$(document).on('click', '#comCodeBtn', function(){
				       		if(result == $('#comCode').val()){
				       			alert('인증되었습니다.');
				       			$('#comCodeModal').modal('hide');
				       			$('#updateComPassModal').modal('show');
				       			$('#findedComEmail').val(comEmail);
				       		}
		       			});
			      },
			      error: function(){ //ajax통신 실패 시 실행부분
			           alert('Ajax 실패');
			      }
			});
		}else{
			alert('이메일을 입력해주세요.');
		}

	});
	
	
	
	
	
	
	
	
});







/* 함수선언 영역*/
(function($){
	
	//이메일 체크 ajax
	emailChkAjax = function(memEmail, another){
		let findMemPass = false;
		$.ajax({
			url: 'emailChkAjax.do', //요청경로
			type: 'post',
			async: another,
			data: {'memEmail' : memEmail},
			//요청경로로 던질 파라메터. '파라메터명':파라메터
			success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
				if(another == true){
					if(result != "" && result != null){
						alert('중복된 이메일입니다.');
					}else{
						alert('사용하실 수 있는 이메일입니다.');
						$('#emailChk').addClass('active');
					}
				}else{
					if(result != "" && result != null){
						findMemPass = true;
					}else{
						alert("존재하지 않는 이메일입니다.");
					}
				}
			},
			error: function(){ //ajax통신 실패 시 실행부분
				alert('실패');
			}
		});
		return findMemPass;
	}
	
	//사업자번호 체크 ajax
	comNumChkAjax = function(comNum){
		$.ajax({
			url: 'comNumChkAjax.do', //요청경로
			type: 'post',
			data: {'comNum' : comNum},
			//요청경로로 던질 파라메터. '파라메터명':파라메터
			success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
				
				if(result != "" && result != null){
					alert('중복된 사업자번호입니다.');
				}else{
					alert('사용하실 수 있는 사업자번호입니다.');
					$('#comNumChk').addClass('active');
				}
			},
			error: function(){ //ajax통신 실패 시 실행부분
				alert('실패');
			}
		});
	}
	
	//개인 회원가입 정규식
	mJoinVali = function(){
		$("#mJoinForm").validate({
		     debug : false,
		     onfocusin : false,
		     onkeyup : false,
		     onfocusout : function(element) { 
		    	 $(element).valid(); 
		     },
		     rules : {
		    	 memEmail : {
		    		 required : true,
		    		 email : true
		    	 },
		    	 memPass : {
		    		 required : true,
		    		 minlength : 6,
		    		 maxlength : 20
		    	 },
		    	 memPassChk : {
		    		 required : true,
		    		 equalTo : joinMemPass
		    	 },
		    	 memName : {
		    		 required : true,
		    		 minlength : 2,
		    		 maxlength : 5,
		    		 regx : /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/
		    	 },
		    	 memBirth : {
		    		 required : true,
		    		 date : 'YYYY-MM-DD'
		    	 },
		    	 memGender : {
		    		 required : true
		    	 },
		    	 memTel1 : {
		    		 required : true
		    	 },
		    	 memAddr : {
		    		 required : true
		    	 }
		     },
		     //검사를 충족하지 못할 경우 표시될 메시지의 나열                                                         
		     messages : {
		    	 memEmail : {
		    	 },
		    	 memPass : {
		    	 },
		    	 memPassChk : {
		    		 required : "같은 값을 다시 입력하세요."
		    	 },
		    	 memName : {
		    		 regx : '한글로 입력해주세요'
		    	 },
		    	 memBirth : {
		    	 },
		    	 memGender : {
		    	 },
		    	 memTel1 : {
		    	 },
		    	 memAddr : {
		    	 }
		     }, 
		     //실패한 요소에 대해서
		     highlight: function(element) {
		     },
		     //성공한 요소에 대해서
		     unhighlight: function(element) {
		     },
		     //유효성 검사 실패 시 메세지의 출력 방식을 설정
		     errorPlacement: function(error, element){
		    	 if($(element).prev().length == 1){
		    		 error.insertAfter($(element).prev());
		    	 }else if($(element).prev().length == 0){
		    		 error.insertAfter($(element).parent().parent().children().first().children().last());
		    	 }
		     },
	        //유효성 검사 완료(성공) 후 실행할 코드 
		     submitHandler: function(form) {
		    	 form.submit();
		     }
		});
	}
	
	//기업 회원가입 정규식
	cJoinVali = function(){
		$("#cJoinForm").validate({
		     debug : false,
		     onfocusin : false,
		     onkeyup : false,
		     onfocusout : function(element) { 
		    	 $(element).valid(); 
		     },
		     rules : {
		    	 comNum : {
		    		 required : true,
		    	 },
		    	 comPass : {
		    		 required : true,
		    		 minlength : 6,
		    		 maxlength : 20
		    	 },
		    	 comPassChk : {
		    		 required : true,
		    		 minlength : 6,
		    		 maxlength : 20,
		    		 equalTo : joinComPass
		    	 },
		    	 comEmail : {
		    		 required : true,
		    		 email : true
		    	 },
		    	 comName : {
		    		 required : true,
		    		 minlength : 2,
		    		 maxlength : 20
		    	 },
		    	 comCeo : {
		    		 required : true
		    	 },
		    	 comLoc : {
		    		 required : true
		    	 },
		    	 comLocDetail : {
		    		 required : true
		    	 },
		    	 comType : {
		    		 required : true
		    	 },
		    	 comTel : {
		    		 required : true
		    	 }
		     },
		     //검사를 충족하지 못할 경우 표시될 메시지의 나열                                                         
		     messages : {
		    	 comNum : {
		    	 },
		    	 comPass : {
		    	 },
		    	 comPassChk : {
		    	 },
		    	 comEmail : {
		    	 },
		    	 comName : {
		    	 },
		    	 comCeo : {
		    	 },
		    	 comLoc : {
		    	 },
		    	 comLocDetail : {
		    	 },
		    	 comType : {
		    	 },
		    	 comTel : {
		    	 }
		     }, 
		     //실패한 요소에 대해서
		     highlight: function(element) {
		     },
		     //성공한 요소에 대해서
		     unhighlight: function(element) {
		     },
		     //유효성 검사 실패 시 메세지의 출력 방식을 설정
		     errorPlacement: function(error, element){
		    		 error.insertAfter($(element).prev());
		     },
	        //유효성 검사 완료(성공) 후 실행할 코드 
		     submitHandler: function(form) {
		    	 form.submit();
		     }
		});
	}
	//개인 비밀번호 변경 시 정규식
	updateMemPassVali = function(){
		$("#updateMemPassForm").validate({
		     debug : false,
		     onfocusin : false,
		     onkeyup : false,
		     onfocusout : function(element) { 
		    	 $(element).valid(); 
		     },
		     rules : {
		    	 memPass : {
		    		 required : true,
		    		 minlength : 6,
		    		 maxlength : 20
		    	 },
		    	 newMemPassChk : {
		    		 required : true,
		    		 minlength : 6,
		    		 maxlength : 20,
		    		 equalTo : newMemPassChk
		    	 }
		     },
		     //검사를 충족하지 못할 경우 표시될 메시지의 나열                                                         
		     messages : {
		     }, 
		     //실패한 요소에 대해서
		     highlight: function(element) {
		     },
		     //성공한 요소에 대해서
		     unhighlight: function(element) {
		     },
		     //유효성 검사 실패 시 메세지의 출력 방식을 설정
		     errorPlacement: function(error, element){
		    		 error.insertAfter($(element).prev());
		     },
	        //유효성 검사 완료(성공) 후 실행할 코드 
		     submitHandler: function(form) {
		    	 form.submit();
		     }
		});
		
	}
	
})(jQuery);