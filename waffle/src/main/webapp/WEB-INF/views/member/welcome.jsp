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
	
	.container > .welcom_msg{
		position:absolute;
		top:50%;
		left:50%;
		transform:translate(-50%,-50%);
		text-align:center;
	}
	.welcom_msg img{
		display:block;
		margin:0 auto;		
	}
	
	.welcom_msg p{
		margin:20px auto;
		line-height:20px;
		font-size:18px;
	}
	
	.welcom_msg .btn_group {
		width:510px;
		height:50px;
		margin:30px auto;
	}
	#tomain_btn, #signin_btn{
		width: 240px;
		height: 50px;
		border-radius: 24.5px;
		border:2px solid #fff;
		background:rgba(255,255,255,0);
		float:left;	
		color:#fff;
		font-size:18px;
	}
	#tomain_btn{
		margin-right:20px;
	}

</style>
</head>
<script type="text/javascript">
	$(function(){
		$('#tomain_btn').on('click',function(){
			location.href="/";
		})
		$('#signin_btn').on('click',function(){
			location.href="/";
		})
		
	});
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
		
		<div class="welcom_msg">
			<a href="/board/list">게시판</a><br />
			<img src="/img/welLogo.png">
			<p>
				고객님<br>
				와플 회원이 되신 것을 환영합니다. 
			</p>
			<p>
				모든 가입 절차가 완료되었습니다. 로그인 후 모든 서비스를 이용할 수 있습니다. 
			</p>
			<div class="btn_group">
				<button type="button" id="tomain_btn">메인으로</button>
				<button type="button" id="signin_btn">로그인</button>
			</div>
		</div>
		
	</div>
</body>
</html>