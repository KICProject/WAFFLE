<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/faq.css" />
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"
	  rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
<title>qnalist</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>

<script type="text/javascript">
$(function(){
   var faq_url="/sub/waffleBoard";
   $('#faq_btn').click(function(){	  
	   $(location).attr('href',faq_url); 
	   $(this).css('background-color','#fff').css('color','#000').css('border','1px solid #333333');
   });
   
    $('#notice_btn').click(function(){
	  $(this).css('background-color','#fff').css('color','#000').css('border','1px solid #333333');
      //$('.full_container').empty();
      $('.full_container').load('/notice/list')
      $("#notice_btn").siblings().css('background-color','#333333').css('color','#fff');
   });
    
       var qna_url="/qna/qnalist";
       $('#qna_btn').click(function(){
       $(location).attr('href',qna_url); 
  	   $(this).css('background-color','#fff').css('color','#000').css('border','1px solid #333333');
    });
   

})

 $(function(){
$('#searchBtn').click(function() {
self.location = "/qna/qnalist" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
			});
				}); 
</script>

<style>
.customer_head{
    display: flex;
    justify-content: space-between;
    width: 100%;
    height: 85px;
    border-bottom: 3px solid #000;
    margin-bottom:50px;
  
 }
 
 .customer_big{
	width: 500px;
    border-bottom: 6px solid #000;
    font-family: S-CoreDream-6;
    font-size: 67.5px;
    color:black;
 
 }
 
.question_text{
 font-family: S-CoreDream-6;
 font-size: 30.5px;
 color:black;
 margin-block-start: 1em;
 margin-block-end: 1em;
 margin-top:0px;
 padding-top:20px;
 border-bottom:solid 3px;
 padding-bottom:20px;
}

a:link { text-decoration:none;}
a:hover { text-decoration:none; color:black;} 

#qna_btn{
 background-color:#fff;
 color:#000;
 border:1px solid #333333;
 }
 

li {list-style: none; float: left; padding: 6px;}

.minju {
	margin: 20px 5px;
}

.search_form {
	display : flex;
	justify-content : center;
	margin : 3px;
	padding : 3px;
}
.form-control {
	height : 30px;
}

#keywordInput {
	height : 30px;
	margin-left : 20px;
}


</style>

<body style="width:100%;">
 <jsp:include page="/WEB-INF/views/include/header_bk.jsp"></jsp:include>  
<br>
<br>
<br>
<br>
<br>

<section>
<div class="customer_head">
	 <p class="customer_big" style="margin-bottom: -1px;">Customer</p>
	</div>	
		<!-- 상단 메뉴 바 시작 -->        
		<div class="top_menu_bar">
			<ul class="board_tab">
				<li id="faq_btn">FAQ</li>
				<li id="notice_btn">NOTICE</li>
				<li id="qna_btn">QNA</li>
			</ul>
		</div>
		
		<div class="question_text">
		<div><a href="/qna/writeView">질문하러 가기</a></div>					 	
		</div>
		<div class="container" style="width:100%;">			 					
			<section id="container_1">
				<form role="form" method="get">
					<table class="table table-hover">
						<thead>
							<tr><th>번호</th><th>제목</th><th>작성자</th><th>등록일</th><th>조회수</th></tr>
						</thead>
						
						<c:forEach items="${qnaList}" var ="qnaList">
							<tr>
								<td><c:out value="${qnaList.qbno}" /></td>
								<td>
									<a href="/qna/qnaPassword?qbno=${qnaList.qbno}"><c:out value="${qnaList.qtitle}" /></a>
								</td>
								<td><c:out value="${qnaList.qwriter}" /></td>
								<td><fmt:formatDate value="${qnaList.regdate}" pattern="yyyy-MM-dd"/></td>
								<td><c:out value="${qnaList.hit}"></c:out></td>
							</tr>
						</c:forEach>
						
					</table>
				
				
				<div class="search_form">
					<div class="search_1">
						<select name="searchType" class="form-control" >
							<option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
							<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
							<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
							<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
							<option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
						</select>
					</div>
					 
					<div class="search_2">
						<div class="input-group">
							<input type="text" name="keyword" id="keywordInput" value="${scri.keyword}" class="form-control"/>
							<button id="searchBtn" type="button" class="btn btn-default">검색</button> 	
							
						</div>
					</div>						
				</div>
					
					<div style="text-align:center;margin:auto; display:inline-block;">
					  <ul>
					    <c:if test="${pageMaker.prev}">
					    	<li><a href="/qna/qnalist ${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
					    </c:if> 
					
					    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
					    	<li class="minju" style="float:left;"><a href="/qna/qnalist${pageMaker.makeSearch(idx)}">${idx}</a></li>
					    </c:forEach>
					
					    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					    	<li><a href="/qna/qnalist ${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
					    </c:if> 
					  </ul>
					</div>
				</form>
			</section>
		</div>
		</section>
		<div style="height:254px;"><jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include></div>
	   <script src="/js/app.js"></script>
	</body>
</html>