
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
li {list-style: none; display:inline; padding: 6px;}
</style>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원탈퇴</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#memberC").on("click", function(){
				location.href="adminlist"
						    
			})
		})
		$(document).ready(function(){
			$("#listC").on("click", function(){
				location.href="listC"
						    
			})
		})
	</script>
	<body>
	<ul>
	<li><input type="button" id ="memberC" class ="btn btn-wearning" value="회원관리"></li>
	<li><input type="button" id ="listC" class ="btn btn-wearning" value="게시판관리"></li>
	</ul>		

	</body>	
</html>
