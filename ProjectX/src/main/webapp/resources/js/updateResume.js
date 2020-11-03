/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	//데이트픽커 디폴트 설정
	$.datepicker.setDefaults($.datepicker.regional['ko']); 

	// 미리보기 엑박 방지
	if($('#preview').attr("src").length < 10){
		$('#preview').hide();
	}
		
		
	//사진 미리보기
	$(document).on('change', '#memImage', function(f) {
		readURL(this);
	});
	
	//이미 등록된 자격증 제거
	$(document).on('click', '.licDeleteBtn', function(){
		var licNum = $(this).parent().children().first().val();
		licRemove(licNum, $(this));
	});
	
	//자격증 칸 증가
	$(document).on('click', '#addCertifi', function() {
		let str = `<div class="col-md-12 licDiv" style="border-bottom: 1px solid gray; border-bottom: 1px solid gray; width="100%;"">
						 <div class="form-row">
						   <div class="form-group col-md-12">
							  <label>자격증 이름</label> 
							   <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-trash deleteBtn" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
									<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
									<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
								</svg>
							  <input type="text" class="form-control" name="licName">
							</div>
						  <div class="form-group col-md-6">
						    <label >발행처/기관</label>
						    <input type="text" class="form-control"  name="licLoc">
						  </div>
						  <div class="form-group col-md-6">
						    <label>점수</label>
						    <input type="text" class="form-control" name="licGrade">
						    <small>※점수가 없는 시험의 경우, 합격/불합격으로 적어주세요.</small>
						  </div>
							<div class="form-group col-md-12">
								<label >취득일</label>
								<input type="text" class="form-control licDate" name="licDate" autocomplete="off">
							</div>
						  </div>
						</div>
					</div>`;
		$('#licenseFather').children().last().append(str);
		
			$('.licDate').datepicker({
				changeYear: true, 
				changeMonth: true,
				monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
				dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
				showMonthAfterYear: true,
				dateFormat: 'yy-mm-dd'
			});
	});
	
	//칸 추가한 자격증 제거
	$(document).on('click','.deleteBtn', function(){
		$(this).parent().parent().parent().remove();
	});
	
	//이미 등록된 자기소개 제거
	$(document).on('click', '.proDeleteBtn', function(){
		var proNum = $(this).parent().children().first().val();
		profilesRemove(proNum, $(this));
	});
	
	//자기소개 칸 증가
	$(document).on('click', '#addProfile', function() {
		let str =`<div class="row col-md-12" style="border-top: 1px solid gray; border-bottom: 1px solid gray; width="100%;"">
					   <div class="form-group col-md-12">
						  <label >자기소개서 이름</label>
						  <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg" id="deleteBtn1">
							<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
							<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
						  </svg>
						  <input type="text" class="form-control" name="proTitle">
						</div>
					   <div class="form-group col-md-12">
						  <label >자기소개서 내용</label>
						  <textarea rows="10" cols="60" class="form-control"  name="proContent"></textarea>
						</div>
				  </div>`;
		$('#profilesFather').children().last().append(str);
	});
	
	//추가 프로필 제거
	$(document).on('click','#deleteBtn1', function(){
		$(this).parent().parent().remove();
	});
	
	//이미 등록된 경력사항 삭제
	$(document).on('click', '.careerDeleteBtn', function(){
		var carNum = $(this).parent().children().first().val();
		careerRemove(carNum, $(this));
	});
	
	//경력 칸 증가
	$(document).on('click', '#addCareer', function(){
		let str = `<div class="col-md-12" style="border-top: 1px solid gray; border-bottom: 1px solid gray; width="100%;"">
					 <div class="form-row">
					   <div class="form-group col-md-6">
					     <label for="beCompany">회사명</label>
					     <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg" id="deleteBtn2">
							<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
							<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
						  </svg>
					     <input type="text" class="form-control carCompany" name="carCompany">
					   </div>
					   <div class="form-group col-md-6">
					     <label for="beCareer">경력</label>
					     <div class="row col-md-12">
					     	<input type="number" class="form-control col-md-11 carCareer" name="carCareer">
							<span class="col-md-1">년</span>
					   	 </div>
					   </div>
					   <div class="form-group col-md-6">
					     <label for="beType">직종</label>
					     <input type="text" class="form-control carType" name="carType">
					   </div>
					   <div class="form-group col-md-6">
					     <label for="bePosition">직책</label>
					     <input type="text" class="form-control carPosition" name="carPosition">
					   </div>
					 </div>
					</div>`;
		$('#careerTotal').children().last().append(str);
	});
	
	//추가한 경력칸 삭제
	$(document).on('click','#deleteBtn2', function(){
		$(this).parent().parent().parent().remove();
	});
	
	
	
	//주소 찾기 열기
	$(document).on('click','#openAddr', function(){
		new daum.Postcode({
	         oncomplete : function(data) {
	        	 jQuery("#address").val(data.address);
					jQuery("#address").focus();
	         }
	    }).open();
	});
	
	//입학일
     $( "#eduBeginDate" ).datepicker({
       changeYear: true, 
       changeMonth: true,
       monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
       monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
       dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
       dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
       showMonthAfterYear: true,
       dateFormat: 'yy-mm-dd'
     });
     
	//졸업일
	$( "#eduEndDate" ).datepicker({
		changeYear: true, 
		changeMonth: true,
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
		dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
		showMonthAfterYear: true,
		dateFormat: 'yy-mm-dd'
	});
	
	//취득일
	$('.licDate').datepicker({
		changeYear: true, 
		changeMonth: true,
		monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
		dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
		showMonthAfterYear: true,
		dateFormat: 'yy-mm-dd'
	});	
});

