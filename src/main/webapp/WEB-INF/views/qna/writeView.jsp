<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="/css/form.css" />
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>게시판</title>
</head>
<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='writeForm']");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/qna/write");
				formObj.attr("method", "post");
				formObj.submit();
			});
						
			fn_addFile();
	 	 })
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
		function fn_addFile(){
			var fileIndex = 1;
			//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
			$(".fileAdd_btn").on("click", function(){
				$("#fileIndex").append("<div><input type='file' style='margin-left:40px;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='margin-left:40px;' id='fileDelBtn'>"+"삭제"+"</button></div>");
			});
			$(document).on("click","#fileDelBtn", function(){
				$(this).parent().remove();
				
			});										
		}
		
	</script>
<style>

@font-face {
  font-family: S-CoreDream-6;
  src: url("../font/SCDream6.otf") format("opentype");
  font-style: normal;
  font-weight: normal;
}

.question_line {
	border-bottom: solid 3px;
	width: 996px;
	margin-left:-10px;
}

.bold {
	font-family: S-CoreDream-6;
	font-size: 30.5px;
	color: black;
	padding-bottom: 10px;
}

.list {
	font-family: S-CoreDream-6;
	font-size: 20px;
	color: black;
}

a:link {
	text-decoration: none;
}

a:hover {
	text-decoration: none;
	color: black;
}

.writeimg {
	width: 45px;
	margin-bottom: 13px;
}

.question_box {
	display: flex;
	align-items: center;
	justify-content: center;
}

.wrap {
	width: 940px;
	margin: 0 auto;
}

a {
	list-style : none;
	text-decoration:none ;
	color:#333333
}

 



</style>
<body class="wrap">

	<div id="root">
		<div class="question_line" style="margin-top: 30px;">
			<div class="bold" style="display: inline;">질문하기</div>
			</hr>
		</div>
		
		<div class="question_box" style="margin-top:20px;">

			<section id="container">
				<form class="form-group" name="writeForm" method="post"
					action="/qna/write" enctype="multipart/form-data">
					<table style="width: 1000px;">
						<tbody>
							<tr>
								<td><label
									style="width: 100%; margin-left: 30px; margin-bottom: 10px;"
									class="col-sm-2 control-label"></label> <input id="textlength"
									type="text"
									style="width: 1000px; height: 40px; margin-left: 40px; margin-bottom: 10px; border: solid 1px lightgray;"
									id="qtitle" placeholder="&nbsp;제목을 적어주세요." name="qtitle"
									class="chk" title="제목을 입력하세요." /></td>
							</tr>
							<tr>
								<td><label
									style="width: 100%; margin-left: 30px; margin-top: 10px; margin-bottom: 10px;"
									class="col-sm-2 control-label"></label> <textarea
										style="height: 300px; width: 1000px; margin-left: 40px; border: solid 1px lightgray"
										id="qcontent" name="qcontent" class="chk"
										placeholder="&nbsp;내용을 적어주세요. 참고할만한 사진을 첨부해주시면 더 좋은 답변을 얻을 수 있습니다."
										title="내용을 입력하세요."></textarea>
									<button style="margin-left: 40px; margin-top: 10px;"
										class="fileAdd_btn" type="button">파일추가</button></td>
										
										<tr>
								<td id="fileIndex"></td>
							    </tr>


							</tr>


							<tr>
								<td><label for="qwriter"
									style="margin-left: 40px; margin-right: 20px; margin-bottom: 20px; margin-top: 20px;">작성자</label>
									<input type="text"
									style="border-radius: 5px; height: 30px; margin-top: 10px;"
									id="qwriter" name="qwriter" class="chk" title="작성자를 입력하세요."
									value="${member.memId}" /></td>
							</tr>

							<tr>
								<td><label for="qwriter"
									style="margin-left: 40px; margin-right: 10px; margin-bottom: 20px; margin-top: 20px;">비밀번호</label>
									<input class="chk" type="password"
									style="border-radius: 5px; height: 30px; margin-top: 10px;"
									maxlength='10' id="review_password" name="review_password"
									title="비밀번호를 입력하세요." /></td>
							</tr>

							<tr>
							
							<tr>
								<td>
				
									<button type="button" class="btn write_btn btn-lg" type="submit" style="margin-left: 40px;">질문 저장하기</button>
									<button type="button" class="btn btn-secondary2 btn-lg" type="submit"><a href="/qna/qnalist"  style="a:link{text-decoration:none;color:black;}">목록이동</a></button>
								</td>
							</tr>
							<!-- <button class="write_btn" style="margin-left: 50px;">
								<a href="/qna/qnalist">목록이동</a>
							</button> -->


						</tbody>
					</table>
				</form>

			</section>
		
		</div>
		</div>
</body>
</html>
