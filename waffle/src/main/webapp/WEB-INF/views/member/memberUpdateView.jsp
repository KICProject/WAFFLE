<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<link rel="stylesheet" type="text/css" href="/css/update.css" />
</head>
<script type="text/javascript">
		$(document).ready(function(){
			//로그인이 안되어 있을 때
			$('#tomain_btn').on('click',function(){
			location.href="/";
			})
			$('#signin_btn').on('click',function(){
				location.href="/member/loginControl";
			})
			
			
			// 취소
			$(".cancle").on("click", function(){
				
				location.href = "/login";
						    
			})
			// 회원탈퇴
			$("#bye").on("click", function(){
				
				location.href="./memberDeleteView";
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
					alert("휴대전화를 입력해주세요.");
					$("#memPhone2").focus();
					return false;
				}
				if($("#memEmail").val()==""){
					alert("휴대전화를 입력해주세요.");
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
					url : "/member/passChk",
					type : "post",
					dataType : "json",
					data : $("#updateForm").serializeArray(),
					success : function(data){
						if(data == true){
							if(confirm("회원수정하시겠습니까?")){
								$("#updateForm").submit();
							}
						}else{
							alert("패스워드가 틀렸습니다.");
						}
					}
				})
			}
	</script>
<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
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
	<div class="container">
		<div class="frame">
			<h2>SIGN IN</h2>
			<span class="logo">WAFFLE</span>
			<span class="intro">IoT Service</span>
			<span class="box1"></span><span class="box2"></span>
			
			<div class="input">
				<form action="/member/register" method="post" id="updateForm">
					<div class="form-group">
				        <label for="memId">아이디</label>
				        <input type="text" class="form-control" id="memId" name="memId"  value="${member.memId }" disabled>
				        <input type="hidden" id="memId" name="memId" value="${member.memId }">
				 	</div>
				    <!-- 비밀번호 -->
				    <div class="form-group">
				        <label for="memPass">비밀번호</label>
				        <input type="password" class="form-control" id="memPass" name="memPass" placeholder="PASSWORD" required>
				    </div>
				    <!-- 이름 -->
				    <div class="form-group ">
				        <label for="memName">이름</label>
				        <input type="text" class="form-control" id="memName" name="memName" value="${member.memName }" required>
				    </div>
				    <!-- 생년월일 -->
				    <div class="form-group">
				        <label for="memBirth">생년월일</label>
				        <input type="text" class="form-control" id="memBirth" name="memBirth" value="${member.memBirth}" required>
				    </div>
				    <!-- 본인확인 이메일 -->
				    <div class="form-group">
				        <label for="memEmail">이메일</label>
				        <input type="text" class="form-control" name="memEmail" id="memEmail" value="${member.memEmail}" required>
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
				        <input type="text" class="form-control" id="memPhone" name="memPhone" value="${member.memPhone}" required>
				    </div>
				    <div class="form-group memPhone2">
				        <label for="memPhone2">비상시연락처<br>('-' 없이 번호만 입력해주세요)</label>
				        <input type="text" class="form-control" id="memPhone2" name="memPhone2" value="${member.memPhone2}" required>
				    </div>
				    <div class="form-group">
				        <label for="memAddr">주소를 입력해주세요</label>
				        <input type="text" class="form-control" id="memAddr" name="memAddr" value="${member.memAddr}"required>
				    </div>
				    <input type="hidden" id="memAuthor" name="memAuthor" value="${member.memAuthor }">
				</form>
				<button class="update_btn" type="button" id="submit">회원정보수정</button>
				<button class="bye" type="button" id="bye">회원탈퇴</button>
				<button class="cancle" type="button">취소</button>			
			</div>				
		</div>	
	</div>
	</c:if>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
		<script src="/js/app.js"></script>
</body>
</html>