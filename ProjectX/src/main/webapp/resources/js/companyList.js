/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	//하트 클릭 시
		$('.btn_like').click(function(){
			var memEmail = $('#companyListmemEmail').val();
			
			if(memEmail == null || memEmail == ''){
				alert('로그인이 필요한 서비스 입니다.');
			}else{
				
				var isChecked = false;
				
				if($(this).children().first().hasClass('img_emoti2')){
					isChecked = true;
					$(this).children().last().removeClass('ani_heart_m hi');
					$(this).children().last().addClass('ani_heart_m bye');
				}else{
					$(this).children().last().removeClass('ani_heart_m bye');
					$(this).children().last().addClass('ani_heart_m hi');
				}
				var announceNum = $(this).attr('data-name');
				
				setTimeout(fun, 1000);
				
				function fun(){
					location.href=`heartedRecruitList.do?isChecked=${isChecked}&announceNum=${announceNum}`;
				}
			}
		});
});

/* 함수선언 영역*/
(function($){
	//aaa라는 함수선언
	//aaa = function(){
	
	//};
})(jQuery);