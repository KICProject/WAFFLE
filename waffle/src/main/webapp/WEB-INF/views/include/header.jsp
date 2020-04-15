<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/reset.css" />
<link rel="stylesheet" type="text/css" href="/css/header.css" />
</head>
<body>
	
	<!-- header -->
	<header>
		<a href="/"><span class="logo">AFFLE</span></a>
		<ul class="gnp">
			<c:if test="${member == null}">
				<li class="login"><a href="member/loginControl" id="login_btn"></a></li>
			</c:if>
			<c:if test="${member != null}">
				<li class="logout"><a href="member/logout" id="logoutBtn"></a></li>
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
					<li><a href="#">About</a></li>
					<li><a href="#">Service</a></li>
					<li><a href="#">Product</a></li>
					<li><a href="#">Customer</a></li>
				</ul>
			</div>
		</div>
	</nav>
</body>