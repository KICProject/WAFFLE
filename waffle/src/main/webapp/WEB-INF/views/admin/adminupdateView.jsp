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
	 	
	 	<title>게시판</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(document).on("click","#fileDel", function(){
				$(this).parent().remove();
			})
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/admin/adminView?memid=${memberUpdate.memId}"
					  /*  + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}"; */
			})
			
			$(".update_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/admin/adminlist");
				formObj.attr("method", "post");
				formObj.submit();
			})
		})
			
		function fn_valiChk(){
			var updateForm = $("form[name='updateForm'] .chk").length;
			for(var i = 0; i<updateForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("memId"));
					return true;
				}
			}
		}
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
				<form name="updateForm" role="form" method="post" action="/admin/updateInfo" enctype="multipart/form-data">
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					<table>
						<tbody>
							<tr style="width: 20px'">
								<td >
									<label for="memId" class="col-sm-2 control-label" style="width:1000;">아이디</label><input style="margin-bottom: 15px;" class="form-control" type="text" id="memId" name="memId" value="${memberUpdate.memId}" class="chk" readonly="readonly"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="memName" class="col-sm-2 control-label">이름</label><input style="margin-bottom: 15px;" class="form-control" type="text" id="memName" name="memName" value="${memberUpdate.memName}" class="chk" title="제목을 입력하세요."/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="memBirth" class="col-sm-2 control-label">생년월일</label><input style="margin-bottom: 15px;" class="form-control" type="date" id="memBirth" name="memBirth" value=<c:out value="${memberUpdate.memBirth}"/>class="chk" title="제목을 입력하세요."/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="memPhone"  class="col-sm-2 control-label">연락처</label><input style="margin-bottom: 15px;" class="form-control" type="text" id="memPhone" name="memPhone" value="${memberUpdate.memPhone}" class="chk" title="제목을 입력하세요."/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="memPhone2"  class="col-sm-2 control-label">연락처2</label><input style="margin-bottom: 15px;" class="form-control" type="text" id="memPhone2" name="memPhone2" value="${memberUpdate.memPhone2}" class="chk" title="제목을 입력하세요."/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="memAddr" class="col-sm-2 control-label">주소</label><input style="margin-bottom: 15px;" class="form-control" type="text" id="memAddr" name="memAddr" value="${memberUpdate.memAddr}" class="chk" title="제목을 입력하세요."/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="memEmail" class="col-sm-2 control-label">이메일</label><input style="margin-bottom: 15px;" class="form-control" type="text" id="memEmail" name="memEmail" value="${memberUpdate.memEmail}" class="chk" title="제목을 입력하세요."/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="memAuthor" class="col-sm-2 control-label">권한</label><input style="margin-bottom: 15px;" class="form-control" type="text" id="memAuthor" name="memAuthor" value="${memberUpdate.memAuthor}" 	class="chk" title="제목을 입력하세요."/>
								<%-- 	<select class="form-control">
									<c:out value="${memberUpdate.memAuthor}"/>
										<option id="memAuthor" value="memAuthor">0</option>
										<option id="memAuthor" value="memAuthor">1</option>
									</select>  --%>
								</td>
							</tr>
						</tbody>	
					</table>
						<hr>		
					<div>
						<button type="button" class="update_btn btn btn-success">저장</button>	
						<button type="button" class="cancel_btn btn btn-danger">취소</button>
					</div>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>