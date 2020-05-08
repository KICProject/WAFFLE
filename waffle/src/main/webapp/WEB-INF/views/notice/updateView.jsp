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
	 	
	 	<title>게시판</title>
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
				<form name="updateForm" role="form" method="post" action="/notice/update" enctype="multipart/form-data">
					<input type="hidden" name="nno" value="${update.nno}" readonly="readonly"/>
					<input type="hidden" id="page" name="page" value="${scri.page}"> 
					<input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
					<input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					<input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
					<input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
					<input type="hidden" id="fileNameDel" name="fileNameDel[]" value=""> 
					
					<div class="inputArea">
					 <label for="gdsImg">이미지</label>
					 <input type="file" id="gdsImg" name="file" />
					 <div class="select_img">
					  <img src="${read.gdsImg}" />
					  <input type="hidden" name="gdsImg" value="${read.gdsImg}" />
					  <input type="hidden" name="gdsThumbImg" value="${read.gdsThumbImg}" /> 
					 </div>
					 
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
					  
					  
					  
					  $(document).ready(function() {
						    $('#emailForm').bootstrapValidator({        
						        feedbackIcons: {
						            valid: 'glyphicon glyphicon-ok',
						            invalid: 'glyphicon glyphicon-remove',
						            validating: 'glyphicon glyphicon-refresh'
						        },
						        fields: {
						            uname: {
						                validators: {
						                        stringLength: {
						                        min: 2,
						                    },
						                        notEmpty: {
						                        message: 'Please enter your name'
						                    }
						                }
						            },             
						            email: {
						                validators: {
						                    notEmpty: {
						                        message: 'Please enter your email address'
						                    },
						                    emailAddress: {
						                        message: 'Please enter a valid email address'
						                    }
						                }
						            },
									attachFile: {
						                validators: {
						                    file: {
						                        extension: 'jpeg,png,pdf,zip,gif,txt,doc',
						                        type: 'image/jpeg,image/png,application/pdf,application/zip,image/gif,text/plain,application/msword',
						                        maxSize: 2048 * 1024,
						                        message: 'The selected file is not valid'
						                    }
						                }
						            },
						            message: {
						                validators: {
						                      stringLength: {
						                        min: 10,
						                        max: 200,
						                        message:'Please enter at least 10 characters and no more than 200'
						                    },
						                    notEmpty: {
						                        message: 'Please enter a message'
						                    }
						                }
						            }
						        }
						    });
						});
					  
					  
					  
					  
					 </script>
					 <%=request.getRealPath("/") %>
					</div>
					<table>
						<tbody>
							<tr>
								<td>
									<label for="ntitle">제목</label><input type="text" id="ntitle" name="ntitle" value="${update.ntitle}" class="chk" title="제목을 입력하세요."/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="ncontent">내용</label><textarea id="ncontent" name="ncontent" class="chk" title="내용을 입력하세요."><c:out value="${update.ncontent}" /></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="nwriter">작성자</label><input type="text" id="nwriter" name="nwriter" value="${update.nwriter}" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td>
									<label for="regdate">작성날짜</label>
									<fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd"/>					
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
					<div>
						<button type="button" class="update_btn">저장</button>
						<button type="button" class="cancel_btn">취소</button>
						<button type="button" class="fileAdd_btn">파일추가</button>
					</div>
				</form>
			</section>
			<hr />
		</div>
		
		<form action="mail.php" method="post" id="emailForm" enctype="multipart/form-data">
	<div class="contact-form">
	<?php if(!empty($_GET['success']) && $_GET['success']) { ?>
		<div id="message" class="alert alert-danger alert-dismissible fade show">The message has been sent.</div>
	<?php } ?>
	<div class="form-group">				  
	  <label class="control-label col-sm-2" for="fname">Name*:</label>
	  <div class="col-sm-10">          
		<input type="text" class="form-control" id="uname" name="uname" placeholder="Enter Name" >
	  </div>
	</div>				
	<div class="form-group">
	  <label class="control-label col-sm-2" for="email">Email*:</label>
	  <div class="col-sm-10">
		<input type="email" class="form-control" id="email" name="email" placeholder="Enter email" >
	  </div>
	</div>
	<div class="form-group">
	  <label class="control-label col-sm-2" for="lname">Attach File:</label>
	  <div class="col-sm-10">          
		<input type="file" class="form-control" id="attachFile" name="attachFile">
	  </div>
	</div>
	<div class="form-group">
	  <label class="control-label col-sm-2" for="comment">Message*:</label>
	  <div class="col-sm-10">
		<textarea class="form-control" rows="5" name="message" id="message"></textarea>
	  </div>
	</div>
	<div class="form-group">        
	  <div class="col-sm-offset-2 col-sm-10">
		<button type="submit" class="btn btn-default" name="sendEmail">Send Email</button>
	  </div>
	</div>
	</div>
</form>
		
	</body>
</html>