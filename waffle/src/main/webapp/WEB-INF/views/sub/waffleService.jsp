<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Waffle Service</title>
<link rel="stylesheet" type="text/css" href="/css/waffleService.css" />
</head>
<script type="text/javascript">
function fn_getMember() {
	$.ajax({
		url : "/sub/getMember",
		type : "post",
		dataType : "json",
		data : {
			"memId" : $("#memId").val()
		},
		success : function(data) {
			if (data == 1) {
				id_dbck = 0;
				console.log(id_dbck);
				alert("중복된 아이디입니다.");
			} else if (data == 0) {
				$("#idChk").attr("value", "Y");
				id_dbck = 1;
				console.log(id_dbck);
				alert("사용가능한 아이디입니다.");
			}
		}
	})
}

</script>
<body>
	<jsp:include page="/WEB-INF/views/include/header_bk.jsp"/>
	<section class="service_main">
        <!-- service WAFFLE -->
        <div class="service_head">
          <p class="title_big">Service</p>
          <p class="title_small">WAFFLE</p>
        </div>
        <!-- img -->
        <div><img src="/img/login_img.jpeg" alt="서비스이미지"></div>
        <!-- service tab -->
        <ul class="service_tab">
            <li>BASIC</li>
            <li>PRO</li>
            <li>ULTIMATE</li>
        </ul>
        <!-- service content -->
        <ul class="service_content">
            <li>
                <p>
                    <span>BASIC SERVICE</span><br>
                    기본적인 서비스로<br> 
                    원룸에 사시거나 거실에만 스마트홈기기을 설치하시는<br>
                    고객님들께 추천해드립니다. 
                </p>
                <button type="button">신청하기</button>
                <a href="../payment/pay">신청하기</a>"
            </li>
            <li>
                <p>
                    <span>PRO SERVICE</span><br>
                    BASIC SERVICE에서<br> 
                    추가로 거실외에 방 3개 이하에 스마트홈기기을 설치하시는<br>
                    고객님들께 추천해드립니다. 
                </p>
                <button type="button">신청하기</button>
            </li>
            <li>
                <p>
                    <span>ULTIMATE SERVICE</span><br>
                    BASIC SERVICE에서<br> 
                    추가로 거실외에 방 3개 이상에 스마트홈기기을 설치하시는<br>
                    고객님들께 추천해드립니다. 
                </p>
                <button type="button">신청하기</button>
            </li>
        </ul>
    </section>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
	<script src="/js/app.js"></script>

</body>
</html>