/* 함수선언 영역*/
(function($){
	//aaa라는 함수선언
	//aaa = function(){
	
	//};
	
	  //사진 미리보기 함수
	  readURL = function(input) {
	        if (input.files && input.files[0]) {
	            var reader = new FileReader();
	            reader.onload = function(e) {
	            	if(e.target.result != ''){
	            		$('#preview').attr('src', e.target.result);
	            		$('#preview').show();
	            	}
	            }
	            reader.readAsDataURL(input.files[0]);
	        }
	    }
	  
	  //이미 있는 자격증 칸 제거하기
	  licRemove = function(licNum, licDom){
		  
		//Ajax 시작
		  $.ajax({
		        url: 'licRemove.me', //요청경로
		        type: 'post',
		        data: {'licNum' : licNum}, //요청경로로 던질 파라메터. '파레메터명':파라메터
		        success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
		        	
		        	if(result != null){
		        		$(licDom).parent().parent().remove();
		        	}else{
		        		alert('쿼리 실패');
		        	}
		        },
		        error: function(){ //ajax통신 실패 시 실행부분
		        	alert('Ajax 오류');
		        }
		  });
		  
	  }
	  
	  profilesRemove = function(proNum, proDom){
		//Ajax 시작
		  $.ajax({
		        url: 'profilesRemove.me', //요청경로
		        type: 'post',
		        data: {'proNum' : proNum}, //요청경로로 던질 파라메터. '파레메터명':파라메터
		        success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
		        	if(result != null){
		        		$(proDom).parent().parent().remove();
		        	}else{
		        		alert('쿼리 실패');
		        	}
		        },
		        error: function(){ //ajax통신 실패 시 실행부분
		        	alert('Ajax 오류');
		        }
		  });
		  
	  }
	  
	  careerRemove = function(carNum, carDom){
		  //ajax 실행
		  $.ajax({
		        url: 'careerRemove.me', //요청경로
		        type: 'post',
		        data: {'carNum' : carNum}, //요청경로로 던질 파라메터. '파레메터명':파라메터
		        success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
		        	if(result != null){
		        		$(carDom).parent().parent().remove();
		        	}else{
		        		alert('쿼리 실패');
		        	}
		        },
		        error: function(){ //ajax통신 실패 시 실행부분
		        	alert('Ajax 오류');
		        }
		  });
	  };
})(jQuery);