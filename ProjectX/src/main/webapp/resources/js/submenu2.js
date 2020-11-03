/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	   $(document).on('click', '.search', function() {
		      var keyword = $('#keywordSearch').val();
		      var place = $('#areaSearch').val();
		      var jobtype = $('#jobSearch').val();
		      location.href = 'companyList.do?keyword=' + keyword + '&place=' + place + '&jobtype=' + jobtype;
		   });
});







/* 함수선언 영역*/
(function($){
	//aaa라는 함수선언
	//aaa = function(){}
	
	
})(jQuery);