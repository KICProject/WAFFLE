var id_dbck = 0;
var pass_chk = 0;

function passCheck(){
	/*// 입력체크
	if (($('#memPass2').val() == '')|| ($('#memPass').val() == '')) {
		$('#compare_pass').attr('style','color:#f00; display:block; clear:left; float:left; margin-left:230px;');
		$('#compare_pass').text('비밀번호를 입력해주세요.');
		return false;
	}*/
		
	// 길이
	if(!/^[a-zA-Z0-9!@#$%^&*()?_~]{6,15}$/.test($('#memPass')))
	{
	    alert("비밀번호는 숫자, 영문, 특수문자 조합으로 6~15자리를 사용해야 합니다.");
	}
	// 영문, 숫자, 특수문자 2종 이상 혼용
	var chk = 0;
	if($('#memPass').search(/[0-9]/g) != -1 ) chk ++;
	if($('#memPass').search(/[a-z]/ig)  != -1 ) chk ++;
	if($('#memPass').search(/[!@#$%^&*()?_~]/g)  != -1  ) chk ++;
	if(chk < 2)
	{
	    alert("비밀번호는 숫자, 영문, 특수문자를 두가지이상 혼용하여야 합니다.");
	}
	
	// 동일한 문자/숫자 4이상, 연속된 문자
	if(/(\w)\1\1\1/.test($('#memPass')) || isContinuedValue($('#memPass')))
	{
	    alert("비밀번호에 4자 이상의 연속 또는 반복 문자 및 숫자를 사용하실 수 없습니다.");
	}
	
	
	// 아이디 포함 여부
	if($('#memPass').search($('#memId'))>-1)
	{
	    alert("ID가 포함된 비밀번호는 사용하실 수 없습니다.");
	}
	
	//일치체크	
	if ($(this).val() == $('#memPass').val()) {
		pass_chk = 1;
		$('#compare_pass').attr('style','color:#0f0; display:block; clear:left; float:left; margin-left:230px;');
		$('#compare_pass').text('비밀번호가 일치합니다.');
	} else {
		$('#compare_pass').attr('style','color:#f00; display:block; clear:left; float:left; margin-left:230px;');
		$('#compare_pass').text('비밀번호가 일치하지 않습니다.');
	}

}

function fn_idChk() {
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
$(document).ready(function() {
		console.log(id_dbck);
		// 취소
		$(".cancle").on("click", function() {
			location.href = "/login";
		})
		// 비밀번호 확인 체크
		$('#memPass2').on("focusout",passCheck());
		
		$("#submit").on("click", function() {
			console.log(id_dbck);
			if ($("#memId").val() == "") {
				alert("아이디를 입력해주세요.");
				$("#memId").focus();
				return false;
			}
			if (id_dbck == 0) {
				alert("아이디 중복체크를 해주세요.");
				$('#idChk').focus();
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
				alert("후대전화를 입력해주세요.");
				$("#memEmail").focus();
				return false;
			}
			if ($("#memAddr").val() == "") {
				alert("주소를 입력해주세요.");
				$("#memAddr").focus();
				return false;
			}
		})

	})

