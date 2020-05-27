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
		
			$(".cancel_btn").on("click", function(){
				location.href = "/qna/qnaView?qbno=${replyUpdate.qbno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
		
			$(".update_btn").on("click", function(){
	            opener.document.location.reload();
	            self.close();
	         })  
	         
	         $(".cancel_btn").on("click", function(){
		            opener.document.location.reload();
		            self.close();
		      })  
	         			
		})
		
	</script>
	<body>
	
		<div id="root">
		
			<hr />
			 
			<hr />
			
			<section id="container">
				<form name="updateForm" role="form" method="post" action="/qna/replyUpdate">
					<input type="hidden" name="qbno" value="${replyUpdate.qbno}" readonly="readonly"/>
					<input type="hidden" id="qrno" name="qrno" value="${replyUpdate.qrno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					<table>
						<tbody>
							<tr>
								<td>
									<div><label for="qcontent">댓글 내용</label><br></div>
									<input style="height:100px;width:200px;" type="text" id="qcontent" name="qcontent" value="${replyUpdate.qcontent}"/>
								</td>
							</tr>	
							
						</tbody>			
					</table>
					<div>
						<button type="submit" class="update_btn">저장</button>
						<button type="button" class="cancel_btn">취소</button>
					</div>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>