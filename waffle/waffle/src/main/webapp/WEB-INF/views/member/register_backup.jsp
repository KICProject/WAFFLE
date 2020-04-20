<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원가입</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cancle").on("click", function(){
				
				location.href = "/login";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#memId").val()==""){
					alert("아이디를 입력해주세요.");
					$("#memId").focus();
					return false;
				}
				if($("#memPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#memPass").focus();
					return false;
				}
				if($("#memName").val()==""){
					alert("성명을 입력해주세요.");
					$("#memName").focus();
					return false;
				}
				if($("#memBirth").val()==""){
					alert("생년월일을 입력해주세요.");
					$("#memBirth").focus();
					return false;
				}
				if($("#memPhone").val()==""){
					alert("전화번호를 입력해주세요.");
					$("#memPhone").focus();
					return false;
				}
				if($("#memPhone2").val()==""){
					alert("후대전화를 입력해주세요.");
					$("#memPhone2").focus();
					return false;
				}
				if($("#memEmail").val()==""){
					alert("후대전화를 입력해주세요.");
					$("#memEmail").focus();
					return false;
				}
				if($("#memAddr").val()==""){
					alert("주소를 입력해주세요.");
					$("#memAddr").focus();
					return false;
				}
			});
		})
	</script>
	<body>
		<section id="container">
			<form action="/member/register" method="post">
				<div class="form-group has-feedback">
			        <label for="memId">아이디</label>
			        <input type="text" class="form-control" id="memId" name="memId" placeholder="ID" required>
			 	</div>
			    <!-- 비밀번호 -->
			    <div class="form-group has-feedback">
			        <label for="memPass">비밀번호</label>
			        <input type="password" class="form-control" id="memPass" name="memPass" placeholder="PASSWORD" required>
			    </div>
			    <!-- 비밀번호 재확인 -->
			    <div class="form-group has-feedback">
			        <label for="memPass2">비밀번호 확인</label>
			        <input type="password" class="form-control" id="memPass2" name="memPass2" placeholder="Confirm Password" required>
			    </div>
			    <!-- 이름 -->
			    <div class="form-group has-feedback">
			        <label for="memName">이름</label>
			        <input type="text" class="form-control" id="memName" name="memName" placeholder="Name" required>
			    </div>
			    <!-- 생년월일 -->
			    <div class="form-group required">
			        <label for="memBirth">생년월일</label>
			        <input type="text" class="form-control" id="memBirth" name="memBirth" placeholder="ex) 19990415" required>
			    </div>
			    <!-- 본인확인 이메일 -->
			    <div class="form-group has-feedback">
			        <label for="memEmail">이메일</label>
			        <input type="text" class="form-control" name="memEmail" id="memEmail" placeholder="E-mail" required>
			        <!-- <input type="text" style="margin-top: 5px;"class="email_form" name="email_confirm" id="email_confirm" placeholder="인증번호를 입력해주세요!" required>
									<button type="button" class="btn btn-outline-danger btn-sm px-3" onclick="confirm_email()">
										<i class="fa fa-envelope"></i>&nbsp;인증
									</button>&nbsp;
									<button type="button" class="btn btn-outline-info btn-sm px-3">
										<i class="fa fa-envelope"></i>&nbsp;확인
									</button>&nbsp; -->			        
			    </div>
			    <!-- 휴대전화 -->
			    <div class="form-group has-feedback">
			        <label for="memPhone">휴대전화 ('-' 없이 번호만 입력해주세요)</label>
			        <input type="text" class="form-control" id="memPhone" name="memPhone" placeholder="Phone Number" required>
			    </div>
			    <div class="form-group has-feedback">
			        <label for="memPhone2">비상시연락처 ('-' 없이 번호만 입력해주세요)</label>
			        <input type="text" class="form-control" id="memPhone2" name="memPhone2" placeholder="Phone Number" required>
			    </div>
			    <div class="form-group has-feedback">
			        <label for="memAddr">주소를 입력해주세요</label>
			        <input type="text" class="form-control" id="memAddr" name="memAddr" placeholder="Address" required>
			    </div>
			    <div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원가입</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
			</form>
		</section>
		
	</body>
	
</html>