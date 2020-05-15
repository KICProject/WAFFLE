/**
 * 날씨정보, 미세먼지정보를 얻어와서 
 */
function weatherCall() {
			$.ajax({
				url : "/api_weather",
				type : "get",
				dataType : "json",
				success : function(data) {					
					if (data == null) {
						alert('통신은 됐는데 data가 없어');
					} else {						
						var response = data['response'];
						var body = response['body'];
						var items = body['items'];
						var item = items['item'];
						var t3h = item['16'];
						var fcstValueTemp = t3h.fcstValue;
						var reh = item['3'];
						var fcstValueHumid = reh.fcstValue;
						console.log('현재 옵도:'+fcstValueTemp);
						console.log('현재 습도:'+fcstValueHumid);
						$('#outerTemp').html(fcstValueTemp + '℃')
						$('#outerHumid').html(fcstValueHumid + '%')
					}
				},
				error : function(e) {
					console.log(e);
					alert('통신을 실패 했습니다.');
				}
			})

		}
		function dustCall() {
			$.ajax({
				url : "/api_dust",
				type : "get",
				dataType : "xml",
				success : function(data) {
					if (data == null) {
						alert('통신은 됐는데 data가 없어');
					} else {
						/*
						* response 객체에는 24시간동의 데이터들이 배열형태로 들어옴
						* 그 중 0번째가 가장 최근의 데이터기 때문에 0번째 배열을 참조한다.
						*/						
						var item = $(data).find("item").eq(0); 
						
						var pm10v = $(item).find("pm10Value").html();
						var pm25v = $(item).find("pm25Value").html();
						var pm10g = $(item).find("pm10Grade").html();
						var pm25g = $(item).find("pm25Grade").html();
						
						
						console.log('pm10수치:'+pm10v);
						console.log('pm25수치:'+pm25v);
						console.log('pm10등급:'+pm10g);
						console.log('pm25등급:'+pm25g);

						$('#pm10v').html(pm10v + '%');
						$('#pm25v').html(pm25v + '%');
						$('#pm10g').html(pm10g+'급');
						$('#pm25g').html(pm25g+'급');

					}
				},
				error : function(e) {
					console.log(e);
					alert('통신을 실패 했습니다.');
				}
			})
		}