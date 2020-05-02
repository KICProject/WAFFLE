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
		<!-- 일반회원 로그인 후 메인 페이지 -->	
		<c:if test="${(member !=null) && (member.memAuthor == 0)}"> 		
			<script type="text/javascript">
			$(function() {
				/* 메인페이지를 c:if 태그로 넣게되면서 생긴 문제로 로그인 전 body의 백그라운드 컬러가  로그인 후 헤더에 영향을 미쳐서 클라이언트에서 직접 바꿔줌*/
				$('body').attr('background','none');					
				$('header').css('background-color','#b1d2e5') 
				
				/* onload 되면서 메인프레임이 fadeIn,transform*/
				setTimeout(function(){
					$('.main_frame').fadeIn(700)
					$('.main_frame').css('transform','translateY(-200px)')
					$('.main_frame').css('transition-duration','0.7s')
				},300)
				/* 외부환경정보를 얻는 API들을 call */
				setTimeout("weatherCall()",3000)
				setTimeout("dustCall()",3000)
				setInterval("weatherCall()",1800000);
				setInterval("dustCall()",3600000);
				
				
				var mem = "${member.memId}" // 회원의 서비스정보를 요청하기 위해 client상에 member객체를 저장
				var usvo = "${usvo.serviceName}"//마찬가지로 회원이 이용중인 서비스명을 얻어옴
				
				/* 서비스 명에 따라서 select 할 수 있는 room의 갯수를 할당*/
				if(usvo=="basic"){
					var rcnt = 1;
					for(var i=1; i<=rcnt; i++){
						$('#room_sel').append("<option value='"+i+"'>room0"+i+"</optoin>");				
					}
				}else if(usvo=="pro"){
					var rcnt = 3;
					for(var i=1; i<=rcnt; i++){
						$('#room_sel').append("<option value='"+i+"'>room0"+i+"</optoin>");				
					}
				}else if(usvo=="ultimate"){
					var rcnt = 5;
					for(var i=1; i<=rcnt; i++){
						$('#room_sel').append("<option value='"+i+"'>room0"+i+"</optoin>");				
					}
				}
				
				
				
			    /*방 번호를 고르면, ajax 통신을 통해 그 방의 상태가 화면에 비동기적으로 표시됩니다.*/
				$('#room_sel').on('change',							
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
								success : function(data) { // 성공적으로 id와 roomNumber를 넘기고, 요청한 데이터를 돌려받으면
									if (data == null) { // 돌려받았지만, 데이터가 없음 = 서비스이용만료
										alert('서비스를 이용이 만료되었습니다. 결제를 해주세요');
										location.href="/sub/waffleService"
									} else { //정상적인 서비스 이용 유저일 경우 (onload 때와 마찬가지로 브라우저의 sessionStorage에 저장)
										/* sessionStorage.setItem("currentdata", JSON.stringify(data));
										var currentroom = JSON.parse(sessionStorage.getItem("currentdata")); */
										var currentroom = JSON.parse(JSON.stringify(data))										
										var innerTemp = currentroom.innerTemp
										var innerWet = currentroom.innerWet
										var aircon = currentroom.aircon
										var tv = currentroom.tv
										var window = currentroom.window
										var light = currentroom.light
										var room = currentroom.roomNumber
										var serviceName = currentroom.serviceName
										
										$('#roomStatus').html('room0' + room)
										$('#innerTemp').html(innerTemp + '℃')
										$('#innerHumid').html(innerWet + '%')
										$('#airconStatus').html(aircon)
										$('#tvStatus').html(tv)
										$('#windowStatus').html(window)
										if(serviceName != ""){
											alert(serviceName)
											/* $('#serviceName').html(serviceName+'이용중') */
										}
										
										$('#lightStatus').html(light)
										
										
										if (room == '1') {
											$('#roomimg').attr('src', '/img/room01.jpg');
										} else if (room == '2') {
											$('#roomimg').attr('src', '/img/room02.jpg');
										} else if (room == '3') {
											$('#roomimg').attr('src', '/img/room03.jpg');
										}
									}
								},
								error : function(e) {
									console.log(e);
									alert("통신 실패");
								}
							})
						});
				$('.round').on('click',function(){
					//var currentroom = JSON.parse(sessionStorage.getItem("currentdata"));
					
					var value = '48';
					var change = $(this).prev().attr('id');		//클릭한 컨트롤 버튼id			
					var idx = change.indexOf('_');				//id값에서 _이후를 빼기위해 인덱스
					var control_pannel = change.substring(0,idx); //테이블에 전송할 필드명과 일치시키기 위해 substring
					
					var status = !$(this).prev().is(":checked"); //클릭 상황에서는 false, 이기때문에 !을 붙여 true로, 들어가는 값
					
					
					if (status == true){
						value = '49';
					}
					
					
					$.ajax({
						url:"/room/updateroom",
						type:"post",
						dataType:"json",
						data:{
							"control_pannel" : control_pannel,
							"value" : value,
							/* "aircon":currentroom.aircon,
							"tv":currentroom.tv,
							"window":currentroom.window,
							"light":currentroom.light */							
						},
						success : function(data) {
							if(data == 1){
								console.log("데이터 업데이트 성공");
							}
						}
					})					
				});						
			});	
			/* onloade 시 loading 되는 동안 보이는 laoder를 작업이 완료되면 없애고, 메인 컨테이너를 보여준다. */
			$(window).ready(function() {
				$('.loader').css("display", "none");
				$('.container').css("display", "block");
			});        
			</script>
			
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