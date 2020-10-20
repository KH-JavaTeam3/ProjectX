/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	
	$(document).on('click', '#logout', function(){
		$.ajax({
			url: 'logout.do', //요청경로
			type: 'post',
			data: { },
			//요청경로로 던질 파라메터. '파라메터명':파라메터
			success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
				if(result != null){
					alert('로그아웃되었습니다.');
					location.href='main.do';
				}
			},
			error: function(){ //ajax통신 실패 시 실행부분
				alert('실패');
			}
		});
	});
		
		
});

/* 함수선언 영역*/
(function($){
	//aaa라는 함수선언
	//aaa = function(){}
	
	
	
	
})(jQuery);