<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>WAFFLE</title>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/css/welcome.css" />
</head>
<script type="text/javascript">
	$(function(){
		$('#tomain_btn').on('click',function(){
			location.href="/";
		})
		$('#signin_btn').on('click',function(){
			location.href="/member/loginControl";
		})
		
	});
</script>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
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
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	<script src="/js/app.js"></script>
</body>
</html>