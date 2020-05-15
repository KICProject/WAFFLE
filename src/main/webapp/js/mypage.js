$(document).ready(function() {
	$('#paymentData').click(function(){
		$('.cs_content').removeClass('show');
		$('.user_info_update').removeClass('show');
		$('.user_info_update>.content>.container').remove();
		$('.user_info_delete').removeClass('show');
		$('.using_info_content').addClass('show');		
	})
	
	$('#csBoard').click(function(){
		$('.using_info_content').removeClass('show');	
		$('.user_info_update').removeClass('show');
		$('.container').remove();
		$('.user_info_delete').removeClass('show');		
		$('.cs_content').addClass('show');
	})
	$('#memberUpdate').click(function(){
		$('.cs_content').removeClass('show');
		$('.using_info_content').removeClass('show');		
		$('.user_info_delete').removeClass('show');			
		$('.user_info_update').addClass('show');
	})
	$('#memberDelete').click(function(){
		$('.cs_content').removeClass('show');
		$('.using_info_content').removeClass('show');
		$('.user_info_update').removeClass('show');
		$('.container').remove();
		$('.user_info_delete').addClass('show');			
		
	})
})



