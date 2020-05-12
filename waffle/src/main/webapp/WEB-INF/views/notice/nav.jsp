<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <style type="text/css">
	li {list-style: none; display:inline; padding: 6px;}
</style> -->
<ul>
	<%-- <c:if test="${(member !=null) && (member.memAuthor == 1)}">
	<li><a href="/notice/list">목록</a></li>
	<li><a href="/notice/writeView">글 작성</a></li>	
	</c:if> --%>
	<c:if test="${(member !=null) && (member.memAuthor == 1)}">
		<li>
			<button type="button" class="btn btn-outline-dark"
				onclick="location.href='/notice/writeView'">관리자 글 작성</button>
		</li>

		<!-- <li>

			<p>${member.memId}님안녕하세요.</p>

		</li> -->
	</c:if>
</ul>