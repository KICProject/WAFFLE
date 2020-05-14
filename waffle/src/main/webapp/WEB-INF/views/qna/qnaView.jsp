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
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/qna/updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				
				var deleteYN = confirm("삭제하시겠습니까?");
				if(deleteYN == true){
					
				formObj.attr("action", "/qna/delete");
				formObj.attr("method", "post");
				formObj.submit();
					
				}
			})
			
			// 목록
			$(".qnalist_btn").on("click", function(){
				
				location.href = "/qna/qnalist?page=${scri.page}"
						     +"&perPageNum=${scri.perPageNum}"
						      +"&searchType=${scri.searchType}&keyword=${scri.keyword}"; 
			})
			
			//글 작성
			$(".replyWriteBtn").on("click", function(){
				var formObj = $("form[name='replyForm']");
				formObj.attr("action", "/qna/replyWrite");
				formObj.submit();
			});
			
			//댓글 수정 View
			$(".replyUpdateBtn").on("click", function(){
         	window.open("/qna/replyUpdateView?qbno=${qnaRead.qbno}"
                     + "&page=${scri.page}"
                     + "&perPageNum=${scri.perPageNum}"
                     + "&searchType=${scri.searchType}"
                     + "&keyword=${scri.keyword}"
                     + "&qrno="+$(this).attr("data-qrno"),
               'w', 'left=800,top=200,width=550,height=230');
        	 })
			
		//댓글 삭제 View
		$(".replyDeleteBtn").on("click", function(){
         window.open("/qna/replyDeleteView?qbno=${qnaRead.qbno}"
               + "&page=${scri.page}"
               + "&perPageNum=${scri.perPageNum}"
               + "&searchType=${scri.searchType}"
               + "&keyword=${scri.keyword}"
               + "&qrno="+$(this).attr("data-qrno"),
               'w', 'left=800,top=200,width=300,height=150');
  		    });
		})
		
		//첨부파일 다운로드 
		function fn_fileDown(fileNo){
			var formObj = $("form[name='readForm']");
			$("#FILE_NO").attr("value", fileNo);
			formObj.attr("action", "/qna/fileDown");
			formObj.submit();
		}
	</script>
	
	<body>
		<div class="container">
			<header>
				<h1>질문하기</h1>
			</header>
			<hr />
			 
			<div style="margin-left:-40px;">
				<%@include file="nav.jsp" %>
			</div>
			
			<section id="container">
				<form name="readForm" role="form" method="post">
					<input type="hidden" id="qbno" name="qbno" value="${qnaRead.qbno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					<input type="hidden" id="FILE_NO" name="FILE_NO" value="">
				</form>
				
				<div class="form-group">
					<label for="qtitle" class="col-sm-2 control-label">제목</label>
					<input type="text" id="qtitle" name="qtitle" class="form-control" value="${qnaRead.qtitle}" readonly="readonly" />
				</div>
				<div class="form-group">
					<label for="qcontent" class="col-sm-2 control-label">내용</label>
					<textarea id="qcontent" name="qcontent" class="form-control" readonly="readonly"><c:out value="${qnaRead.qcontent}" /></textarea>
				</div>
				<div class="form-group">
					<label for="qwriter" class="col-sm-2 control-label" >작성자</label>
					<input type="text" id="qwriter" name="qwriter" class="form-control" value="${qnaRead.qwriter}"/>
				</div>
				<div class="form-group">
					<!--<label style="margin-left:-10px;"for="regdate" class="col-sm-2 control-label">작성날짜</label>-->
					<div><fmt:formatDate value="${qnaRead.regdate}" pattern="yyyy-MM-dd" /></div>
				</div>
				<hr>
				<span>파일 목록</span>
				<div class="form-group" style="border: 1px solid #dbdbdb;">
					<c:forEach var="file" items="${file}">
						<a href="#" onclick="fn_fileDown('${file.FILE_NO}'); return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)<br>
					</c:forEach>
			
				</div>
				<hr>
				<div style="margin-left:800px;">
					<button type="button" class="update_btn btn">질문 수정</button>
					<button type="button" class="delete_btn btn ">질문 삭제</button>
				<!--  <button type="button" class="list_btn btn">나의 질문 목록</button>	-->
				</div>
				
				<!-- 댓글 -->
				<div id="reply">
					<ol class="replyList">
						<c:forEach items="${replyList}" var="replyList">
							<li>
								<div style="margin-left:-40px;">
								작성자 : ${replyList.qwriter}<p><p><p>
								</div>
								  
								<div style="margin-left:-40px;">내용 : ${replyList.qcontent}</div><p><p>
								
								<div class="Date" style="margin-left:-40px;"><fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" /></div><p><p>
								<div style="margin-left:765px;" >
									<button  type="button" class="replyUpdateBtn btn" data-qrno="${replyList.qrno}">댓글 수정</button>
									<button  type="button" class="replyDeleteBtn btn" data-qrno="${replyList.qrno}">댓글 삭제</button>
								</div>
							</li>
						</c:forEach>   
					</ol>
				</div>
				
				<form name="replyForm" method="post" class="form-horizontal">
					<input type="hidden" id="qbno" name="qbno" value="${qnaRead.qbno}" />
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				
					<div class="form-group" style="margin-top:20px;">
						<label  style="margin-left:-90px;" for="qwriter" class="col-sm-2 control-label" >댓글 작성자</label>
						<div class="col-sm-10">
							<input style="margin-left:20px;"type="text" id="qwriter" name="qwriter" class="form-control" />
						</div>
					</div>
					
					<div>
					<img src="/img/common_accordion_A.png" id="q_img">
					<div class="form-group" style="margin-top:20px;">
						<label style="margin-left:-90px;" for="qcontent" class="col-sm-2 control-label">답변</label>
						<div class="col-sm-10">
							<input type="text" style="margin-left:20px; display:inline-block;" id="qcontent" name="qcontent" class="form-control"/>
						</div>
					</div>
					</div>
				<div class="form-group" style="text-align:center;">
						<div class="col-sm-offset-2 col-sm-10">
							<button style="width:100px; margin-top:20px; font-size:20px;color:white; background-color: #F3D1E9;" type="button" class="replyWriteBtn btn">작성</button>
						</div>
					</div> 
				</form>
				
			</section>
			<hr />
		</div>
	</body>
</html>