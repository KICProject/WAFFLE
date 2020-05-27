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
	 	
	 	<title>질문 수정</title>
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
				location.href = "/qna/qnaView?qbno=${update.qbno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}"; 
			})
			
			$(".update_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/qna/update");
				formObj.attr("method", "post");
				formObj.submit();
			})
		})
			
		function fn_valiChk(){
			var updateForm = $("form[name='updateForm'] .chk").length;
			for(var i = 0; i<updateForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("qtitle"));
					return true;
				}
			}
		}
 		function fn_addFile(){
			var fileIndex = 1;
			//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
			$(".fileAdd_btn").on("click", function(){
				$("#fileIndex").append("<div><input type='file' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' id='fileDelBtn'>"+"삭제"+"</button></div>");
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
	</script>
	
	<style>
@import "../css/reset.css";
@import "../css/header.css";

@font-face {
  font-family: S-CoreDream-1;
  src: url("../font/SCDream1.otf") format("opentype");
  font-style: normal;
  font-weight: normal;
}
@font-face {
  font-family: S-CoreDream-3;
  src: url("../font/SCDream3.otf") format("opentype");
  font-style: normal;
  font-weight: normal;
}
@font-face {
  font-family: S-CoreDream-6;
  src: url("../font/SCDream6.otf") format("opentype");
  font-style: normal;
  font-weight: normal;
}

.q_update{
	font-family: S-CoreDream-6;
    font-size: 30.5px;
    font-weight: bold;
    color: black;
    margin-block-start: 2em;
    border-bottom : solid 3px;
    margin : 40px auto;
    padding : 5px;
   
}

	#root{
		width : 1140px;
		margin : 0 auto;		
	}
	
td {
	padding-bottom : 5px;
}
	</style>
	<body>

		<div id="root">
			<div class="q_update">
				질문 수정하기
			</div>
			
		<%-- 	<div>
				<%@include file="nav.jsp" %>
			</div> --%>
			
			
			<section id="container">
				<form name="updateForm" role="form" method="post" action="/qna/update" enctype="multipart/form-data">
					<input type="hidden" name="qbno" value="${update.qbno}" readonly="readonly"/>
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					<input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
					<input type="hidden" id="fileNameDel" name="fileNameDel[]" value=""> 
					
					<div class="content_view" >
					<table style="width:100%;">
						<tbody>
							<tr>
								
						<label for="qtitle" style="margin-right:10px;margin-bottom:10px;font-weight: bold;float:left;">제목</label><input type="text" id="qtitle" name="qtitle" style=" border-radius:3px;width:1140px;margin-bottom:20px;"
						 value="${update.qtitle}" class="chk" title="제목을 입력하세요."/>
								
							</tr>	
							<tr>
								<td>
									<label for="qcontent" style="margin-right:10px;margin-bottom:10px;font-weight: bold;float:left;">내용</label><textarea id="qcontent" name="qcontent" class="chk" title="내용을 입력하세요."
									 style="border-radius:3px;width:1140px;height:280px;margin-bottom:20px;">
									<c:out value="${update.qcontent}" /></textarea>
								</td>
								
								    
							</tr>
							<tr>
								<td>
									<button style="float:left;" type="button" class="fileAdd_btn">파일추가</button>
								</td>
							</tr>
								
							
							<tr>
								<td id="fileIndex">
									<c:forEach var="file" items="${file}" varStatus="var">
									<div>
										<input type="hidden" id="FILE_NO" name="FILE_NO_${var.index}" value="${file.FILE_NO }">
										<input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FILE_NO_${var.index}">
										<a href="#" id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>(${file.FILE_SIZE}kb)
										<button id="fileDel" onclick="fn_del('${file.FILE_NO}','FILE_NO_${var.index}');" type="button">삭제</button><br>
									</div>
									</c:forEach>
								</td>
							</tr>
						</tbody>			
					</table>
					</div>
					
					<div>
						<label for="qwriter" style="margin-right:10px;">작성자</label><input type="text" id="qwriter" name="qwriter" value="${update.qwriter}" readonly="readonly"/>					
						<label for="regdate">작성날짜</label>
						<fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd"/>
						
						<div style="margin : 10px;align:center;">
							<button type="button" class="update_btn btn btn">저장</button>
							<button type="button" class="cancel_btn btn btn" style="margin-left : 10px">취소</button>
						</div>
						
					</div>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>