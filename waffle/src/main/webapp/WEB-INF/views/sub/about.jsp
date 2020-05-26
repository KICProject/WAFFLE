<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WAFFLE</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/css/about.css" />
</head>
<script>
//youtube API 불러옴
var tag = document.createElement('script');
tag.src = "https://www.youtube.com/player_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

// 플레이어변수 설정
var youTubePlayer1;

function onYouTubeIframeAPIReady() {
    youTubePlayer1 = new YT.Player('youTubePlayer1', {
        width: '1000',
        height: '563',
        videoId: 'F8M8LgBNM14',
        playerVars: {rel: 0},//추천영상 안보여주게 설정
        events: {
          'onReady': onPlayerReady, //로딩할때 이벤트 실행
          'onStateChange': onPlayerStateChange //플레이어 상태 변화시 이벤트실행
        }
    });//youTubePlayer1셋팅
}

function onPlayerReady(event) {
    event.target.playVideo();//자동재생
    //로딩할때 실행될 동작을 작성한다.
}

function onPlayerStateChange(event) {
    if (event.data == YT.PlayerState.PLAYING) {
        //플레이어가 재생중일때 작성한 동작이 실행된다.
    }
  }
 
$(document).ready(function () {
    $(".btn_play").on("click", function () {
        youTubePlayer1.playVideo();//재생
    });
    $(".btn_stop").on("click", function () {
        youTubePlayer1.stopVideo();//정지
    });
    $(".btn_pause").on("click", function () {
        youTubePlayer1.pauseVideo();//일시정지
    });
});
</script>
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
						<p>
						대한민국을 넘어 세계로 향합니다.<br>
						WAFFLE은<br /> 
						아래 영상과 같은 서비스를 제공합니다.
						</p>
						<div id="youTubePlayer1"></div>
						<!-- 플레이어를 불러올 영역-->
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