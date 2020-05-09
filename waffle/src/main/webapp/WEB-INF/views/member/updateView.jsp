<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="/js/update.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="/css/update2.css" /> -->
<style type="text/css">
body {
	font-family: S-CoreDream-3;
	color: #000;
}

.container>.frame {
	margin: 0 auto;
	margin-top: 20px;
	width: 800px;
	height: 800px;
	overflow: hidden;
}

/* inner things */
.container>.frame>.input {
	overflow: hidden;
	padding-top: 20px;
	position: relative;
	left: 50%;
	transform: translateX(-50%);
	width: 600px;
	height: 800px;
	float: left;
	overflow: hidden;
}

.input form {
	width: 600px;
	height: 600px;
	overflow: hidden;
}

.input .updategrp {
	width: 600px;
	height: 40px;
	color: #000;
	font-size: 14px;
	margin-bottom: 20px;
	overflow: hidden;
}

.input .updategrp label {
	display: block;
	width: 180px;
	height: 35px;
	float: left;
	line-height: 35px;
}

.input .updategrp input {
	width: 290px;
	height: 33px;
	float: right;
	line-height: 35px;
	margin-left: 30px;
}

.input .passchkgrp1, .input .passchkgrp2 {
	width: 600px;
	height: 60px;
	color: #000;
	font-size: 14px;
	overflow: hidden;
}

.input .passchkgrp1 label, .input .passchkgrp2 label {
	display: block;
	width: 180px;
	height: 35px;
	float: left;
	line-height: 35px;
}

.input .passchkgrp1 input, .input .passchkgrp2 input {
	width: 290px;
	height: 33px;
	float: right;
	line-height: 35px;
	margin-left: 30px;
}

.input .memPhone, .input .memPhone2 {
	height: 40px;
}

.input .memPhone label, .input .memPhone2 label {
	height: 40px;
	line-height: 20px;
}

.btngrp {
	width: 420px;
	height: 30px;
	margin: 30px auto;
}

button {
	width: 120px;
	height: 30px;
	opacity: 0.73;
	border-radius: 24.5px;
	background-color: #888;
	margin-right: 30px;
	color: #fff;
	display: block;
	float: left;
}

.update_btn {
	background-color: #afde77;
}

.cancle {
	margin-right: 0;
}
</style>
</head>
<script>
	$(function(){
		// 취소
		$(".cancle").on("click", function() {
			location.href = "/member/mypage";
		})	
		$(".update_btn").on("click", function() {
			if ($('#memPass').val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#memPass").focus();
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
	
			fn_idChk()
	
		})
	})
</script>
<body>
	<div class="container">
		<div class="frame">
			<div class="input">
				<form action="/member/register" method="post" id="updateForm">
					<div class="updategrp">
						<label for="memId">아이디</label> <input type="text"
							class="input-control" id="memId" name="memId"
							value="${member.memId }" readonly>
					</div>
					<!-- 비밀번호 -->
					<div class="passchkgrp1">
						<label for="memPass">비밀번호</label> <input type="password"
							id="memPass" name="memPass" placeholder="비밀번호" required>
						<p id="pwValidate_message"></p>
					</div>
					<!-- 비밀번호 재확인 -->
					<div class="passchkgrp2">
						<label for="memPass2">비밀번호 확인</label> <input type="password"
							id="memPass2" name="memPass2" placeholder="비밀번호 확인" required><br>
						<p id="compare_pass"></p>
					</div>
					<!-- 이름 -->
					<div class="updategrp">
						<label for="memName">이름</label> <input type="text"
							class="input-control" id="memName" name="memName"
							value="${member.memName }" required>
					</div>
					<!-- 생년월일 -->
					<div class="updategrp">
						<label for="memBirth">생년월일</label> <input type="text"
							class="input-control" id="memBirth" name="memBirth"
							value="${member.memBirth}" required>
					</div>
					<!-- 본인확인 이메일 -->
					<div class="updategrp ">
						<label for="memEmail">이메일</label> <input type="text"
							class="input-control" name="memEmail" id="memEmail"
							value="${member.memEmail}" readonly>
					</div>
					<!-- 휴대전화 -->
					<div class="updategrp memPhone">
						<label for="memPhone">휴대전화<br>('-' 없이 번호만 입력)
						</label> <input type="text" class="input-control" id="memPhone"
							name="memPhone" value="${member.memPhone}" required>
					</div>
					<div class="updategrp memPhone2">
						<label for="memPhone2">비상시연락처<br>('-' 없이 번호만 입력)
						</label> <input type="text" class="input-control" id="memPhone2"
							name="memPhone2" value="${member.memPhone2}" required>
					</div>
					<div class="updategrp">
						<label for="memAddr">주소</label> <input type="text"
							class="input-control" id="memAddr" name="memAddr"
							value="${member.memAddr}" required>
					</div>
					<input type="hidden" id="memAuthor" name="memAuthor"
						value="${member.memAuthor }">
					<div class="btngrp">
						<button class="update_btn" type="button" id="submit">회원정보수정</button>
						<button class="bye" type="button" id="bye">회원탈퇴</button>
						<button class="cancle" type="button">취소</button>
					</div>
				</form>

			</div>
		</div>
	</div>