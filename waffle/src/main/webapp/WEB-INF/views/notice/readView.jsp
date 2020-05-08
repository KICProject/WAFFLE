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
	 	
	 	<title></title>
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
		})
		
	</script>
	
	<body>
		<div class="container">
			<header>
				<!-- <h1> 게시판</h1> -->
			</header>
			<hr />		
			<div>
					<button type="button" class="update_btn btn btn-warning">관리자 글 수정</button>
					<button type="button" class="delete_btn btn btn-danger">관리자 글 삭제</button>
					<!-- <button type="button" class="list_btn btn btn-primary">목록</button>	 -->
				</div>
				
			<section id="container">
				<form name="readForm" role="form" method="post">
					<input type="hidden" id="nno" name="nno" value="${read.nno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					<input type="hidden" id="FILE_NO" name="FILE_NO" value=""> 
				</form>
				
				<div class="form-group row text-center">					
					<%-- <input type="text" id="ntitle" name="ntitle" class="display-1" value="${read.ntitle}" readonly="readonly" /> --%>
					<h1 class="display-1"><c:out value="${read.ntitle}" /></h1>
				</div>
				
				<div class="form-group row text-center">
					<h2><small><label for="regdate" class="col-sm-2 control-label" style="width: 100%; float:40; margin:10 auto; ">작성일 : 					
					<fmt:formatDate value="${read.regdate}" pattern="yyyy.MM.dd"  />	</label></small></h2>
					
				</div>
				
				<hr />
				<br>
				<br>
				<br>
				
				<div class="form-group row text-center">
					<!-- <label for="ncontent" class="col-sm-2 control-label">내용</label><br><br> -->
					<%-- <textarea id="ncontent" name="ncontent" class="form-control" readonly="readonly">
					<c:out value="${read.ncontent}" /></textarea> --%>
					<img src="${read.gdsImg}" class="oriImg"/>
				</div>
				<%-- <div class="form-group">
					<label for="nwriter" class="col-sm-2 control-label">작성자</label>
					<input type="text" id="nwriter" name="nwriter" class="form-control" value="${read.nwriter}"  readonly="readonly"/>
				</div> --%>
				
				
				<hr>				
				
				<%-- <div class="inputArea">
					 <label for="gdsImg">이미지</label>
					 					 
					 <img src="${read.gdsImg}" class="oriImg"/>	 
					 
				</div>	 --%>
				
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
									<button type="button" class="replyUpdateBtn btn btn-warning" data-nrno="${replyList.nrno}">수정</button>
									<button type="button" class="replyDeleteBtn btn btn-danger" data-nrno="${replyList.nrno}">삭제</button>
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
							<button type="button" class="replyWriteBtn btn btn-success">작성</button>
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