<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
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
	 	

	 	<!-- <title>게시판 수정하기</title> -->
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(document).on("click","#fileDel", function(){
				$(this).parent().remove();
			})
			
			fn_addFile();
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/notice/readView?nno=${update.nno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
			$(".update_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/notice/update");
				formObj.attr("method", "post");
				formObj.submit();
			})
		})
			
		function fn_valiChk(){
			var updateForm = $("form[name='updateForm'] .chk").length;
			for(var i = 0; i<updateForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("ntitle"));
					return true;
				}
			}
		}
 		function fn_addFile(){
			var fileIndex = 1;
			//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
			$(".fileAdd_btn").on("click", function(){
				$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
			});
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent().remove();
				
			});
		}
 		var fileNoArry = new Array();
 		var fileNameArry = new Array();
 		function fn_del(value, name){
 			
 			fileNoArry.push(value);
 			fileNameArry.push(name);
 			$("#fileNoDel").attr("value", fileNoArry);
 			$("#fileNameDel").attr("value", fileNameArry);
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
				<!-- <h1> 게시판 수정</h1> -->
			</header>
			<hr />
			 
			<div>
				<%@include file="nav.jsp" %>
			</div>
			<hr />
			
			<section id="container">
			 <div class="form-group row justify-content-center">
				<form name="updateForm" role="form" method="post" action="/notice/update" enctype="multipart/form-data">				
					<table style="width : 1000px;">
						<tbody>
							<tr>
								<td>
									<label style="width : 100%; margin-bottom:10px;" class="col-sm-2 control-label" for="ntitle">제목</label>
									<input type="text" id="ntitle" name="ntitle" value="${update.ntitle}" title="제목을 입력하세요." style="width: 1000px; height:40px; margin-bottom:10px; border : solid 1px lightgray;" />
								</td>
							</tr>	
							<tr>
								<td>
									<label for="ncontent">내용</label><textarea id="ncontent" name="ncontent" class="chk" title="내용을 입력하세요."><c:out value="${update.ncontent}" /></textarea>									
								</td>
							</tr>
							
							<tr>		
								<td>						
									<label for="gdsImg">이미지</label>
									<input type="file"  id="gdsImg" name="file" class="chk" title="이미지 파일을 선택하세요." value="${read.gdsImg}" />
								</td>
							</tr>						
							
							<tr>
								<td>
									<label for="regdate">작성날짜</label>
									<fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd"/>					
								</td>
							</tr>							
						</tbody>			
					</table>
					
					<input type="hidden" name="nno" value="${update.nno}" readonly="readonly"/>
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					<input type="hidden" name="gdsImg" value="${goods.gdsImg}" />
					<input type="hidden" name="gdsThumbImg" value="${goods.gdsThumbImg}" />
					
					
					<div>
						<button type="button" class="update_btn btn">저장</button>
						<button type="button" class="cancel_btn btn">취소</button>
						<!-- <button type="button" class="fileAdd_btn">파일추가</button> -->
					</div>
					
				</form>
				</div>
			</section>
			<hr />
	 </div>
	</body>
</html>