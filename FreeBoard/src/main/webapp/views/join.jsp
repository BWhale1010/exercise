<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/join.css">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>

<h3 id="joinTitle">회원가입</h3>
<br>
<div id="joinBox">
	<ul>
	
		<li>필수 입력</li>
		<li>
			<label for="userId">아이디</label>
			<input type="text" id="userId" placeholder="아이디를 입력해 주세요">
<!-- 			<input type="button" id="idOverlay" value="아이디 중복체크"> -->
			<span class="msg1"></span>
		</li>
		
		<li>
			<label for="pw">비밀번호</label>
			<input type="password" id="pw" placeholder="비밀번호를 입력해 주세요">
			<span class="msg2"></span>
		</li>
		
		<li>
			<label for="pw">비밀번호 확인</label>
			<input type="password" id="pwCheck" placeholder="비밀번호 확인을 입력해 주세요">
			<span class="msg3"></span>
		</li>
		
		<li>
			<label for="nickName">닉네임</label>
			<input type="text" id="nickName" placeholder="닉네임을 입력해 주세요">
			<input type="button" id="nNRan" value="닉네임 추천">
			<span class="msg4"></span>
		</li>
		
		<li>
			<label for="email">이메일</label>
			<input type="text" id="email" placeholder="이메일을 입력해 주세요">
			<input type="button" id="mailChkBtn" value="인증번호 발송하기"></input>
			<span class="msg5"></span>
			
		</li>
		
		<li>	
			<label for="blank">&nbsp;</label>
			<input type="text" class="emailChkInput" placeholder="인증번호 6자리를 입력해주세요" maxlength="6" disabled>
		</li>
		
		<br>
		<hr>
		<br>

				
<!-- 		<li>선택 입력</li> -->


		
<!-- 		<li> -->
<!-- 			<label for="userName">이름</label> -->
<!-- 			<input type="text" id="userName" placeholder="이름을 입력해 주세요"> -->
<!-- 		</li>		 -->
		
<!-- 		<li> -->
<!-- 			<label for="gender">성별</label> -->
<!-- 			<input type="radio" name="gender" value="남"> 남자 -->
<!-- 			<input type="radio" name="gender" value="여"> 여자 -->
<!-- 		</li>		 -->
		
<!-- 		<li> -->
<!-- 			<label for="age">나이</label> -->
<!-- 			<input type="text" id="age" placeholder="나이를 입력해 주세요"> -->
<!-- 		</li> -->
		
<!-- 		<li> -->
<!-- 			<label for="address">주소</label> -->
<!-- 			<input type="text" id="postcode" placeholder="우편번호를 입력해 주세요"> -->
<!-- 		</li>		 -->
		
<!-- 		<li> -->
<!-- 			<label for="address"></label> -->
<!-- 			<input type="text" id="roadAddr" placeholder="도로명을 입력해 주세요"> -->
<!-- 		</li> -->
		
<!-- 		<li> -->
<!-- 			<label for="address"></label> -->
<!-- 			<input type="text" id="detailAddr" placeholder="상세주소를 입력해 주세요"> -->
<!-- 		</li>		 -->
		
<!-- 		<li> -->
<!-- 			<label for="phone">전화번호</label> -->
<!-- 			<input type="tel" id="phone" placeholder="전화번호를 입력해 주세요"> -->
<!-- 		</li>		 -->
		
		<li id="joinLi">
			<input id="joinBtn" type="button" value="회원가입">
		</li>
	
	</ul>


</div>

</body>
<script>
// valTest();
var idOverChk = false; // 아이디 중복검사 유무 확인용 변수
var emailOverChk = false; // 이메일 중복 확인
var emailChk = false; // 이메일 발송 유무 확인용 변수
var nickOver = false; // 닉네임 중복확인 변수


// 회원 가입 버튼 눌렀을 경우

