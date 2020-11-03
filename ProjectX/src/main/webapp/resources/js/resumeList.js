/* 페이지 로딩 후 실행 */
$(document).ready(function(){
   $(document).on('click', '.deleteResumeBtn', function() {
      var resumeNum = $(this).parent().prev().attr('data-attr');
      var question = confirm("진짜 삭제 하실건가요?");
      if(question){
    	  okdelete(resumeNum, $(this));
      }else{
    	  return false
      }
   });
});







/* 함수선언 영역*/
(function($){
	//이력서 삭제
	okdelete = function(resumeNum, okDel){
		//Ajax 시작
  	  $.ajax({
  	        url: 'deleteResume.me', //요청경로
  	        type: 'post',
  	        data: {'resumeNum':resumeNum}, //요청경로로 던질 파라메터. '파레메터명':파라메터
  	        success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
  	        	if(result != null){
  	        		$(okDel).parent().parent().remove();
  	        		alert('삭제했습니다');
  	        	}
  	        	else{
  	        		alert('삭제 쿼리 실패');
  	        	}
  	        },
  	        error: function(){ //ajax통신 실패 시 실행부분
  	        	alert('ajax 실패')
  	        }
  	  });
	}
	
	
})(jQuery);