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
	
})

