<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>WAFFLE</title>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<link rel="stylesheet" type="text/css" href="/css/register.css" />
	<script src="/js/register.js"></script>
	
</head>
<script>		    
		    function find_zipcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var roadAddr = data.roadAddress; // 도로명 주소 변수
		                var extraRoadAddr = ''; // 참고 항목 변수
		
		                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraRoadAddr += data.bname;
		                }
		                // 건물명이 있고, 공동주택일 경우 추가한다.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                if(extraRoadAddr !== ''){
		                    extraRoadAddr = ' (' + extraRoadAddr + ')';
		                }
		
		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('zipcode').value = data.zonecode;
		                document.getElementById("roadAddress").value = roadAddr;
		                /* document.getElementById("jibunAddress").value = data.jibunAddress; */
		                
		                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
		                if(roadAddr !== ''){
		                    document.getElementById("extraAddress").value = extraRoadAddr;
		                } else {
		                    document.getElementById("extraAddress").value = '';
		                }
		
		                var guideTextBox = document.getElementById("guide");
		                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
		                if(data.autoRoadAddress) {
		                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
		                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
		                    guideTextBox.style.display = 'block';
		
		                } else if(data.autoJibunAddress) {
		                    var expJibunAddr = data.autoJibunAddress;
		                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
		                    guideTextBox.style.display = 'block';
		                } else {
		                    guideTextBox.innerHTML = '';
		                    guideTextBox.style.display = 'none';
		                }
		            }
		        }).open();
		    }
		</script>	

<body>
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<div class="container">
		<div class="frame">
			<h2>SIGN IN</h2>
			<span class="logo">WAFFLE</span>
			<span class="intro">IoT Service</span>
			<span class="box1"></span><span class="box2"></span>
			
			<div class="input">
				<form action="/member/register" method="post">
					<div class="register-group idchkgrp">
				        <label for="memId">아이디</label>
				        <input type="text" class="form-control" id="memId" name="memId" placeholder="아이디" required>
				        <button class="idChk" type="button" id="idChk" onclick="fn_idChk()" value="N">중복확인</button>
				        <p id="idValidate_message"></p>
				 	</div>
				    <!-- 비밀번호 -->
				    <div class="register-group passchkgrp1">
				        <label for="memPass">비밀번호</label>
				        <input type="password" id="memPass" name="memPass" placeholder="비밀번호" required>
				        <p id="pwValidate_message"></p>
				    </div>
				    <!-- 비밀번호 재확인 -->
				    <div class="register-group passchkgrp2">
				        <label for="memPass2">비밀번호 확인</label>
				        <input type="password" id="memPass2" name="memPass2" placeholder="비밀번호 확인" required><br>
				        <p id="compare_pass"> </p>
				    </div>
				    <!-- 이름 -->
				    <div class="register-group ">
				        <label for="memName">이름</label>
				        <input type="text" id="memName" name="memName" placeholder="이름" required>
				    </div>
				    <!-- 생년월일 -->
				    <div class="register-group">
				        <label for="memBirth">생년월일</label>
				        <input type="text" id="memBirth" name="memBirth" placeholder="ex) 19990415" required>
				    </div>
				    <!-- 본인확인 이메일 -->
				    <div class="register-group emailchkgrp">
				        <label for="memEmail">이메일</label>
				        <input type="text" name="memEmail" id="memEmail" placeholder="이메일" required>
				        <button class="emailChk" type="button" id="emailChk" onclick="fn_emailChk()" value="N">중복확인</button>
				        <p id="emailValidate_message"></p>		 	        
				    </div>
				    <!-- 휴대전화 -->
				    <div class="register-group memPhone">
				        <label for="memPhone">휴대전화<br>('-' 없이 번호만 입력해주세요)</label>
				        <input type="text" id="memPhone" name="memPhone" placeholder="Phone Number1" required>
				        <p id="phoneValidate_message"></p>
				    </div>
				    <div class="register-group memPhone2">
				        <label for="memPhone2">비상시연락처<br>('-' 없이 번호만 입력해주세요)</label>
				        <input type="text" id="memPhone2" name="memPhone2" placeholder="Phone Number2" required>
				        <p id="phone2Validate_message"></p>
				    </div>
				    <div class="Address">
				    	<label for="zipcode">우편번호를 검색해주세요</label>
				    	<input type="text" id="zipcode" name="zipcode" class="zipcode" placeholder="우편번호">
						<input type="button" onclick="find_zipcode()" class="zipChk" value="주소 찾기"><br>
						<input type="text" id="roadAddress"  name="roadAddress"placeholder="도로명주소"><br>						
						<span id="guide" style="color:#999;display:none"></span><br>
						<input type="text" id="detailAddress" name="detailAddress" placeholder="상세주소"><br>
						<input type="text" id="extraAddress" name="extraAddress" placeholder="참고항목"><br>												    					    
				    </div>
				    <input type="hidden" id="memAuthor" name="memAuthor" value="0"/>				    
					<button class="reg_btn" type="submit" id="submit">회원가입</button>				
				</form>		
			</div>				
		</div>	
	</div>
	
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	<script src="/js/app.js"></script>
</body>
</html>