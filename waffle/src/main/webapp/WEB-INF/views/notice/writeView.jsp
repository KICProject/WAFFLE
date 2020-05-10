<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="/css/noticeList.css" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta charset="utf-8">
	  	<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		
		<!-- Popper JS -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	 	
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
		
	</script>
	<body>
		<jsp:include page="/WEB-INF/views/include/header_bk.jsp"></jsp:include>
	
		<section class="board_main">
		<!-- service WAFFLE -->
        <div class="board_head">
          <p class="title_big">Notice</p>
          <p class="title_small">WAFFLE</p>
        </div>       
			
		<div id="root">
			<header>
				<!-- <h1> 게시판</h1> -->
			</header>
					
			<section id="container">
			<div class="form-group row justify-content-center">
				<form name="writeForm" method="post" action="/notice/write" enctype="multipart/form-data">
					<span> * 공지글은 관리자만 입력 및 게시가 가능합니다. </span>
					<table style="width : 1000px;">
						<tbody>
							<%-- <c:if test="${member.memId != null}"> --%>
								<tr>
									<td>
										<label style="width : 100%; margin-bottom:10px;" class="col-sm-2 control-label" for="ntitle">공지 제목</label>
										<input  type="text" id="ntitle" name="ntitle" class="chk" title="제목을 입력하세요." placeholder="제목을 입력하세요." style="width: 1000px; height:40px; margin-bottom:10px; border : solid 1px lightgray;"/>
										
									</td>
								</tr>
										
										
	
								<tr>
									<td>
										<label for="ncontent" style="width : 100%;margin-top:10px;margin-bottom:10px;" class="col-sm-2 control-label" title="내용을 입력하세요." >공지 내용</label>
										<textarea id="ncontent" name="ncontent" placeholder="내용을 입력하세요." style="width: 1000px; height:300px; margin-bottom:10px; border : solid 1px lightgray;"></textarea>
										
											
									</td>
								</tr>								
							
								<tr>
									<td>
										<label for="gdsImg" style="width : 100%; margin-bottom:10px; margin-top:10px" class="col-sm-2 control-label" >이미지 첨부</label><br>
										<input type="file" id="gdsImg" name="file"  style="margin-bottom:10px; border : solid 1px lightgray;"/>	
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
												
										<%=request.getRealPath("/") %><br /><br />
									</td>
								</tr>							
								<tr>
									<td>
										<label style="width : 100%; margin-bottom:10px;" class="col-sm-2 control-label" for="nwriter">작성자</label><br />
										<input type="text" id="nwriter" name="nwriter" style="width: 200px; height:40px; margin-bottom:10px; border : solid 1px lightgray;" value="${member.memId}" />
									</td>
								</tr>
								<tr>
									<td><br /><br /><br /><br /><br />						
										<!-- <button class="col-sm-2 control-label write_btn btn btn-outline-dark" type="submit" style="margin-bottom:10px; margin-top:10px; text-align:center;">작 성</button><br /><br /> -->	
										<a href="/notice/list" class="medium_btn">작 성</a>
										<br /><br /><br /><br /><br /><br /><br />									
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
		</section>
	</body>
</html>
