/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	$('#preview').hide();
	
	
	//사진 미리보기
	$(document).on('change', '#resumeImg', function(f) {
		readURL(this);
	});
	
	//자격증 칸 증가
	$(document).on('click', '#addCertifi', function() {
		var str = `<div class="row col-md-12" style="border-bottom: 1px solid gray; width="100%;"">
				<div class="row col-md-12">
				 <div class="form-row">
				   <div class="form-group col-md-12">
					  <label for="certifiName">자격증 이름</label>
					  <input type="text" class="form-control" id="certifiName" name="certifiName">
					</div>
				  <div class="form-group col-md-6">
				    <label for="publisher">발행처/기관</label>
				    <input type="text" class="form-control" id="publisher" name="publisher">
				  </div>
				  <div class="form-group col-md-6">
				    <label for="success">합격구분</label>
				    	<div class="row col-md-12" style="width: 500px;">
					   		<select style="height: 35px;">
					   			<option value="">선택하세요</option>
					   			<option value="1">1차 합격</option>
					   			<option value="2">2차 합격</option>
					   			<option value="3">필기 합격</option>
					   			<option value="4">실기 합격</option>
					   			<option value="5">최종 합격</option>
					   		</select>
					</div>
				  </div>
				  <div class="form-group col-md-12">
					  <label for="getDate">취득일</label>
					  <input type="date" class="form-control" id="getDate" name="getDate">
				  </div>
				</div>
			</div>
		</div>`;
		$('#divdiv').prepend(str);
		
		
		
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