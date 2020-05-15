var pass_chk = 0;
var re = /^[a-zA-Z0-9]{4,12}$/; // 아이디와 적합한지 검사할 정규식
var re2 = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{6,16}$/; //패스워드(특수문자,영문,숫자) 검사 정규식
var re3 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
var re4 = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g; // 전화번호 검사 규칙


function fn_idChk(){
	$.ajax({
		url : "/member/memberUpdate",
		type : "post",
		dataType : "json",
		data : $("#updateForm").serializeArray(),
		success : function(data){
			if(data == true){				
				alert('회원정보 수정이 성공하였습니다.')
				location.href="/member/mypage"
			}else{
				alert("회줭정보 수정에 실패핬습니다.");
			}
		}
	})
}
$(document).ready(function() {
	// 취소
	$(".cancle").on("click", function() {
		location.href = "redirect:/";
	})	
	//비밀번호 체크
	$('#memPass').on("focusout",function() {
		var validate = re2.test($(this).val());
		if(!validate){
			$(this).val("");
			$('#pwValidate_message').attr('style','color:#f00; display:block; clear:left; float:left; margin-left:300px; height:20px;');
			$('#pwValidate_message').text('6~16자의 영문,특수문자,숫자로 입력해주세요.');
			return false;
		}else{
			$('#pwValidate_message').text('');
			return true;			
		}				
	})
	// 비밀번호 확인 체크
	$('#memPass2').on("focusout",function() {
		if (($(this).val() == '')|| ($('#memPass').val() == '')) {
			$('#compare_pass').attr('style','color:#f00; display:block; clear:left; float:left; margin-left:300px; height:20px;');
			$('#compare_pass').text('비밀번호를 입력해주세요.');
		} else {
			if ($(this).val() == $('#memPass').val()) {
				pass_chk = 1;
				$('#compare_pass').attr('style','color:#0f0; display:block; clear:left; float:left; margin-left:300px; height:20px;');
				$('#compare_pass').text('비밀번호가 일치합니다.');
			} else {
				$('#compare_pass').attr('style','color:#f00; display:block; clear:left; float:left; margin-left:300px; height:20px;');
				$('#compare_pass').text('비밀번호가 일치하지 않습니다.');
			}
		}
	})
	//전화번호 유효성 체크
	$('#memPhone').on("blur",function() {
		console.log($(this).val());
		var validate = re4.test($(this).val());
		console.log(validate);
		if(!validate){
			$(this).empty();
			$(this).focus();
			$('#phoneValidate_message').attr('style','color:#f00; display:block; clear:left; float:left; margin-left:230px;');
			$('#phoneValidate_message').text('숫자만 입력해주세요.');
			return false;
		}else{
			$('#phoneValidate_message').text('');
		}
	})
	$('#memPhone2').on("blur",function() {
		console.log($(this).val());
		var validate = re4.test($(this).val());
		if(!validate){
			$(this).empty();
			$(this).focus();
			$('#phone2Validate_message').attr('style','color:#f00; display:block; clear:left; float:left; margin-left:230px;');
			$('#phone2Validate_message').text('숫자만 입력해주세요.');
			return false;
		}else{
			$('#phone2Validate_message').text('');
		}
	})
	
	
})







