/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	
	//하트 클릭 시
//	$(document).on('click', '.ani_heart_m', function() {
//		var a = '1';
//	    var comNum = $(this).attr('data-attr');
//	    var memEmail = $('#companyListmemEmail').val();
//	    var comName = $('#comName').text();
//	    var announceNum = $(this).attr('data-name');
//	    
		$('.btn_like').click(function(){
	    
		  if($(this).hasClass('btn_unlike')){
			  var a = '1';
			  var comNum = $(this).attr('data-attr');
			  var memEmail = $('#companyListmemEmail').val();
			  var comName = $('#comName').text();
			  var announceNum = $(this).attr('data-name');
		    $(this).removeClass('btn_unlike');
		    $('.ani_heart_m').removeClass('hi');
			$('.ani_heart_m').addClass('bye');
			location.href='likeCompany.me?comNum=' + comNum + '&memEmail=' + memEmail + '&a=' + a + '&announceNum=' + announceNum;
		  }
		  
		  else{
			  var a = '1';
			  var comNum = $(this).attr('data-attr');
			  var memEmail = $('#companyListmemEmail').val();
			  var comName = $('#comName').text();
			  var announceNum = $(this).attr('data-name');
		    $(this).addClass('btn_unlike');
		    $('.ani_heart_m').addClass('hi');
		    $('.ani_heart_m').removeClass('bye');
		    location.href='likeCompany.me?comNum=' + comNum + '&memEmail=' + memEmail + '&a=' + a + '&announceNum=' + announceNum;
		  }
		});
//	});
});

/* 함수선언 영역*/
(function($){
	//aaa라는 함수선언
	//aaa = function(){
	
	//};
})(jQuery);