<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인덱스</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>

<h3>인덱스</h3>
<a href="login.go">로그인</a>
<a href="join.go">회원가입</a>

</body>
<script>
var msg = "${msg}";

if(msg != "" && msg != null){
	alert(msg);
}

</script>
</html>