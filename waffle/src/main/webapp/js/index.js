function updateInner(){
	var member;
	$.ajax({ //실제적인 멤버 로그인 후의 모든 작동 > ajax로 아이디와 서비스 정보를 HashMap으로 가져옴
		url:"/member/getMem",
		type:"post",
		dataType:"json",
		success : function(data){
		
			var getMem = JSON.parse(JSON.stringify(data))
			console.log(getMem)
			var mem = getMem.mem
			var roomNumber = $('#room_sel option:selected').val();
		
			$.ajax({
			url:"adu/updateadu",
				type:"get",
				data:{
					"memId":mem,
					"roomNumber":roomNumber
				},
				dataType:"json",
				success:function(data){
				$.ajax({
					url:"/room/getroom",
					type:"post",
					data:{
						"memId":mem,
						"roomNumber":roomNumber
					},
					dataType:"json",
					success:function(data2){
						console.log(data2)
						var currentroom=JSON.parse(JSON.stringify(data));
						var innerTemp = currentroom.innerTemp;
						var innerWet = currentroom.innerWet;
						$('#innerTemp').html(innerTemp + '℃')
						$('#innerHumid').html(innerWet + '%')								
					},error(e){
						console.log(e);
						}
					})
				}
			})
		}
	})
}



$(function() {
	/* 메인페이지를 c:if 태그로 넣게되면서 생긴 문제로 로그인 전 body의 백그라운드 컬러가  로그인 후 헤더에 영향을 미쳐서 클라이언트에서 직접 바꿔줌*/
	$('body').attr('background','none');					
	$('header').css('background-color','#b1d2e5') 
	
	/* onload 되면서 메인프레임이 fadeIn,transform*/
	setTimeout(function(){
		$('.main_frame').fadeIn(700)
		$('.main_frame').css('transform','translateY(-200px)')
		$('.main_frame').css('transition-duration','0.7s')
	},300)
	/* 외부환경정보를 얻는 API들을 call */
	setTimeout("weatherCall()",3000)
	setTimeout("dustCall()",3000)
	setInterval("weatherCall()",1800000);
	setInterval("dustCall()",3600000);
	$.ajax({
		url:"/adu/connect",
		type:"get",
		dataType:"json",
		success : function(data){
			console.log(data)
			console.log("연결성공")
			alert("연결성공")
		},
		error : function(e) {
			console.log(e);
			alert("통신 실패");
		}
	})
	
	
	$.ajax({ //실제적인 멤버 로그인 후의 모든 작동 > ajax로 아이디와 서비스 정보를 HashMap으로 가져옴
		url:"/member/getMem",
		type:"post",
		dataType:"json",
		success : function(data){
		
			var getMem = JSON.parse(JSON.stringify(data))
			console.log(getMem)
			var mem = getMem.mem
			console.log(mem)
			var usvo = getMem.usvo
			console.log(usvo)
			
			if(usvo == null){
				$('#serviceName').html('서비스 결제필요')
				
			}
			if(usvo != null){
				$('#serviceName').html(usvo+'이용중')					
			}
			
			/* 서비스 명에 따라서 select 할 수 있는 room의 갯수를 할당*/
			if(usvo=="basic"){
				var rcnt = 1;
				for(var i=1; i<=rcnt; i++){
					$('#room_sel').append("<option value='"+i+"'>room0"+i+"</optoin>");				
				}
			}else if(usvo=="pro"){
				var rcnt = 3;
				for(var i=1; i<=rcnt; i++){
					$('#room_sel').append("<option value='"+i+"'>room0"+i+"</optoin>");				
				}
			}else if(usvo=="ultimate"){
				var rcnt = 5;
				for(var i=1; i<=rcnt; i++){
					$('#room_sel').append("<option value='"+i+"'>room0"+i+"</optoin>");				
				}
			}
			
			
			
			
			
			/*방 번호를 고르면, ajax 통신을 통해 그 방의 상태가 화면에 비동기적으로 표시됩니다.*/
			$('#room_sel').on('change',							
					function() {
						var roomNumber = $('#room_sel option:selected').val();
						$.ajax({
								url : "adu/updateadu",
								type : "get",
								data : {
										"memId" : mem,
										"roomNumber" : roomNumber
											},
								dataType : "json",
								success : function(temwet) {
									$.ajax({
										url : "/room/getroom",
										type : "post",
										data : {
											"memId" : mem,
											"roomNumber" : roomNumber
										},
										dataType : "json",
										success : function(data) { // 성공적으로 id와 roomNumber를 넘기고, 요청한 데이터를 돌려받으면
											if (data == null) { // 돌려받았지만, 데이터가 없음 = 서비스이용만료
												alert('서비스를 이용이 만료되었습니다. 결제를 해주세요');
												location.href="/sub/waffleService"
											} else { //정상적인 서비스 이용 유저일 경우 (onload 때와 마찬가지로 브라우저의 sessionStorage에 저장)
												/* sessionStorage.setItem("currentdata", JSON.stringify(data));
												var currentroom = JSON.parse(sessionStorage.getItem("currentdata")); */
												var currentroom = JSON.parse(JSON.stringify(data))										
												var innerTemp = currentroom.innerTemp
												var innerWet = currentroom.innerWet
												
												var aircon = currentroom.aircon
												if(aircon =='49'){											
													$('input:checkbox[id=aircon_switch]').prop('checked',true);
												}else{
													$('input:checkbox[id=aircon_switch]').prop('checked',false);
												}
												var tv = currentroom.tv
												if(tv =='49'){											
													$('input:checkbox[id=tv_switch]').prop('checked',true);
												}else{
													$('input:checkbox[id=tv_switch]').prop('checked',false);
												}
												var window = currentroom.window
												if(window =='49'){											
													$('input:checkbox[id=window_switch]').prop('checked',true);
												}else{
													$('input:checkbox[id=window_switch]').prop('checked',false);
												}
												var light = currentroom.light
												if(light =='49'){											
													$('input:checkbox[id=light_switch]').prop('checked',true);
												}else{
													$('input:checkbox[id=light_switch]').prop('checked',false);
												}
												var room = currentroom.roomNumber
												var serviceName = currentroom.serviceName
												$('#roomStatus').html('room0' + room)
												$('#innerTemp').html(innerTemp + '℃')
												$('#innerHumid').html(innerWet + '%')
												
												if(serviceName != ""){
													$('#serviceName').html(serviceName+'이용중')
												}										
												if (room == '1') {
													$('#roomimg').attr('src', '/img/room01.jpg');
												} else if (room == '2') {
													$('#roomimg').attr('src', '/img/room02.jpg');
												} else if (room == '3') {
													$('#roomimg').attr('src', '/img/room03.jpg');
												}
											}
										},
										error : function(e) {
											console.log(e);
											alert("통신 실패");
										}
									})
								},
								error : function(e) {
									console.log(e);
									alert("통신 실패");
								}
						})
						
						
						setInterval("updateInner()",1800000);
									
			$('.round').on('click',function(){
				var roomNumber = $('#room_sel option:selected').val();
				var value = '48';
				var change = $(this).prev().attr('id');		//클릭한 컨트롤 버튼id			
				var idx = change.indexOf('_');				//id값에서 _이후를 빼기위해 인덱스
				var control_pannel = change.substring(0,idx); //테이블에 전송할 필드명과 일치시키기 위해 substring
				var aduurl ='';
				if(control_pannel=='aircon') aduurl = "/adu/updateair"
				if(control_pannel=='tv') aduurl = "/adu/updatetv"
				if(control_pannel=='light') aduurl = "/adu/updatelight"
				if(control_pannel=='window') aduurl = "/adu/updatewindow"
				
				
				var status = !$(this).prev().is(":checked"); //클릭 상황에서는 false, 이기때문에 !을 붙여 true로, 들어가는 값
				if (status == true){
					value = '49';	//controller의 값이 on 이면 49로 세팅
				}
			
				$.ajax({
					url:"/room/updateroom",
					type:"post",
					dataType:"json",
					data:{
						"control_pannel" : control_pannel,	//필드명을 id값으로 파싱해서 보냄(ex : aircon_switch => aircon)
						"value" : value,	// 49(on) / 48(off) 값
						"memId" : mem, // 현재 로그인 중인 id (roomVo를 가져오기위해)
						"roomNumber":roomNumber // 현재 선택된 방번호 (정확한 roomVo를 가져오기위해)
					},
					success : function(room) {
						var currentroom = JSON.parse(JSON.stringify(data))
						console.log(currentroom)
						$.ajax({							
							url:aduurl,
							type:"get",
							dataType:"json",
							data: {
								"memId" : mem,
								"roomNumber" : roomNumber
							},
							success : function(adu){
								alert('하이')
							},
							error : function(e){
								}
						})
					},
					error : function(e){
						console.log(e)
						$('input:checkbox').prop('checked',false);
						alert('서비스에 가입되어 있지 않습니다.')							
					}
				})//.ajax-updateroom					
			})//.round
		})//.room.sel
		} //getmem select
		
	})//getmem -ajax
	})//함수 
	/* onloade 시 loading 되는 동안 보이는 laoder를 작업이 완료되면 없애고, 메인 컨테이너를 보여준다. */
		$(window).ready(function() {
			$('.loader').css("display", "none");
			$('.container').css("display", "block");
		});	


