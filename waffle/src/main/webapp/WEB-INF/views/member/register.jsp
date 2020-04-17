<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/css/register.css" />
	<script src="/js/register.js"></script>
</head>

<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<div class="container">
		<div class="frame">
			<h2>SIGN IN</h2>
			<span class="logo">WAFFLE</span>
			<span class="intro">IoT Service</span>
			<span class="box1"></span><span class="box2"></span>
			
			<div class="input">
				<form action="/member/register" method="post">
					<div class="form-group">
				        <label for="memId">아이디</label>
				        <input type="text" class="form-control" id="memId" name="memId" placeholder="ID" required>
				        <button class="idChk" type="button" id="idChk" onclick="fn_idChk()" value="N">중복확인</button>
				 	</div>
				    <!-- 비밀번호 -->
				    <div class="form-group">
				        <label for="memPass">비밀번호</label>
				        <input type="password" class="form-control" id="memPass" name="memPass" placeholder="PASSWORD" required>
				    </div>
				    <!-- 비밀번호 재확인 -->
				    <div class="form-group passchkgrp">
				        <label for="memPass2">비밀번호 확인</label>
				        <input type="password" class="form-control" id="memPass2" name="memPass2" placeholder="Confirm Password" required><br>
				        <p id="compare_pass"> </p>
				    </div>
				    <!-- 이름 -->
				    <div class="form-group ">
				        <label for="memName">이름</label>
				        <input type="text" class="form-control" id="memName" name="memName" placeholder="Name" required>
				    </div>
				    <!-- 생년월일 -->
				    <div class="form-group">
				        <label for="memBirth">생년월일</label>
				        <input type="text" class="form-control" id="memBirth" name="memBirth" placeholder="ex) 19990415" required>
				    </div>
				    <!-- 본인확인 이메일 -->
				    <div class="form-group">
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
				    <div class="form-group memPhone">
				        <label for="memPhone">휴대전화<br>('-' 없이 번호만 입력해주세요)</label>
				        <input type="text" class="form-control" id="memPhone" name="memPhone" placeholder="Phone Number" required>
				    </div>
				    <div class="form-group memPhone2">
				        <label for="memPhone2">비상시연락처<br>('-' 없이 번호만 입력해주세요)</label>
				        <input type="text" class="form-control" id="memPhone2" name="memPhone2" placeholder="Phone Number" required>
				    </div>
				    <div class="form-group">
				        <label for="memAddr">주소를 입력해주세요</label>
				        <input type="text" class="form-control" id="memAddr" name="memAddr" placeholder="Address" required>
				    </div>
				    <input type="hidden" id="memAuthor" name="memAuthor" value="0"/>
				    
					<button class="reg_btn" type="submit" id="submit">회원가입</button>						
					
				</form>		
			</div>				
		</div>	
	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	<script src="/js/app.js"></script>
</body>
</html>