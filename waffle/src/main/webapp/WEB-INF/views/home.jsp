<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<c:if test="${member == null}"> <!-- 로그인 하지 않은 상태에서의 화면 -->
		<%-- ${sessionScope.token } --%>
		<!-- <a href="/member/kakaologout">카카오로그아웃</a> -->
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
		<c:if test="${(member !=null) && (member.memAuthor == 0)}"> <!-- 로그인을 했고, 일반회원인 경우 페이지 -->			
			<script type="text/javascript">
			$(function() {
				$('body').attr('background','none');
				$('header').css('background-color','#b1d2e5')
				
				setTimeout("weatherCall()",0)
				setTimeout("dustCall()",0)
				setInterval("weatherCall()",1800000);
				setInterval("dustCall()",3600000);
				
				var mem = "${member.memId}" // 회원의 서비스정보를 요청하기 위해 client상에 member객체를 저장
					
					if (sessionStorage.length != 0) { 
						// 일단 로드가 되면, 기존에 회원이 조회한 방 정보는 브라우저의 sessionStorage에 저장되도록 했기 때문에, 데이터가 있으면 로드합니다. 
						// 새로고침을 했을때, 회원이 조회한 정보가 초기화 되지 않도록 하기 위함입니다.
						var currentroom = JSON.parse(sessionStorage.getItem("currentdata")); //sessionStorage로부터 현재 저장되어 있는 방 정보를 JSON형태로 가져옵니다.

						var innerTemp = currentroom.innerTemp	// 데이터를 파싱해서 각 변수에 담습니다.
						var innerWet = currentroom.innerWet
						var aircon = currentroom.aircon
						var tv = currentroom.tv
						var window = currentroom.window
						var light = currentroom.light
						var room = currentroom.roomNumber
						var serviceName = currentroom.serviceName

						$('#roomStatus').html('room' + room)	// 데이터가 보여질 위치에 .html()을 이용해서 출력합니다.
						$('#innerTemp').html(innerTemp + '℃')
						$('#innerHumid').html(innerWet + '%')
						$('#airconStatus').html(aircon)
						$('#tvStatus').html(tv)
						$('#windowStatus').html(window)
						$('#lightStatus').html(light)
						$('#serviceName').html(serviceName+'이용중')

						if (room == '01') {
							$('#roomimg').attr('src', '/img/room01.jpg');
						} else if (room == '02') {
							$('#roomimg').attr('src', '/img/room02.jpg');
						} else if (room == '03') {
							$('#roomimg').attr('src', '/img/room03.jpg');
						}
						
					}

							
					$('#room_sel').on( // 방 번호를 고르면, 그 방의 상태가 화면에 비동기적으로 표시됩니다.
							'change',
							function() {
								var roomNumber = $('#room_sel option:selected').val();
								$.ajax({
									url : "/room/getroom",
									type : "post",
									data : {
										"memId" : mem,
										"roomNumber" : roomNumber
									},
									dataType : "json",
									success : function(data) {
										if (data == null) {
											alert('서비스를 이용이 만료되었습니다. 결제를 해주세요');
											location.href="/sub/waffleService"
										} else {
											sessionStorage.setItem("currentdata", JSON.stringify(data));

											var currentroom = JSON.parse(sessionStorage.getItem("currentdata"));

											var innerTemp = currentroom.innerTemp
											var innerWet = currentroom.innerWet
											var aircon = currentroom.aircon
											var tv = currentroom.tv
											var window = currentroom.window
											var light = currentroom.light
											var room = currentroom.roomNumber

											$('#roomStatus').html('room' + room)
											$('#innerTemp').html(innerTemp + '℃')
											$('#innerHumid').html(innerWet + '%')
											$('#airconStatus').html(aircon)
											$('#tvStatus').html(tv)
											$('#windowStatus').html(window)
											$('#lightStatus').html(light)

											if (room == '01') {
												$('#roomimg').attr('src', '/img/room01.jpg');
											} else if (room == '02') {
												$('#roomimg').attr('src', '/img/room02.jpg');
											} else if (room == '03') {
												$('#roomimg').attr('src', '/img/room03.jpg');
											}

										}
									},
									error : function(e) {
										console.log(e);
										alert("통신 실패");
									}
								})
							})							
			});	
			$(window).ready(function() {
				$('.loader').css("display", "none");
				$('.container').css("display", "block");
			});
			</script>
			
			<div class="loader"></div>
			<div class="container"> <!-- 회원에게 보여지는 컨테이너 -->
				<div class="main_frame">
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
										<span id="pm10v"></span>
										<span id="pm10g"></span>
									</div>
									<div>
										<p>pm25 농도</p>
										<span id="pm25v"></span>
										<span id="pm25g"></span>
									</div>
							</div>
						</div>
					</div>
					<div class="controll">
						<div class="room">
							<p id="roomStatus"></p>
							<img id="roomimg" src="" alt="">
						</div>
						<div class="user">
							<img src="/img/profile_wh.png" alt="">
							<p>${member.memId}님의집</p>
							<p id="serviceName">이용중</p>							
							<select id="room_sel">
								<option value="">--선택해주세요--</option>
								<option value="01">room1</option>
								<option value="02">room2</option>
								<option value="03">room3</option>
							</select>
						</div>
						<div class="aircon ctrlbox">
							<p>에어컨 on/off</p>
							<p id="airconStatus"></p>
						</div>
						<div class="tv">
							<p>tv on/off</p>
							<p id="tvStatus"></p>
						</div>
						<div class="window ctrlbox">
							<p>창문 open/close</p>
							<p id="windowStatus"></p>
						</div>
						<div class="light ctrlbox">
							<p>조명 on/off</p>
							<p id="lightStatus"></p>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${(member !=null) && (member.memAuthor == 1)}"><!-- 관리자로 로그인 했을 경우입니다. redirect로 관리자 페이지로 바로 넘어갑니니다. -->
			<div class="container">
				<p>관리자로 로그인하셨습니다. redirect 할 예정입니다.</p>
			</div>
		</c:if>
		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
		<script src="/js/app.js"></script>
		<script src="/js/getApi.js"></script>
	
	</body>
</html>