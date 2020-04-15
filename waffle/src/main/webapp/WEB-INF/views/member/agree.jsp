<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="/css/style.css">
<style type="text/css">
	@import url("/css/S-Core-Dream-light/s-core-dream.css");
	
	* {margin:0px; padding:0px; }
	ul, li {
		list-style:none;
	}
	a {
		text-decoration:none;
	}
	/* body 부분  */	
	body{
		background-image:url("/img/background_copy.jpg");
		width:1920px;
		height:1080px;
		overflow:scroll;
		color:#fff;	
	}
	
	/* header */
	header {
		width:100%;
		height:94px;
		margin-top:30px;
		position:relative;
	}
	header nav{
		position:relative;
		z-index:0;	
	}
	
	header .menu_btn > a{
		display:block;
		width:30px;
		height:17px;
		position:absolute;		
		z-index:10;
		top:0px;
		left:30px;
	}
	header .menu_btn img{
		width:30px;
		height:17px;		
	}
	.menu_btn {
  		width: 30px;
  		height: 17px;
  		object-fit: contain;
	}
	
	.main_logo {
		position:absolute;
		top:0px;
		left:50%;
		transform:translateX(-50%);
		z-index:3;
		width: 288px;
		height: 94px;
	}
	.main_logo > img {
		width: 98px;
		height: 53px;
		float:left;
	}
	.main_logo > .logo_text{
		width:190px;
		height:95px;
		padding-top:17px;
		display:block;
		font-family: "s-core-dream-thin";
		font-size: 67px;
		font-weight: 100;
		font-stretch: normal;
		font-style: normal;
		line-height: 0.27;
		letter-spacing: normal;
		text-align: center;
		color: #ffffff;
		float:left;
	}
	
	
	header .right_menu{
		position:absolute;
		top:0px;
		right:10px;
		width:180px;
		height:30px;
		z-index:5;
	}
	
	header .right_menu li{
		width:90px;
		height:30px;
		float:left;
	}
	
	header .right_menu a {
		display:block;
		width:90px;
		height:30px;
		text-align:center;
		line-height:30px;
		font-size:12px;
	}
	.container{
		overflow:hidden;
		
	}
	
	/* signup_container */
	.container > .frame{
		margin:0 auto;
		margin-top:150px;
		width: 800px;
		height: 740px;
		/* opacity: 0.5; */
		border-radius: 50px;
		box-shadow: 0px 30px 21px 0 rgba(64, 64, 64, 0.67);
		background-image: linear-gradient(to bottom, #051c29 14%, #051c29 14%, #405590 42%, #7283b3 63%, #576d95 68%, #425b7c 72%, #113245 86%);
		overflow:hidden;
		
	}
	.container > .frame > h2 {
		padding-top:65px;
		padding-left:92px;
		width: 245px;
		height: 94px;
		font-family: "s-core-dream-extrabold";
		font-size: 67.5px;
		font-weight: 800;
		font-stretch: normal;
		font-style: normal;
		line-height: 0.27;
		letter-spacing: normal;
		float:left;
	}
	.container > .frame .logo {
		padding-top:50px;
		margin-right:96px;
		width: 165px;
  		height: 61px;
  		font-family: "s-core-dream-thin";
  		font-size: 43.9px;
  		font-weight: 100;
  		font-stretch: normal;
  		font-style: normal;
		line-height: 0.27;
  		letter-spacing: normal;
  		float:right;
		
	}
	.container > .frame .intro {
		margin-right:96px;
		clear:right;
		float:right;
		width: 100px;
  		height: 25px;
  		font-family: "s-core-dream-thin";
  		font-size: 18px;
  		font-weight: 100;
  		font-stretch: normal;
  		font-style: normal;
		line-height: 0.65;
  		letter-spacing: normal;
  		text-align: left;
  		color: #ffffff;
	}
	.container > .frame .box1{
		clear:both;
		display:block;
		width:280px;
		height:6px;
		background-color:#fff;
		margin-left:66px;
		float:left;
	}
	.container > .frame .box2{
		display:block;
		width:388px;
		height:3px;
		margin-top:3px;
		background-color:#fff;
		float:left;		
	}
	/* inner things */
	.container > .frame > .agreement{
		overflow:hidden;
		clear:both;
		padding-top:20px;		
		position:relative;
		left:50%;
		transform:translateX(-50%);	
		width:600px;
		float:left;
		
	}
	
  	.container > .frame > .agreement > ul{
  		display:block;
  		margin:20px auto;
  		float:left;  		
  		width:100%;
  	}
  	
  	.container > .frame > .agreement  > ul > li{
  		float:left;  		
  	}
  	
  	.container > .frame > .agreement > ul > li > a{
  		color:#fff;
  	}
	
	.container > .frame > .agreement > h3 {
		margin-bottom:15px;
	}
	.container > .frame > .agreement > span {
		display:block;
		text-indent:10px;
		font-size:12px;
	}
	.container > .frame > .agreement > input{
		margin-left:10px;
	}
	.container > .frame > .agreement > .terms {
		width:600px;
		height:100px;
		margin:0 auto;
		position:relative;
		top:20px;
		left:50%;
		transform:translateX(-50%);
  		background-color: #f4f4f4;
  		font-size:16px;
  		line-height:50px;
  		color:#111;
	}
	.terms .terms_list {
		/* position:absolute; */
		top:0px;
		left:0px;
	}
	.terms .terms_list > li {
		position:relative;
	}
	.terms .terms_list > li:nth-child(2){
		top:25px;
	} 
	.terms .terms_list > li > span{
		display:block;
		position:absolute;
		top:0;
		left:20px;
	}
	.terms .terms_list > li > a{
		position:absolute;
		top:0;
		right:20px;
	}

	#signin_btn, #cancle_btn{
		width: 236px;
		height: 49px;
		opacity: 0.73;
		border-radius: 24.5px;
		background-color: #aaa8d8;
		float:left;
		margin-top:30px;
		
	}
	#cancle_btn{
		margin-left:155px;
	}
	#signin_btn {
		margin-left:15px;
  		background-color: #afde77;
	}
	
