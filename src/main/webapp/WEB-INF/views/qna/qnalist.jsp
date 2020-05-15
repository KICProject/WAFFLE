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
	 
	 	<title>qna게시판</title>	
	</head>
	
	<body>
		<div class="container">
			<header>
				<div class="logo-area">
				 <img src="/img/common_accordion_Q.png" id="q_img" style="margin-top:-13px;margin-right:5px;">
				 <h2 style="display : inline-block; margin-top:50px;">질문해주세요.</h2>
				 </div>
			
			</header>
			<hr />
			 
			<div style="margin-left:-40px;">
			  <%@include file="nav.jsp" %>
			</div>
					
			<section id="container">
				<form role="form" method="get">
					<table class="table table-hover">
						<thead>
							<tr><th>번호</th><th>제목</th><th>작성자</th><th>등록일</th></tr>
						</thead>
						
						<c:forEach items="${qnaList}" var ="qnaList">
							<tr>
								<td><c:out value="${qnaList.qbno}" /></td>
								<td>
									<a href="/qna/qnaPassword?qbno=${qnaList.qbno}"><c:out value="${qnaList.qtitle}" /></a>
								</td>
								<td><c:out value="${qnaList.qwriter}" /></td>
								<td><fmt:formatDate value="${qnaList.regdate}" pattern="yyyy-MM-dd"/></td>
							</tr>
						</c:forEach>
						
					</table>
				<div class="search">
						<div class="col-xs-2 col-sm-2">
							<select name="searchType" class="form-control">
								<option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
								<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
								<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
								<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
								<option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
							</select>
						</div>
						 
						<div class="col-xs-10 col-sm-10">
							<div class="input-group">
								<input style="margin-bottom:20px;" type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control"/>
								<span class="input-group-btn">
									<button style="margin-bottom:20px;" id="searchBtn" type="button" class="btn btn-default">검색</button> 	
								</span>
							</div>
						</div>
						 
						<script>
							 $(function(){
								 $('#searchBtn').click(function() {
									 self.location = "/qna/qnalist" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
								 });
							 });
							 
						</script>
					</div>
					
					<div style="text-align:center">
					  <ul>
					    <c:if test="${pageMaker.prev}">
					    	<li><a href="/qna/qnalist${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
					    </c:if> 
					
					    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					    	<li><a href="/qna/qnalist${pageMaker.makeSearch(idx)}">${idx}</a></li>
					    </c:forEach>
					
					    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					    	<li><a href="/qna/qnalist${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
					    </c:if> 
					  </ul>
					</div>
				</form>
			</section>
		</div>
	</body>
</html>
