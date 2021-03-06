<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WAFFLE</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/agree.css" />
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
	
	function setCheckAll(){ // '모두 동의' 를 클릭 시, 약관 체크박스를 모두 체크해주는/(해제도) 함수
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
	<jsp:include page="/WEB-INF/views/include/header.jsp"/>
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
				</div>					
			</div>
				<button type="button" id="cancle_btn">취소</button>
				<button type="button" id="signin_btn">확인</button>
		</div>	
	</div>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	<script src="/js/app.js"></script>
</body>
</html>