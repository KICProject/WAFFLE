<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/faq.css" />
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link
	href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"
	rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<title>waffleBoard</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<script type="text/javascript">
$(function(){
    $('button').click(function(){     
        $(this).next().slideToggle(500);
    })       
})

$(function(){
		$('.btn').click(function(){
			
			var key= $('#keyword').val();
			var buttoncnt = $('button').length;
			for(var i=1; i<buttoncnt; i++){
				var searchObject = $('button').eq(i).text();
				if(searchObject.match(key)){
					$('button').eq(i).show();
					//$('button').eq(i).next().show();				
				}else{
					$('button').eq(i).hide();
					$('button').eq(i).next().hide();
				}
			}
		})
	})
	
</script>

<style>
@import "../css/reset.css";
@import "../css/header.css";

@font-face {
  font-family: S-CoreDream-1;
  src: url("../font/SCDream1.otf") format("opentype");
  font-style: normal;
  font-weight: normal;
}
@font-face {
  font-family: S-CoreDream-3;
  src: url("../font/SCDream3.otf") format("opentype");
  font-style: normal;
  font-weight: normal;
}
@font-face {
  font-family: S-CoreDream-6;
  src: url("../font/SCDream6.otf") format("opentype");
  font-style: normal;
  font-weight: normal;
}
.show {
	display: block;
}

.hide {
	display: none;
}

 a:link { text-decoration:none;}
 
 a:hover { text-decoration:none; color:black;} 
 
 .customer_head{
    display: flex;
    justify-content: space-between;
    width: 100%;
    height: 85px;
    border-bottom: 3px solid #000;
    margin-bottom:50px;
  
 }
 
 .customer_big{
	width: 500px;
    border-bottom: 6px solid #000;
    font-family: S-CoreDream-6;
    font-size: 67.5px;
    color:black;
 
 }
 #faq_btn{
 background-color:#fff;
 color:#000;
 border:1px solid #333333;
 }
 
 .customer_small{
    position: relative;
    height: 80px;
    border-right: 1px solid #000;
    padding-right: 5px;
    font-family: S-CoreDream-1;
    font-size: 44px;
   
 }
 
 .customer_small::before{
 content: "";
    position: absolute;
    top: 40px;
    right: -3px;
    height: 40px;
    border-right: 3px solid #000;
 }

</style>

<script type="text/javascript">

$(function(){
   $('#faq_btn').click(function(){
	  $(this).css('background-color','#fff').css('color','#000').css('border','1px solid #333333');
      //$('.full_container').empty();
      $('.full_container').load('/sub/faq')
    //  $("#faq_btn").siblings().css('background-color','#333333').css('color','#fff'); 
   });
    var notice_url="/notice/list";
    $('#notice_btn').click(function(){
      $(location).attr('href',notice_url); 
      $("#notice_btn").siblings().css('background-color','#333333').css('color','#fff');
   });
    
    var qna_url="/qna/qnalist";
    $('#qna_btn').click(function(){
    	$(location).attr('href',qna_url); 
    	$(this).css('background-color','#fff').css('color','#000').css('border','1px solid #333333'); 
    });
   
})


</script>

