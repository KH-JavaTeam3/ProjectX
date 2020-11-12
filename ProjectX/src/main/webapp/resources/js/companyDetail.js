/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	

	// 미리보기 엑박 방지
	if($('#preview').length > 0){
		if($('#preview').attr("src").length < 35){
			$('#preview').hide();
		}
	}
	
	//지원버튼
	$(document).on('click', '#applyBtn', function(){
		applyAjax($(this));
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
	  
	  applyAjax = function(selecting){
		  let announceNum = selecting.attr('data-announceNum');
		  $.ajax({
		      url: 'chkApply.do', //요청경로
		      type: 'post',
		      data: {'announceNum' : announceNum },
			 //요청경로로 던질 파라메터. '파라메터명':파라메터
		      success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
		    	  if(+result){
		    		  alert('이미 지원하셨습니다.');
		    	  }else{
		    		  let comNum = selecting.attr('data-comNum');
		    		  location.href=`resumeApplication.me?announceNum=${announceNum}&comNum=${comNum}`;
		    	  }
		      },
		      error: function(){ //ajax통신 실패 시 실행부분
		           alert('실패');
		      }
		});

	  }
	  
})(jQuery);