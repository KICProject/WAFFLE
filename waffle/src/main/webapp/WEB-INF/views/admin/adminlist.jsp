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
	 	<script type="text/javascript">
	 /* 
	 	$(document).ready(function(){
			var formObj = $("form[name='updateForm']");

			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/admin/adminView?memid=${adminlist.memId}"
					  /*  + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}"; 
			})
		}) */

	 		
	 	</script>
	</head>
	<body>
		<div class="container">
			<header>
				<h1> 관리자페이지</h1>
			</header>
			<hr />
			<div>
				<%@include file="nav.jsp" %>
			</div>
			<section id="container">
				<form id="form" method="get">
					<table class="table table-hover" id="memTable">
						<tr><th>아이디</th><th>이름</th><th>회원가입일자</th><th>권한</th><th>수정</th></tr>
						<c:forEach items="${adminlist}" var = "adminlist" varStatus="status">
							<tr>
								<td><a href="/admin/adminView?memId=${adminlist.memId}"><c:out value="${adminlist.memId}"/></a></td>
								<td><c:out value="${adminlist.memName}" /></td>
								<td><fmt:formatDate value="${adminlist.regDate}" pattern="yyyy-MM-dd"/></td>
								<td><c:out value="${adminlist.memAuthor}" /></td>
								<td><input type="hidden" name=currentid${status.index}  value="${adminlist.memId}"/>
								<td><input type="button" class="readView_btn btn btn-warning" value="x"></td>
						</c:forEach>	
							</tr>
					</table>
					<!-- 검색 -->
					<%-- <div class="search row">
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
								<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control"/>
								<span class="input-group-btn">
									<button id="searchBtn" type="button" class="btn btn-default">검색</button> 	
								</span>
							</div>
						</div>
						 
						<script>
							 $(function(){
								 $('#searchBtn').click(function() {
									 self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
								 });
							 });   
						</script>
					</div>
					<div class="col-md-offset-3">
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
							</c:if> 
							
							<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
								<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
								<a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
							</c:forEach>
							
							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
							</c:if> 
						</ul>
					</div>
				</form>--%>
			</section>
		</div>
	</body> 
</html>
