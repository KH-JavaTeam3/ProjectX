/* 페이지 로딩 후 실행 */
$(document).ready(function(){

	//하위 체크박스 변경 시 제목줄의 체크박스 변경
	   $(document).on('click', '.chk', function() {
	      //.chk의 개수
	      var chkCnt = $('.chk').length;
	      //.chk 중에서 체크가 된 노드의 개수
	      var checkedCnt = $('.chk:checked').length;
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
		if(c > 2){
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
		alert(resumeNum);
		alert(comNum);
		alert(announceNum);
		location.href ='resumeApp.do?resumeNum='+resumeNum+'&comNum='+comNum+'&announceNum='+announceNum;
	});
	//클릭 이벤트
	//$(document).on('click', '선택자', function() {

	//});
	
});

/* 함수선언 영역*/
(function($){
	
})(jQuery);