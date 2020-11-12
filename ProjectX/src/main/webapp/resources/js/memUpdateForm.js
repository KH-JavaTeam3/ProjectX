$(document).ready(function(){

	// 미리보기 엑박 방지
//	if($('#preview').attr("src").length < 35){
//		$('#preview').hide();
//	}
		
		
	//사진 미리보기
	$(document).on('change', '#memImage', function(f) {
		readURL(this);
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