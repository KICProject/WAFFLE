<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="/css/noticeList.css" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>		
		<!-- Popper JS -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>		
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
		<script src="https://kit.fontawesome.com/44f00f680d.js" crossorigin="anonymous"></script>		
	 	<!-- <title>공지 게시판</title> -->
	</head>
	<body>		
		<jsp:include page="/WEB-INF/views/include/header_bk.jsp"></jsp:include> 
		<section class="board_main">
				<!-- service WAFFLE -->
		        <div class="board_head">
		          <p class="title_big">Customer</p>
		          <p class="title_small">WAFFLE</p>
		        </div>
		        <!-- tab -->
		       <ul class="board_tab">
			        <li id="moveFaq"><a href="/sub/waffleBoard">FAQ</a></li>
			        <li id="moveNotice"><a href="/notice/list">NOTICE</a></li>
			        <li id="moveQna"><a href="/qna/writeView">QNA</a></li>
		   	   </ul>			
	<section class="board_main">			
	   	<div id="root">			
			<div>
				<ul>
				<c:if test="${(member !=null) && (member.memAuthor == 1)}">
				<li><button type="button" class="btn btn-outline-dark" onclick="location.href='/notice/writeView'" >관리자 글 작성</button></li>
				</c:if>	
			</ul>
			</div>				
			<br />
			
			<div class="search row justify-content-center" style="margin-top:3px;">
				<div class="col-xs-2 col-sm-2">
					<div class="border-bottom" >
					<select name="searchType" class="form-control border-0">
						<option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>------------</option>
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
				
				<!-- keydown ->타이핑하기위해서 키를 눌렀을때 발생 keyup ->누른키를 손을 놓을때 발생 -->
				<div class="col-xs-5 col-sm-5">
					<div class="input-group border-bottom">
						<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control border-0" onkeyup="enterkey();" placeholder="검색어를 입력하세요."/>
						&nbsp; &nbsp;<i class="fas fa-search fa-2x" id="searchBtn"></i>						
					</div>
				</div>				
			</div>			
							
			<section id="container" style="margin-top:10px;">
				<form role="form" method="get">			
				<div style="margin-top: 10px;">                
               	 전체 <span style="color: purple; font-size:15pt">${pageMaker.totalCount }</span> 건                             
                </div>				
					<table class="table" style="margin-top: 20px;">
						<thead class="thead-light border-top">
						<tr>
							<th>번호</th>
							<th class="text-center">제목</th>
							<th >작성일</th>
							<th >조회수</th>
						</tr>
						</thead>
						<tbody class="text-dark border-bottom align-middle">
						<c:forEach items="${list}" var = "list">
							<tr style="height: 70px;">
								<td class="align-middle"><c:out value="${list.nno}" /></td>
								<td class="align-middle">
									<a href="/notice/readView?nno=${list.nno}&page=${scri.page}&perPageNum=${scri.perPageNum}&searchType=${scri.searchType}&keyword=${scri.keyword}" class="text-secondary"><c:out value="${list.ntitle}" /></a>
								</td>								
								<td class="align-middle"><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
								<td class="align-middle"><c:out value="${list.nhit}" /></td>
							</tr>
						</c:forEach>
						</tbody>						
					</table>
										
					<div class="col-md-offset-3" style="margin-bottom:100px;">
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
		</section>	
		</section>		
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
		<script src="/js/app.js"></script>	
	</body>
</html>
