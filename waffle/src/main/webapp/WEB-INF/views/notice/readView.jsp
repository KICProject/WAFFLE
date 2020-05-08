<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>		
		<meta charset="utf-8">
	  	<meta name="viewport" content="width=device-width, initial-scale=1">
	  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>	 	
	 	<!-- <title>글상세보기</title> -->
	</head>
	
	<script type="text/javascript">
		
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/notice/updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				
				var deleteYN = confirm("삭제하시겠습니까?");
				if(deleteYN == true){
					
				formObj.attr("action", "/notice/delete");
				formObj.attr("method", "post");
				formObj.submit();
					
				}
			})
			
			// 목록
			$(".list_btn").on("click", function(){
				
				location.href = "/notice/list?page=${scri.page}"
						      +"&perPageNum=${scri.perPageNum}"
						      +"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			})
			
			//글 작성
			$(".replyWriteBtn").on("click", function(){
				var formObj = $("form[name='replyForm']");
				formObj.attr("action", "/notice/replyWrite");
				formObj.submit();
			});
			
			//댓글 수정 View
			$(".replyUpdateBtn").on("click", function(){
				location.href = "/notice/replyUpdateView?nno=${read.nno}"
								+ "&page=${scri.page}"
								+ "&perPageNum=${scri.perPageNum}"
								+ "&searchType=${scri.searchType}"
								+ "&keyword=${scri.keyword}"
								+ "&nrno="+$(this).attr("data-nrno");
			});
			
			//댓글 삭제 View
			$(".replyDeleteBtn").on("click", function(){
				location.href = "/notice/replyDeleteView?nno=${read.nno}"
					+ "&page=${scri.page}"
					+ "&perPageNum=${scri.perPageNum}"
					+ "&searchType=${scri.searchType}"
					+ "&keyword=${scri.keyword}"
					+ "&nrno="+$(this).attr("data-nrno");
			});
			
			$(document).ready(function(){
				var formObj = $("form[name='updateForm']");
				
				$(".cancel_btn").on("click", function(){
					location.href = "/notice/readView?nno=${replyUpdate.nno}"
						   + "&page=${scri.page}"
						   + "&perPageNum=${scri.perPageNum}"
						   + "&searchType=${scri.searchType}"
						   + "&keyword=${scri.keyword}";
				})
				
			})
		})
		
	</script>
	
	<body>
		<div class="container">
			<header>
				<!-- <h1> 게시판</h1> -->
			</header>
			<hr />	
			<%-- <!-- 관리자 로그인시 관리자만 볼 수 있게 -->	
			<c:if test>
			<div>
					<button type="button" class="update_btn btn">관리자 글 수정</button>
					<button type="button" class="delete_btn btn">관리자 글 삭제</button>
					<!-- <button type="button" class="list_btn btn btn-primary">목록</button>	 -->
				</div>
			</c:if>	 --%>
			<!-- 편집 끝나고 아래 코드 삭제 -->
			<div>
					<button type="button" class="update_btn btn btn-outline-dark">관리자 글 수정</button>
					<button type="button" class="delete_btn btn btn-outline-dark">관리자 글 삭제</button>					
			</div>
			
			<section id="container">
				<form name="readForm" role="form" method="post">
					<input type="hidden" id="nno" name="nno" value="${read.nno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					<!-- <input type="hidden" id="FILE_NO" name="FILE_NO" value="">  -->
				</form>
				
				<div class="form-group row justify-content-center">					
					<h1><label for="ntitle" class="col-sm-12 control-label" style="width: 100%; float:40; margin:10 auto;">${read.ntitle} </label></h1>
				</div>		
				<div class="form-group row justify-content-center">	
					<label for="regdate" class="col-sm-3 control-label" style="width: 100%; float:40; margin:10 auto;font-size:20px;">
					작성일 : <fmt:formatDate value="${read.regdate}" pattern="yyyy.MM.dd"  /></label>			
				</div>
				
				<hr />
				<br>
				<br>
				<br>
				
				<div class="form-group row justify-content-center">					
					<pre class="ncontent"><c:out value="${read.ncontent}" /></pre>
					<img src="${read.gdsImg}" class="oriImg"/>
				</div>
				
				<hr>				
								
				<!-- 댓글 -->
				<div id="reply" class="panel panel-default" style="margin-top: 10px;">
					<ol class="replyList">
						<c:forEach items="${replyList}" var="replyList">
							<li>
								<p>
								작성자 : ${replyList.nrwriter}<br />
								작성 날짜 :  <fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" />
								</p>
								  
								<p>${replyList.nrcontent}</p>
								<div class="form-group row text-center">
									<button type="button" class="replyUpdateBtn btn" data-nrno="${replyList.nrno}">수정</button>
									<button type="button" class="replyDeleteBtn btn" data-nrno="${replyList.nrno}">삭제</button>
								</div>
							</li>
						</c:forEach>   
					</ol>
				</div>
				
				
				
				<form name="replyForm" method="post" class="form-horizontal">
					<input type="hidden" id="nno" name="nno" value="${read.nno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				
					<div class="form-group">
						<label for="nrwriter" class="col-sm-2 control-label">댓글 작성자</label>
						<div class="col-sm-10">
							<input type="text" id="nrwriter" name="nrwriter" class="form-control" />
						</div>
					</div>
					
					<div class="form-group">
						<label for="nrcontent" class="col-sm-2 control-label">content</label>
						<div class="col-sm-10">
							<input type="text" id="nrcontent" name="nrcontent" class="form-control"/>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" class="replyWriteBtn btn btn-outline-dark">작성</button>
						</div>
					</div>					
				</form>
			</section>
			<hr /><br><br>
					<div>
						<%@include file="listNav.jsp" %>
					</div>	
								
		</div>
	</body>
</html>