$('#joinBtn').click(function(){
	
	$id = $('#userId');
	$pw = $('#pw');
	$pwCheck = $('#pwCheck');
	$nickName = $('#nickName');
	$email = $('#email');
	$emailChkInput = $('#emailChkInput');
	
	if($id.val() == ''){
		alert('아이디를 입력해 주세요');
		$id.focus();
	}else if(!idOverChk){
		alert('아이디 중복을 확인해 주세요');
		$id.focus();
	}else if($pw.val() == ''){
		alert('비밀번호를 입력해 주세요');
		$pw.focus();
	}else if($pwCheck.val() == ''){
		alert('비밀번호 확인을 입력해 주세요');
		$pwCheck.focus();
	}else if($pw.val() != $pwCheck.val()){
		alert('비밀번호 확인을 다시 입력해 주세요');
		$pwCheck.focus();
	}else if($nickName.val() == ''){
		alert('닉네임을 입력해 주세요');
		$nickName.focus();
	}else if($email.val() == ''){
		alert('이메일을 입력해 주세요');
		$id.focus();
	}else if(!emailChk){
		alert('이메일 인증을 진행해주세요');
	}else if($emailChkInput.val() == ''){
		alert('인증번호를 입력해 주세요');
		$emailChkInput.focus();		
	}else{
		 var param = {};
		 param.id = $id.val();
		 param.pw = $pw.val();
		 param.nickName = $nickName.val();
		 param.email = $email.val();
		 
		 $.ajax({
			 type: 'post',
			 url : 'join.ajax',
			 data : param,
			 dataType : 'JSON',
			 success : function(data){
				 if(data.success=1){
					 alert("회원가입에 성공했습니다.");
					 location.href="./";
				 }else{
					alert("회원 가입에 실패했습니다.")
				}				 
			 },
			 error : function(e){
				 console.log(e);
			 }
			 
		 });
		 
		 
		
	}	
	
	
});

// ------------------------------------------------------------------------------------

// 아이디 중복 확인 

function idOver(){
	
	var id = $("#userId").val();
	
	if(id != ''){
		$.ajax({
			type:'post',
			url: 'idOver.ajax',
			data : {'id':id},
			dataType : 'JSON',
			success : function(data){
				console.log(data);
				if(data.idOver){
					$('.msg1').html('이미 사용 중인 아이디입니다');
					$('#userId').val('');
				}
				else{
					idOverChk = true;
					$('.msg1').html('<b style="color:blue">사용가능한 아이디 입니다</b>');
				}
			},
			error: function(e){
				console.log(e);
			}
		});		
	}
}


	
	


// -------------------------------------------------------------------------------------

// 닉네임 중복확인 

function nickNameOver(nickName){
	
		$.ajax({
			type: 'post',
			url : 'nickOver.ajax',
			data : {nickName:'nickName'},
			dataType: 'JSON',
			success : function(data){
				console.log(data);
				if(data.nickOver){
					$('.msg4').html('이미 사용 중인 닉네임입니다');
					$('#nickName').val('');
				}else{
					$('.msg4').html('<b style="color:blue">사용가능한 닉네임 입니다.</b>');
					nickOver = true;
				}
			},
			error: function(e){
				console.log(e);
			}
		});			
}


// 닉네임 포커스 아웃 때	
$('#nickName').on('blur',function(){
	var nickName = $('#nickName').val();
	
	if(nickName == ''){
		$('.msg4').html("닉네임을 입력해 주세요");
	}else{
		nickNameOver(nickName);	
	}
	
	
	
});



// 닉네임 추천

$('#nNRan').click(function(){
	$nickName = $('#nickName').val();	
	
	$.get({
		type: 'get',
		url: 'https://nickname.hwanmoo.kr/?format=json&count=1',
		data : {},
		dataType: 'text',
		success: function(data){			 
	
		//console.log(data);
		var str = data;
		var words = str.split('"');
		//console.log(words[3]);
		
		 var nickName =  $("#nickName").val(words[3]);
		 nickNameOver(nickName);
		 },
		 error: function(e){
			 alert('닉네임을 불러오는데 실패하였습니다.');
		 }
	});
	
	
	
});











// 이메일 중복확인