<body style="margin:0 auto;width:100%;">
<div><jsp:include page="/WEB-INF/views/include/header_bk.jsp"></jsp:include></div>	
	<br>
	<br>
	<br>
	<br>
	<br>

	<section style="width:1410px;margin:0 auto;">
	<div class="customer_head">
	 <p class="customer_big" style="margin-bottom: -1px;">Customer</p>
	 <p class="customer_small">WAFFLE</p>
	</div>	
		<!-- 상단 메뉴 바 시작 -->        
		<div class="top_menu_bar">
			<ul class="board_tab">
				<li id="faq_btn">FAQ</li>
				<li id="notice_btn">NOTICE</li>
				<li id="qna_btn">QNA</li>
			</ul>
		</div>

		<div class="full_container" style="margin-top:-30px;">
			<div class="container">
				<div class="row">
					<div class="span12">
						<form id="custom-search-form"
							class="form-search form-horizontal pull-right">
							<div class="input-append span12" style="margin-bottom:35px;">
								<input id="keyword" type="text" class="search-query"
									placeholder="&nbsp;궁금하신 서비스를 입력해주세요."
									style="width: 800px; height: 30px;">
								<button type="button" class="btn"
									style="height: 37px;">
									<i class="icon-search"></i>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
			

			<div class="content">
				<div class="picture" >
					<figure>
						<img src="../img/TV.png" alt="서비스1"
							class="img_hover" style="margin-top:10px;">
						<figcaption class="img_content">TV</figcaption>
					</figure>
					<figure>
						<img src="/img/light.png" alt="서비스2"
							class="img_hover" style="margin-top:10px;">
						<figcaption class="img_content">조명</figcaption>
					</figure>
					<figure>
						<img src="/img/window.png" alt="서비스4"
							class="img_hover" style="margin-top:10px;">
						<figcaption class="img_content">창문</figcaption>
					</figure>

					<figure>
						<img src="/img/conditioner.png" alt="서비스4"
							class="img_hover" style="margin-top:10px;">
						<figcaption class="img_content">에어컨</figcaption>
					</figure>

			
				</div>

				<!-- <div class="button_wrap">
					<div class="pre">
						<img src="/img/customer_category_arrow_prev.png">
					</div>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<div class="next">
						<img src="/img/customer_category_arrow_next.png">
					</div>
				</div>
 -->


				<div class="noto_body"
					style="margin-top: 50px; margin-bottom: 15px;">
					&nbsp;&nbsp;
					<h4 class="noto">전체</h4>
					<span class="noto_count">25건</span>
				</div>

				<div class="faq-page" id="faq-page">
					<div class="faq">
						<button class="question-top">
							<img src="/img/common_accordion_Q.png" class="q_img"
								style="margin-right: 10px">
							<h4 style="text-align: left; line-height: 50px;" id="q_title">설치 전 체크리스트</h4>
						</button>

						<div class="answer">
							<img src="/img/common_accordion_A.png" class="a_img">
							<div class="answer_content">
								<span style="font-weight: bold;">▶ 랙(앵글) 설치 사전 체크리스트</span> <br>
								<br> <span style="font-weight: bold;">1) 설치 공간 확인</span><br>
								<br> ① 최소 너비 900mm, 높이 2,000mm, 깊이 800mm 이상 공간 확보가 필요합니다.<br>
								<br> ② 설치 벽면 상 선반/도시가스/전기배선/창문 등이 설치 되어있을 경우 설치 불가<br>
								<br> (선반 제거 시 선반 고정부 노후로 나사/너트 등이 부식이 된 경우 설치 불가)<br>
								<br> ③ 랙 고정을 위해 설치 벽면(좌,우,뒤)이 콘크리트 벽만 설치 가능<br> <br>
								(타일/벽돌/가벽 등은 설치 불가)<br> <br> ④ 랙 사이즈(폭*높이*깊이) : [외경]
								800*930~1030*750mm<br> <br> <br> <span
									style="font-weight: bold;">2) tv 사양 확인</span><br> <br>
								<span style="color: red; font-weight: bold;">tv 최대 폭
									740mm 이하, 높이 1,000mm 이하 까지 설치 가능!</span><br> <br> ※ L * : 트원
								워시, 통돌이 세탁기 설치 불가<br> <br> ※ 삼* : 플렉스 워시 (올 인원세탁기),
								액티브워시 (통돌이) 설치 불가<br> <br> <br> <span
									style="font-weight: bold;">3) 랙 설치 비용 안내</span><br> <br>
								ㆍ랙 별도 구매+설치 요청 시 설치비 포함 159,000원 <br> <br> ㆍ랙 만 설치 요청
								시 설치비 포함 40,000원 (설치 환경사유로 설치불가시 출장비 17,000원발생)<br> <br>
								일부지역 및 도서산간 지역은 거리에 따라 추가 요금이 발생 될 수 있음을 참고 부탁 드립니다.<br> <br>
								<br> 감사합니다.

								<div class="answer_img">
									<img src="/img/answer_1.png" style="margin-top: 40px;">
								</div>
							</div>


						</div>


						<button class="question">
							<img src="/img/common_accordion_Q.png" class="q_img"
								style="margin-right: 10px">
							<h4 style="text-align: left; line-height: 50px;">계약 해지는 어떻게 하나요?</h4>

						</button>
						<div class="answer">
							<img src="/img/common_accordion_A.png" class="a_img">
							<div class="answer_content" style="margin-bottom:20px;">회원이 의무가입기간이 경과되기 전에 임의로 본계약을 해지할 경우 , <br><br>
							   회원은 당해 가입기간 또는 연체기간동안 교환된 필터의 소비자가격에 해당하는 금액과 정기점검 및 청소 서비스 1회당<br><br>
							  금(오만원)으로 계산한 금액을 회사에게 배상 하여야 합니다.</div>
						</div>

						<button class="question">
							<img src="/img/common_accordion_Q.png" class="q_img"
								style="margin-right: 10px">
							<h4 style="text-align: left; line-height: 50px;">이벤트 사은품은 언제 지급 되나요?</h4>


						</button>

						<div class="answer">
							<img src="/img/common_accordion_A.png" class="a_img">
							<div class="answer_content">이벤트 기간 동안 가입하신 분들에게는 12월 29일 모바일 상품권으로 일괄 발송 됩니다.</div>
						</div>

						<button class="question">
							<img src="/img/common_accordion_Q.png" class="q_img"
								style="margin-right: 10px">
							<h4 style="text-align: left; line-height: 50px;">소비자 분쟁 해결 기준 안내</h4>
						</button>
						
						<div class="answer">
							<img src="/img/common_accordion_A.png" class="a_img">
							<div class="answer_content">저의 와플에서는 소비자 분쟁 해결 기준에 따라 아래와 같이 제품에 대한 보증을 실시합니다. </div>
								<div class="answer_img">
									<img src="/img/table01.png" style="margin-top: 20px;margin-bottom:20px;margin-left:75px;">
								</div>
						</div>

						<button class="question-bottom">
							<img src="/img/common_accordion_Q.png" class="q_img"
								style="margin-right: 10px;">
							<h4 style="text-align: left; line-height: 50px;">카드결제 시 참고 사항</h4>
						</button>
						
						<div class="answer">
							<img src="/img/common_accordion_A.png" class="a_img">
							<span>
						   <div class="answer_content" style="margin-bottom:20px;"> <span style="font-weight: bold;">※ 카드결제 시 결제 프로그램 미설치로 인한 오류에 따른 안내 사항</span>	<br><br>

								* 제품 구매시 카드결제를 하기 위해서는 별도의 결제 프로그램을 설치하여야 합니다.<br><br>
								
								  카드 결제 선택 시 프로그램이 설치되지 않은 고객님의 PC에서는 자동으로 프로그램
								
								  설치를 안내하는 창이 웹 브라우져 상단에 노란색으로 생성이 되어서 설치 후 결제를
								
								  진행하시면 됩니다.<br><br>
										
							</div>
						</div>

					</div>

					<div class="page">
						<ul>
							<div class="page_choice">
								<li><a onclick="
                            fetch('page1').then(function(response) {
                            	
                                response.text().then(function(text) {
                                    document.querySelector('.faq').innerHTML = text;
                                    $(function(){
                                        $('button').click(function(){     
                                            $(this).next().slideToggle(500);
                                        })       
                                    })
                                })
                            })
	                        ">1</a></li>
								</div>
								<div class="page_choice">
									<li><a onclick="
										 fetch('page2').then(function(response) {
				                            	
				                                response.text().then(function(text) {
				                                    document.querySelector('.faq').innerHTML = text;
				                                    $(function(){
				                                        $('button').click(function(){     
				                                            $(this).next().slideToggle(500);
				                                        })       
				                                    })
				                                    
				                                })
				                            })
	                        ">2</a></li>
								</div>
								<div class="page_choice">
									<li><a onclick="
	                            fetch('page3.html').then(function(response) {
	                                response.text().then(function(text) {
	                                    document.querySelector('.faq').innerHTML = text;
	                                    $(function(){
	                                        $('button').click(function(){     
	                                            $(this).next().slideToggle(500);
	                                        })       
	                                    })
	                                })
	                            })
	                        ">3</a></li>
								</div>
								<div class="page_choice">
									<li><a onclick="
	                            fetch('page4.html').then(function(response) {
	                                response.text().then(function(text) {
	                                    document.querySelector('.faq').innerHTML = text;
	                                    $(function(){
	                                        $('button').click(function(){     
	                                            $(this).next().slideToggle(500);
	                                        })       
	                                    })
	                                })
	                            })
	                        ">4</a></li>
								</div>
								<div class="page_choice">
									<li><a
										onclick="
	                            fetch('page5.html').then(function(response) {
	                                response.text().then(function(text) {
	                                    document.querySelector('.faq').innerHTML = text;
	                                    $(function(){
	                                        $('button').click(function(){     
	                                            $(this).next().slideToggle(500);
	                                        })       
	                                    })
	                                })
	                            })
	                        ">5</a></li>
							</div>
						</ul>
					</div>
				</div>

			</div>
		</div>
	</section>
	<!-- footer -->
	<div style="width:100%;"><jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include></div>
	<script src="/js/app.js"></script>
</body>
</html>