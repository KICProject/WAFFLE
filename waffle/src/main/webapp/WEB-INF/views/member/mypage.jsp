<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WAFFLE</title>
<link rel="stylesheet" type="text/css" href="/css/mypage5.css?after" />
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="/js/mypage.js"></script>
</head>
<script type="text/javascript">

$(function(){
	//로그인이 안되어 있을 때
	$('#tomain_btn').on('click',function(){
		location.href="/";
	})
	$('#signin_btn').on('click',function(){
		location.href="/member/loginControl";
	})	
});
</script>
<body>	
	<jsp:include page="/WEB-INF/views/include/header_bk.jsp"/>
	<c:if test="${member == null}">
		<div class="container">		
			<div class="login_first">
				<p>
					로그인을<br>
					먼저 해주시기 바랍니다. 
				</p>
				<div class="btn_group">
					<button type="button" id="tomain_btn">메인으로</button>
					<button type="button" id="signin_btn">로그인</button>
				</div>
			</div>			
		</div>
	</c:if>
	<c:if test="${member != null}">
	<script>
	$(function(){
		$('#memId1').text("${member.memId}");
		$('#memName1').text("${member.memName}"+' 님')
	})
	</script>
	<section class="mypage">		
        <!--  title -->
        <div class="mypage_head">
          <p class="title_big">MyPage</p>
          <p class="title_small">WAFFLE</p>
        </div>      
        <!-- content -->
        <div class="mypage_menu">
        	<div class="profile">
        		<div>
        			<img src="/img/profile_wh.png" alt="profile">
    	    		<br><span id="memId1"></span>
        		</div>
	       		<p id="memName1"></p>
        	</div>
        	<div class="using_info">
        		<ul>
        			<li>이용정보
        				<ul>
        					<li>
        						<a href="#" id="paymentData">결제정보</a>
        					</li>
        				</ul>
        			</li>
        		</ul>
        	</div>
        	<div class="cs">
        		<ul>
        			<li>고객센터
        				<ul>
        					<li>
        						<a href="#" id="csBoard">문의내역</a>
        					</li>
        				</ul>
        			</li>
        		</ul>
        	</div>
        	<div class="user_info">
        		<ul>
        			<li>회원정보
        				<ul>
        					<li>
        						<a href="#" id="memberUpdate">회원정보수정</a>
        					</li>
        					<li>
        						<a href="#" id="memberDelete">회원탈퇴</a>
        					</li>
        				</ul>
        			</li>
        		</ul>
        	</div>        	
        </div>
        <div class="mypage_content">
        <script>
	       $(function(){
        		$('#memId').text("${member.memId}");
        		$('#memName').text("${member.memName}")
        		$('#serviceName').text("${usvo.serviceName}")
        		var usvo = "${usvo.serviceName}";
        		var usvd = ("${usvo.serviceDate}").substring(0,10);
        		var usved = ("${usvo.expireDate}").substring(0,10);
        		switch (usvo){
        		case  "basic": 
        			$('#rcnt').text('1');
        			break;
        		case  "pro" : 
        			$('#rcnt').text('3');
        			break;
        		case  "ultimate": 
        			$('#rcnt').text('5');
        			break;
        		default : 
        			$('#rcnt').text('이용중인 서비스가 없습니다.');
        			$('#serviceName').text('이용중인 서비스가 없습니다.')
        		}
        		
        		$('#regDate').text(usvd);
        		$('#expDate').text(usved);
        		
        		$('#passEnter').click(function(){
        			if($('#memUpdatePass').val()==""){
        				alert('비밀번호를 입력해주세요.');
        				return false;
        			}
        			$.ajax({
        				url:"/member/passDbChk",
        				type:"POST",
        				dataType:"json",
        				data: $("#updateConfim").serializeArray(),
        				success : function(data){
        					if(data==true){
        						$('.user_info_update>.content').load('/member/updateView')
        						console.log('성공')
        					}else{
        						alert('비밀번호가 틀립니다')
        						return;
        					}
        				
        				},
        				error:function(e){
        					console.log(e)
							alert('오류발생');
        					return;
        				}
        			
        			})
        		})
        		$('#passEnter2').click(function(){
        			if($('#memDeletePass').val()==""){
        				alert('비밀번호를 입력해주세요.');
        				return false;
        			}
        			$.ajax({
        				url:"/member/passDbChk",
        				type:"POST",
        				dataType:"json",
        				data: $("#deleteConfim").serializeArray(),
        				success : function(data){
        					if(data==true){
        						console.log('비밀번호 ok')
        						$.ajax({
        							url:"/member/memberDelete",
        							type:"POST",
        							data: $("#deleteConfim").serializeArray(),
        							success:function(process){
        								if(process == true)
        								alert('탈퇴가 완료되었습니다.')
        								location.href="/"        								
        							}
        						})
	       					}else{
        						alert('비밀번호가 틀립니다')
        						return;
        					}
        				
        				},
        				error:function(e){
        					console.log(e)
							alert('오류발생');
        					return;
        				}
        			
        			})
        		})
        		
        	})
        </script>
        	<div class="using_info_content show">
        		<h3>이용중인 서비스</h3>
        		<div class="content">
					<p>
						<span>아이디</span>
						<span id="memId"></span>
					</p>
					<p>
						<span>이름</span>
						<span id="memName"></span>
					</p>
					<p>
						<span>이용중인 서비스</span>
						<span id="serviceName"></span>
					</p>	
					<p>
						<span>설정된 방 갯수</span>
						<span id="rcnt"></span>
					</p>
					<p>
						<span>서비스 가입일</span>
						<span id="regDate"></span>
					</p>
					<p>
						<span>서비스 만료일</span>
						<span id="expDate"></span>
					</p>
        		</div>
        	</div>
        	<div class="cs_content">				
        		
        	</div>
        	<div class="user_info_update">
        		<h3>회원정보관리</h3>        		
		       	<div class="content">
		       		<form method="post" id="updateConfim">
			    		<label for="memPass">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인해주세요.</label>
			    		<input type="hidden" id="memUpdateId" name="memId" value="${member.memId }">
			    		<input type="password" id="memUpdatePass" name="memPass">		       			
			    		<input type="button" id="passEnter" value="확인">
		       		</form>
		       	</div>       		     		
        	</div>
        	<div class="user_info_delete">
        		<h3>탈퇴하기</h3>
	       		<div class="content">
	       			<form method="post" id="deleteConfim">
			    		<label for="memPass">회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인해주세요.</label>
			    		<input type="hidden" id="memDeleteId" name="memId" value="${member.memId }">
			    		<input type="password" id="memDeletePass" name="memPass">		       			
			    		<input type="button" id="passEnter2" value="확인">
		       		</form>      			
	       		</div>	       		
        	</div>
        </div>
    </section>
    </c:if>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	<script src="/js/app.js"></script>
</body>
</html>