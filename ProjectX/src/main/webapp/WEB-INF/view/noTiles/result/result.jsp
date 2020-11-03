<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script type="text/javascript">
	var result = '${result}'; 
	
	if(result == 'mJoin'){
		goMain('회원가입되었습니다.');
	}
	if(result == 'cJoin'){
		goMain('회원가입되었습니다.');
	}
	if(result == 'mLoginSuccess'){
		goMain('로그인되었습니다.');
	}
	if(result == 'mLoginFail'){
		goMain("일치하는 계정이 없습니다.");
	}
	if(result === 'cLoginSuccess'){
		alert('로그인되었습니다.');
		location.href = 'comLogin.do';
	}
	if(result === 'cLoginFail'){
		goMain('일치하는 계정이 없습니다.');
	}
	if(result === 'memPass'){
		 goMain('비밀번호가 변경되었습니다.');
	}
	if(result === 'logout'){
		goMain('로그아웃되었습니다.');
	}
	function goMain(notice){
		alert(notice);
		location.href='main.do';
	}
	
</script>
</body>
</html>