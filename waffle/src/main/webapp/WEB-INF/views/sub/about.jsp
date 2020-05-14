<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WAFFLE</title>
<link rel="stylesheet" type="text/css" href="/css/about.css" />
</head>
<body>
	<jsp:include page="/WEB-INF/views/include/header_bk.jsp"></jsp:include>
	<section class="about_main">
      <!-- about WAFFLE -->
      <div class="about_head">
        <p class="title_big">About WAFFLE</p>
        <p class="title_small">WAFFLE</p>
      </div>
      <!-- tab -->
      <div class="about_center">
        <ul class="about_menu">
          <li class="active">WAFFLE STORY</li>
          <li>강남역마지노선</li>
        </ul>
        <!-- content -->
        <ul class="about_content">
          <!-- story -->
          <li class="waffle_story active">
            <div>
              <div class="story_content">
                <img id="story_img" src="/img/about_img_0.jpg" alt="IoT">
                <pre id="story_text">WAFFLE is
IoT
Web Service</pre>
                <button class="btn prevBtn">prev</button>
                <button class="btn nextBtn">next</button>
              </div>
            </div>
          </li>
          <!-- member -->
          <li class="member">
            <p>강남역 마지노선은</p>
            <ul>
              <li>
                <img src="/img/5.png" />
                <p class="name">DEVTACO</p>
                <strong>BackEnd/FrontEnd/webDesign</strong>
              </li>
              <li>
                <img src="/img/6.png" />
                <p class="name">YEONY</p>
                <strong>BackEnd</strong>
              </li>
              <li>
                <img src="/img/7.png" />
                <p class="name">MSKIM</p>
                <strong>BackEnd</strong>
              </li>
              <li>
                <img src="/img/8.png" />
                <p class="name">DAEKI</p>
                <strong>BackEnd/FrontEnd</strong>
              </li>
              <li>
                <img src="/img/9.png" />
                <p class="name">MiNJU</p>
                <strong>BackEnd/FrontEnd</strong>
              </li>
              <li>
                <img src="/img/10.png" />
                <p class="name">AIN</p>
                <strong>FrontEnd</strong>
              </li>
            </ul>
            <p>6명으로 이루어진 웹개발 팀입니다.</p>
          </li>
        </ul>
      </div>
    </section>
	<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
	<script src="/js/app.js"></script>
</body>
</html>