<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css" />
		<link rel='stylesheet' href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	
	 	<title>게시판</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/notice/write");
				formObj.attr("method", "post");
				formObj.submit();
			});
			fn_addFile();
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("ntitle"));
					return true;
				}
			}
		}			 
		
	</script>
	<body>
	
		<div id="root">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<div>
				<%@include file="nav.jsp" %>
			</div>
			<hr />			
			<section id="container">
				<form name="writeForm" method="post" action="/notice/write" enctype="multipart/form-data">
					<table>
						<tbody>
							<%-- <c:if test="${member.memId != null}"> --%>
								<tr>
									<td>
										<label for="ntitle">제 목</label><input type="text" id="ntitle" name="ntitle" class="chk" title="제목을 입력하세요."/>
									</td>
								</tr>	
								<tr>
									<td>
										<label for="ncontent">내용</label><textarea id="ncontent" name="ncontent" class="chk" title="내용을 입력하세요."></textarea>
									</td>
								</tr>
								<tr>
									<td>
										<label for="nwriter">작성자</label><input type="text" id="nwriter" name="nwriter" class="chk" title="작성자를 입력하세요." />
									</td>
								</tr>
								<tr>
								<tr>
									<td id="fileIndex">
									</td>
								</tr>
								<tr>
									<td>						
										<button class="write_btn" type="submit">작성</button>										
									</td>
								</tr>	
							<%-- </c:if> 
								 <c:if test="${member.memId == null}">
								<p>로그인 후에 작성하실 수 있습니다.</p>
							</c:if> --%>
							
						</tbody>			
					</table>
					
					<div class="inputArea">
						 <label for="gdsImg">이미지</label>
						 <input type="file" id="gdsImg" name="file" />
						 <div class="select_img"><img src="" /></div>
						 
						 <script>
						  $("#gdsImg").change(function(){
						   if(this.files && this.files[0]) {
						    var reader = new FileReader;
						    reader.onload = function(data) {
						     $(".select_img img").attr("src", data.target.result).width(500);        
						    }
						    reader.readAsDataURL(this.files[0]);
						   }
						  });
						 </script>
						 <%=request.getRealPath("/") %>
					</div>
					
				</form>				
			</section>
			<hr />
		</div>
	</body>
</html>
