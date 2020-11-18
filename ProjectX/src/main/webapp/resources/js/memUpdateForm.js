$(document).ready(function(){

	// 미리보기 엑박 방지
//	if($('#preview').attr("src").length < 35){
//		$('#preview').hide();
//	}
		
		
	//사진 미리보기
	$(document).on('change', '#memImage', function(f) {
		readURL(this);
	});
	
	//개인 회원가입시 주소
	$(document).on('click', '#findAddr', function(){
		new daum.Postcode({
			oncomplete : function(data) {
				jQuery("#memAddr").val(data.address);
				jQuery("#memAddr").focus();
			}
		}).open();
	});
});


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
	
})(jQuery);