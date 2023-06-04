<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/login.css">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>

<form action="login.do" method="post">
<h3 id="loginTitle">로그인</h3>

<div id="loginBox">

	<ul>
		<li>
			<label for="loginId">아이디</label>
			<input type="text" placeholder="아이디를 입력해 주세요" name="id">
		</li>
	
		<li>
			<label for="loginPw">비밀번호</label>
			<input type="password" placeholder="비밀번호를 입력해 주세요" name="pw">
		</li>

		<li id="loginLi">
			<input type="submit" id="loginBtn" value="로그인" >
		</li>
		
		<li>
			<input type="button" id="joinBtn" value="회원가입" onclick="location.href='join.go'">
			<input type="button" id="findBtn" value="계정찾기" onclick="location.href='accountFind.go'">
		</li>
		
					
	</ul>
</div>

</form>

</body>
<script>

</script>
</html>