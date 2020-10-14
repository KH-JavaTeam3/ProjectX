$(document).ready(function(){
	
	//기업목록 소환
	$(document).on('click', '#companyListBtn', () => {
		$('#listDiv').empty();
		$('#detail').empty();
		$('#companyDetail').remove();
		$('#memberDetail').remove();
		companyListAjax();
	});
	//개인목록 소환
	$(document).on('click', '#memberListBtn', () => {
		$('#listDiv').empty();
		$('#detail').empty();
		$('#companyDetail').remove();
		$('#memberDetail').remove();
		memberListAjax();
	});
	//기업상세 소환
	$(document).on('click', '.companyDetailBtn', function() {
		$('#companyDetail').remove();
		companyDetailAjax($(this).text());
	});
	//개인상세 소환
	$(document).on('click', '.memberDetailBtn', function(){
		$('#memberDetail').remove();
		memberDetailAjax($(this).text());
	});









	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	function companyListAjax(){
		$.ajax({
			url: 'companyListAjax.ad', //요청경로
			type: 'post',
			data: {},
			//요청경로로 던질 파라메터. '파라메터명':파라메터
			success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
				$('#memberList').remove();
				let str = `<table class="table table-hover" id="companyList">`;
				for(let arr of result){
					str += `<tr>
				      <td class="companyDetailBtn">${arr.comName}</td>
					    </tr>`;
				}
				str += `</table>`;
				$('#listDiv').append(str);
			},
			error: function(){ //ajax통신 실패 시 실행부분
				alert('실패');
			}
		});
	}
	
	function memberListAjax(){
		$.ajax({
			url: 'memberListAjax.ad', //요청경로
			type: 'post',
			data: {},
			//요청경로로 던질 파라메터. '파라메터명':파라메터
			success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
				$('#companyList').remove();
				let str = `<table class="table table-hover" id="memberList">`;
				for(let arr of result){
					str += `<tr>
						<td class="memberDetailBtn">${arr.memName}</td>
						</tr>`;
				}
				str += `</table>`;
				$('#listDiv').append(str);
			},
			error: function(){ //ajax통신 실패 시 실행부분
				alert('실패');
			}
		});
	}
	
	function companyDetailAjax(comName){
		$.ajax({
			url: 'companyDetailAjax.ad', //요청경로
			type: 'post',
			data: {'comName' : comName},
			//요청경로로 던질 파라메터. '파라메터명':파라메터
			success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
				$('#memberDetail').remove();
				let str =  `<table class="table" id="companyDetail">
						    <tr>
								<th scope="col">법인명 : </th>
								<td>${result.comName}</td>
						    </tr>
							<tr>
								<th scope="col">사업자 번호 : </th>
								<td>${result.comNum}</td>
							</tr>
							<tr>
								<th scope="col">사업자 이메일 : </th>
								<td>${result.comEmail}</td>
							</tr>
							<tr>
								<th scope="col">대표자 : </th>
								<td>${result.comCeo}</td>
							</tr>
							<tr>
								<th scope="col">주소 : </th>
								<td>${result.comLoc}</td>
							</tr>
							<tr>
								<th scope="col">산업군 : </th>
								<td>${result.comType}</td>
							</tr>
							<tr>
								<th scope="col">연락처 : </th>
								<td>${result.comTel}</td>
							</tr>
							<tr>
								<th scope="col">가입 날짜 : </th>
								<td>${result.comJoinDate}</td>
							</tr>
						</table>`;
				$('#detailDiv').append(str);
			},
			error: function(){ //ajax통신 실패 시 실행부분
				alert('실패');
			}
		});
	}
	
	function memberDetailAjax(memName){
		$.ajax({
			url: 'memberDetailAjax.ad', //요청경로
			type: 'post',
			data: {'memName' : memName},
			//요청경로로 던질 파라메터. '파라메터명':파라메터
			success: function(result) { // ajax 통신 성공 시 실행부분. result가 결과 데이터를 가진다.
				$('#companyDetail').remove();
				let str = `<table class="table" id="memberDetail">
						    <tr>
								<th scope="col">회원명 : </th>
								<td>${result.memName}</td>
						    </tr>
							<tr>
								<th scope="col">회원 나이 : </th>
								<td>${result.memAge}</td>
							</tr>
							<tr>
								<th scope="col">성별 : </th>
								<td>${result.memGender}</td>
							</tr>
							<tr>
								<th scope="col">생년월일 : </th>
								<td>${result.memBirthYear} 년 ${result.memBirthMonth} 월 ${result.memBirthDay} 일 </td>
							</tr>
							<tr>
								<th scope="col">연락처 1 : </th>
								<td>${result.memTel1}</td>
							</tr>
							<tr>
								<th scope="col">연락처 2 : </th>
								<td>${result.memTel2}</td>
							</tr>
							<tr>
								<th scope="col">주소 : </th>
								<td>${result.memAddr}</td>
							</tr>
							<tr>
								<th scope="col">가입 날짜 : </th>
								<td>${result.memJoinDate}</td>
							</tr>
						</table>`;
				$('#detailDiv').append(str);
			},
			error: function(){ //ajax통신 실패 시 실행부분
				alert('실패');
			}
		});
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
});
	