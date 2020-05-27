<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<script type="text/javascript">
$(function(){
    $('button').click(function(){     
        $(this).next().slideToggle(500);
    })       
})

$(function(){
	$('.btn').click(function(){
		
		var key= $('#keyword').val();
		var buttoncnt = $('button').length;
		for(var i=1; i<buttoncnt; i++){
			var searchObject = $('button').eq(i).text();
			if(searchObject.match(key)){
				$('button').eq(i).show();
				//$('button').eq(i).next().show();				
			}else{
				$('button').eq(i).hide();
				$('button').eq(i).next().hide();
			}
		}
	})
})
</script>
<body>
<div class="full_container">
			<div class="container">
				<div class="row">
					<div class="span12">
						<form id="custom-search-form"
							class="form-search form-horizontal pull-right">
							<div class="input-append span12">
								<input id="keyword" type="text" class="search-query"
									placeholder="&nbsp;�ñ��Ͻ� ���񽺸� �Է����ּ���."
									style="width: 800px; height: 30px; margin: auto">
								<button type="button" class="btn"
									style="height: 37px;">
									<i class="icon-search"></i>
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>


			<div class="content" style="margin-top:35px;">
					<div class="picture" >
					<figure>
						<img src="../img/TV.png" alt="����1"
							class="img_hover" style="margin-top:10px;">
						<figcaption class="img_content">TV</figcaption>
					</figure>
					<figure>
						<img src="/img/light.png" alt="����2"
							class="img_hover" style="margin-top:10px;">
						<figcaption class="img_content">����</figcaption>
					</figure>
					<figure>
						<img src="/img/window.png" alt="����4"
							class="img_hover" style="margin-top:10px;">
						<figcaption class="img_content">â��</figcaption>
					</figure>

					<figure>
						<img src="/img/conditioner.png" alt="����4"
							class="img_hover" style="margin-top:10px;">
						<figcaption class="img_content">������</figcaption>
					</figure>

			
				</div>

				<!-- <div class="button_wrap">
					<div class="pre">
						<img src="/img/customer_category_arrow_prev.png">
					</div>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<div class="next">
						<img src="/img/customer_category_arrow_next.png">
					</div>
				</div> -->



				<div class="noto_body"
					style="margin-top: 50px; margin-bottom: 15px;">
					&nbsp;&nbsp;
					<h4 class="noto">��ü</h4>
					<span class="noto_count">25��</span>
				</div>

				<div class="faq-page" id="faq-page">
	<div class="faq">
						<button class="question-top">
							<img src="/img/common_accordion_Q.png" class="q_img"
								style="margin-right: 10px">
							<h4 style="text-align: left; line-height: 50px;" id="q_title">��ġ �� üũ����Ʈ</h4>
						</button>

						<div class="answer">
							<img src="/img/common_accordion_A.png" class="a_img">
							<div class="answer_content">
								<span style="font-weight: bold;">�� ��(�ޱ�) ��ġ ���� üũ����Ʈ</span> <br>
								<br> <span style="font-weight: bold;">1) ��ġ ���� Ȯ��</span><br>
								<br> �� �ּ� �ʺ� 900mm, ���� 2,000mm, ���� 800mm �̻� ���� Ȯ���� �ʿ��մϴ�.<br>
								<br> �� ��ġ ���� �� ����/���ð���/����輱/â�� ���� ��ġ �Ǿ����� ��� ��ġ �Ұ�<br>
								<br> (���� ���� �� ���� ������ ���ķ� ����/��Ʈ ���� �ν��� �� ��� ��ġ �Ұ�)<br>
								<br> �� �� ������ ���� ��ġ ����(��,��,��)�� ��ũ��Ʈ ���� ��ġ ����<br> <br>
								(Ÿ��/����/���� ���� ��ġ �Ұ�)<br> <br> �� �� ������(��*����*����) : [�ܰ�]
								800*930~1030*750mm<br> <br> <br> <span
									style="font-weight: bold;">2) tv ��� Ȯ��</span><br> <br>
								<span style="color: red; font-weight: bold;">tv �ִ� ��
									740mm ����, ���� 1,000mm ���� ���� ��ġ ����!</span><br> <br> �� L * : Ʈ��
								����, �뵹�� ��Ź�� ��ġ �Ұ�<br> <br> �� ��* : �÷��� ���� (�� �ο���Ź��),
								��Ƽ����� (�뵹��) ��ġ �Ұ�<br> <br> <br> <span
									style="font-weight: bold;">3) �� ��ġ ��� �ȳ�</span><br> <br>
								���� ���� ����+��ġ ��û �� ��ġ�� ���� 159,000�� <br> <br> ���� �� ��ġ ��û
								�� ��ġ�� ���� 40,000�� (��ġ ȯ������� ��ġ�Ұ��� ����� 17,000���߻�)<br> <br>
								�Ϻ����� �� �����갣 ������ �Ÿ��� ���� �߰� ����� �߻� �� �� ������ ���� ��Ź �帳�ϴ�.<br> <br>
								<br> �����մϴ�.

								<div class="answer_img">
									<img src="/img/answer_1.png" style="margin-top: 40px;">
								</div>
							</div>


						</div>


						<button class="question">
							<img src="/img/common_accordion_Q.png" class="q_img"
								style="margin-right: 10px">
							<h4 style="text-align: left; line-height: 50px;">��� ������ ��� �ϳ���?</h4>

						</button>
						<div class="answer">
							<img src="/img/common_accordion_A.png" class="a_img">
							<div class="answer_content" style="margin-bottom:20px;">ȸ���� �ǹ����ԱⰣ�� ����Ǳ� ���� ���Ƿ� ������� ������ ��� , <br><br>
							   ȸ���� ���� ���ԱⰣ �Ǵ� ��ü�Ⱓ���� ��ȯ�� ������ �Һ��ڰ��ݿ� �ش��ϴ� �ݾװ� �������� �� û�� ���� 1ȸ��<br><br>
							  ��(������)���� ����� �ݾ��� ȸ�翡�� ��� �Ͽ��� �մϴ�.</div>
						</div>

						<button class="question">
							<img src="/img/common_accordion_Q.png" class="q_img"
								style="margin-right: 10px">
							<h4 style="text-align: left; line-height: 50px;">�̺�Ʈ ����ǰ�� ���� ���� �ǳ���?</h4>


						</button>

						<div class="answer">
							<img src="/img/common_accordion_A.png" class="a_img">
							<div class="answer_content">�̺�Ʈ �Ⱓ ���� �����Ͻ� �е鿡�Դ� 12�� 29�� ����� ��ǰ������ �ϰ� �߼� �˴ϴ�.</div>
						</div>

						<button class="question">
							<img src="/img/common_accordion_Q.png" class="q_img"
								style="margin-right: 10px">
							<h4 style="text-align: left; line-height: 50px;">�Һ��� ���� �ذ� ���� �ȳ�</h4>
						</button>
						
						<div class="answer">
							<img src="/img/common_accordion_A.png" class="a_img">
							<div class="answer_content">���� ���ÿ����� �Һ��� ���� �ذ� ���ؿ� ���� �Ʒ��� ���� ��ǰ�� ���� ������ �ǽ��մϴ�. </div>
								<div class="answer_img">
									<img src="/img/table01.png" style="margin-top: 20px;margin-bottom:20px;margin-left:75px;">
								</div>
						</div>

						<button class="question-bottom">
							<img src="/img/common_accordion_Q.png" class="q_img"
								style="margin-right: 10px;">
							<h4 style="text-align: left; line-height: 50px;">ī����� �� ���� ����</h4>
						</button>
						
						<div class="answer">
							<img src="/img/common_accordion_A.png" class="a_img">
							<span>
						   <div class="answer_content" style="margin-bottom:20px;"> <span style="font-weight: bold;">�� ī����� �� ���� ���α׷� �̼�ġ�� ���� ������ ���� �ȳ� ����</span>	<br><br>

								* ��ǰ ���Ž� ī������� �ϱ� ���ؼ��� ������ ���� ���α׷��� ��ġ�Ͽ��� �մϴ�.<br><br>
								
								  ī�� ���� ���� �� ���α׷��� ��ġ���� ���� ������ PC������ �ڵ����� ���α׷�
								
								  ��ġ�� �ȳ��ϴ� â�� �� ������ ��ܿ� ��������� ������ �Ǿ ��ġ �� ������
								
								  �����Ͻø� �˴ϴ�.<br><br>
										
							</div>
						</div>

					</div>

					<div class="page">
						<ul>
							<div class="page_choice">
								<li><a onclick="
                            fetch('page1').then(function(response) {
                            	
                                response.text().then(function(text) {
                                    document.querySelector('.faq').innerHTML = text;
                                    $(function(){
                                        $('button').click(function(){     
                                            $(this).next().slideToggle(500);
                                        })       
                                    })
                                })
                            })
	                        ">1</a></li>
								</div>
								<div class="page_choice">
									<li><a onclick="
										 fetch('page2').then(function(response) {
				                            	
				                                response.text().then(function(text) {
				                                    document.querySelector('.faq').innerHTML = text;
				                                    $(function(){
				                                        $('button').click(function(){     
				                                            $(this).next().slideToggle(500);
				                                        })       
				                                    })
				                                    
				                                })
				                            })
	                        ">2</a></li>
								</div>
								<div class="page_choice">
									<li><a onclick="
	                            fetch('page3.html').then(function(response) {
	                                response.text().then(function(text) {
	                                    document.querySelector('.faq').innerHTML = text;
	                                    $(function(){
	                                        $('button').click(function(){     
	                                            $(this).next().slideToggle(500);
	                                        })       
	                                    })
	                                })
	                            })
	                        ">3</a></li>
								</div>
								<div class="page_choice">
									<li><a onclick="
	                            fetch('page4.html').then(function(response) {
	                                response.text().then(function(text) {
	                                    document.querySelector('.faq').innerHTML = text;
	                                    $(function(){
	                                        $('button').click(function(){     
	                                            $(this).next().slideToggle(500);
	                                        })       
	                                    })
	                                })
	                            })
	                        ">4</a></li>
								</div>
								<div class="page_choice">
									<li><a
										onclick="
	                            fetch('page5.html').then(function(response) {
	                                response.text().then(function(text) {
	                                    document.querySelector('.faq').innerHTML = text;
	                                    $(function(){
	                                        $('button').click(function(){     
	                                            $(this).next().slideToggle(500);
	                                        })       
	                                    })
	                                })
	                            })
	                        ">5</a></li>
							</div>
						</ul>
					</div>
				</div>

			</div>
		</div>
</body>
</html>