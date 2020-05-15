<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WAFFLE</title>
<link rel="stylesheet" type="text/css" href="/css/service.css" />
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="/js/servicepage.js"></script>
</head>
<body>
	<div id="prePayForm" >
    	<form action="/payment/pay" method="post" id="payForm">
    		<label for="memId">주문자 ID</label>
    		<input type="text" id="memId" name="memId" value="${member.memId }" readonly>
    		<label for="memName">주문자 이름</label>
    		<input type="text" id="memName" name="memName" value="${member.memName }" readonly>
    		<label for="serviceName">주문 서비스</label>
    		<input type="text" id="serviceName" name="serviceName" readonly>
    		<label for="price">서비스 가격</label>
    		<input type="text" id="price" name="price" readonly>
    		<input type="button" id="pay" value="결제하기">    		
    	</form>    
    	</div>
	<div id="cover"></div>
  		
	<jsp:include page="/WEB-INF/views/include/header_bk.jsp"/>	
	<section class="service_main">
		
        <!-- service WAFFLE -->
        <div class="service_head">
          <p class="title_big">Service</p>
          <p class="title_small">WAFFLE</p>
        </div>
        <!-- img -->
        <div><img src="/img/service.jpg" alt="서비스이미지"></div>
        <!-- service tab -->
        <ul class="service_tab">
            <li>BASIC</li>
            <li>PRO</li>
            <li>ULTIMATE</li>
        </ul>
        <!-- service content -->
        <ul class="service_content">
            <li>
                <p>
                    <span>BASIC SERVICE</span><br>
                    기본적인 서비스로<br> 
                    원룸에 사시거나 거실에만 스마트홈기기을 설치하시는<br>
                    고객님들께 추천해드립니다. 
                </p>
                <button type="button" id="basic">신청하기</button>
            </li>
            <li>
                <p>
                    <span>PRO SERVICE</span><br>
                    BASIC SERVICE에서<br> 
                    추가로 거실외에 방 3개 이하에 스마트홈기기을 설치하시는<br>
                    고객님들께 추천해드립니다. 
                </p>
                <button type="button"  id="pro" >신청하기</button>
            </li>
            <li>
                <p>
                    <span>ULTIMATE SERVICE</span><br>
                    BASIC SERVICE에서<br> 
                    추가로 거실외에 방 3개 이상에 스마트홈기기을 설치하시는<br>
                    고객님들께 추천해드립니다. 
                </p>
                <button type="button"  id="ultimate">신청하기</button>
            </li>
        </ul>
    </section>
    
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	<script src="/js/app.js"></script>
</body>
</html>