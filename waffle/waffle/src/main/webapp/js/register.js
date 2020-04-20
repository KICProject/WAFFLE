var id_dbck = 0;
var pass_chk = 0;

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
			if ($("#memPass").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#memPass").focus();
				return false;
			}
			if (pass_chk == 0) {
				alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요");
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

