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
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>	
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
				<div class="tv">
				
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
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	<script src="/js/app.js"></script>
</body>
</html>