<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		/* overflow:hidden; */
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
	
	/* login_container */
	.container > .login_frame{
		margin:0 auto;
		margin-top:150px;
		width: 800px;
		height: 740px;
		/* opacity: 0.5; */
		border-radius: 50px;
		box-shadow: 0px 30px 21px 0 rgba(64, 64, 64, 0.67);
		background-image: linear-gradient(to bottom, #051c29 14%, #051c29 14%, #405590 42%, #7283b3 63%, #576d95 68%, #425b7c 72%, #113245 86%);
		background-color:rgba(255,255,255,0.5);		
		overflow:hidden;
		
	}
	.container > .login_frame > h2 {
		padding-top:65px;
		padding-left:92px;
		width: 201px;
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
	.container > .login_frame .logo {
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
	.container > .login_frame .intro {
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
	.container > .login_frame .box1{
		clear:both;
		display:block;
		width:232px;
		height:6px;
		background-color:#fff;
		margin-left:66px;
		float:left;
	}
	.container > .login_frame .box2{
		display:block;
		width:436px;
		height:3px;
		margin-top:3px;
		background-color:#fff;
		float:left;		
	}
	
	.container > .login_frame > .login_input{
		overflow:hidden;
		clear:both;
		padding-top:20px;
		margin-left:40px;
		width:359px;	
		float:left;
	}
	#memId {
  		width:232px;
  		height:36px;
  		margin:94px auto 0 66px;
  		opacity: 0.52;
  		border: solid 1px #ffffff;
  	}
  	#memPass {
  		width:232px;
  		height:36px;
  		opacity: 0.52;
  		border: solid 1px #ffffff;
  		margin:15px auto 0 66px;
  	}
  	#login_btn{
		width: 232px;
	 	height: 39px;
	  	opacity: 0.73;
	  	border-radius: 24.5px;
	  	background-color: #c3fe5d;
	  	margin:30px auto 0 66px;
  	}
  	
  	.container > .login_frame > .login_input ul{
  		display:block;
  		margin:20px auto;
  		float:left;
  		margin-left:66px;
  		
  	}
  	
  	.container > .login_frame > .login_input ul li{
  		float:left;
  		margin-right:20px;
  	}
  	
  	.container > .login_frame > .login_input ul li a{
  		float:left;
  		margin-rigt:10px;
  		color:#fff;
  	}
	
	.middle_line{
		display:block;
		background-color:#fff;
		height:387px;
		width:1px;
		float:left;
		margin-top:40px;
	}
	
	.container > .login_frame > .singin_box{
		overflow:hidden;
		padding-top:94px;
		margin-left:40px;
		width:358px;	
		float:right;		
	}	
	
	.signin_box > p {
		width: 164px;
		height: 20px;
		font-family: "SpoqaHanSans";
		font-size: 14px;
		font-weight: bold;
		font-stretch: normal;
		font-style: normal;
		line-height: 0.49;
		letter-spacing: 1.4px;
	}
	.singin_box > span{
		display:block;
		width: 250px;
		height: 15px;
		font-family: "SpoqaHanSans";
		font-size: 10px;
		font-weight: normal;
		font-stretch: normal;
		font-style: normal;
		line-height: 1.8;
		letter-spacing: 1px;
		margin:10px 0px;
	}
	
	#signin_btn{
		width: 236px;
		height: 49px;
		opacity: 0.73;
		border-radius: 24.5px;
		background-color: #aaa8d8;
	}
	.SNS {
		margin-left:126px;
		margin-top:30px;
		
	}
</style>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		$("#logoutBtn").on("click", function(){
			location.href="./logout";
		})
		$("#signin_btn").on("click",function(){
			location.href="./agree";
		})
		$("#memberUpdateBtn").on("click",function(){
			location.href="./memberUpdateView";
		})
		
	})
</script>
<body>
	<header>
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
		<div class="login_frame">
			<h2>LOGIN</h2>
			<span class="logo">WAFFLE</span>
			<span class="intro">IoT Service</span>
			<span class="box1"></span><span class="box2"></span>
			
			<div class="login_input">
				<form name='homeForm' method="post" action="./login">
				<c:if test="${member == null}">		
					<input type="text" name="memId" id="memId" placeholder="아이디"><br>
					<input type="password" name="memPass" id="memPass" placeholder="비밀번호"><br>
				<button type="submit" id="login_btn">로그인</button><br>
				</c:if>
				<c:if test="${msg == false}">
					<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
				</c:if>
				</form>				
				<ul>
					<li><a href="#">아이디 찾기</a><span>&nbsp;&nbsp;&nbsp;|</span></li>					
					<li><a href="#">비밀번호 찾기</a></li>
				</ul><br>
				<span class="SNS"> SNS 로그인</span><br>
				<ul>
					<li><a href="#"><img src="" alt="">네이버로고</a></li>
					<li><a href="#"><img src="" alt="">카카오로고</a></li>
				</ul> 	
							
			</div>
			<span class="middle_line"></span>
			<div class="singin_box">
				<p>아직 회원가입 전이세요?</p>
				<span>회원등록하시고 와플의 다양한 서비스를 이용해보세요</span><br>
				<button type="button" id="signin_btn">회원가입</button>
			</div>
		</div>
	</div>
</body>
</html>