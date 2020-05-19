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
<link
	href='//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'
	rel='stylesheet' type='text/css'>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/faq.css" />
<link
	href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<title></title>
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
.show {
	display: block;
}

.hide {
	display: none;
}


 a:link { text-decoration:none; color:#ffffff;}

 a:visited { text-decoration:none;color:#000;}  

 a:active {text-decoration:none; color:#ffffff; } 

 a:hover { text-decoration:none; color:black;} 

</style>

<script type="text/javascript">
$(function(){
   $('#faq_btn').click(function(){
	  $(this).css('background-color','#fff').css('color','#000').css('border','1px solid #333333');
      //$('.full_container').empty();
      $('.full_container').load('/sub/faq')
      $("#faq_btn").siblings().css('background-color','#333333').css('color','#fff'); 
   });
   
    $('#notice_btn').click(function(){
	  $(this).css('background-color','#fff').css('color','#000').css('border','1px solid #333333');
      //$('.full_container').empty();
      $('.full_container').load('/notice/list')
      $("#notice_btn").siblings().css('background-color','#333333').css('color','#fff');
   });
    
    $('#qna_btn').click(function(){
  	  $(this).css('background-color','#fff').css('color','#000').css('border','1px solid #333333');
        //$('.full_container').empty();
        $('.full_container').load('/qna/qnalist')
        $("#qna_btn").siblings().css('background-color','#333333').css('color','#fff');
    });
   

})
   
</script>

<body>
	<jsp:include page="/WEB-INF/views/include/header_bk.jsp"></jsp:include>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<section>
		<!-- 상단 메뉴 바 시작 -->
	
        
		<div class="top_menu_bar">
			<ul class="board_tab">
				<li id="faq_btn">FAQ</li>
				<li id="notice_btn">NOTICE</li>
				<li id="qna_btn">QNA</li>
			</ul>
		</div>

		<div class="full_container">
			<div class="container">
				<div class="row">
					<div class="span12">
						<form id="custom-search-form"
							class="form-search form-horizontal pull-right">
							<div class="input-append span12">
								<input id="keyword" type="text" class="search-query"
									placeholder="&nbsp;궁금하신 서비스를 입력해주세요."
									style="width: 600px; height: 30px; margin: auto">
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
				<div class="picture" style="margin-bottom: 40px; padding-top: 10px;">
					<figure>
						<img src="../img/customer_product_slide4.jpg" alt="서비스1"
							class="img_hover">
						<figcaption class="img_content">자연가습기</figcaption>
					</figure>
					<figure>
						<img src="/img/customer_product_slide5.jpg" alt="서비스2"
							class="img_hover">
						<figcaption class="img_content">온풍기</figcaption>
					</figure>
					<figure>
						<img src="/img/tv.png" alt="서비스4"
							class="img_hover">
						<figcaption class="img_content">초미세먼지</figcaption>
					</figure>

					<figure>
						<img src="/img/customer_product_slide7.jpg" alt="서비스4"
							class="img_hover">
						<figcaption class="img_content">초미세먼지</figcaption>
					</figure>

					<figure>
						<img src="/img/customer_product_slide7.jpg" alt="서비스4"
							class="img_hover">
						<figcaption class="img_content">초미세먼지</figcaption>
					</figure>
				</div>

				<div class="button_wrap">
					<div class="pre">
						<img src="/img/customer_category_arrow_prev.png">
					</div>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<div class="next">
						<img src="/img/customer_category_arrow_next.png">
					</div>
				</div>



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
							<h4 style="text-align: left; line-height: 50px;" id="q_title">아이디를
								분실했어요,어떻게 해야할까요?</h4>
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
									style="font-weight: bold;">2) 세탁기 사양 확인</span><br> <br>
								<span style="color: red; font-weight: bold;">세탁기 최대 폭
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
							<h4 style="text-align: left; line-height: 50px;">비밀번호를
								분실했어요,어떻게 해야할까요?</h4>

						</button>
						<div class="answer">
							<img src="/img/common_accordion_A.png" class="a_img">
						</div>

						<button class="question">
							<img src="/img/common_accordion_Q.png" class="q_img"
								style="margin-right: 10px">
							<h4 style="text-align: left; line-height: 50px;">회원탈퇴를
								하고싶어요.</h4>


						</button>

						<div class="answer">
							<img src="/img/common_accordion_A.png" class="a_img">
						</div>

						<button class="question">
							<img src="/img/common_accordion_Q.png" class="q_img"
								style="margin-right: 10px">
							<h4 style="text-align: left; line-height: 50px;">고객센터 운영시간이
								어떻게 되나요?</h4>


						</button>
						<div class="answer">
							<img src="/img/common_accordion_A.png" class="a_img">
						</div>

						<button class="question-bottom">
							<img src="/img/common_accordion_Q.png" class="q_img"
								style="margin-right: 10px;">
							<h4 style="text-align: left; line-height: 50px;">기기등록을 어떻게
								해야할까요?</h4>
						</button>
						
						<div class="answer">
							<img src="/img/common_accordion_A.png" class="a_img">
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
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	<script src="/js/app.js"></script>
</body>
</html>