/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	

// 미리보기 엑박 방지
if($('#preview').attr("src").length < 35){
	$('#preview').hide();
}
	
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