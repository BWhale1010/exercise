<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/reset.css">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>

<h3 id="resetTitle">계정 찾기 결과</h3>

<div id="resetBox">

<ul>
	<li>
		<label>아이디</label>
		<input type="text" id="findId" value="${id}" readonly>
	</li>
	<li>
		<label for="pw">비밀번호</label>
		<input type="password" id="pw" placeholder="비밀번호를 입력해 주세요">
		<span class="msg1"></span>
	</li>
	<li>
		<label for="pw">비밀번호 확인</label>
		<input type="password" id="pwCheck" placeholder="비밀번호 확인을 입력해 주세요">
		<span class="msg2"></span>
	</li>

	<li id="exLi">
		<input type="button" id="resetBtn" value="비밀번호 재설정">
		<input type="button" id="backBtn" onclick="history.go(-1)" value="뒤로가기">
	</li>
</ul>

</div>


</body>
<script>

var pwReg = false;


$('#resetBtn').click(function(){
	$pw = $('#pw');
	$pwCheck = $('#pwCheck');
	
	if($pw.val() == ''){
		alert('비밀번호를 입력해 주세요');
		$pw.focus();
	}else if(!pwReg){
		alert('비밀번호를 다시 입력해 주세요');
		$pw.focus();
	}else if($pwCheck.val() == ''){
		alert('비밀번호 확인을 입력해 주세요');
		$pwCheck.focus();
	}else if($pw.val() != $pwCheck.val()){
		alert('비밀번호 확인을 다시 입력해 주세요');
		$pwCheck.focus();
	}else{
		var pw = $pw.val();
		var id = $('#findId').val()
		var rtn;
		rtn = confirm('비밀번호를 변경하시겠습니까?');
		if(rtn){
			$.ajax({
				type: 'post',
				url : 'pwReset.ajax',
				data : {'pw':pw, 'id':id},
				dataType : 'JSON',
				success : function(data){
					location.href ="/";
				},
				error : function(e){
					
				}			
			});	
		}
	}	
});




$(function(){
	$('input[type=password]').blur(function(){
		var cid = $(this).attr('id');
		var cv;
		cv = groSpace($(this).val());
		
		if(cv ==''){
			$(this).siblings('.msg1').text("비밀번호를 입력해 주세요");
			$(this).siblings('.msg2').text("비밀번호 확인을 입력해 주세요");
		}else if(cid == 'pw'){
			if(!validReg(cv,cid)){
				$('.msg1').html("비밀번호는 6~10자의 영문자 또는 숫자로만 입력해 주세요");
			}else{
				$('.msg1').html('<b style="color:blue">사용가능한 비밀번호입니다</b>');
				pwReg = true;
			}
		}else if(cid = 'pwCheck'){
			if(cv != $('#pw').val()){
				$('.msg2').html("비밀번호가 불일치 합니다");
			}else{
				$('.msg2').html('<b style="color:blue">비밀번호가 일치 합니다</b>');
			}
		}		
	});	
});

function groSpace(val){ // val - 전달 변수
    var newval = val.replace(/\s/g,"");
    // replace(바꾸고 싶은 값, 바꿀 값)
    // 바꾸고 싶은 값을 정규식으로 찾아 모두 바꿈
    // 슬래쉬 사이에 값을 쓰고 g 플래그를 사용하여 모두 바꿈
    // 스페이스는 정규식에서 \s로 표시
    // /\s/g -> 스페이스를 모두 찾아라

    // 변경된 값을 반환
    return newval;// 호출한 곳으로 변경된 값을 가지고 돌아간다.

}

function validReg(val, cid) {
    // val - 검사할 값, cid - 처리구분아이디
    //console.log(val+"/"+cid);

    // 정규식 변수
    var reg;

	//비밀번호
   	reg = /^[a-zA-Z0-9]{6,10}$/g;
   	//비밀번호 6~10자 영문자 또는 숫자

    //console.log("정규식:"+reg);
    // 검사결과 리턴
    // test(값) 값을 검사하여 
    // true/false 리턴하는 JS내장함수
    return reg.test(val);
}




</script>
</html>