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
					
							<%-- <c:if test="${member.memId != null}"> --%>
							
							<%-- </c:if> 
								 <c:if test="${member.memId == null}">
								<p>로그인 후에 작성하실 수 있습니다.</p>
							</c:if> --%>
				<div class="container">
					  <form action="https://app.99inbound.com/e/123" method="POST" target="_blank">
					    
					    <h3 style="text-align: center;">공지사항 글쓰기</h3>
					
					    <div class="form-group">
					      <div class="input-group">
					        <div class="input-group-prepend">
					          <span class="input-group-text bg-white">
					            <i class="fa fa-user"></i>&nbsp
					          </span>
					        </div>
					        <input name="nwriter" type="name" placeholder="이름을 입력해주세요." class="form-control border-left-0" required>
					      </div>
					    </div>
					
					    <div class="form-group">
					      <div class="input-group">
					        <div class="input-group-prepend">
					          <span class="input-group-text bg-white">
					            <i class="fa fa-envelope"></i>
					          </span>
					        </div>
					        <input name="ntitle" type="email" placeholder="제목을 입력해주세요." class="form-control border-left-0" required>
					      </div>
					    </div>
					    
					    <div class="form-group">
					      <div class="input-group">
					        <div class="input-group-prepend">
					          <span class="input-group-text bg-white">
					            <i class="fa fa-envelope"></i>
					          </span>
					        </div>
					        <input name="email" type="email" placeholder="Email" class="form-control border-left-0" required>
					      </div>
					    </div>
					
					    <div class="form-group">
					      <textarea class="form-control" id="message" rows="5" placeholder="내용을 입력해주세요." required></textarea>
					    </div>
					
						<div class="form-group">
						 <div class="input-group">
					        <div class="input-group-prepend">
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
					
					
					    <button type="submit" class="btn btn-primary float-right">
					      <i class="fa fa-paper-plane"></i> 
					       작성 
					    </button>
					  </form>
					</div>			
							
							
							
						</form>			
						
			</section>
			<hr />
		</div>
	</body>
</html>
