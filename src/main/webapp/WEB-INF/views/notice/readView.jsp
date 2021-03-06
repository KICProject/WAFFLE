<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="/css/noticeList.css" />		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta charset="utf-8">
	  	<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>		
		<!-- Popper JS -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>		
		<!-- Latest compiled JavaScript -->
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
		/* $(".replyUpdateBtn").on("click", function(){
			location.href = "/notice/replyUpdateView?nno=${read.nno}"
							+ "&page=${scri.page}"
							+ "&perPageNum=${scri.perPageNum}"
							+ "&searchType=${scri.searchType}"
							+ "&keyword=${scri.keyword}"
							+ "&nrno="+$(this).attr("data-nrno");
		}); */
		$(".replyUpdateBtn").on("click", function(){
			window.open("/notice/replyUpdateView?nno=${read.nno}"
							+ "&page=${scri.page}"
							+ "&perPageNum=${scri.perPageNum}"
							+ "&searchType=${scri.searchType}"
							+ "&keyword=${scri.keyword}"
							+ "&nrno="+$(this).attr("data-nrno"),
					'w', 'left=800,top=200,width=550,height=230');
			})
		
		
		//댓글 삭제 View
		/* $(".replyDeleteBtn").on("click", function(){
			location.href = "/notice/replyDeleteView?nno=${read.nno}"
				+ "&page=${scri.page}"
				+ "&perPageNum=${scri.perPageNum}"
				+ "&searchType=${scri.searchType}"
				+ "&keyword=${scri.keyword}"
				+ "&nrno="+$(this).attr("data-nrno");
		});	 */	
		
		$(".replyDeleteBtn").on("click", function(){
			window.open("/notice/replyDeleteView?nno=${read.nno}"
					+ "&page=${scri.page}"
					+ "&perPageNum=${scri.perPageNum}"
					+ "&searchType=${scri.searchType}"
					+ "&keyword=${scri.keyword}"
					+ "&nrno="+$(this).attr("data-nrno"),
					'w', 'left=800,top=200,width=300,height=150');
		})
	})
		
	</script>
	
	<body>
		<jsp:include page="/WEB-INF/views/include/header_bk.jsp"></jsp:include>	
	
		<section class="board_main">
   		<!-- service WAFFLE -->
        <div class="board_head">
          <p class="title_big">Notice</p>
          <p class="title_small">WAFFLE</p>
        </div>
        
      	<div class="container">
			<header>
				<!-- <h1> 게시판</h1> -->
			</header>			
			
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
					<label for="ntitle" class="col-sm-12 control-label" style="width: 100%; float:40; margin:10 auto; font-size:40px;">${read.ntitle} </label>
				</div>		
				<div class="form-group row justify-content-center">	
					<label for="regdate" class="col-sm-3 control-label" style="width: 100%; float:40; margin:10 auto;font-size:20px;">
					작성일 : <fmt:formatDate value="${read.regdate}" pattern="yyyy.MM.dd"  /></label>			
				</div>
				
				<hr />
				
				<br>
				
				<div class="form-group row justify-content-center">					
					<!-- <textarea id="ncontent" name="ncontent" class="form-control" rows="50" readonly="readonly"> -->	
					<c:if test="${(read.ncontent !=null)}">				
					<textarea id="ncontent" name="ncontent" style="width: 1000px; height:300px; margin-bottom:10px; border : hidden 1px;">
					<c:out value="${read.ncontent}" /></textarea>	
					</c:if>						
					<img src="${read.gdsImg}" class="oriImg"/>
				</div>
				
				<hr>
						
				<!-- 댓글 -->
				<div id="reply" class="panel panel-default" style="margin-top: 10px;">
					<ul class="replyList" style="list-style:none">
						<c:forEach items="${replyList}" var="replyList">
							<li>
								<p class="nrwiter float-left" style = "font-size:15px; color: #848484;">
								${replyList.nrwriter}
								</p>
								<p class="nrdate float-right">
								<fmt:formatDate value="${replyList.regdate}" pattern="yyyy/MM/dd" />
								</p>
							</li>
							<br />
							<br />
							<li>	  
								<span class="nrcontent float-left">
								${replyList.nrcontent}
								
								</span>
							</li>							
							<br />
							<br />
							<li>
								<div class="form-group row text-center" style="margin-left:1020px;">
									<button type="button" class="replyUpdateBtn btn btn-sm" data-nrno="${replyList.nrno}">수정 </button>									
									<button type="button" class="replyDeleteBtn btn btn-sm" data-nrno="${replyList.nrno}">삭제</button>
								</div>
							</li>							
							<hr style="border-color:black;">
							<br />
						</c:forEach>   
					</ul>
				</div>
				<br /><br /><br />
				
				
				<form name="replyForm" method="post" class="form-horizontal">
					<input type="hidden" id="nno" name="nno" value="${read.nno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					
					
					<div class="form-group">
						<label for="nrwriter" class="col-sm-2 control-label" style="margin-left:5px">writer</label>						
						<div class="col-sm-10">
							<input type="text" id="nrwriter" name="nrwriter" class="form-control" value="${member.memId}" style="margin-top:10px;"/>
						</div>
					</div>
					
					<div class="form-group" style="margin-top:10px;">
						<label for="nrcontent" class="col-sm-2 control-label" style="margin-left:5px">content</label>
						<div class="col-sm-10">
							<input type="text" id="nrcontent" name="nrcontent" class="form-control" style="margin-top:10px;"/>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" class="replyWriteBtn btn btn-outline-dark">댓글 작성</button>
						</div>
					</div>
					
					<hr />
						
					<%-- <!-- 관리자 로그인시 관리자만 볼 수 있게 -->	
					<c:if test="${(member !=null) && (member.memAuthor == 1)}">
					<div>
							<button type="button" class="update_btn btn">관리자 글 수정</button>
							<button type="button" class="delete_btn btn">관리자 글 삭제</button>
							<!-- <button type="button" class="list_btn btn btn-primary">목록</button>	 -->
						</div>
					</c:if>	 --%>
					<!-- 편집 끝나고 아래 코드 삭제 -->
					<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<button type="button" class="update_btn btn btn-outline-dark">관리자 글 수정</button>
								<button type="button" class="delete_btn btn btn-outline-dark">관리자 글 삭제</button>		
							</div>				
						</div>
						<br /><br /><br /><br />								
					</form>
			</section>			
		</div>
		
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
		<script src="/js/app.js"></script>
		</section>
	</body>
</html>