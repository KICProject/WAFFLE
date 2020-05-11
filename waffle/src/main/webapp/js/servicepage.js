$(function() {
	$('button').click(function(){
		console.log('js들어옴')
		if("${member}" == ""){
			alert('로그인을 먼저 해주세요');
			location.href="/member/loginControl";
		}
		
		var btn = $(this).attr('id');
		$('#serviceName').val(btn);
		
		$('#cover').show();
		$('#prePayForm').show();		
		
		if(btn == 'basic'){
			$('#price').val(100);
		}else if(btn == 'pro'){
			$('#price').val(300);
		}else
			$('#price').val(500);
		
		console.log($('#price').val())
	})
	
	$('#cover').click(function(){
		$('#prePayForm').hide();
		$('#cover').hide();
	})

	$('#pay').click(function(){
		var paydata_str = $('#payForm').serialize();
		console.log(paydata_str)
		$.ajax({
			url : "/payment/payReady",
			type:"post",
			data : paydata_str,
			dataType : "json",
			success : function(data){
				if(data==1){
					location.href="/payment/pay"				
				}else{
					alert('결제 정보 저장이 되지 않았습니다.')
				}
				
			},error : function(e){
				alert('결제에 실패하였습니다.');
				//location.reload();
			}
		})		
	})
})



