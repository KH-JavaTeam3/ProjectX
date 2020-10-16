/* 페이지 로딩 후 실행 */
$(document).ready(function(){
	
	
	$(document).on('click', '.search', function() {
		
		let search1 = $('#searchSearch').val();
		let search2 = $('#areaSearch').val();
		let search3 = $('#jobSearch').val();
		
		console.log(search1);
		console.log(search2);
		console.log(search3);
		location.href ="companyList.do?search1="+search1+"&search2="+search2+"&search3="+search3;
	
//		alert(search1);
//		alert(search2);
//		alert(search3);
		
		
		
		
		
	});
});

/* 함수선언 영역*/
(function($){
	//aaa라는 함수선언
	//aaa = function(){}
	
	
	
	
})(jQuery);