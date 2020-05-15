<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="/js/update.js"></script>
<link rel="stylesheet" type="text/css" href="/css/update.css" />
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
				alert("휴대전화를 입력해주세요.");
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
						<label for="memPhone">휴대전화<br>('-' 없이 번호만 입력해주세요)</label>
				        <input type="text" id="memPhone" name="memPhone" value="${member.memPhone }" required>
				        <p id="phoneValidate_message"></p>
					</div>
					<div class="updategrp memPhone2">
						 <label for="memPhone2">비상시연락처<br>('-' 없이 번호만 입력해주세요)</label>
				        <input type="text" id="memPhone2" name="memPhone2" placeholder="${member.memPhone2}" required>
				        <p id="phone2Validate_message"></p>
					</div>
					<div class="updategrp">
						<label for="memAddr">주소</label> <input type="text" class="input-control" id="memAddr" name="memAddr" value="${member.memAddr}" required>
					</div>
					<input type="hidden" id="memAuthor" name="memAuthor" value="${member.memAuthor }">
					<div class="btngrp">
						<button class="update_btn" type="button" id="submit">회원정보수정</button>
						<button class="bye" type="button" id="bye">회원탈퇴</button>
						<button class="cancle" type="button">취소</button>
					</div>
				</form>

			</div>
		</div>
	</div>