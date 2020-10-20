/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	
	//클릭 이벤트
	$(document).on('click', '#acceptanceBtn', function() {
		var comMypageNum = $('#comMypageNum').val();
		var a = 1;
		Btn(comMypageNum,a);
	});
	//클릭 이벤트
	$(document).on('click', '#rejectBtn', function() {
		var comMypageNum = $('#comMypageNum').val();
		var a = 0;
		Btn(comMypageNum,a);
		
	});
});

/* 함수선언 영역*/
(function($){
	Btn = function(comMypageNum,a){
		$.ajax({
		      url: 'acceptanceAndrejectBtn.co', //요청경로
		      type: 'post',
		      data: {'comMypageNum': comMypageNum, 'ynN':a}, //요청경로로 던질 파라메터. '파레메터명':파라메터
		      success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
		    		  location.href ='resumeInquiry.co'
		      },
		      error: function(){ //ajax통신 실패 시 실행부분
		    	  alert('실패');
		      }
		});
		
	};
	
})(jQuery);