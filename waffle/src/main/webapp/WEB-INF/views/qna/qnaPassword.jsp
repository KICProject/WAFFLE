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
      <title>비밀번호 체크!</title>
   </head>
   <script type="text/javascript">
      $(document).ready(function(){
         // 취소
         $(".cencle").on("click", function(){
            
            location.href = "/";
                      
         })
      
         $(".submit").on("click", function(){
            var formObj = $("form[name='readForm']");
            if($("#review_password").val()==""){
               alert("비밀번호를 입력해주세요.");
               $("#review_password").focus();
               return false;
            }   
      
            if($("#review_password").val()=='${qnaRead.review_password}'){
               location.href="/qna/qnaView?qbno=${qnaRead.qbno}"
            
         }else{
            
            alert("비밀번호가 다릅니다");
         }
         
         });
         

      })
   </script>
   <body>
      <section id="container">
         <form  name="delForm" method="post">
         <input type="hidden" name="qbno" value="${qnaRead.qbno}" readonly="readonly"/>
         <input type="hidden" name="review_Password" value="${qnaRead.review_password}" readonly="readonly"/>
            
            <div class="form-group has-feedback">
               <label class="control-label" for="review_password">패스워드</label>
               <input  style="width:200px;" class="form-control" type="password" id="review_password" name="review_password" />
            </div>
            <div class="form-group has-feedback">
               <button class="submit btn" type="button" >비밀번호 체크</button>
               <button class="cencle btn" type="button">취소</button>
            </div>
         </form>
         <div>

            
         </div>
      </section>
      
   </body>
   
</html>