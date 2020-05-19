<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style type="text/css">
	li {list-style: none; display:inline; padding: 6px;}
</style>
<ul>
	<li><a href="/qna/qnalist">목록보기</a></li>
	
	
	<li><a href="/qna/writeView">질문하기</a></li>	<br>
	<li> 

	
	<c:if test="${member != null}">
         <p style="margin-left:8px;">${member.memId}님 안녕하세요.</p>
    </c:if>
      
	</li>
		
</ul>

