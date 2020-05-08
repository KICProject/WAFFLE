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
		<script src="https://kit.fontawesome.com/44f00f680d.js" crossorigin="anonymous"></script>
	 	<!-- <title>공지 게시판</title> -->
	</head>
	<body>
		<div class="container">
			<header>
				<h1></h1>
			</header>
			<hr />	
			<div class="search row justify-content-center">
				<div class="col-xs-2 col-sm-2">
					<div class="border-bottom">
					<select name="searchType" class="form-control border-0">
						<option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>---------</option>
						<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
						<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
						<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
						<option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
					</select>
					</div>
				</div>				
						 
				<script>
					 $(function(){
						 $('#searchBtn').click(function() {
							 self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
						 });
					 });   
					 function enterkey() {
					        if (window.event.keyCode == 13) {					        	
					        self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
					        }
					}
				</script>
				<div class="col-xs-5 col-sm-5">
					<div class="input-group border-bottom">
						<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control border-0" onkeyup="enterkey();" placeholder="검색어를 입력하세요."/>
						&nbsp; &nbsp;<i class="fas fa-search fa-2x" id="searchBtn"></i>						
					</div>
				</div>	
				
			</div>			
			 			
			<br>
			<br>
			<br>
			
			<div>
				<%@include file="nav.jsp" %>
			</div>
							
			<section id="container">
				<form role="form" method="get">
				
				
				<div>
                 
                전체 <span style="color: purple; font-size:15pt">${pageMaker.totalCount }</span> 건
                             
                </div>
				
					<table class="table ">
						<thead class="thead-light border-top">
						<tr>
							<th>번호</th>
							<th class="text-center">제목</th>
							<th >작성일</th>
							<th >조회수</th>
						</tr>
						</thead>
						<tbody class="text-dark border-bottom">
						<c:forEach items="${list}" var = "list">
							<tr>
								<td><c:out value="${list.nno}" /></td>
								<td>
									<a href="/notice/readView?nno=${list.nno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}" class="text-secondary"><c:out value="${list.ntitle}" /></a>
								</td>
								<%-- <td><c:out value="${list.nwriter}" /></td> --%>
								<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
								<td><c:out value="${list.nhit}" /></td>
							</tr>
						</c:forEach>
						</tbody>						
					</table>
										
					<div class="col-md-offset-3">
						<ul class="pagination justify-content-center">
							<c:if test="${pageMaker.prev}">
								<li class="page-item">
								<a class="page-link" aria-label="Previous" href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">
								<span class="text-secondary" aria-hidden="true">&laquo;</span>
       							 <span class="sr-only">Previous</span>
       							 </a></li>								
							</c:if> 							
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<li class="page-item"<c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
								<a class="page-link text-dark" href="list${pageMaker.makeSearch(idx)}" >${idx}</a></li>
							</c:forEach>							
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li class="page-item">
								<a class="page-link" aria-label="Next" href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}" >
								<span class="text-secondary" aria-hidden="true">&raquo;</span>
        						<span class="sr-only">Next</span>
        						</a></li>
        					</c:if>
						</ul>					
						
					</div>
				</form>
			</section>
			
			
		</div>
	</body>
</html>
