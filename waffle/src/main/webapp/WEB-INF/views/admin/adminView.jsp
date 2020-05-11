<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	
	 	<title>관리자페이지</title>
	</head>
	
	<script type="text/javascript">
		
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/admin/adminupdateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				
				var deleteYN = confirm("삭제하시겠습니까?");
				if(deleteYN == true){
					
				formObj.attr("action", "/admin/deleteInfo");
				formObj.attr("method", "post");
				formObj.submit();
					
				}
			})
			
			// 목록
			$(".list_btn").on("click", function(){
				
				location.href = "/admin/adminlist?page=${scri.page}"
						      +"&perPageNum=${scri.perPageNum}"
						      +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			})
			//비밀번호 초기화
			$(".clearpwd_btn").on("click", function(){
				var result = confirm("정말로 비밀번호를 초기화 하시겠습니까?");
				if(result){//확인버튼을 눌렀을 때
				var pwdcheck = prompt("관리자 비밀번호를 입력해주세요")
				var adminpass == $("#adminpwd").val();
				if(pwdchekck == adminpass){
				formObj.attr("action", "/admin/pwdclear");
				formObj.attr("method", "post");
				formObj.submit();
				alert("비밀번호 초기화 완료")
				}//inner if 
				else
					alert("비밀번호가 틀립니다.")
				}//outer if 
				
				else
					alert("비밀번호 초기화 취소")
			})
			
		})

	</script>
	
	<body>
		<div class="container">
			<header>
				<h1> 관리자 페이지</h1>
			</header>
			<hr />
			 
			<div>
				<%@include file="nav.jsp" %>
			</div>
			
			<section id="container">
				<form name="readForm" role="form" method="post">
					<input type="hidden" id="adminpwd" name="adminpwd" value="${adminpwd.memPass }">
					<%-- <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> --%>
				
				<div class="form-group">
					<label for="memId" class="col-sm-2 control-label">아이디</label>
					<input type="text" id="memId" name="memId" class="form-control" value="${readmember.memId}" readonly="readonly" />
				</div>
				<div class="form-group">
					<label for="memName" class="col-sm-2 control-label">이름</label>
					<textarea id="memName" name="memName" class="form-control" readonly="readonly"><c:out value="${readmember.memName}" /></textarea>
				</div>
				<div class="form-group">
					<label for="memBirth" class="col-sm-2 control-label">생년월일</label>
					<input type="text" id="memBirth" name="memBirth" class="form-control" value="${readmember.memBirth}"  readonly="readonly"/>
				</div>
				<div class="form-group">
					<label for="memPhone" class="col-sm-2 control-label">연락처</label>
					<input type="text" id="memPhone" name="memPhone" class="form-control" value="${readmember.memPhone}"  readonly="readonly"/>
				</div>
				<div class="form-group">
					<label for="memPhone2" class="col-sm-2 control-label">연락처2</label>
					<input type="text" id="memPhone2" name="memPhone2" class="form-control" value="${readmember.memPhone2}"  readonly="readonly"/>
				</div>
				<div class="form-group">
					<label for="memAddr" class="col-sm-2 control-label">주소</label>
					<input type="text" id="memAddr" name="memAddr" class="form-control" value="${readmember.memAddr}"  readonly="readonly"/>
				</div>
				<div class="form-group">
					<label for="memEmail" class="col-sm-2 control-label">이메일</label>
					<input type="text" id="memEmail" name="memEmail" class="form-control" value="${readmember.memEmail}"  readonly="readonly"/>
				</div>
				<div class="form-group">
					<label for="memAuthor" class="col-sm-2 control-label">권한</label>
					<input type="text" id="memAuthor" name="memAuthor" class="form-control" value="${readmember.memAuthor}"  readonly="readonly"/>
				</div>
			
				<hr>
				<div>
					<button type="button" class="update_btn btn btn-warning">수정</button>
					<button type="button" class="delete_btn btn btn-danger">삭제</button>
					<button type="button" class="list_btn btn btn-primary">목록</button>	
					<button type="button" class="clearpwd_btn btn btn-danger" style="float: right">비밀번로 초기화</button>	
				</div>
				
						</div>
					</div>
				</from>
			</section>
			<hr />
		</div>
	</body>
</html>