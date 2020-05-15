<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>WAFFLE</title>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<link rel="stylesheet" type="text/css" href="/css/mainstyle.css" />
		<link rel="stylesheet" type="text/css" href="/css/reset.css" />		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.0.0/animate.min.css" />     
	</head>	
	<body>
		<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>	
		<c:if test="${member == null}"> <!-- 로그인 하지 않은 상태에서의 화면 -->
		<main>
	 <!-- main1 -->
         <section class="main1">
            <article class="main1_left">
               <div class="left_text_box">
                  <p class="left_text1 animate__animated animate__fadeInDownBig">행복을 생각하다</p>
                  <p class="left_text2 animate__animated animate__fadeInLeftBig">WAFFLE</p>
                  <div class="left_text3 animate__animated animate__fadeInUpBig">
                     <p>WAFFLE은 차별화된 기술력으로</p>
                     <p>어디서든(WHEREVER) 안전하게(SARETY) 원하는대로(FLEXIBLE)</p>
                     <p>서비스를 제공합니다.</p>
                  </div>
               </div>
            </article>
            <article class="main1_right">
               <div class="right_text animate__animated animate__flipInY">집</div>
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
		
		<!-- 일반회원 로그인 후 메인 페이지 -->	
		<c:if test="${(member !=null)}">
		<%-- <c:if test="${(member !=null) && (member.memAuthor == 0)}"> --%> 		
		<script src="/js/index.js"></script>
		<div class="loader"></div>
		<div class="container"> <!-- 회원에게 보여지는 컨테이너 -->
		<div class="main_frame" style="display: none; margin-top: 300px;">
			<div class="state">
				<div class="temp statebox" id="temp">
					<div>
						<p>외부온도</p>
						<span id="outerTemp">℃</span>
					</div>
					<div>
						<p>내부온도</p>
						<span id="innerTemp">-℃</span>
					</div>
				</div>
				<div class="humd statebox">
					<div>
						<p>외부습도</p>
						<span id="outerHumid">%</span>
						</div>
					<div>
						<p>내부습도</p>
						<span id="innerHumid">-%</span>
					</div>
				</div>
				<div class="dust">
					<div class="dustDsp">
						<p>미세먼지농도</p>
						<div>
							<p>pm10 농도</p>
							<span id="pm10v"></span> <span id="pm10g"></span>
						</div>
						<div>
							<p>pm25 농도</p>
							<span id="pm25v"></span> <span id="pm25g"></span>
						</div>
					</div>
				</div>
			</div>
			<div class="control">
				<div class="room">
					<p id="roomStatus"></p>
					<img id="roomimg" src="" alt="">
				</div>
				<div class="user">
					<img src="/img/profile_wh.png">
					<p>${member.memId}님의집</p>
					<p id="serviceName">이용중</p>
					<select id="room_sel">
						<option value="">--선택해주세요--</option>
					</select>
				</div>
				<div class="aircon">
					<p>에어컨 on/off</p>
					<p id="airconStatus"></p>
					<input type="checkbox" id="aircon_switch" class="swtich">
					<label for="aircon_switch" class="round"></label>
				</div>
				<div class="tv">
					<p>tv on/off</p>
					<p id="tvStatus"></p>
					<input type="checkbox" id="tv_switch" class="swtich">
					<label for="tv_switch" class="round"></label>
				</div>
				<div class="window">
					<p>창문 open/close</p>
					<p id="windowStatus"></p> 
					<input type="checkbox" id="window_switch" class="swtich">
					<label for="window_switch" class="round"></label>						
				</div>
				<div class="light">
					<p>조명 on/off</p>
					<p id="lightStatus"></p>
					<input type="checkbox" id="light_switch" class="swtich">
					<label for="light_switch" class="round"></label>						
				</div>
			</div>
		</div>
	</div>
	</c:if>
	<%-- <c:if test="${(member !=null) && (member.memAuthor == 1)}"><!-- 관리자로 로그인 했을 경우입니다. redirect로 관리자 페이지로 바로 넘어갑니니다. -->
		<div class="container">
			<p>관리자로 로그인하셨습니다. redirect 할 예정입니다.</p>
		</div>
	</c:if> --%>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	<script src="/js/app.js"></script>
	<script src="/js/getApi.js"></script>
</body>
</html>