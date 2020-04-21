<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href='//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css' rel='stylesheet' type='text/css'>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet"  type="text/css" href="/css/faq.css"/>
    <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
    <title></title>
    <title>Document</title>
   <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<script type="text/javascript">
$(function(){
    $('button').click(function(){     
        $(this).next().slideToggle(500);
    }) 
})
</script>

<body>
	<jsp:include page="/WEB-INF/views/include/header_bk.jsp"></jsp:include>
	<ul class="board_tab">
        <li>FAQ</li>
        <li>NOTICE</li>
        <li>QNA</li>
    </ul>

    <div class="container">
        <div class="row">
            <div class="span12">
                <form id="custom-search-form" class="form-search form-horizontal pull-right">
                    <div class="input-append span12">
                       <input id="keyword" type="text" class="search-query" placeholder="&nbsp;궁금하신 서비스를 입력해주세요." style="width:600px; height:30px; margin:auto">
                        <button type="submit" onkeyup="enterkey();" class="btn" style="height:37px;"><i class="icon-search"></i></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    

    <div class="content">
        <div class="picture" style="margin-bottom: 40px;">
            <figure>
                <img src="/img/customer_product_slide4.jpg" alt="서비스1" class="img_hover">
                <figcaption class="img_content">자연가습기</figcaption>
            </figure>
            <figure>
                <img src="/img/customer_product_slide5.jpg" alt="서비스2" class="img_hover">
                <figcaption class="img_content">온풍기</figcaption>
            </figure>
            <figure>
                <img src="/img/customer_product_slide7.jpg" alt="서비스4" class="img_hover">
                <figcaption class="img_content">초미세먼지</figcaption>
            </figure>
        </div>

        <div class="button_wrap"> 
            <div class="pre"><img src="/img/customer_category_arrow_prev.png"></div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <div class="swiper">
                    <span class="slide1"></span>
                    <span class="slide1"></span>
                    <span class="slide1"></span>
                    <span class="slide1"></span>
                </div>
            <div class="next"><img src="/img/customer_category_arrow_next.png"></div>
        </div>

       

        <div class="noto_body" style="margin-top: 50px;">
        &nbsp;&nbsp;<h4 class="noto">전체</h4>
        <sapn class="noto_count">125건</sapn>
        </div>

        <div class="faq-page">
            <div class="faq">
                    <button class="question-top">
                        <img src="/img/common_accordion_Q.png" class="q_img" style="margin-right:10px">
                        <h4 style="text-align: left; line-height: 50px;">아이디를 분실했어요,어떻게 해야할까요?</h4>    
                    </button>

                    <div class="answer">
                    <img src="/img/common_accordion_A.png" class="a_img">
                    </div>


                    <button class="question">
                        <img src="/img/common_accordion_Q.png" class="q_img" style="margin-right:10px">
                        <h4 style="text-align: left; line-height: 50px;">비밀번호를 분실했어요,어떻게 해야할까요?</h4>                          
                          
                </button>
                <div class="answer">
                    <img src="/img/common_accordion_A.png" class="a_img">
                </div>

                <button class="question">
                    <img src="/img/common_accordion_Q.png" class="q_img" style="margin-right:10px">
                    <h4 style="text-align: left; line-height: 50px;">회원탈퇴를 하고싶어요.</h4>                        
                    
                
            </button>

            <div class="answer">
                <img src="/img/common_accordion_A.png" class="a_img">
            </div>

            <button class="question">
                <img src="/img/common_accordion_Q.png" class="q_img" style="margin-right:10px">
                <h4 style="text-align: left; line-height: 50px;">고객센터 운영시간이 어떻게 되나요?</h4>                          
                
            
        </button>
        <div class="answer">
            <img src="/img/common_accordion_A.png" class="a_img">
        </div>

        <button class="question-bottom">
            <img src="/img/common_accordion_Q.png" class="q_img" style="margin-right:10px;">
            <h4 style="text-align: left; line-height: 50px;">기기등록을 어떻게 해야할까요?</h4>                          
           
        
    </button>
    <div class="answer">
        <img src="/img/common_accordion_A.png" class="a_img">
    </div>
                
            </div>
    
            <div class="page">
                <ul>
                <div class="page_choice"><li><a href="#">1</a></li></div>
                <div class="page_choice"><li><a href="#">2</a></li></div>
                <div class="page_choice"><li><a href="#">3</a></li></div>
                <div class="page_choice"><li><a href="#">4</a></li></div>
                <div class="page_choice"><li><a href="#">5</a></li></div>
                </ul>
            </div>
       </div>

    </div>

		<!-- footer -->
		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
		<script src="/js/app.js"></script>
</body>
</html>