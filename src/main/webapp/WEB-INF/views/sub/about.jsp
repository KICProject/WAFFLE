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
              <p>대한민국을 넘어 세계로 향합니다.</p>
              <p>
                WAFFLE은<br />
                친환경 친휴먼 짱짱맨 IoT 서비스 입니다.
              </p>
              <div class="story_img">
                <p>
                  WAFFLE is<br />
                  IoT<br />
                  Web Service
                </p>
              </div>
            </div>
          </li>
          <!-- member -->
          <li class="member">
            <p>강남역 마지노선은</p>
            <ul>
              <li>
                <img src="/img/5.png" />
              </li>
              <li>
                <img src="/img/6.png" />
              </li>
              <li>
                <img src="/img/7.png" />
              </li>
              <li>
                <img src="/img/8.png" />
              </li>
              <li>
                <img src="/img/9.png" />
              </li>
              <li>
                <img src="/img/10.png" />
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