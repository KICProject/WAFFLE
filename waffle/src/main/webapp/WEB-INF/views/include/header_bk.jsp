<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WAFFLE</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/css/header_bk_.css" />
</head>
<body>	
	<!-- header -->
	<header>
		<a href="/"><span class="logo">AFFLE</span></a>
		<ul class="gnp">
			<c:if test="${member == null}">
				<li class="login"><a href="#" id="login_btn"></a></li>
			</c:if>
			<c:if test="${member != null}">
				<li class="logout"><a href="#" id="logoutBtn"></a></li>
			</c:if>			
			<li class="search"><a href="#"></a></li>
			<li class="my_page"><a href="#"></a></li>
		</ul>		
	</header>
	<!-- nav -->
	<nav>
		<div class="hamburg_box">
			<div class="hamburg"></div>
		</div>
		<div class="menu_box">
			<div class="dimmed"></div>
			<div class="menu">
				<div class="btn_x"></div>
				<ul>
					<li><a href="#" id="about">About</a></li>
					<li><a href="/sub/waffleService">Service</a></li>
					<li><a href="#">Product</a></li>
					<li><a href="/sub/waffleBoard">Customer</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<script type="text/javascript">
			$(document).ready(function() {
				$("#login_btn").on("click", function() {
					location.href = "/member/loginControl";
				})
				$("#logoutBtn").on("click", function() {
					$.ajax({
						url : "/member/logout",
						type:"get",
						success: function(){
							sessionStorage.clear();
							location.href="/home"
							location.reload();
							alert('로그아웃 되었습니다.\n 감사합니다.');
						},error:function(e){
							alert('정상적으로 종료되지 않았습니다.');
						}
					})
				})
				$(".search").on("click", function() {
					location.href = "redirect:/";
				})
				$(".my_page").on("click", function() {
					location.href = "/member/mypage";
				})
				$("#about").on("click", function(){
					location.href ="/sub/about"
				})	
			})
		</script>
</body>