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
		background-image:url("/img/join_background_copy.jpg");
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
		height: 1000px;
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
	.container > .frame > .input{
		overflow:hidden;
		clear:both;
		padding-top:20px;		
		position:relative;
		left:50%;
		transform:translateX(-50%);	
		width:600px;
		height:1000px;
		float:left;
		
	}
	.input form{
		width:600px;
		height:1000px;
		
	}
	.input .form-group{
		width:600px;
		height:40px;
		color:#fff;
		font-size:14px;
		margin:20px 0;
	}
	
	.input .form-group label{
		display:block;
		width:200px;
		height:35px;
		float:left;
		line-height:35px;
	}
	.input .form-group input{
		width:290px;
		height:33px;
		float:left;
		line-height:35px;
		margin-left:30px;
		
	}
	
	.input .memPhone,.input .memPhone2 {
		height:40px;				
	}
	.input .memPhone label, .input .memPhone2 label{
		height:40px;
		line-height:20px;
	}

	.reg_btn{
		width: 240px;
		height: 50px;
		opacity: 0.73;
		border-radius: 24.5px;
		background-color: #afde77;
		clear:both;
		margin:30px 176px;
	}
	.idChk{
		width: 70px;
		height: 30px;
		opacity: 0.73;
		border-radius: 24.5px;
		background-color: #f38;
		float:left;
		margin-left:5px;
	}
	.show{
		display:block;
	}
	
	
</style>
</head>
<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cancle").on("click", function(){
				
				location.href = "/login";
						    
			})
			// 비밀번호 확인 체크
			$('#memPass2').on("focusout",function(){
				if($(this).val() == $('#memPass').val()){
					alert('입력한 비밀번호와 일치합니다. 계속 진행해주세요.')
				}else{
					alert('입력한 비밀번호와 일치하지 않습니다. 다시 입력해주세요.');
				}
			})
			$("#submit").on("click", function(){
				if($("#memId").val()==""){
					alert("아이디를 입력해주세요.");
					$("#memId").focus();
					return false;
				}
				if($("#memPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#memPass").focus();
					return false;
				}
				if($("#memName").val()==""){
					alert("성명을 입력해주세요.");
					$("#memName").focus();
					return false;
				}
				if($("#memBirth").val()==""){
					alert("생년월일을 입력해주세요.");
					$("#memBirth").focus();
					return false;
				}
				if($("#memPhone").val()==""){
					alert("전화번호를 입력해주세요.");
					$("#memPhone").focus();
					return false;
				}
				if($("#memPhone2").val()==""){
					alert("후대전화를 입력해주세요.");
					$("#memPhone2").focus();
					return false;
				}
				if($("#memEmail").val()==""){
					alert("후대전화를 입력해주세요.");
					$("#memEmail").focus();
					return false;
				}
				if($("#memAddr").val()==""){
					alert("주소를 입력해주세요.");
					$("#memAddr").focus();
					return false;
				}
			})
			
			
		})
		
		function fn_idChk(){
				$.ajax({
					url : "/member/idChk",
					type : "post",
					dataType : "json",
					data : {"memId" : $("#memId").val()},
					success : function(data){
						if(data == 1){
							alert("중복된 아이디입니다.");
						}else if(data == 0){
							$("#idChk").attr("value", "Y");
							alert("사용가능한 아이디입니다.");
						}
					}
				})
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
			
			<div class="input">
				<form action="/member/register" method="post">
					<div class="form-group">
				        <label for="memId">아이디</label>
				        <input type="text" class="form-control" id="memId" name="memId" placeholder="ID" required>
				        <button class="idChk" type="button" id="idChk" onclick="fn_idChk()" value="N">중복확인</button>
				 	</div>
				    <!-- 비밀번호 -->
				    <div class="form-group">
				        <label for="memPass">비밀번호</label>
				        <input type="password" class="form-control" id="memPass" name="memPass" placeholder="PASSWORD" required>
				    </div>
				    <!-- 비밀번호 재확인 -->
				    <div class="form-group">
				        <label for="memPass2">비밀번호 확인</label>
				        <input type="password" class="form-control" id="memPass2" name="memPass2" placeholder="Confirm Password" required>
				        <span id="compare_pass"></span>
				    </div>
				    <!-- 이름 -->
				    <div class="form-group ">
				        <label for="memName">이름</label>
				        <input type="text" class="form-control" id="memName" name="memName" placeholder="Name" required>
				    </div>
				    <!-- 생년월일 -->
				    <div class="form-group">
				        <label for="memBirth">생년월일</label>
				        <input type="text" class="form-control" id="memBirth" name="memBirth" placeholder="ex) 19990415" required>
				    </div>
				    <!-- 본인확인 이메일 -->
				    <div class="form-group">
				        <label for="memEmail">이메일</label>
				        <input type="text" class="form-control" name="memEmail" id="memEmail" placeholder="E-mail" required>
				        <!-- <input type="text" style="margin-top: 5px;"class="email_form" name="email_confirm" id="email_confirm" placeholder="인증번호를 입력해주세요!" required>
										<button type="button" class="btn btn-outline-danger btn-sm px-3" onclick="confirm_email()">
											<i class="fa fa-envelope"></i>&nbsp;인증
										</button>&nbsp;
										<button type="button" class="btn btn-outline-info btn-sm px-3">
											<i class="fa fa-envelope"></i>&nbsp;확인
										</button>&nbsp; -->			        
				    </div>
				    <!-- 휴대전화 -->
				    <div class="form-group memPhone">
				        <label for="memPhone">휴대전화<br>('-' 없이 번호만 입력해주세요)</label>
				        <input type="text" class="form-control" id="memPhone" name="memPhone" placeholder="Phone Number" required>
				    </div>
				    <div class="form-group memPhone2">
				        <label for="memPhone2">비상시연락처<br>('-' 없이 번호만 입력해주세요)</label>
				        <input type="text" class="form-control" id="memPhone2" name="memPhone2" placeholder="Phone Number" required>
				    </div>
				    <div class="form-group">
				        <label for="memAddr">주소를 입력해주세요</label>
				        <input type="text" class="form-control" id="memAddr" name="memAddr" placeholder="Address" required>
				    </div>
				    <input type="hidden" id="memAuthor" name="memAuthor" value="0"/>
				    
					<button class="reg_btn" type="submit" id="submit">회원가입</button>						
					
				</form>		
			</div>				
		</div>	
	</div>
</body>
</html>