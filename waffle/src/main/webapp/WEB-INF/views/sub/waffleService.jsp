<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Waffle Service</title>
<link rel="stylesheet" type="text/css" href="/css/waffleService.css" />
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
	#cover{
		width:100%;
		height:100%;
		position:fixed;
		top:0;
		left:0;
		background-color:rgba(0,0,0,0.7);		
		z-index:98;
		display:none;
	}

	.cover{
		display:!important block;		
	}
	.show{
		display:block;
	}
	#prePayForm {
		display:none;
		width:400px;
		height:400px;
		background-color:#000;
		position:fixed;
		z-index:99;
		top:50%;
		left:50%;
		transform:translate(-50%,-50%);
		color:#000;
	}
	#prePayForm input {
		width:150px;
		height: 
	}
</style>
</head>
<script type="text/javascript">
$(function(){
	$('button').click(function(){
		if("${member}" == ""){
			alert('로그인을 먼저 해주세요');
			location.href="/member/loginControl";
		}
		
		var btn = $(this).attr('id');
		$('#serviceName').val(btn);
		
		$('#cover').show();
		$('#prePayForm').show();		
		
		if(btn == 'basic'){
			$('#price').val(100);
		}else if(btn == 'pro'){
			$('#price').val(300);
		}else
			$('#price').val(500);
		
	})	
	$('#cover').click(function(){
		$('#prePayForm').hide();
		$('#cover').hide();
	})
	
	/* $('#pay').click(function(){
		location.href="/payment/pay"
	}) */
	
	$('#pay').click(function(){
		//var paydata_str = JSON.stringify($('#payForm').serializeArray());
		//var json_pay = JSON.parse(paydata_str);
		
		//var paydata_str = $('#payForm').serializeArray();
		var paydata_str = $('#payForm').serialize();
		var json_pay = JSON.stringify(paydata_str);
		
		//var json_pay = JSON.parse(paydata_str);
		
		console.log(paydata_str)
		console.log(json_pay);
		//console.log(json_pay)
		$.ajax({
			url : "/payment/payReady",
			type:"post",
			data : paydata_str,
			dataType : "json",
			success : function(data){
				if(data==1){
					location.href="/payment/pay"				
				}else{
					alert('결제 정보 저장이 되지 않았습니다.')
				}
				
			},error : function(e){
				alert('결제에 실패하였습니다.');
				//location.reload();
			}
		})
		
	})
})

</script>
<body>
	<div id="prePayForm">
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
        <div><img src="/img/login_img.jpeg" alt="서비스이미지"></div>
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