<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/find.css">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>

<h3 id="findTitle">계정 찾기</h3>

<div id="findBox">
	<ul>
		<li>
			<label>이메일</label>
			<input type="text" id="email" name="email" placeholder="이메일을 입력해 주세요" required="required">
			<input type="button" id="mailChkBtn" value="인증번호 발송하기"></input>
			<span class="msg"></span>
		</li>
		<li>	
			<label for="blank">&nbsp;</label>
			<input type="text" class="emailChkInput" placeholder="인증번호 6자리를 입력해주세요" maxlength="6" disabled>
		</li>
		<li>
			<input type="button" id="findBtn" value="계정찾기">
		</li>
	</ul>
</div>

</body>
<script>

var emailChk = false;

$('#mailChkBtn').click(function(){
	email = $('#email').val();
	var emailChkInput =$('.emailChkInput');
	var path = window.location.pathname;
	
	$.ajax({
		type:'get',
		url : 'mailChk.ajax',
		data : {'email':email, 'path':path},
		dataType : 'JSON',
		success : function(data){
			emailChkInput.attr('disabled', false);
			code = data;
			$('.msg').html('<b style="color:blue">이메일이 발송되었습니다.</b>')
		},
		error : function(e){
			console.log(e);
		}
	});
	
});

$('.emailChkInput').on('blur',function(){
	var inputCode = $('.emailChkInput').val();
	
	if(inputCode == code){
		$('.msg').html('<b style="color:blue">인증번호가 일치 합니다.</b>');
		$('#mailChkBtn').attr('disabled', true);
		$('#email').attr('readonly', true);
		emailChk = true;
	}else{
		$('.msg').html('<b style="color:red">인증번호가 불일치 합니다.</b>');
	}	
});

$('#findBtn').click(function(){
	
	if(!emailChk){
		alert("이메일 인증을 진행해 주세요");
		$('.emailChkInput').focus();
	}else{
		
		idPost();
		

	}	
});

function idPost(){
	var form = document.createElement('form');
	var obj;
	obj = document.createElement('input');
	obj.setAttribute('type','text');
	obj.setAttribute('name','email');
	obj.setAttribute('value', $('#email').val());
	form.appendChild(obj);
	form.setAttribute('method','post');
	form.setAttribute('action', "idFind.go");
	document.body.appendChild(form);
	form.submit();
	
	
}




</script>
</html>