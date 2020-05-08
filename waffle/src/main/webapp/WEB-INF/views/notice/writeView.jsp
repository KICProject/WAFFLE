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
	 	<!-- 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
	 	
	 	<!-- ckeditor -->	 	
	 	<script src="/resources/ckeditor/ckeditor.js"></script>
	 	<!-- <title>게시판 글쓰기</title> -->
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
	<body>
	
		<div id="root">
			<header>
				<!-- <h1> 게시판</h1> -->
			</header>
			<hr />
			 
			<div>
				<%@include file="nav.jsp" %>
			</div>
			<hr />			
			<section id="container">
			<div class="form-group row justify-content-center">
				<form name="writeForm" method="post" action="/notice/write" enctype="multipart/form-data">
					<table style="width : 1000px;">
						<tbody>
							<%-- <c:if test="${member.memId != null}"> --%>
								<tr>
									<td>
										<label style="width : 100%; margin-bottom:10px;" class="col-sm-2 control-label" for="ntitle">제목</label>
										<input  type="text" id="ntitle" name="ntitle" class="chk" title="제목을 입력하세요." placeholder="제목을 입력하세요." style="width: 1000px; height:40px; margin-bottom:10px; border : solid 1px lightgray;"/>
										
									</td>
								</tr>
										
										
	
								<tr>
									<td>
										<label for="ncontent" style="width : 100%;margin-top:10px;margin-bottom:10px;" class="col-sm-2 control-label" title="내용을 입력하세요.">내용</label>
										<textarea id="ncontent" name="ncontent" placeholder="내용을 입력하세요." style ="height: 300px; width:1000px; border:solid 1px lightgray"></textarea>
										<script>
											 var ckeditor_config = {
											   resize_enaleb : false,
											   enterMode : CKEDITOR.ENTER_BR,
											   shiftEnterMode : CKEDITOR.ENTER_P,
											   filebrowserUploadUrl : "/ckUpload"
											 };
											 
											 CKEDITOR.replace("ncontent", ckeditor_config);
											</script>
											
									</td>
								</tr>								
							
								<tr>
									<td>
										<label for="gdsImg" style="width : 100%; margin-bottom:10px; margin-top:10px" class="col-sm-2 control-label" >이미지 첨부</label><br>
										<input type="file" id="gdsImg" name="file"  style="margin-bottom:10px; border : solid 1px lightgray;"/>				
										<%=request.getRealPath("/") %><br />
									</td>
								</tr>
 
								
								
								<tr>
									<td>
										<label style="width : 100%; margin-bottom:10px;" class="col-sm-2 control-label" for="nwriter">작성자</label><br />
										<input type="text" id="nwriter" name="nwriter" style="width: 200px; height:40px; margin-bottom:10px; border : solid 1px lightgray;" value="${member.memId}" />
									</td>
								</tr>
								<tr>
									<td>						
										<button class="col-sm-2 control-label write_btn btn btn-outline-dark" type="submit" style="margin-bottom:10px; margin-top:10px">작성</button>										
									</td>
								</tr>	
							<%-- </c:if> 
								 <c:if test="${member.memId == null}">
								<p>로그인 후에 작성하실 수 있습니다.</p>
							</c:if> --%>
							
						</tbody>			
					</table>					
					
				</form>
				</div>				
			</section>
			<hr />
		</div>
	</body>
</html>
