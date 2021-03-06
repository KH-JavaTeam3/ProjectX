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

	//자격증 칸 증가
	$(document).on('click', '#addCertifi', function() {
		let str = `<div class="col-md-12" style="border-top: 1px solid gray; border-bottom: 1px solid gray; width="100%;"">
						 <div class="form-row">
						   <div class="form-group col-md-12">
							  <label >자격증 이름</label> 
							   <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg" id="deleteBtn">
								<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
								<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
								</svg>
							  <input type="text" class="form-control" name="licName" autocomplete="off">
							</div>
						  <div class="form-group col-md-6">
						    <label >발행처/기관</label>
						    <input type="text" class="form-control"  name="licLoc" autocomplete="off">
						  </div>
						  <div class="form-group col-md-6">
						    <label >점수</label>
						    <input type="text" class="form-control"  name="licGrade" autocomplete="off">
						    <small>※점수가 없는 시험의 경우, 합격/불합격으로 적어주세요.</small>
						  </div>
							<div class="form-group col-md-12">
								<label >취득일</label>
								<input type="text" class="form-control licDate" name="licDate" autocomplete="off">
							</div>
						  </div>
						</div>
					</div>`;
		$('#licenseDiv').append(str);
		let findDate = $('#licenseDiv').children().last().find('.licDate');
		
		datepicFun(findDate);
	});
	
	//추가 자격증 제거
	$(document).on('click','#deleteBtn', function(){
		$(this).parent().parent().parent().remove();
	});

	//자소서 칸 증가
	$(document).on('click', '#addProfile', function() {
		var str =`<div class="col-md-12" style="border-top: 1px solid gray; border-bottom: 1px solid gray;">
					   <div class="form-group col-md-12">
						  <label >자기소개서 이름</label>
						  <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg" id="deleteBtn1">
							<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
							<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
						  </svg>
						  <input type="text" class="form-control"  name="proTitle" autocomplete="off">
						</div>
					   <div class="form-group col-md-12 wrap">
					  <label for="proContent">자기소개서 내용</label>
					  	<textarea rows="10" cols="60" class="form-control wrap proContent" name="proContent" wrap="hard" maxlength="2000" style="height: 165px;"></textarea>
					  	 <span class="counter"></span>
					</div>
				  </div>`;
		$('#profileDiv').parent().append(str);
		
		var newDiv = $(this).next().children().last();
		var proContent = newDiv.children().next().children().eq(1);
		var content = proContent.val();
		proContent.height(((content.split('\n').length + 1) * 1.5) + 'em');
		proContent.next().html(content.length + '/2000');
	});
	
	//자소서 글자 세기
	$(document).on('keyup', '.proContent', function(){
		var content = $(this).val();
        $(this).height(((content.split('\n').length + 1) * 1.5) + 'em');
        $(this).next().html(content.length + '/2000');
	});
	$('.proContent').keyup();
	

	
	//추가 자소서 제거
	$(document).on('click','#deleteBtn1', function(){
		$(this).parent().parent().remove();
	});
	
	//경력 칸 증가
	$(document).on('click', '#addCareer', function(){
		var str = `<div class="col-md-12" style="border-top: 1px solid gray; border-bottom: 1px solid gray; width="100%;"">
					 <div class="form-row">
					   <div class="form-group col-md-6">
					     <label for="beCompany">회사명</label>
					     <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg" id="deleteBtn2">
							<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
							<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
						  </svg>
					     <input type="text" class="form-control" id="beCompany" name="beCompany" autocomplete="off">
					   </div>
					   <div class="form-group col-md-6">
					     <label for="beCareer">경력</label>
					     <div class="row col-md-12">
					     	<input type="number" class="form-control col-md-11" id="beCareer" name="beCareer" max="99">
							<span class="col-md-1">년</span>
					   	 </div>
					   </div>
					   <div class="form-group col-md-6">
					     <label for="beType">직종</label>
					     <input type="text" class="form-control" id="beType" name="beType" autocomplete="off">
					   </div>
					   <div class="form-group col-md-6">
					     <label for="bePosition">직책</label>
					     <input type="text" class="form-control" id="bePosition" name="bePosition" autocomplete="off">
					   </div>
					 </div>
					</div>`;
		$('#careerDiv').append(str);
	});
	
	//추가한 경력칸 삭제
	$(document).on('click','#deleteBtn2', function(){
		$(this).parent().parent().parent().remove();
	});
	
	//주소 찾기 열기
	$(document).on('click','#openAddr', function(){
		new daum.Postcode({
	         oncomplete : function(data) {
	        	 jQuery("#eduLoc").val(data.address);
	        	 jQuery("#eduLoc").focus();
	         }
	    }).open();
	});
	
	//입학일
	datepicFun('#eduBeginDate');
	//입학일 - 자동 추가
	$(document).on('keyup', '#eduBeginDate', function(){
		highpun($(this));
		
		
		
	});
	//졸업일
	datepicFun('#eduEndDate');
	//졸업일 - 자동 추가
	$(document).on('keyup', '#eduEndDate', function(){
		highpun($(this));
	});
	//취득일
	datepicFun('.licDate');
	
});
/* 함수선언 영역*/
(function($){
	
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
	  
	datepicFun = function(selecting){
		  $(selecting).datepicker({
				changeYear: true, 
				changeMonth: true,
				monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
		dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
		showMonthAfterYear: true,
		dateFormat: 'yy-mm-dd'
			});
		  
	}
	  
	highpun = function(date){
		date.val(date.val().replace(/[^0-9]/g, "").replace(/([0-9]{4})([0-9]{2})([0-9]{2})/, "$1-$2-$3").replace(/^-/, ""));
	}
})(jQuery);