function emailOver(){
	
	var email = $("#email").val();
	console.log(email);
		
		// 이메일 중복확인
		if(email != ''){
			$.ajax({
				type:'post',
				url: 'emailOver.ajax',
				data : {'email':email},
				dataType : 'JSON',
				success : function(data){
					console.log(data);
					if(data.emailOver){
						$('.msg5').html('이미 사용 중인 이메일입니다.');
						$('#email').val('');
					}
					else{
					
						$('.msg5').html('<b style="color:blue">사용가능한 이메일 입니다.</b>');
						
						// 이메일 발송
						$('#mailChkBtn').click(function(){
							var emailChkInput = $('.emailChkInput'); 
							
							$.ajax({
								type: 'get',
								url : 'mailChk.ajax',
								data : {'email':email},
								dataType : 'JSON',
								success: function(data){
									console.log(data);
									emailChkInput.attr('disabled', false);
									code = data;
									$('.msg5').html('<b style="color:blue">이메일이 발송되었습니다.</b>');
								},
								error: function(e){
									console.log(e);
								}
							});						
						});
						
					}
				},
				error: function(e){
					console.log(e);
				}
			});
		}
}

//-----------------------------------------------------------------------------------

// 이메일 코드 확인
$('.emailChkInput').on('blur',function(){
	var inputCode = $('.emailChkInput').val();
	
	if(inputCode == code){
		$('.msg5').html('<b style="color:blue">인증번호가 일치 합니다.</b>');
		$('#mailChkBtn').attr('disabled', true);
		$('#email').attr('readonly', true);
		emailChk = true;
	}else{
		$('.msg5').html('<b style="color:red">인증번호가 불일치 합니다.</b>');
	}	
});

// -----------------------------------------------------------------------------------

// 입력 값 확인

$(function(){
	
	$("input[type=text],input[type=password]")
	.blur(function(){
		var cid = $(this).attr("id");
		var cv;
		cv = groSpace($(this).val());		
		
		if(cv== ""){
			$(this).siblings('.msg1').text("아이디를 입력해 주세요");
			$(this).siblings(".msg2").text("비밀번호를 입력해 주세요");
			$(this).siblings(".msg3").text("비밀번호 확인을 입력해 주세요");
			$(this).siblings(".msg5").text("이메일을 입력해 주세요");
		}else if(cid == "userId"){
			if(!validReg(cv,cid)){
				$('.msg1').html("아이디는 6~10자의 영문자와 숫자로만 입력해 주세요");
			}else{
				idOver();
			}
		}else if(cid == "pw"){
			if(!validReg(cv,cid)){
				$('.msg2').html("비밀번호는 6~10자의 영문자 또는 숫자로만 입력해 주세요");
			}else{
				$('.msg2').html('<b style="color:blue">사용가능한 비밀번호입니다</b>');
			}			
		}else if(cid == "pwCheck"){
			if(cv !== $('#pw').val()){
				$('.msg3').html("비밀번호가 불일치 합니다");
			}else{
				$('.msg3').html('<b style="color:blue">비밀번호가 일치 합니다</b>');
			}
		}else if(cid == "email"){
			if(!validReg(cv,cid)){
				$('.msg5').html("이메일 형식에 맞게 입력해 주세요");
			}else{
				emailOver();
			}			
		}		
	})	
	
});

// -------------------------------------------------------------------------------------------------
// 인풋 유효성 검사

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

    switch (cid) {
        case "userId": //아이디
        	 reg = /^[a-zA-Z0-9]{6,10}$/g;
            //아이디는 6~10자 영문자 또는 숫자
            break;
        case "pw": //비밀번호
        	reg = /^[a-zA-Z0-9]{6,10}$/g;
        	//비밀번호 6~10자 영문자 또는 숫자
            break;
        case "nickName": //아이디
        	reg = /^[a-zA-Z0-9]{6,10}$/g;
            //닉네임 6~10자 영문자 또는 숫자
            break;
        case "email": //이메일
            reg = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
            break;

    } ///// switch case문 ///////

    //console.log("정규식:"+reg);
    // 검사결과 리턴
    // test(값) 값을 검사하여 
    // true/false 리턴하는 JS내장함수
    return reg.test(val);

}
// ------------------------------------------------------------------------------------




</script>
</html>