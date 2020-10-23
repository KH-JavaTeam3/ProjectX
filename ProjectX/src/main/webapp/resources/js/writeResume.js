/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	

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
		let str = `<div class="col-md-12" style="border-bottom: 1px solid gray; width="100%;"">
						 <div class="form-row">
						   <div class="form-group col-md-12">
							  <label >자격증 이름</label> 
							   <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg" id="deleteBtn">
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
						    <label >점수</label>
						    <input type="text" class="form-control"  name="licGrade">
						    <small>※점수가 없는 시험의 경우, 합격/불합격으로 적어주세요.</small>
						  </div>
							<div class="form-group col-md-12">
								<label >취득일</label>
								<input type="text" class="form-control licDate" name="licDate">
							</div>
						  </div>
						</div>
					</div>`;
		$('#licenseDiv').prepend(str);
	});
	
	//추가 자격증 제거
	$(document).on('click','#deleteBtn', function(){
		$(this).parent().parent().parent().remove();
	});

	//프로필 칸 증가
	$(document).on('click', '#addProfile', function() {
		var str =`<div class="row col-md-12" style="border-bottom: 1px solid gray; width="100%;"">
					   <div class="form-group col-md-12">
						  <label >자기소개서 이름</label>
						  <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg" id="deleteBtn1">
							<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
							<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
						  </svg>
						  <input type="text" class="form-control"  name="proTitle">
						</div>
					   <div class="form-group col-md-12">
						  <label >자기소개서 내용</label>
						  <textarea rows="10" cols="60" class="form-control"  name="proContent"></textarea>
						</div>
				  </div>`;
		$('#profileDiv').prepend(str);
	});
	
	//추가 프로필 제거
	$(document).on('click','#deleteBtn1', function(){
		$(this).parent().parent().remove();
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
    $.datepicker.setDefaults($.datepicker.regional['ko']); 
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
	$.datepicker.setDefaults($.datepicker.regional['ko']); 
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
		$.datepicker.setDefaults($.datepicker.regional['ko']); 
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
})(jQuery);