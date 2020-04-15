<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/mainstyle.css" />
<link rel="stylesheet" type="text/css" href="/css/header.css" />
<link rel="stylesheet" type="text/css" href="/css/footer.css" />
<link rel="stylesheet" type="text/css" href="/css/login.css" />	
</head>
<script type="text/javascript">
	$(document).ready(function(){
		$("#logoutBtn").on("click", function(){
			location.href="./logout";
		})
		$("#signin_btn").on("click",function(){
			location.href="./agree";
		})
		$("#memberUpdateBtn").on("click",function(){
			location.href="./memberUpdateView";
		})
		
	})
</script>
<body>
	<!-- header -->
	<header>
		<a href="/"><span class="logo">AFFLE</span></a>
		<ul class="gnp">
			<c:if test="${member == null}">
				<li class="login"><a href="member/loginControl" id="login_btn"></a></li>
			</c:if>
			<c:if test="${member != null}">
				<li class="logout"><a href="member/logout" id="logoutBtn"></a></li>
			</c:if>			
			<li class="search"><a href="#"></a></li>
			<li class="my_page"><a href="#"></a></li>
		</ul>
	</header>
	<!-- nav -->
	<nav>
		<div class="hamburg_box">
			<div class="hamburg"></div>
		</div>
		<div class="menu_box">
			<div class="dimmed"></div>
			<div class="menu">
				<div class="btn_x"></div>
				<ul>
					<li><a href="#">About</a></li>
					<li><a href="#">Service</a></li>
					<li><a href="#">Product</a></li>
					<li><a href="#">Customer</a></li>
				</ul>
			</div>
		</div>
	</nav>
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
				<ul>
					<li><a href="#">아이디 찾기</a><span>&nbsp;&nbsp;&nbsp;|</span></li>					
					<li><a href="#">비밀번호 찾기</a></li>
				</ul><br>
				<span class="SNS"> SNS 로그인</span><br>
				<ul>
					<li><a href="#"><img src="" alt="">네이버로고</a></li>
					<li><a href="#"><img src="" alt="">카카오로고</a></li>
				</ul> 	
							
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
		<footer>
			<div class="footer_top">
				<ul class="cs_info">
					<li>와플 고객만족센터</li>
					<li>1544-XXXX</li>
					<li>월요일~금요일 09:00~18:00 / 토요일,일요일,공휴일 휴무</li>
				</ul>
				<ul class="project_info">
					<li>(주)와플 만든이들 : 김민수, 박종혁, 박재은, 신민주, 이정연, 홍대기</li>
					<li>주소 ; 서울 강남구 테헤란로1길 10 세경빌딩 3층</li>
					<li>COPYRIGHT ⓒ WAFFLE ALL RIGHTS RESERVED.</li>
				</ul>
			</div>
			<div class="footer_bottom">
				<ul>
					<li><a href="#">와플 이용약관</a></li>
					<li><a href="#">개인정보처리방침</a></li>
					<li><a href="#">이메일무단수집거부</a></li>
					<li><a href="#">사이트맵</a></li>
				</ul>
			</div>
		</footer>
		<script src="/js/app.js"></script>
</body>
</html>