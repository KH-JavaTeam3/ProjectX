/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	
	// 제목줄의 체크박스가 선택되면
	$(document).on('click', '#checkAll', function() {
		// 체크 유무 확인
		var isChecked = $('#checkAll').is(':checked');
		if (isChecked) {// 체크가 되었을때s
			$('.chk').prop('checked', true);
		} else {
			$('.chk').prop('checked', false);
		}
	});

	//하위 체크박스 변경 시 제목줄의 체크박스 변경
	   $(document).on('click', '.chk', function() {
	      //.chk의 개수
	      var chkCnt = $('.chk').length;
	      //.chk 중에서 체크가 된 노드의 개수
	      var checkedCnt = $('.chk:checked').length;
	      
	      if(chkCnt == checkedCnt){
	         $('#checkAll').prop('checked',true);
	      }else{
	         $('#checkAll').prop('checked',false);
	}
	   });
	//공고 삭제 버튼
	$(document).on('click', '#deleteCartBtu', function() {
		// .chk의 개수
		//var a = $('.chk').length; /* 체크박스의 총 개수 */
		// .chk 중에서 체크가 된 노드의 개수
		var c = $('.chk:checked').length
		if(c == 0){
			alert('삭제 할 공고를 선택해주세요.');
			return;
		}
		//cartId가 담길 배열 생성
		var announceNums = new Array();
		//체크가된 노드 벨류값을 가져온다
		$('.chk:checked').each(function(index, element) {
			announceNums[index] = $(element).val();
		})
		location.href = 'recruitDelete.co?announceNums='+announceNums;
		
	});
	//클릭 이벤트
	//$(document).on('click', '선택자', function() {

	//});
	
});

/* 함수선언 영역*/
(function($){
	
})(jQuery);