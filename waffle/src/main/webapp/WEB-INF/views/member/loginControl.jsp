<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WAFFLE</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/login.css" />	
</head>
<script type="text/javascript">
	$(document).ready(function(){		
		$("#signin_btn").on("click",function(){
			location.href="./agree";
		})					
	})
</script>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<div class="container">
		<div class="login_frame">
			<h2>LOGIN</h2>
			<span class="logo">WAFFLE</span>
			<span class="intro">IoT Service</span>
			<span class="box1"></span><span class="box2"></span>
			
			<div class="login_input">
				<form name='homeForm' method="post" action="./login">
				<c:if test="${member == null}">		
					<input type="text" name="memId" id="memId" placeholder="아이디"><br>
					<input type="password" name="memPass" id="memPass" placeholder="비밀번호"><br>
				<button type="submit" id="con_login_btn">로그인</button><br>
				</c:if>
				<c:if test="${msg == false}">
					<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
				</c:if>
				</form>				
				<ul class="find_account">
					<li><a href="#">아이디 찾기</a><span>&nbsp;&nbsp;&nbsp;|</span></li>					
					<li><a href="#">비밀번호 찾기</a></li>
				</ul><br>
				<!-- <span class="SNS"> SNS 로그인</span><br>
				<ul class="api_login">
					<li><a href="#" id="nvr_btn"><img src="/img/naver_btn.png"></a></li>
					<li><a href="https://kauth.kakao.com/oauth/authorize?client_id=e1d6e555ab653c2367b93a83450e0e0e&redirect_uri=http://localhost:8090/member/kakaologin&response_type=code" id="kko_btn"><img src="/img/kakao_btn.png"></a></li>
				</ul> --> 	
							
			</div>
			<span class="middle_line"></span>
			<div class="singin_box">
				<p>아직 회원가입 전이세요?</p>
				<span>회원등록하시고 와플의 다양한 서비스를 이용해보세요</span><br>
				<button type="button" id="signin_btn">회원가입</button>
			</div>
		</div>
	</div>
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
		<script src="/js/app.js"></script>
</body>
</html>