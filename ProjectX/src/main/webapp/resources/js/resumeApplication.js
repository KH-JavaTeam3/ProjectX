/* 페이지 로딩 후 실행 */
$(document).ready(function(){

	$(document).on('click', '.listTr', function(){
		var chkBox = $(this).children().children().first();
		if(chkBox.is(':checked')){
			chkBox.prop('checked',false);
		}else{
			chkBox.prop('checked',true);
		}
	});
	//공고 지원 버튼
	$(document).on('click', '#resumeAppBut', function() {
		// .chk의 개수
		//var a = $('.chk').length; /* 체크박스의 총 개수 */
		// .chk 중에서 체크가 된 노드의 개수
		var c = $('.chk:checked').length
		if(c == 0){
			alert('이력서를 선택해주세요.');
			return;
		}
		if(c > 1){
			alert('이력서는 하나만 지원 됩니다.');
			return;
		}
		var resumeNum = 0;
		//체크가된 노드 벨류값을 가져온다
		$('.chk:checked').each(function(index, element) {
			resumeNum = $(element).val();
		})
		console.log(resumeNum);
		var comNum = $('.resumeAppcomNum').val();
		var announceNum = $('.resumeAppannounceNum').val();
		location.href ='resumeApp.do?resumeNum='+resumeNum+'&comNum='+comNum+'&announceNum='+announceNum;
	});
	
});

/* 함수선언 영역*/
(function($){
	
})(jQuery);