/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	$('#preview').hide();
	
	
	//사진 미리보기
	$(document).on('change', '#memImage', function(f) {
		readURL(this);
	});
	
	//자격증 칸 증가
	$(document).on('click', '#addCertifi', function() {
		var str = `<div class="col-md-12">
						 <div class="form-row">
						   <div class="form-group col-md-12">
							  <label for="licName">자격증 이름</label> 
							   <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg" id="deleteBtn">
								<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
								<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
								</svg>
							  <input type="text" class="form-control" id="licName" name="licName">
							</div>
						  <div class="form-group col-md-6">
						    <label for="licLoc">발행처/기관</label>
						    <input type="text" class="form-control" id="licLoc" name="licLoc">
						  </div>
						  <div class="form-group col-md-6">
						    <label for="licGrade">점수</label>
						    <input type="text" class="form-control" id="licGrade" name="licGrade">
						    <small>※점수가 없는 시험의 경우, 합격/불합격으로 적어주세요.</small>
						  </div>
						  </div>
						  <div class="form-group col-md-12">
							  <label for="licDate">취득일</label>
							  <input type="date" class="form-control" id="licDate" name="licDate">
						  </div>
						</div>
					</div>`;
		$('#licenseDiv').prepend(str);
	});
	
	$(document).on('click','#deleteBtn', function(){
		$(this).parent().parent().parent().parent().remove();
	});

	//프로필 칸 증가
	$(document).on('click', '#addProfile', function() {
		var str =`<div class="row col-md-12" style="border-bottom: 1px solid gray; width="100%;"">
					   <div class="form-group col-md-12">
						  <label for="proTitle">자기소개서 이름</label>
						  <svg width="1.5em" height="1.5em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg" id="deleteBtn1">
							<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
							<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
						  </svg>
						  <input type="text" class="form-control" id="proTitle" name="proTitle">
						</div>
					   <div class="form-group col-md-12">
						  <label for="proContent">자기소개서 내용</label>
						  <textarea rows="10" cols="60" class="form-control" id="proContent" name="proContent"></textarea>
						</div>
				  </div>`;
		$('#profileDiv').prepend(str);
	});
	
	$(document).on('click','#deleteBtn1', function(){
		$(this).parent().parent().remove();
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