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
<link rel="stylesheet" type="text/css" href="/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/css/header.css" />
<link rel="stylesheet" type="text/css" href="/css/footer.css" />
</head>
<body>
	
	<!-- header -->
	<header>
		<p class="logo">AFFLE</p>
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
	<c:if test="${member == null}">
		<main>
			<!-- main1 -->
			<section class="main1">
				<article class="main1_left">
					<div class="left_text_box">
						<p class="left_text1">행복을 생각하다</p>
						<p class="left_text2">WAFFLE</p>
						<div class="left_text3">
							<p>WAFFLE은 차별화된 기술력으로</p>
							<p>어디서든(WHEREVER) 안전하게(SARETY) 원하는대로(FLEXIBLE)</p>
							<p>서비스를 제공합니다.</p>
						</div>
					</div>
				</article>
				<article class="main1_right">
					<div class="right_text">집</div>
				</article>
				<div class="scroll_down_box">
					<div class="scroll"></div>
					<p>SCROLL DOWN</p>
				</div>
			</section>
			<!-- main2 -->
			<section class="main2">
				<article class="main2_left">
					<img src="./img/main2_img.jpg">
				</article>
				<article class="main2_right">
					<div class="main2_text_box">
						<p class="right_text1">
							WAFFLE<br> IoT SERVICE
						</p>
						<p class="right_text2">
							미래지향적 시스템인 WAFFLE SERVICE를<br> 경험해보세요
						</p>
						<button>바로가기</button>
					</div>
				</article>
			</section>
			<!-- main3 -->
			<section class="main3">
				<div class="title">WAFFLE</div>
				<div class="sub_title">생활을 연구하다</div>
				<div class="comment">WAFFLE은 편리하면서도 따뜻한삶을 누릴수 있도록 연구합니다.</div>
			</section>
		</main>		
	</c:if>
	<c:if test="${member != null}">
	<div class="container">
		<div class="main_frame">
			<div class="state">
				<div class="temp statebox">
					<div>
						<p>외부온도</p>
						<span>25도</span>
					</div>
					<div>
						<p>내부온도</p>
						<span>18도</span>
					</div>
				</div>
				<div class="humd statebox">
					<div>
						<p>외부습도</p>
						<span>55%</span>
					</div>
					<div>
						<p>내부습도</p>
						<span>30%</span>
					</div>
				</div>
				<div class="dust statebox">
					<div>
						<p>미세먼지농도</p>
						<span>20도씨</span>
					</div>						
				</div>
			</div>
			<div class="controll">
				<div class="room">
				
				</div>
				<div class="user ctrlbox">
				
				</div>
				<div class="aircon ctrlbox">
				
				</div>
				<div class="tv ctrlbox">
				
				</div>
				<div class="window ctrlbox">
				
				</div>
				<div class="light ctrlbox">
				
				</div>
				
			</div> 
		</div>
	</div>
	<script type="text/javascript">
	$(document).ready(function(){
		$("#logoutBtn").on("click", function(){
			location.href="member/logout";
		})
		$("#memberUpdateBtn").on("click",function(){
			location.href="member/memberUpdateView";
		})		
	})
	</script>
	</c:if>
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