</style>
</head>
<script type="text/javascript">
	$(function(){
		
		setCheckAll();
		
		$('#all').on('change', function () {
			  $('#agree1').prop('checked',$(this).prop('checked'));
			  $('#agree2').prop('checked',$(this).prop('checked'));
		});
		
		$('.terms_list').find('input:checkbox').not('#all').on('change',function(){
			setCheckAll();
		})
		
		$('#signin_btn').on('click',function(){
		// check를 하지 않으면 alert
			/* if($('input[name="agree"]').attr('checked')==false){
				alert('약관에 동의체크를 해주세요');
				return false;
			}
			if(!$('#agree1').attr('checked') && !$('#agree2').attr('checked')){
				alert('약관에 동의체크를 해주세요');
				return false;
			*/
			if(!$('#all').prop('checked')){
				alert('약관에 동의체크를 해주세요');
				return false;
			}else {
				// 만약 동의 checkbox가 체크가 다 되어 있으면 location.href="member/register";
				location.href="./register";
			}
			
		});
		$('#cancle_btn').on('click',function(){
			location.href="/";
		})
		// 취소를 누르면  login 페이지로 컴백
	})
	function setCheckAll(){
		var checkTotal = 
			$('.terms_list').find('input:checkbox').length;
		var checkCount = 0;
		
		$('.terms_list').find('input:checkbox').each(function(){
			if($(this).prop('checked')){
				checkCount++;
			}
		});
		
		$('#all').prop('checked',checkTotal == checkCount);
	}
</script>
<body>
	<header>
		<!-- nav 여긴 나중에 뺌 -->
		<nav>
			<div class="menu_btn">
				<a href="#"><img src="/img/menu_btn.png" alt=""/></a>
				<ul>
					<li><a href="#"></a>
					<li><a href="#"></a>
					<li><a href="#"></a>					
				</ul>
			</div>
			<h1 class="main_logo"><img src="/img/Waffle_Logo@3x.png"><span class="logo_text">AFFLE</span></h1>
			<ul class="right_menu">
				<li><a href="#">로그인btn</a></li>
				<li><a href="#">searchbtn</a></li>
			</ul>
		</nav>
	</header>
	<div class="container">
		<div class="frame">
			<h2>SIGN IN</h2>
			<span class="logo">WAFFLE</span>
			<span class="intro">IoT Service</span>
			<span class="box1"></span><span class="box2"></span>
			
			<div class="agreement">
				<ul>
					<li><a href="#">01.약관동의  &gt;&nbsp; </a></li>
					<li><a href="#">02.정보입력  &gt;&nbsp; </a></li>
					<li><a href="#">03.가입완료  &gt;&nbsp; </a></li>
				</ul>
				<h3>약관동의</h3>
				<span>이용약관 및 개인정보 이용에 동의해주세요</span><br>
				<input type="checkbox" id="all" name="all">&nbsp;전체 동의하기
				<div class="terms">
					<ul class="terms_list">
						<li><span><input type="checkbox" id="agree1" name="agree1"> &nbsp;이용약관동의(필수)</span><a href="#">전체보기 &gt;</a></li>
						<li><span><input type="checkbox" id="agree2" name="agree2"> &nbsp;개인정보 수집 및 이용 동의(필수)</span><a href="#">전체보기 &gt;</a></li>
					</ul>
					<!-- <ul class="terms_check">
						<li><a href="#">전체보기 &gt;</a>
						<li><a href="#">전체보기 &gt;</a>
					</ul> -->
				</div>					
			</div>
				<button type="button" id="cancle_btn">취소</button>
				<button type="button" id="signin_btn">확인</button>
		</div>	
	</div>
</body>
</html>