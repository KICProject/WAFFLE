<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>		
		<!-- Popper JS -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>		
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	 	<!-- <title>게시판</title> -->
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			$(".update_btn").on("click", function(){
				opener.document.location.reload();
				self.close();
			})	
			$(".cancel_btn").on("click", function(){
				location.href = "/notice/readView?nno=${replyUpdate.nno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})			
		})
		
	</script>
	<body>	
		<div id="root">
			<section id="container">
				<form name="updateForm" role="form" method="post" action="/notice/replyUpdate">
					<input type="hidden" name="nno" value="${replyUpdate.nno}" readonly="readonly"/>
					<input type="hidden" id="nrno" name="nrno" value="${replyUpdate.nrno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					
					<div style="text-align:center;">
					<table>
						<tbody>
							<tr>
								<td style="text-align:center;">
									<label for="nrcontent">* 댓글 내용을 입력해주세요.</label><br />
									<input type="text" id="nrcontent" name="nrcontent" value="${replyUpdate.nrcontent}" style="width: 400px; height:50px; margin-bottom:10px; border : solid 1px lightgray;"/>
								</td>
							</tr>							
						</tbody>			
					</table>
					<div>
						<button type="submit" class="update_btn btn btn-outline-dark">저장</button>
						<button type="button" class="cancel_btn btn btn-outline-dark">취소</button>
					</div>
					</div>
				</form>
			</section>			
		</div>
	</body>
</html>