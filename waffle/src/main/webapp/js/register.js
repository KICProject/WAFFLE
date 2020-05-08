var id_dbck = 0;
var pass_chk = 0;
var email_dbck =0;
var re = /^[a-zA-Z0-9]{4,12}$/; // 아이디와 패스워드가 적합한지 검사할 정규식
var re2 = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{6,16}$/;
var re3 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
var re4 = /^\d{2,3}\d{3,4}\d{4}$/; // 전화번호 검사 규칙


function check(re, what, message) {
    if(re.test(what.value)) {
        return true;
    }
    alert(message);
    what.value = "";
    what.focus();
}

$(document).ready(function() {
	// 취소
	$(".cancle").on("click", function() {
		location.href = "/login";
	})
	//아이디 입력체크
	$('#memId').on("focusout",function() {		
		var validate = re.test($(this).val());
		if(!validate){
			$(this).val("");
			$('#idValidate_message').attr('style','color:#f00; display:block; clear:left; float:left; margin-left:230px; font-size:14px;');
			$('#idValidate_message').text('아이디는 4~12자의 영문 대소문자로 입력해주세요.');
			return false;
		}else{
			$('#idValidate_message').text('');
			return true;			
		}				
	})
	//비밀번호 체크
	$('#memPass').on("focusout",function() {
		var validate = re2.test($(this).val());
		if(!validate){
			$(this).val("");
			$('#pwValidate_message').attr('style','color:#f00; display:block; clear:left; float:left; margin-left:230px;');
			$('#pwValidate_message').text('비밀번호는 6~16자의 영문,특수문자,숫자로 입력해주세요.');
			return false;
		}else{
			$('#pwValidate_message').text('');
			return true;			
		}				
	})
	// 비밀번호 확인 체크
	$('#memPass2').on("focusout",function() {
		if (($(this).val() == '')|| ($('#memPass').val() == '')) {
			$('#compare_pass').attr('style','color:#f00; display:block; clear:left; float:left; margin-left:230px;');
			$('#compare_pass').text('비밀번호를 입력해주세요.');
		} else {
			if ($(this).val() == $('#memPass').val()) {
				pass_chk = 1;
				$('#compare_pass').attr('style','color:#0f0; display:block; clear:left; float:left; margin-left:230px;');
				$('#compare_pass').text('비밀번호가 일치합니다.');
			} else {
				$('#compare_pass').attr('style','color:#f00; display:block; clear:left; float:left; margin-left:230px;');
				$('#compare_pass').text('비밀번호가 일치하지 않습니다.');
			}
		}
	})
	//이메일
	$('#memEmail').on("focusout",function() {
		var validate = re3.test($(this).val());
		if(!validate){
			$(this).val("");
			$('#emailValidate_message').attr('style','color:#f00; display:block; clear:left; float:left; margin-left:230px;');
			$('#emailValidate_message').text('이메일 형식에 맞게 입력해주세요.');
			return false;
		}else{
			$('#emailValidate_message').text('');
			return true;			
		}				
	})
	//전화번호 체크
	$('#memPhone').on("blur",function() {
		var validate = re4.test($(this).val());
		if(!validate){
			$(this).val("");
			$(this).focus();
			alert('전화번호는 숫자만 입력해주세요');
			return false;
		}
	})
	$('#memPhone2').on("blur",function() {
		var validate = re4.test($(this).val());
		if(!validate){
			$(this).val("");
			$(this).focus();
			alert('전화번호는 숫자만 입력해주세요');			
			return false;
		}
	})
	$("#submit").on("click", function(){
		if (id.val() == "") {
			alert("아이디를 입력해주세요.");
			$("#memId").focus();
			return false;
		}
		if (id_dbck == 0) {
			alert("아이디 중복체크를 해주세요.");
			$('#idChk').focus();
			return false;
		}
		if (pw.val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("#memPass").focus();
			return false;
		}
		if ($("#memName").val() == "") {
			alert("성명을 입력해주세요.");
			$("#memName").focus();
			return false;
		}
		if ($("#memBirth").val() == "") {
			alert("생년월일을 입력해주세요.");
			$("#memBirth").focus();
			return false;
		}
		if ($("#memPhone").val() == "") {
			alert("전화번호를 입력해주세요.");
			$("#memPhone").focus();
			return false;
		}
		if ($("#memPhone2").val() == "") {
			alert("후대전화를 입력해주세요.");
			$("#memPhone2").focus();
			return false;
		}
		if ($("#memEmail").val() == "") {
			alert("이메일을 입력해주세요.");
			$("#memEmail").focus();
			return false;
		}
		if (email_dbck == 0) {
			alert("이메일 중복체크를 해주세요.");
			$('#emailChk').focus();
			return false;
		}
		if ($("#zipcode").val() == "") {
			alert("우편번호를 입력해주세요.");
			$(".zipChk").focus();
			return false;
		}
		if ($("#detailAddress").val() == "") {
			alert("상세주소를 입력해주세요.");
			$("#detailAddress").focus();
			return false;
		}
	})
})

function fn_idChk() {
	if($('#memId').val()==""){
		alert('공백 아이디는 입력할 수 없습니다.')
		return false;
	}
	$.ajax({
		url : "/member/idChk",
		type : "post",
		dataType : "json",
		data : {
			"memId" : $("#memId").val()
		},
		success : function(data) {
			if (data == 1) {
				id_dbck = 0;
				console.log(id_dbck);
				alert("중복된 아이디입니다.");
			} else if (data == 0) {
				$("#idChk").attr("value", "Y");
				id_dbck = 1;
				console.log(id_dbck);
				alert("사용가능한 아이디입니다.");
			}
		}
	})
}
function fn_emailChk() {
	if($('#memEmail').val()==""){
		alert('이메일 주소를 입력하셔야 확인이 됩니다.')
		return false;
	}
	$.ajax({
		url : "/member/emailChk",
		type : "post",
		dataType : "json",
		data : {
			"memEmail" : $("#memEmail").val()
		},
		success : function(data) {
			if (data == 1) {
				email_dbck = 0;
				console.log(email_dbck);
				alert("중복된 이메일입니다.");
			} else if (data == 0) {
				$("#emailChk").attr("value", "Y");
				email_dbck = 1;
				console.log(email_dbck);
				alert("사용가능한 이메일입니다.");
			}
		}
	})
}





